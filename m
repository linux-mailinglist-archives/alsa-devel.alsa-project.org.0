Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63419117F6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F2A17AF;
	Thu,  2 May 2019 13:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F2A17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795288;
	bh=FK0/CX0fTlKL9gLtv/7NVp3OD28JTTfZPQNwYkTUbhk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJ0vxYMwcuHdOwVW7wEOrjNASxUb5O0+vf5nNvrIeuYQLzXNTVa7rGvoUijt+YVuq
	 9wYtcsdDfgjRV+M86CceNT45RXWvAFk75sNHpJG9QEZaXK2yi+XY3wbXLRVHpeFq0x
	 Mvlps2qS00At7K43/njRAq+ppbxpkaWx03r5XZiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B98F8974A;
	Thu,  2 May 2019 13:00:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607A2F89740; Thu,  2 May 2019 13:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A03F8973A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A03F8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hGTpa5W8"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74DD520656;
 Thu,  2 May 2019 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794834;
 bh=l04ZnMIsIj3l4Q1hjBjiiE8cooNZ17Nbi2wlg4DufLw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hGTpa5W8R5BkX9ve2cK6vA1XVyYGTRtI7DVrrCYVJj0Mn6IX2elCEpnU1l2SAwVEK
 UvPEBdCVatPs9oLFUN1qX/Zc2I0rJi4abRiQGp5WA7W31WJJh91dWIUUK/3yI78faF
 iFILWXLjxn00Zbd7nuY3tJiAvjkSj4FA9/lDH3cw=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:25 +0530
Message-Id: <20190502105930.9889-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 09/14] soundwire: intel: more alignment fixes
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

Found few more issues reported checkpatch on code alignment so fix those
as well in the intel module.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/intel.c           | 36 ++++++++++++++---------------
 include/linux/soundwire/sdw_intel.h |  2 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 9774dc1e4029..31336b0271b0 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -691,9 +691,9 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 			return -ENOMEM;
 
 		if (type == INTEL_PDI_BD || type == INTEL_PDI_OUT) {
-			dais[i].playback.stream_name = kasprintf(GFP_KERNEL,
-							"SDW%d Tx%d",
-							cdns->instance, i);
+			dais[i].playback.stream_name =
+				kasprintf(GFP_KERNEL, "SDW%d Tx%d",
+					  cdns->instance, i);
 			if (!dais[i].playback.stream_name) {
 				kfree(dais[i].name);
 				return -ENOMEM;
@@ -706,9 +706,9 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 		}
 
 		if (type == INTEL_PDI_BD || type == INTEL_PDI_IN) {
-			dais[i].capture.stream_name = kasprintf(GFP_KERNEL,
-							"SDW%d Rx%d",
-							cdns->instance, i);
+			dais[i].capture.stream_name =
+				kasprintf(GFP_KERNEL, "SDW%d Rx%d",
+					  cdns->instance, i);
 			if (!dais[i].capture.stream_name) {
 				kfree(dais[i].name);
 				kfree(dais[i].playback.stream_name);
@@ -749,40 +749,40 @@ static int intel_register_dai(struct sdw_intel *sdw)
 	/* Create PCM DAIs */
 	stream = &cdns->pcm;
 
-	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN,
-			stream->num_in, off, stream->num_ch_in, true);
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN, stream->num_in,
+			       off, stream->num_ch_in, true);
 	if (ret)
 		return ret;
 
 	off += cdns->pcm.num_in;
-	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT,
-			cdns->pcm.num_out, off, stream->num_ch_out, true);
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT, cdns->pcm.num_out,
+			       off, stream->num_ch_out, true);
 	if (ret)
 		return ret;
 
 	off += cdns->pcm.num_out;
-	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD,
-			cdns->pcm.num_bd, off, stream->num_ch_bd, true);
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD, cdns->pcm.num_bd,
+			       off, stream->num_ch_bd, true);
 	if (ret)
 		return ret;
 
 	/* Create PDM DAIs */
 	stream = &cdns->pdm;
 	off += cdns->pcm.num_bd;
-	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN,
-			cdns->pdm.num_in, off, stream->num_ch_in, false);
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN, cdns->pdm.num_in,
+			       off, stream->num_ch_in, false);
 	if (ret)
 		return ret;
 
 	off += cdns->pdm.num_in;
-	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT,
-			cdns->pdm.num_out, off, stream->num_ch_out, false);
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT, cdns->pdm.num_out,
+			       off, stream->num_ch_out, false);
 	if (ret)
 		return ret;
 
 	off += cdns->pdm.num_bd;
-	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD,
-			cdns->pdm.num_bd, off, stream->num_ch_bd, false);
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD, cdns->pdm.num_bd,
+			       off, stream->num_ch_bd, false);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 0848f9d38bcb..4d70da45363d 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -11,7 +11,7 @@
  */
 struct sdw_intel_ops {
 	int (*config_stream)(void *arg, void *substream,
-			void *dai, void *hw_params, int stream_num);
+			     void *dai, void *hw_params, int stream_num);
 };
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
