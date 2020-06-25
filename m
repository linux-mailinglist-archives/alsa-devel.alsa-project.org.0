Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A403820A5A8
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571791AC8;
	Thu, 25 Jun 2020 21:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571791AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112870;
	bh=eTTr/3y1QlmN532B8HC9gTpdwJizTUD4gCRU7E/1WEM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDpeTNtpEy6Cm/j5CuJl1IuNBHEbY7iE6cF+BbjRO9MAEt6a4yyVsLE+o+Yjzd/sb
	 vFRhUCx4E+IO4B9Yphmi0YrG3DOEwvA5+hHykT8d7vNnsHx4x/+CxPYQMLI6av2JY9
	 ORh1ekZzbX8qMmS0Y7lo3yq9EffRytpT6WeVhG1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4076F80328;
	Thu, 25 Jun 2020 21:14:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C04FF802E0; Thu, 25 Jun 2020 21:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAADBF802DC
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAADBF802DC
IronPort-SDR: Y6kfP2/sBXMn8QSCfesRvHkyTyRJnE2EpZOSYSpZohn14tvs09oesD2RWJRJoGikiQzxnWHlg3
 Dca75lMgot1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120842"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:42 -0700
IronPort-SDR: 3SO7ltZjDTHXjnP/HX1L9zcAdCPEwOZFK+mnU74M5RHGinB073NGEflICit6DWy/1bogUj5frr
 IE0YvbYcVUzQ==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559531"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/17] ASoC: intel: cml_rt1011_rt5682: use
 for_each_card_prelinks
Date: Thu, 25 Jun 2020 14:13:03 -0500
Message-Id: <20200625191308.3322-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

for_each_card_prelinks() is a common API to walk through each prelink
in the card.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index d29b4a8ff70d..3f8b7d9820cd 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -533,6 +533,7 @@ static struct snd_soc_card snd_soc_card_cml = {
 
 static int snd_cml_rt1011_probe(struct platform_device *pdev)
 {
+	struct snd_soc_dai_link *dai_link;
 	struct card_private *ctx;
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
@@ -554,12 +555,11 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
 	/* when 4 speaker is available, update codec config */
 	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
 				SOF_RT1011_SPEAKER_TR)) {
-		for (i = 0; i < ARRAY_SIZE(cml_rt1011_rt5682_dailink); i++) {
-			if (!strcmp(cml_rt1011_rt5682_dailink[i].codecs->dai_name,
+		for_each_card_prelinks(&snd_soc_card_cml, i, dai_link) {
+			if (!strcmp(dai_link->codecs->dai_name,
 				    CML_RT1011_CODEC_DAI)) {
-				cml_rt1011_rt5682_dailink[i].codecs = ssp1_codec_4spk;
-				cml_rt1011_rt5682_dailink[i].num_codecs =
-						ARRAY_SIZE(ssp1_codec_4spk);
+				dai_link->codecs = ssp1_codec_4spk;
+				dai_link->num_codecs = ARRAY_SIZE(ssp1_codec_4spk);
 			}
 		}
 	}
-- 
2.20.1

