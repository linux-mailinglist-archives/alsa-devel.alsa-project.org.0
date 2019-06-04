Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C98350B4
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 22:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A88916B5;
	Tue,  4 Jun 2019 22:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A88916B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559679167;
	bh=NL6A0M9F+KQ4iSXfna9WGovssVYHLMH0r3neiFTB1UY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gIBumhS9rBhGL/XN9FZorcvo/3R5HFIR0t30MZRrEdnQUVHQ0waRiO1RiRrjAv+zg
	 EmNT531rTtcXvwxifjZc9DzEOANCCtykygBSinf9GmxkvBrki0rhunD2LovWidLoRv
	 PH0ni6nz1HLXToH69vPJKrC04yJ+gVw8bFXRZ8Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28E87F89738;
	Tue,  4 Jun 2019 22:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E21A7F8972F; Tue,  4 Jun 2019 22:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA699F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 22:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA699F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 13:09:08 -0700
X-ExtLoop1: 1
Received: from ifreitas-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.150.186])
 by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2019 13:09:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  4 Jun 2019 15:08:56 -0500
Message-Id: <20190604200858.4867-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604200858.4867-1-pierre-louis.bossart@linux.intel.com>
References: <20190604200858.4867-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/4] ASoC: Intel: bytcht_es8316: fix kernel
	oops with platform_name override
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

The platform override code uses devm_ functions to allocate memory for
the new name but the card device is not initialized. Fix by moving the
init earlier.

Fixes: e4bc6b1195f64 ("ASoC: Intel: bytcht_es8316: platform name fixup support")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 1f319b2a835f..ba4830b7a161 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -488,6 +488,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	}
 
 	/* override plaform name, if required */
+	byt_cht_es8316_card.dev = dev;
 	platform_name = mach->mach_params.platform;
 
 	ret = snd_soc_fixup_dai_links_platform_name(&byt_cht_es8316_card,
@@ -568,7 +569,6 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "mono" : "stereo",
 		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
 	byt_cht_es8316_card.long_name = long_name;
-	byt_cht_es8316_card.dev = dev;
 	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
 
 	ret = devm_snd_soc_register_card(dev, &byt_cht_es8316_card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
