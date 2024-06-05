Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884B8FD76E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 22:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F8CD839;
	Wed,  5 Jun 2024 22:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F8CD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717618860;
	bh=uKobMdssiBNVRXYbdWAN28ycziehwxzkQTvSknhr/oQ=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SLX8Yhl9FqXKnq/cSMGfVtoSzWkljm8RxUfyL89Hk+9gwGQ62mS0XbYJJkrZsHRJi
	 Js4QBhLx/7QNaL4tWljnp/9igWlUJt+urgjby9MFhqq0LyrzND3H+7/9fqbVN4xu5+
	 rhWGN6Z6VeCAoz2+q3VWAzBb8miOk8DFhBxN2mIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F432F80579; Wed,  5 Jun 2024 22:20:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCC95F802DB;
	Wed,  5 Jun 2024 22:20:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD3ECF802DB; Wed,  5 Jun 2024 22:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69761F800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 22:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69761F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=a4gM/RNA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717618814; x=1718223614; i=markus.elfring@web.de;
	bh=K4LgTxaCEsSwrK2DaS4xTbm0mo17tA8sa1rtdFZaZSA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=a4gM/RNABMV3cshzsCgNsHWPGDd13x/ZuzC2DqDCZUp/bbIPpfviTN2j9IsvFsik
	 A11rbnVTX1AgUhGRkp2QcIV9dHv8eTUdWiGTYWs8/Ldj6FHumJNUkbwNfXTyc0nUo
	 3CEkER+A3lnbUNzOU7r6QyHw6sFuN5Pu6Vo2kO4Upgt8Ipl2Mxo7SJyZ4cInzCKLz
	 ewal+wleMRoSLOE/tPh3Xo2qizVjZGDXEgQz9xsKzuCSQxU2rRpANwzWIqkKoCHsf
	 TkzEEPDS5YP4Z9hB3ouDrV8aV+zm9DbJ7rhirutlsAFOuEYHkNNhphPwgnP7d+F8N
	 sHldYOHdG7oWIDzBNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mv3US-1sWLTa1tWi-011U9e; Wed, 05
 Jun 2024 22:20:14 +0200
Message-ID: <f2912116-93f2-437d-bb15-9b7d41ccda19@web.de>
Date: Wed, 5 Jun 2024 22:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org,
 David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ASoC: cs35l56: Use scope-based resource management in
 cs35l56_try_get_broken_sdca_spkid_gpio()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iiMvF75SG/hLXKOCRnOGm3xQbDMpR7dtnFbnQ9Xj6PHqB2eQQvy
 /VTBEhRwXj4Ql8Bkp1zH6MhJTVhN8IKwREbf2wYTCoxGKpxCn5tHQWeJC0UxJW0APqbyUWh
 74QaReiEVNE0OBgn8QtlmCnnsmk9+/9OLLMayfGcwdUNLjI9YCVriOzULAXL8NwQAIKWmh/
 3WoJ8iSyJ4ormopJEgkrA==
UI-OutboundReport: notjunk:1;M01:P0:n4JHpL93ZJo=;PTxSPLzhWGpJxuiVw13mzB0IY1c
 0EhReMzzrH1mcmQHZigcjzVCjSL4XlZ507DMRHr/4DG+EUtxWMX//+A9VbGGy0V7LHwTGHlHO
 DclfvWZwdw7BqDbFigGPKYXQG1AfYuac2RaWCfIntfy00+dU2vUyhpgnZxPjN4DVrDqkTxtAm
 urkY6eIxm7K4NxBjvesr6gsDiHMnSAWBSmdG2DIlYQefU6kLhZgLEAW0C5NrDiz4rKIanYnPr
 Pq9sCDdIKbl+azn8ZcmjrXE3pBJbGtrB4nVigG6R9UnX1VufBK5446gRLMTlvuamoNXHWDNUZ
 REIX88b8RGsLJ09ikbt7LSBNZrh7NiLLB4+pE8mJowIEglv2r0SI9vMuctZjLQi5dTRnopLQN
 8KlTpmmEbSi/KMnPLbnonW9crElAPP5ppqY30/9Lpub5jEgKaKPP0jvolRulYekkzm9urqMsX
 IfxtN2GNMMf2gKS9dMsfGUGTaUPi37EczsqdIvg/3abrHLVpMeq/7HjTw+d51331Y48DIPQX3
 FHoM/axKquwiYdx3+hdbG9JtTjgsGw0Y1qvKknMR19Nr3mZjTKlclv/dONOmV/upHa7tUDjX6
 /2t4gErup825VQbjH0P0DgYtAPuup78IAzF6CAG2+U9pPgTT4mFQFDdLFC1z9XuCkd4lPyLsu
 8hE8dnLxcK2STZt8SMo3d7wuIWkIuGDtPGo9IFhrMjioeeEwiQ+BvrXZpmEpFjfqOgwk71stD
 Xb7ahDhflymtoG2AErj0askyTI09esP02lFyr3CrdGE0OEQyhLMh1fwz3arTVFXzP5h3inxZl
 G2kp6wRgjXjCQnBswNK0XacWzPTwHQGNHP+MDpgALjhm4=
