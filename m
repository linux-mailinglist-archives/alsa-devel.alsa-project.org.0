Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2389E25FF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 502911674;
	Wed, 23 Oct 2019 23:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 502911674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571867926;
	bh=ChgWpQgS78mcxhhEtQuNEWlA5/aUFSTLpcMEcXmOQaM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXDObVzRArkVh3tlFtzTtt5UYwKOOjdgKhHCjKSrSkVcbigtJcMmZCW1dJbNY1TsR
	 bkMHn6ZBhS1LN36FVP85ZPpgEwEUkDapI78CHGygz0T4nbfF+Q8nrw0PCwQZGu/mmD
	 MgYTYv9nOiYNVKLQiV86r+3Ln6cg2Fbil7rx/+oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F513F80752;
	Wed, 23 Oct 2019 23:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C6E1F80736; Wed, 23 Oct 2019 23:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5DB4F8071F
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5DB4F8071F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="196908285"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by fmsmga008.fm.intel.com with ESMTP; 23 Oct 2019 14:46:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:45:59 -0500
Message-Id: <20191023214601.883-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023214601.883-1-pierre-louis.bossart@linux.intel.com>
References: <20191023214601.883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 16/18] soundwire: stream: only prepare stream
	when it is configured.
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We don't need to prepare the stream again if the stream is already
prepared.

sdw_prepare_stream() could be called multiple times without calling
sdw_deprepare_stream(). We call sdw_prepare_stream() in the prepare
dai ops and sdw_deprepare_stream() in the hw_free dai ops. If an xrun
happens, sdw_prepare_stream() will be called but
sdw_deprepare_stream() will not, which results in an imbalance and an
invalid total bandwidth.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 0a074d445b8d..38375c9124e4 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1544,7 +1544,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
  */
 int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 {
-	int ret = 0;
+	int ret;
 
 	if (!stream) {
 		pr_err("SoundWire: Handle not found for stream\n");
@@ -1553,6 +1553,11 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state == SDW_STREAM_PREPARED) {
+		ret = 0;
+		goto state_err;
+	}
+
 	if (stream->state != SDW_STREAM_CONFIGURED &&
 	    stream->state != SDW_STREAM_DEPREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
