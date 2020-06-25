Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20220A5C0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4604A1ADA;
	Thu, 25 Jun 2020 21:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4604A1ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593113241;
	bh=PMf6p2vgzEF8t4XhXE47MSmepB/AX0n2ztS+L/VoHyw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vEjJSMCWI+2v7qWpGs0Ocle1Shr2Pevlv/a7bVgD0aVxFgFF4jaVyEkXp39j4bkLk
	 MxBeMjs2uQjfDJUH5tEhnef+k9npQ68sLUHF8ti5KA5dDEFC+ytkA9e5/OuhNtR2nv
	 TxOmVLshREJHkoIA76VDs5uZht7zBrSIvT3/XcGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D2AF8023E;
	Thu, 25 Jun 2020 21:25:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB60F80234; Thu, 25 Jun 2020 21:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6374F80137
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6374F80137
IronPort-SDR: hl7y9tVWp+A0Iga9PqhFIWrWwM632tl0v6zCrlOZKqEhHsYPoMRxMX1e/for0rFBVyjE0M8nhw
 EToTBAnu0BPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="145091116"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="145091116"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:25:28 -0700
IronPort-SDR: CyeV2i/wsZMJYuLnqidmLIRBl39SAryaBJVcyXMkYrPU+YZ90s1biWKRZtgQoTSkjxBdge8hJp
 kQ8fTLfqcT6Q==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="311197940"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:25:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/17] ASoc: Intel: cml_rt1011_rt5682: explicitly access first
 codec
Date: Thu, 25 Jun 2020 14:24:58 -0500
Message-Id: <20200625192458.4148-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

dailink.codecs is pointer to a codec array. Explicitly access
first codec's dai_name.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 3f8b7d9820cd..6943020fa0bd 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -556,7 +556,7 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
 	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
 				SOF_RT1011_SPEAKER_TR)) {
 		for_each_card_prelinks(&snd_soc_card_cml, i, dai_link) {
-			if (!strcmp(dai_link->codecs->dai_name,
+			if (!strcmp(dai_link->codecs[0].dai_name,
 				    CML_RT1011_CODEC_DAI)) {
 				dai_link->codecs = ssp1_codec_4spk;
 				dai_link->num_codecs = ARRAY_SIZE(ssp1_codec_4spk);
-- 
2.20.1