Message-ID-Hash: ZBI4EQWDN72ZU2WE24AY2J2YTKTL4FTD
X-Message-ID-Hash: ZBI4EQWDN72ZU2WE24AY2J2YTKTL4FTD
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBI4EQWDN72ZU2WE24AY2J2YTKTL4FTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Jun 2024 22:02:09 +0200

Scope-based resource management became supported also for another
programming interface by contributions of Jonathan Cameron on 2024-02-17.
See also the commit 59ed5e2d505bf5f9b4af64d0021cd0c96aec1f7c ("device
property: Add cleanup.h based fwnode_handle_put() scope based cleanup.").

* Thus use the attribute =E2=80=9C__free(fwnode_handle)=E2=80=9D.

* Reduce the scope for the local variable =E2=80=9Caf01_fwnode=E2=80=9D.

* Omit explicit fwnode_handle_put() calls accordingly.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

See also the commit fbd741f0993203d07b2b6562d68d1e5e4745b59b ("ASoC: cs35l=
56:
fix usages of device_get_named_child_node()").


 sound/soc/codecs/cs35l56.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 758dfdf9d3ea..db41fc42dcac 100644
=2D-- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1345,13 +1345,13 @@ static void cs35l56_acpi_dev_release_driver_gpios(=
void *adev)

 static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private =
*cs35l56)
 {
-	struct fwnode_handle *af01_fwnode;
 	const union acpi_object *obj;
 	struct gpio_desc *desc;
 	int ret;

 	/* Find the SDCA node containing the GpioIo */
-	af01_fwnode =3D device_get_named_child_node(cs35l56->base.dev, "AF01");
+	struct fwnode_handle *af01_fwnode __free(fwnode_handle)
+					  =3D device_get_named_child_node(cs35l56->base.dev, "AF01");
 	if (!af01_fwnode) {
 		dev_dbg(cs35l56->base.dev, "No AF01 node\n");
 		return -ENOENT;
@@ -1361,7 +1361,6 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(st=
ruct cs35l56_private *cs35l5
 				    "spk-id-gpios", ACPI_TYPE_PACKAGE, &obj);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "Could not get spk-id-gpios package: %d\n", =
ret);
-		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}

@@ -1369,7 +1368,6 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(st=
ruct cs35l56_private *cs35l5
 	if (obj->package.count !=3D 4) {
 		dev_warn(cs35l56->base.dev, "Unexpected spk-id element count %d\n",
 			 obj->package.count);
-		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}

@@ -1383,26 +1381,21 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(=
struct cs35l56_private *cs35l5
 		 * ACPI_COMPANION().
 		 */
 		ret =3D acpi_dev_add_driver_gpios(adev, cs35l56_af01_spkid_gpios_mappin=
g);
-		if (ret) {
-			fwnode_handle_put(af01_fwnode);
+		if (ret)
 			return dev_err_probe(cs35l56->base.dev, ret,
 					     "Failed to add gpio mapping to AF01\n");
-		}

 		ret =3D devm_add_action_or_reset(cs35l56->base.dev,
 					       cs35l56_acpi_dev_release_driver_gpios,
 					       adev);
-		if (ret) {
-			fwnode_handle_put(af01_fwnode);
+		if (ret)
 			return ret;
-		}

 		dev_dbg(cs35l56->base.dev, "Added spk-id-gpios mapping to AF01\n");
 	}

 	desc =3D fwnode_gpiod_get_index(af01_fwnode, "spk-id", 0, GPIOD_IN, NULL=
);
 	if (IS_ERR(desc)) {
-		fwnode_handle_put(af01_fwnode);
 		ret =3D PTR_ERR(desc);
 		return dev_err_probe(cs35l56->base.dev, ret, "Get GPIO from AF01 failed=
\n");
 	}
@@ -1411,13 +1404,10 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(=
struct cs35l56_private *cs35l5
 	gpiod_put(desc);

 	if (ret < 0) {
-		fwnode_handle_put(af01_fwnode);
 		dev_err_probe(cs35l56->base.dev, ret, "Error reading spk-id GPIO\n");
 		return ret;
 	}

-	fwnode_handle_put(af01_fwnode);
-
 	dev_info(cs35l56->base.dev, "Got spk-id from AF01\n");

 	return ret;
=2D-
2.45.1

