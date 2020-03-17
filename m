Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE1187EC4
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 11:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2450D185B;
	Tue, 17 Mar 2020 11:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2450D185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584442415;
	bh=lHy/G3iMJucgMmT6+TPiJXLWsXPjo6RYzmzbB9+Xlrk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XXR0G94kS6PexUpDtsDh94R79aDvapUrM2HWQ7Y6pWGwIqoi6F/qbygwlygkr9Okw
	 VFVikeEXqeXEdZSVqTxPQK48ik2KfV30loxziqBAGs32+2uUo4lR1of4zHCl1W7YBl
	 Q38ng8nnj3cMUwe4fdaumUvKeJwzWdSn0B1t27OY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA24F800C0;
	Tue, 17 Mar 2020 11:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31FC7F800C0; Tue, 17 Mar 2020 11:51:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6DCAF800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 11:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6DCAF800C0
IronPort-SDR: e0hxMnCy+p+c6j4yMATtkuj3xmYPBLqW8rysL7iPL4QNv1FMx5U/zL7L4NM8GSHpifSyR9ouf0
 HBG6UBau95Ag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 03:51:46 -0700
IronPort-SDR: KZ6MXAW7Wed2SNzKcd2mam6OirO0eshuzYwmIoVa3c3D4x/dkjUTfFVzfIM4PbIvTgvxq46orL
 4gYl46xoHlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="236295330"
Received: from dasabhi1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.35.148])
 by fmsmga007.fm.intel.com with ESMTP; 17 Mar 2020 03:51:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] soundwire: stream: only change state if needed
Date: Tue, 17 Mar 2020 05:51:42 -0500
Message-Id: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In a multi-cpu DAI context, the stream routines may be called from
multiple DAI callbacks. Make sure the stream state only changes for
the first call, and don't return error messages if the target state is
already reached.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1b43d03c79ea..3319121cd706 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1572,6 +1572,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 	sdw_acquire_bus_lock(stream);
 
 	if (stream->state == SDW_STREAM_PREPARED) {
+		/* nothing to do */
 		ret = 0;
 		goto state_err;
 	}
@@ -1661,6 +1662,12 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state == SDW_STREAM_ENABLED) {
+		/* nothing to do */
+		ret = 0;
+		goto state_err;
+	}
+
 	if (stream->state != SDW_STREAM_PREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
 		pr_err("%s: %s: inconsistent state state %d\n",
@@ -1744,6 +1751,12 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state == SDW_STREAM_DISABLED) {
+		/* nothing to do */
+		ret = 0;
+		goto state_err;
+	}
+
 	if (stream->state != SDW_STREAM_ENABLED) {
 		pr_err("%s: %s: inconsistent state state %d\n",
 		       __func__, stream->name, stream->state);
@@ -1809,6 +1822,12 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 
+	if (stream->state == SDW_STREAM_DEPREPARED) {
+		/* nothing to do */
+		ret = 0;
+		goto state_err;
+	}
+
 	if (stream->state != SDW_STREAM_PREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
 		pr_err("%s: %s: inconsistent state state %d\n",
-- 
2.20.1

