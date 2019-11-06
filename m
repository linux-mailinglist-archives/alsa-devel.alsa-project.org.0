Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E7BF1F05
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:37:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1292C1660;
	Wed,  6 Nov 2019 20:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1292C1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573069054;
	bh=by3qFqoPlwIqRkiAKXtHzO4fCw5A8jKn8cmGvmKn620=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CS8KGPbEv3qylx/6JKABuv6ENj22mdjnJRxTPXSGG4AOsWMhA/Ho0EPqPXE5h74xU
	 8ysujEOsWUoHqihazskHabu1+AtsLY/9gL9N1K4kkzluKLz8DxP/6imVaYhPxo/mwd
	 m7FHWq1O/gZfFylK+P3WMxdRwByk7ovVqlKjp1WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0BBAF80797;
	Wed,  6 Nov 2019 20:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDC51F806F8; Wed,  6 Nov 2019 20:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E9DAF80611
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E9DAF80611
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="403835182"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 11:22:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:22:20 -0600
Message-Id: <20191106192223.6003-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
References: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, tiwai@suse.de, gregkh@linuxfoundation.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 16/19] soundwire: stream: update state
	machine and add state checks
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The state machine and notes don't accurately explain or allow
transitions from STREAM_DEPREPARED and STREAM_DISABLED.

Add more explanations and allow for more transitions as a result of a
trigger_stop(), trigger_suspend() and prepare(), depending on the
ALSA/ASoC layer behavior defined by the INFO_RESUME and INFO_PAUSE
flags.

Also add basic checks to help debug inconsistent states and illegal
state machine transitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/driver-api/soundwire/stream.rst | 63 +++++++++++++------
 drivers/soundwire/stream.c                    | 38 +++++++++++
 2 files changed, 83 insertions(+), 18 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index 5351bd2f34a8..9b7418ff8d59 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -156,22 +156,27 @@ Below shows the SoundWire stream states and state transition diagram. ::
 	+-----------+     +------------+     +----------+     +----------+
 	| ALLOCATED +---->| CONFIGURED +---->| PREPARED +---->| ENABLED  |
 	|   STATE   |     |    STATE   |     |  STATE   |     |  STATE   |
-	+-----------+     +------------+     +----------+     +----+-----+
-	                                                           ^
-	                                                           |
-	                                                           |
-	                                                           v
-	         +----------+           +------------+        +----+-----+
+	+-----------+     +------------+     +---+--+---+     +----+-----+
+	                                         ^  ^              ^
+				                 |  |              |
+				               __|  |___________   |
+				              |                 |  |
+	                                      v                 |  v
+	         +----------+           +-----+------+        +-+--+-----+
 	         | RELEASED |<----------+ DEPREPARED |<-------+ DISABLED |
 	         |  STATE   |           |   STATE    |        |  STATE   |
 	         +----------+           +------------+        +----------+
 
-NOTE: State transition between prepare and deprepare is supported in Spec
-but not in the software (subsystem)
+NOTE: State transitions between ``SDW_STREAM_ENABLED`` and
+``SDW_STREAM_DISABLED`` are only relevant when then INFO_PAUSE flag is
+supported at the ALSA/ASoC level. Likewise the transition between
+``SDW_DISABLED_STATE`` and ``SDW_PREPARED_STATE`` depends on the
+INFO_RESUME flag.
 
-NOTE2: Stream state transition checks need to be handled by caller
-framework, for example ALSA/ASoC. No checks for stream transition exist in
-SoundWire subsystem.
+NOTE2: The framework implements basic state transition checks, but
+does not e.g. check if a transition from DISABLED to ENABLED is valid
+on a specific platform. Such tests need to be added at the ALSA/ASoC
+level.
 
 Stream State Operations
 -----------------------
@@ -246,6 +251,9 @@ SDW_STREAM_PREPARED
 
 Prepare state of stream. Operations performed before entering in this state:
 
+  (0) Steps 1 and 2 are omitted in the case of a resume operation,
+      where the bus bandwidth is known.
+
   (1) Bus parameters such as bandwidth, frame shape, clock frequency,
       are computed based on current stream as well as already active
       stream(s) on Bus. Re-computation is required to accommodate current
@@ -270,13 +278,15 @@ Prepare state of stream. Operations performed before entering in this state:
 After all above operations are successful, stream state is set to
 ``SDW_STREAM_PREPARED``.
 
