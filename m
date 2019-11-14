Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269EFCDA2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:33:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3437716AA;
	Thu, 14 Nov 2019 19:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3437716AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573756414;
	bh=lwjahv/g/t6w4y5eqE65PW1+WZatDrpSEfe3g+bj1CI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kx0idTJtv1sylvxrQEmJrDRO3r49Xm6WtgdqasrhAu6GG+vpdMkJmoxYEMg6jPjUn
	 dDg8AVAeGjGEM/m97BLTCZxA5xj1tXhTISwtmkoTiCpfq9FvM+XKri0MzsXycnX9yW
	 zPxH1zZdV/7jbYH1KDnaRtgY9KuQBoeLwe3IKKZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A4AF8028E;
	Thu, 14 Nov 2019 19:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C85F8015D; Thu, 14 Nov 2019 19:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A3B9F8012F
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A3B9F8012F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123577"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:18:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:58 -0600
Message-Id: <20191114181702.22254-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v3 18/22] soundwire: stream: update state
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
 drivers/soundwire/stream.c                    | 37 +++++++++++
 2 files changed, 82 insertions(+), 18 deletions(-)

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
index 178ae92b8cc1..6aa0b5d370c0 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1553,8 +1553,18 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 
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
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
@@ -1619,8 +1629,17 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 
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
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
@@ -1693,8 +1712,16 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state != SDW_STREAM_ENABLED) {
+		pr_err("%s: %s: inconsistent state state %d\n",
+		       __func__, stream->name, stream->state);
+		ret = -EINVAL;
+		goto state_err;
+	}
+
 	ret = _sdw_disable_stream(stream);
 
+state_err:
 	sdw_release_bus_lock(stream);
 	return ret;
 }
@@ -1749,8 +1776,18 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
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
