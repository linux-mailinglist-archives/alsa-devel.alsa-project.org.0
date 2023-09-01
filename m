Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75913791786
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC709DF3;
	Mon,  4 Sep 2023 14:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC709DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831612;
	bh=eNRqMVZatneI3Ka7MdPBpZnvpucMZGdgWUKSG9J6DGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ko9OJ0FbANLN7gJgyTs9Kmo94Kxepl6P/HsLfSaDY0ZFM2w9G9eQDddLoPmaHQyhu
	 24D5Rx0Tsi3i8oL5p9agb/cTDo/UWVv7/8a8pLwLxL4zK2HOCDylOBb0ZrIY9hr1qN
	 Xir1AHbJxkRCnkbe13WJThELf+ZxR2wrm51J0ahA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBB9F805C6; Mon,  4 Sep 2023 14:44:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEEF4F805BE;
	Mon,  4 Sep 2023 14:44:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47429F80236; Fri,  1 Sep 2023 16:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3347AF8023B
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3347AF8023B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=IdxD+cPi
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2922B9C1115;
	Fri,  1 Sep 2023 10:46:43 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5O8TOwzDq38N; Fri,  1 Sep 2023 10:46:42 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6829B9C2A5C;
	Fri,  1 Sep 2023 10:46:42 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 6829B9C2A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579602; bh=dPY5UkpvLa7HatpHe4ldL14oOtB8Oa3iWA3pVzNiCVo=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=IdxD+cPiu/8wasCQTbBCLdmjFg7dWFSxqPHyS9zYMpobnYHuxW3Rv4EhKpc42/Is0
	 45sEoriCzkRPkkjyGnkaE1LdU+OFBc6GuS83qIYaQHvP8n2Wi6HkFcx7feRtBoXGrQ
	 U9ZqfMM9tjeTMK/+NkIBzGLGNM4rhC/V+GjDnyG7Elerx28xSKxe4R1M5hPhZ0767j
	 w22MjR66SGn8smsguC72LklhJRIEPDDaa6yGznU4SB5GY036BYfMJdDmcDNp7w89fr
	 hzhca3XVJJc7WU6s1+a0wKoosPZQ6W97IEJ1CzdQdCPdbuzul/twXd0Uhnn64eXZf3
	 txHyaJSoKvQ3w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OUo11mwFm-fu; Fri,  1 Sep 2023 10:46:42 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8DA449C2A5F;
	Fri,  1 Sep 2023 10:46:41 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 05/10] ASoC: fsl-asoc-card: add new DAPM audio map for asrc
Date: Fri,  1 Sep 2023 16:45:45 +0200
Message-Id: <20230901144550.520072-6-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
References: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DED63YW65SJ6NRQPHPZFCRI4FDF2VRNJ
X-Message-ID-Hash: DED63YW65SJ6NRQPHPZFCRI4FDF2VRNJ
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DED63YW65SJ6NRQPHPZFCRI4FDF2VRNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add the new DAPM audio map audio_map_asrc used with the dummy codec.
The dummy codec doesn't have any Playback or Capture DAPM widgets. DAPM
default audio maps are thus unused with it. However, when using the
ASRC, DAPM routes between CPU DAI and ASRC are still required.
The driver must then handle this use case.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 5ef26ae512de..d8f4412be308 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -148,6 +148,13 @@ static const struct snd_soc_dapm_route audio_map_rx[=
] =3D {
 	{"ASRC-Capture",  NULL, "CPU-Capture"},
 };
=20
+
+static const struct snd_soc_dapm_route audio_map_asrc[] =3D {
+	{"CPU-Playback",  NULL, "ASRC-Playback"},
+	{"ASRC-Capture",  NULL, "CPU-Capture"},
+};
+
+
 /* Add all possible widgets into here without being redundant */
 static const struct snd_soc_dapm_widget fsl_asoc_card_dapm_widgets[] =3D=
 {
 	SND_SOC_DAPM_LINE("Line Out Jack", NULL),
@@ -803,6 +810,11 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 	/* Drop the second half of DAPM routes -- ASRC */
 	if (!asrc_pdev)
 		priv->card.num_dapm_routes /=3D 2;
+	else if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec")) {
+		/* Dummy codec doesn't provide Playback and Capture widgets */
+		priv->card.dapm_routes =3D audio_map_asrc;
+		priv->card.num_dapm_routes =3D 2;
+	}
=20
 	if (of_property_read_bool(np, "audio-routing")) {
 		ret =3D snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
--=20
2.25.1

