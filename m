Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB450352749
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 10:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C77516B1;
	Fri,  2 Apr 2021 10:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C77516B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617351348;
	bh=s0ybl13Pp+zpqNuda7b7/B+aTo1PxGabYqA2f6x8Ltw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JWiW9/z8hiiOTCyfqx/9na96nWiyf/dSIeGeFHry4bYn7ERyqEs94gv6uESSepObz
	 yLvvUnbr9X3LaC1cLydh3Do15315X3HAtfUYxP2oBbwqPzcydWPXj2cPn9JoE5vvox
	 AemPVBAM3iBKxleJygnBSZGmXSxyTplUjCU8ECJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0298F800F5;
	Fri,  2 Apr 2021 10:14:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02B54F801DB; Fri,  2 Apr 2021 10:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp46.i.mail.ru (smtp46.i.mail.ru [94.100.177.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E2F5F800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 10:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E2F5F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru
 header.b="fZBY1yoU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=rq4pNq5VcUQQ/+nRLnlq4dvKNrUQAQiMzf36L4qbPiA=; 
 b=fZBY1yoUr1zDCB3Ku0xRzHKblD4JTq1VpFxE2TnPbUoMdO/Np2kBouK9gMbfWY8kHYSGJ7Yg0qGwTdPsjfc5kdyvw+ee6BEjcTtYE7VayRFDFj2JUOz2KUG94vkU12EC81yAqwaJsdFgeYN0EqNv+EkEmja2WlpZuHAliv6ZuOk=;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from <shc_work@mail.ru>)
 id 1lSEwU-0006Ao-8t; Fri, 02 Apr 2021 11:14:10 +0300
From: Alexander Shiyan <shc_work@mail.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_esai: Fix TDM slot setup for I2S mode
Date: Fri,  2 Apr 2021 11:14:05 +0300
Message-Id: <20210402081405.9892-1-shc_work@mail.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp46.i.mail.ru; auth=pass smtp.auth=shc_work@mail.ru
 smtp.mailfrom=shc_work@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9ED7173E37F4E32947287414FD1D04A09E656A5F3377C994A182A05F5380850404A7D69A5CCA05214A96F02D1809047A35D689E7D5A7B763763237D51722530F1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75C0AD7D016C066E3C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67CDEEF6D7F21E0D1D174C73DBBBFC7664DACD858F8408EEB9B70BD720305F45896AD398CFD846D226389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C04CF195F1528592878941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B636DA1BED736F9328CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C22496390A0E1B38D649C76E601842F6C81A12EF20D2F80756B5F7E9C4E3C761E06A776E601842F6C81A127C277FBC8AE2E8B7828FED2C75941C03AA81AA40904B5D9DBF02ECDB25306B2201CA6A4E26CD07C3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735E5B2F3A2B87CD4C8C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C7B5A45DDF210A4CF68D2675E952CE975DCE9195A6CF2C85C9C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B07FFFBAFA8F3AB84C8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341776B9FDE05FBA7ACF98E9AA050475FB7CF3DD4B470B7746BBBC751A8451AD46360C271E89C6ECAB1D7E09C32AA3244CF8E5106561CBD2E41B81B7AAD1D45D0BBBA718C7E6A9E042C2E5D8217768D59A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojiysexgWf3371l8lDkT4iYw==
X-Mailru-Sender: 8261CADE3D3FA0B4C2F1292954F703E97A9D5555569AF0460552862BBA4B16FB9A07AE5EE9D80F1F6B3B2BD4812BFD4DC77752E0C033A69E93554C27080790AB3B25A7FBAAF806F0AE208404248635DF
X-Mras: Ok
Cc: Alexander Shiyan <shc_work@mail.ru>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

When using the driver in I2S TDM mode, the fsl_esai_startup()
function rewrites the number of slots previously set by the
fsl_esai_set_dai_tdm_slot() function to 2.
To fix this, let's use the saved slot count value or, if TDM
is not used and the number of slots is not set, the driver will use
the default value (2), which is set by fsl_esai_probe().

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 sound/soc/fsl/fsl_esai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 08056fa0a0fa..a857a624864f 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -519,11 +519,13 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 				   ESAI_SAICR_SYNC, esai_priv->synchronous ?
 				   ESAI_SAICR_SYNC : 0);
 
-		/* Set a default slot number -- 2 */
+		/* Set slots count */
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_TCCR,
-				   ESAI_xCCR_xDC_MASK, ESAI_xCCR_xDC(2));
+				   ESAI_xCCR_xDC_MASK,
+				   ESAI_xCCR_xDC(esai_priv->slots));
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_RCCR,
-				   ESAI_xCCR_xDC_MASK, ESAI_xCCR_xDC(2));
+				   ESAI_xCCR_xDC_MASK,
+				   ESAI_xCCR_xDC(esai_priv->slots));
 	}
 
 	return 0;
-- 
2.26.2