-Bus implements below API for PREPARE state which needs to be called once per
-stream. From ASoC DPCM framework, this stream state is linked to
-.prepare() operation.
+Bus implements below API for PREPARE state which needs to be called
+once per stream. From ASoC DPCM framework, this stream state is linked
+to .prepare() operation. Since the .trigger() operations may not
+follow the .prepare(), a direct transitions from
+``SDW_STREAM_PREPARED`` to ``SDW_STREAM_DEPREPARED`` is allowed.
 
 .. code-block:: c
 
-  int sdw_prepare_stream(struct sdw_stream_runtime * stream);
+  int sdw_prepare_stream(struct sdw_stream_runtime * stream, bool resume);
 
 
 SDW_STREAM_ENABLED
@@ -332,6 +342,14 @@ Bus implements below API for DISABLED state which needs to be called once
 per stream. From ASoC DPCM framework, this stream state is linked to
 .trigger() stop operation.
 
+When the INFO_PAUSE flag is supported, a direct transition to
+``SDW_STREAM_ENABLED`` is allowed.
+
+For resume operations where ASoC will use the .prepare() callback, the
+stream can transition from ``SDW_STREAM_DISABLED`` to
+``SDW_STREAM_PREPARED``, with all required settings restored but
+without updating the bandwidth and bit allocation.
+
 .. code-block:: c
 
   int sdw_disable_stream(struct sdw_stream_runtime * stream);
@@ -353,9 +371,18 @@ state:
 After all above operations are successful, stream state is set to
 ``SDW_STREAM_DEPREPARED``.
 
-Bus implements below API for DEPREPARED state which needs to be called once
-per stream. From ASoC DPCM framework, this stream state is linked to
-.trigger() stop operation.
+Bus implements below API for DEPREPARED state which needs to be called
+once per stream. ALSA/ASoC do not have a concept of 'deprepare', and
+the mapping from this stream state to ALSA/ASoC operation may be
+implementation specific.
+
+When the INFO_PAUSE flag is supported, the stream state is linked to
+the .hw_free() operation - the stream is not deprepared on a
+TRIGGER_STOP.
+
+Other implementations may transition to the ``SDW_STREAM_DEPREPARED``
+state on TRIGGER_STOP, should they require a transition through the
+``SDW_STREAM_PREPARED`` state.
 
 .. code-block:: c
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e69f94a8c3a8..0a074d445b8d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1553,10 +1553,21 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state != SDW_STREAM_CONFIGURED &&
+	    stream->state != SDW_STREAM_DEPREPARED &&
+	    stream->state != SDW_STREAM_DISABLED) {
+		pr_err("%s: %s: inconsistent state state %d\n",
+		       __func__, stream->name, stream->state);
+		ret = -EINVAL;
+		goto state_err;
+	}
+
 	ret = _sdw_prepare_stream(stream);
+
 	if (ret < 0)
 		pr_err("Prepare for stream:%s failed: %d\n", stream->name, ret);
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
@@ -1621,10 +1632,19 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state != SDW_STREAM_PREPARED &&
+	    stream->state != SDW_STREAM_DISABLED) {
+		pr_err("%s: %s: inconsistent state state %d\n",
+		       __func__, stream->name, stream->state);
+		ret = -EINVAL;
+		goto state_err;
+	}
+
 	ret = _sdw_enable_stream(stream);
 	if (ret < 0)
 		pr_err("Enable for stream:%s failed: %d\n", stream->name, ret);
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
@@ -1697,10 +1717,18 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state != SDW_STREAM_ENABLED) {
+		pr_err("%s: %s: inconsistent state state %d\n",
+		       __func__, stream->name, stream->state);
+		ret = -EINVAL;
+		goto state_err;
+	}
+
 	ret = _sdw_disable_stream(stream);
 	if (ret < 0)
 		pr_err("Disable for stream:%s failed: %d\n", stream->name, ret);
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
@@ -1755,10 +1783,20 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 	}
 
 	sdw_acquire_bus_lock(stream);
+
+	if (stream->state != SDW_STREAM_PREPARED &&
+	    stream->state != SDW_STREAM_DISABLED) {
+		pr_err("%s: %s: inconsistent state state %d\n",
+		       __func__, stream->name, stream->state);
+		ret = -EINVAL;
+		goto state_err;
+	}
+
 	ret = _sdw_deprepare_stream(stream);
 	if (ret < 0)
 		pr_err("De-prepare for stream:%d failed: %d\n", ret, ret);
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
