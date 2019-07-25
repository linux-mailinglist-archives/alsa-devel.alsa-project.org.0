Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65D74B78
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 12:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0881AD4;
	Thu, 25 Jul 2019 12:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0881AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564050265;
	bh=bSPinfBvu4BbZ7UNiMrlOHL73dDFRSKEFi+DQ5jbrmY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pElVh5l8T1hSXQmNXOxx8b5idoTQbFSB+QHKKr+uK9+vH3ApiwbWeghx7pLzTJ5lx
	 xtGbtfTohJIhZgEaAtSSS3zSJRLHH1f69mgaVTj6fNu7F7bAoWI3d0GiOO5iCqllhj
	 W2EIMx94dHr0eYTlu71rTsu0sgEchHmwTiiurAoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02E76F803D0;
	Thu, 25 Jul 2019 12:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C1EF803D0; Thu, 25 Jul 2019 12:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4F89F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 12:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F89F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ghq/2OBS"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PAMTcC029804;
 Thu, 25 Jul 2019 05:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564050149;
 bh=vsxGJSq6Q1NuCBoWhzjiA+1ThQ4/lUXE9hS+/sJtOM8=;
 h=From:To:CC:Subject:Date;
 b=ghq/2OBSSvdCKurgXkazr1GGkrmNRJLyEvJCgxynQ5WkaspSxN9UbLjnjxw7wDrxV
 R2mL0qFpxNsaccynHu7jE2t66oZubaGWQuy+lh655M9LKS63I/p7WhE+xveju1lwmq
 dv0SwKRx/NMkGnXyZ50b1EVwXDOgL7JgHP/gsd4U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PAMTXR077471
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 05:22:29 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 05:22:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 05:22:29 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PAMQPG110383;
 Thu, 25 Jul 2019 05:22:27 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 25 Jul 2019 13:22:26 +0300
Message-ID: <20190725102226.781-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
Subject: [alsa-devel] [PATCH] ASoC: soc-pcm: Use format size instead
	physical for sample_bits symmetry
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

For DAIs the format size in bits matters when it comes to symmetry.
The physical width is the in-memory format size which matters mostly for
the platform drivers.

If for example a DAI requests symmetric_samplebits and the first stream is
using S24_LE then the second stream would not be allowed to use S24_3LE
despite both S24_LE and S24_3LE would need the same clocking on the bus.
But S32_LE would be allowed (S24_LE and S32_LE is both physically 32 bits
in memory) which would not be compatible with S24_LE on the bus.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/soc-pcm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1406f935af22..c70722dc1f4f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -243,7 +243,7 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 	rate = params_rate(params);
 	channels = params_channels(params);
-	sample_bits = snd_pcm_format_physical_width(params_format(params));
+	sample_bits = snd_pcm_format_width(params_format(params));
 
 	/* reject unmatched parameters when applying symmetry */
 	symmetry = cpu_dai->driver->symmetric_rates ||
@@ -932,7 +932,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 		codec_dai->rate = params_rate(&codec_params);
 		codec_dai->channels = params_channels(&codec_params);
-		codec_dai->sample_bits = snd_pcm_format_physical_width(
+		codec_dai->sample_bits = snd_pcm_format_width(
 						params_format(&codec_params));
 
 		snd_soc_dapm_update_dai(substream, &codec_params, codec_dai);
@@ -945,8 +945,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	/* store the parameters for each DAIs */
 	cpu_dai->rate = params_rate(params);
 	cpu_dai->channels = params_channels(params);
-	cpu_dai->sample_bits =
-		snd_pcm_format_physical_width(params_format(params));
+	cpu_dai->sample_bits = snd_pcm_format_width(params_format(params));
 
 	snd_soc_dapm_update_dai(substream, params, cpu_dai);
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
