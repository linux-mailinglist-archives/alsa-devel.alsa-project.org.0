Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646166F628D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 03:10:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10C431725;
	Thu,  4 May 2023 03:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10C431725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683162656;
	bh=eJ5QldeycIa2NTUjoWTmraq9o+Jc5QK64BWRMRqmYoE=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qvdsi9R8hEbh+QtUAgdBGgCpCXsWTUzfB/yuPSHfySHvC6twbr+59FfSPUfC+c1nc
	 FzMtOUT3UHJB1WA23iSxwKDdAnq8REJt8hRGkd2LfvJP1JQUtT5xdDTijhVtxJ0nEY
	 OP+5v/Q7ikXVCV8x6tJJf1ZCdfRwCWHPAPvt3TPw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59023F80114;
	Thu,  4 May 2023 03:10:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE646F8049E; Thu,  4 May 2023 03:10:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0D5BF80114;
	Thu,  4 May 2023 03:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0D5BF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X0b442MX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB3D262F92;
	Thu,  4 May 2023 01:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36FBC433EF;
	Thu,  4 May 2023 01:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683162591;
	bh=eJ5QldeycIa2NTUjoWTmraq9o+Jc5QK64BWRMRqmYoE=;
	h=Date:From:To:Cc:Subject:From;
	b=X0b442MXlGtWVUi5jULE0Huux8t4dvI514DxSEwsRfLJoPmcKyVofn+u22gEoUi1B
	 6Q25oo9hZ6B5I1jZYfYqnvCV4hcOcl1xMhUdKNUHhMPMvhdo5w4tjK3+SzrDC+/rDa
	 ZGUOzAMxxa4DUJwnGgtBTIShPSaF/ECIZyTo6PA+UBqhY6zabu7G2Z+hIWF2/Ghs2I
	 AgXT6z1n48VsN1/2bBWDftUBrBZErNISlLOuwPl6U0ZGoL4k0AwMyc2YGDd4rPnCMj
	 pABplT6FgW6NtmkM+ujIgSR7/y8qI7Nc9GP+mPX5+AWbyeZWoW6L1IS/i9TXb4QqxD
	 zNGQjJ5T3jAtg==
Date: Thu, 4 May 2023 10:09:45 +0900
From: Mark Brown <broonie@kernel.org>
To: postmaster@alsa-project.org, sound-open-firmware-owner@alsa-project.org,
	perex@perex.cz, tiwai@suse.de
Subject: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC: mediatek:
 mt8195-afe-pcm: Simplify runtime PM during probe]
Message-ID: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cVoURN8e43gh+mdh"
Content-Disposition: inline
X-Cookie: Ring around the collar.
Message-ID-Hash: A2AKSGE5UGHUQBUM4L2TVAWJOTJSUZUY
X-Message-ID-Hash: A2AKSGE5UGHUQBUM4L2TVAWJOTJSUZUY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2AKSGE5UGHUQBUM4L2TVAWJOTJSUZUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cVoURN8e43gh+mdh
Content-Type: multipart/mixed; boundary="bbQifIiVLsKaYT2j"
Content-Disposition: inline


--bbQifIiVLsKaYT2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's another mail (one of several in this series) that got completely
mangled by the alsa-project.org mailman to the point of unusability.  I
didn't see any response to my last mail about this, is there any news on
fixing mailman to not do this?  It's extremely disruptive to working
with lore.

Thanks,
Mark

--bbQifIiVLsKaYT2j
Content-Type: message/rfc822
Content-Disposition: inline

Subject: [PATCH 3/5] ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM
 during probe
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Date: Wed, 03 May 2023 13:34:11 +0200
Message-Id: <168311377075.26.14919941665402646886@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Use devm_pm_runtime_enable() and pm_runtime_resume_and_get() to
to simplify the probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 9e45efeada55..a54c16e0aa05 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3179,16 +3179,16 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	mt8195_afe_parse_of(afe, pdev->dev.of_node);
 
-	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev)) {
-		ret = mt8195_afe_runtime_resume(dev);
-		if (ret)
-			return ret;
-	}
-
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
 					    &mt8195_afe_regmap_config);
@@ -3238,7 +3238,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	mt8195_afe_init_registers(afe);
 
-	pm_runtime_put_sync(dev);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to suspend device\n");
+
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -3248,7 +3251,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 err_pm_put:
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.40.1

--bbQifIiVLsKaYT2j--

--cVoURN8e43gh+mdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRTBdgACgkQJNaLcl1U
h9DEhwf+IyUedH7iVv1hknTeNHkwqwExWNn8Cm3+LC1hVFbyxZ7csTPIL+a4V4UO
pVgg5asB9PQGj6d3kCLoCpO9QebO99N/8xIv+mL1RcS89f25mLQGd3Nejkk0X9jf
5T11JsLwkMl0K/OiDmolj7BsFSxYn79zVA1kAttAkMwE5GED2axO8g536PlNvWmu
Ls4h9YrFgDluLTbiUW5244KSscJRC9jLYKRezZxq64XZ3UQHwkE2m//FK83d5OXg
BZBZ7yB9SgP0paolZH0Da+csf6XI0NTzSA7nqMAMAKh3LwcDC0PpUAMZIlLB5xMX
F0RY7HAlsoaOZ26zer+UuV9I2DjSpQ==
=Xekk
-----END PGP SIGNATURE-----

--cVoURN8e43gh+mdh--
