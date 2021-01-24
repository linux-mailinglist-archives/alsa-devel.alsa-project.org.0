Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C3301AD4
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 10:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F8F18F5;
	Sun, 24 Jan 2021 10:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F8F18F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611480545;
	bh=JxnDE3GKMNIXlWUhZhwuCc8fZSEWrLvmNg1hGi+plck=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L2hMv2ObSWdw75TLY5HvuScuqjhNNBrAfrLFljdX+utRwW1AdCXMiRsmPsuGK9/UH
	 yK6Y344hxYHe7WXkfUXLxVvDCwm7tUlwH8nw7xxZRkyTal+NxkoTnJ5375RqSusjUR
	 uR2raj41xwfCisRkP6/zEPyBKAHNRukNxo2S0dH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 481B3F801D8;
	Sun, 24 Jan 2021 10:27:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2343CF8015B; Sun, 24 Jan 2021 10:27:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 789E0F8012D
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 10:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 789E0F8012D
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id F151C1C0B7F; Sun, 24 Jan 2021 10:27:13 +0100 (CET)
Date: Sun, 24 Jan 2021 10:27:13 +0100
From: Pavel Machek <pavel@ucw.cz>
To: broonie@kernel.org, aaro.koskinen@iki.fi, spinal.by@gmail.com,
 jarkko.nikula@bitmer.com, merlijn@wizzup.org, pavel@ucw.cz,
 peter.ujfalusi@ti.com, sre@kernel.org, tony@atomide.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 phone-devel@vger.kernel.org
Subject: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio graph
 card
Message-ID: <20210124092713.GA22195@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
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


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Tony Lindgren <tony@atomide.com>

We can have multiple connections on a single McBSP instance configured
with audio graph card when using TDM (Time Division Multiplexing). Let's
allow that by configuring dais dynamically.

See Documentation/devicetree/bindings/sound/audio-graph-card.txt and
Documentation/devicetree/bindings/graph.txt for more details for
multiple endpoints.

I've tested this with droid4 where cpcap pmic and modem voice are both
both wired to mcbsp3. I've also tested this on droid4 both with and
without the pending modem audio codec driver that is waiting for n_gsm
serdev dependencies to clear.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Arthur D. <spinal.by@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>

---
 sound/soc/ti/omap-mcbsp-priv.h |  2 ++
 sound/soc/ti/omap-mcbsp.c      | 76 +++++++++++++++++++++++++++++---------=
----
 2 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index 7865cda4bf0a..9464f5d35822 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -262,6 +262,8 @@ struct omap_mcbsp {
 	struct omap_mcbsp_platform_data *pdata;
 	struct omap_mcbsp_st_data *st_data;
 	struct omap_mcbsp_reg_cfg cfg_regs;
+	struct snd_soc_dai_driver *dais;
+	int dai_count;
 	struct snd_dmaengine_dai_dma_data dma_data[2];
 	unsigned int dma_req[2];
 	int dma_op_mode;
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 6025b30bbe77..189a6461b671 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -1299,23 +1300,53 @@ static int omap_mcbsp_remove(struct snd_soc_dai *da=
i)
 	return 0;
 }
=20
-static struct snd_soc_dai_driver omap_mcbsp_dai =3D {
-	.probe =3D omap_mcbsp_probe,
-	.remove =3D omap_mcbsp_remove,
-	.playback =3D {
-		.channels_min =3D 1,
-		.channels_max =3D 16,
-		.rates =3D OMAP_MCBSP_RATES,
-		.formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
-	},
-	.capture =3D {
-		.channels_min =3D 1,
-		.channels_max =3D 16,
-		.rates =3D OMAP_MCBSP_RATES,
-		.formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
-	},
-	.ops =3D &mcbsp_dai_ops,
-};
+static int omap_mcbsp_init_dais(struct omap_mcbsp *mcbsp)
+{
+	struct device_node *np =3D mcbsp->dev->of_node;
+	int i;
+
+	if (np)
+		mcbsp->dai_count =3D of_graph_get_endpoint_count(np);
+
+	if (!mcbsp->dai_count)
+		mcbsp->dai_count =3D 1;
+
+	mcbsp->dais =3D devm_kcalloc(mcbsp->dev, mcbsp->dai_count,
+				   sizeof(*mcbsp->dais), GFP_KERNEL);
+	if (!mcbsp->dais)
+		return -ENOMEM;
+
+	for (i =3D 0; i < mcbsp->dai_count; i++) {
+		struct snd_soc_dai_driver *dai =3D &mcbsp->dais[i];
+
+		dai->name =3D devm_kasprintf(mcbsp->dev, GFP_KERNEL, "%s-dai%i",
+					   dev_name(mcbsp->dev), i);
+
+		if (i =3D=3D 0) {
+			dai->probe =3D omap_mcbsp_probe;
+			dai->remove =3D omap_mcbsp_remove;
+			dai->ops =3D &mcbsp_dai_ops;
+		}
+		dai->playback.channels_min =3D 1;
+		dai->playback.channels_max =3D 16;
+		dai->playback.rates =3D OMAP_MCBSP_RATES;
+		if (mcbsp->pdata->reg_size =3D=3D 2)
+			dai->playback.formats =3D SNDRV_PCM_FMTBIT_S16_LE;
+		else
+			dai->playback.formats =3D SNDRV_PCM_FMTBIT_S16_LE |
+						SNDRV_PCM_FMTBIT_S32_LE;
+		dai->capture.channels_min =3D 1;
+		dai->capture.channels_max =3D 16;
+		dai->capture.rates =3D OMAP_MCBSP_RATES;
+		if (mcbsp->pdata->reg_size =3D=3D 2)
+			dai->capture.formats =3D SNDRV_PCM_FMTBIT_S16_LE;
+		else
+			dai->capture.formats =3D SNDRV_PCM_FMTBIT_S16_LE |
+					       SNDRV_PCM_FMTBIT_S32_LE;
+	}
+
+	return 0;
+}
=20
 static const struct snd_soc_component_driver omap_mcbsp_component =3D {
 	.name		=3D "omap-mcbsp",
@@ -1404,18 +1435,17 @@ static int asoc_mcbsp_probe(struct platform_device =
*pdev)
 	mcbsp->dev =3D &pdev->dev;
 	platform_set_drvdata(pdev, mcbsp);
=20
-	ret =3D omap_mcbsp_init(pdev);
+	ret =3D omap_mcbsp_init_dais(mcbsp);
 	if (ret)
 		return ret;
=20
-	if (mcbsp->pdata->reg_size =3D=3D 2) {
-		omap_mcbsp_dai.playback.formats =3D SNDRV_PCM_FMTBIT_S16_LE;
-		omap_mcbsp_dai.capture.formats =3D SNDRV_PCM_FMTBIT_S16_LE;
-	}
+	ret =3D omap_mcbsp_init(pdev);
+	if (ret)
+		return ret;
=20
 	ret =3D devm_snd_soc_register_component(&pdev->dev,
 					      &omap_mcbsp_component,
-					      &omap_mcbsp_dai, 1);
+					      mcbsp->dais, mcbsp->dai_count);
 	if (ret)
 		return ret;
=20
--=20
2.11.0

--=20
http://www.livejournal.com/~pavelmachek

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmANPXAACgkQMOfwapXb+vLfrgCeNvSRS9g22zGEyaBrP8dM+pds
zs8Ani6OgW/IB2/CcypeT+4Dp1n+GCMc
=zxjB
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
