Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A8938E9F4
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89451692;
	Mon, 24 May 2021 16:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89451692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867841;
	bh=Myo0OzaoMPDK2v0dbEFHWTxeSMSFdgX4JF++vJTCP0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxSH9C+ZqEcrXgEtQVKtcfLI5JtXOzvoECGkGBIiJbUNZA/weJlzQdW9Q0d+Y7l3p
	 t1CP0GB4BENRMkQ6vK0nhAV4Mrpv6Hx07tAlBNPTR0buxXoRksImyhkVN7BUHGTBA7
	 fwgvvW9EDLmeivyDTftkZg4R/DLPeHwuyJyM4QWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0416F804CF;
	Mon, 24 May 2021 16:47:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 056C0F804AD; Mon, 24 May 2021 16:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFEDCF80475
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFEDCF80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lcBdUsYl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A1D2613B6;
 Mon, 24 May 2021 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867620;
 bh=Myo0OzaoMPDK2v0dbEFHWTxeSMSFdgX4JF++vJTCP0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcBdUsYlpqEP4F1UCP/CJh5u81oHkkzSLJTozXMWJ/pv9gJrE7LKiPl1pwDjK2cDf
 BKyvVmHzz/qZEwKWXopNf3LecnSGxcCzvU+1PPCHlA7Py4cke4ohsWU7FMNKiJ0Dxb
 Dyz2uWL/N3+FWm6OJw9eVLn5hdKgI97puy3nupKHuIElj0cKhNnLGxlozV/R2KcG/2
 wPYx1eswgD3mps+iXdfWrUFVl1xaN9J3YH8vAeY0YGMOgFoNKkMMNsYVHz+PYx3gWE
 DqW9zinIj7OFTrQ1oqMaHD9htthZEQqm0VgVcW+FmZkXC4/Eyr6UbkWw0nU+/Idf+L
 BYqS/fgLPAB9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 30/63] ASoC: rt5645: add error checking to
 rt5645_probe function
Date: Mon, 24 May 2021 10:45:47 -0400
Message-Id: <20210524144620.2497249-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144620.2497249-1-sashal@kernel.org>
References: <20210524144620.2497249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Phillip Potter <phil@philpotter.co.uk>
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

From: Phillip Potter <phil@philpotter.co.uk>

[ Upstream commit 5e70b8e22b64eed13d5bbebcb5911dae65bf8c6b ]

Check for return value from various snd_soc_dapm_* calls, as many of
them can return errors and this should be handled. Also, reintroduce
the allocation failure check for rt5645->eq_param as well. Make all
areas where return values are checked lead to the end of the function
in the case of an error. Finally, introduce a comment explaining how
resources here are actually eventually cleaned up by the caller.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
Link: https://lore.kernel.org/r/20210503115736.2104747-56-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5645.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index ab06133a85da..85ab33bdcdec 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3364,30 +3364,44 @@ static int rt5645_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	rt5645->component = component;
 
 	switch (rt5645->codec_type) {
 	case CODEC_TYPE_RT5645:
-		snd_soc_dapm_new_controls(dapm,
+		ret = snd_soc_dapm_new_controls(dapm,
 			rt5645_specific_dapm_widgets,
 			ARRAY_SIZE(rt5645_specific_dapm_widgets));
-		snd_soc_dapm_add_routes(dapm,
+		if (ret < 0)
+			goto exit;
+
+		ret = snd_soc_dapm_add_routes(dapm,
 			rt5645_specific_dapm_routes,
 			ARRAY_SIZE(rt5645_specific_dapm_routes));
+		if (ret < 0)
+			goto exit;
+
 		if (rt5645->v_id < 3) {
-			snd_soc_dapm_add_routes(dapm,
+			ret = snd_soc_dapm_add_routes(dapm,
 				rt5645_old_dapm_routes,
 				ARRAY_SIZE(rt5645_old_dapm_routes));
+			if (ret < 0)
+				goto exit;
 		}
 		break;
 	case CODEC_TYPE_RT5650:
-		snd_soc_dapm_new_controls(dapm,
+		ret = snd_soc_dapm_new_controls(dapm,
 			rt5650_specific_dapm_widgets,
 			ARRAY_SIZE(rt5650_specific_dapm_widgets));
-		snd_soc_dapm_add_routes(dapm,
+		if (ret < 0)
+			goto exit;
+
+		ret = snd_soc_dapm_add_routes(dapm,
 			rt5650_specific_dapm_routes,
 			ARRAY_SIZE(rt5650_specific_dapm_routes));
+		if (ret < 0)
+			goto exit;
 		break;
 	}
 
@@ -3395,9 +3409,17 @@ static int rt5645_probe(struct snd_soc_component *component)
 
 	/* for JD function */
 	if (rt5645->pdata.jd_mode) {
-		snd_soc_dapm_force_enable_pin(dapm, "JD Power");
-		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
-		snd_soc_dapm_sync(dapm);
+		ret = snd_soc_dapm_force_enable_pin(dapm, "JD Power");
+		if (ret < 0)
+			goto exit;
+
+		ret = snd_soc_dapm_force_enable_pin(dapm, "LDO2");
+		if (ret < 0)
+			goto exit;
+
+		ret = snd_soc_dapm_sync(dapm);
+		if (ret < 0)
+			goto exit;
 	}
 
 	if (rt5645->pdata.long_name)
@@ -3407,7 +3429,15 @@ static int rt5645_probe(struct snd_soc_component *component)
 		RT5645_HWEQ_NUM, sizeof(struct rt5645_eq_param_s),
 		GFP_KERNEL);
 
-	return 0;
+	if (!rt5645->eq_param)
+		ret = -ENOMEM;
+exit:
+	/*
+	 * If there was an error above, everything will be cleaned up by the
+	 * caller if we return an error here.  This will be done with a later
+	 * call to rt5645_remove().
+	 */
+	return ret;
 }
 
 static void rt5645_remove(struct snd_soc_component *component)
-- 
2.30.2

