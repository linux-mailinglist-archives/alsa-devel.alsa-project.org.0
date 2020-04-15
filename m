Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47491A9186
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 05:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612AA1678;
	Wed, 15 Apr 2020 05:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612AA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586921345;
	bh=915oPQTmHa1uRJLo0Pr48FxshBjh07o8BwoqMOMxAsA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FfIvfKWneogo8xmK3JTwqF6zZIXpBFwY9R7/db6jO5yIBdzowvDiBaIWyid1882Zl
	 IpLnpxXc39RFL9wPI1z+bjKSey/Sil3lMSM6iuGj/vhZ1rv483vR64Wmbxd5ucQPhY
	 zL/ZBddVmgEXxbD8Ia1sHxh2eKYbcp8rVLUHNQgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 410B3F8025F;
	Wed, 15 Apr 2020 05:27:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A740F80245; Wed, 15 Apr 2020 05:27:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3762CF800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 05:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3762CF800ED
IronPort-SDR: 0BFzNntCZwu3RmJHXuFTZ3FiE1gRURfxymLzsKxCArhMiCxPVqe0K6tYQCtgSP0rB3mmqIyihj
 NOgiz/MitPiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 20:27:04 -0700
IronPort-SDR: 2sQk5zkKDb9JMYf7Kh4oRpWgYo0aaQ1OAjbPGGosU1LVQCPrzL77QQACNweHjfoMJ0aSlstdld
 v+YMzsqzlRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="242186965"
Received: from pazucen-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.38.34])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2020 20:27:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: skl_hda_generic: remove rtd->codec_dai
Date: Tue, 14 Apr 2020 22:26:47 -0500
Message-Id: <20200415032647.11209-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Stephen Rothwell <sfr@canb.auug.org.au>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Use macro and solve compilation issues

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 64197b010e7d..35f222ed9912 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -175,7 +175,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd =
 		list_first_entry(&card->rtd_list,
 				 struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_hda_priv *hda_pvt;
 
 	if (!codec_dai)
-- 
2.20.1

