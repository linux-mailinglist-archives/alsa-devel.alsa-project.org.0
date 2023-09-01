Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C979177F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D3EA4C;
	Mon,  4 Sep 2023 14:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D3EA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831570;
	bh=94GvThpch4KIQhb/eDaV9ArjImgMNezZnaruBwzFAfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n+LTekKAAnKcbCpf7ot3p5jXEiIJwc/fe2Q8QvQjLRP/s7g1491aMsgZkgipLRVVq
	 d17ynV6qF4mhCU2IGmrvSUmWbdcF7TQmNKGF5GO4/q7JbMPsro8MrXwlWPbrGfTsR1
	 JdCiQzC9PJyDE305OksG/n6l+Ai6YMx9cO6y3g+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF96F8058C; Mon,  4 Sep 2023 14:44:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F0FF8057F;
	Mon,  4 Sep 2023 14:44:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BDAF80236; Fri,  1 Sep 2023 16:46:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D5ABF800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5ABF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=uGL1j1Gl
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 420E19C1115;
	Fri,  1 Sep 2023 10:46:32 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id i_qMz8tGS-Jw; Fri,  1 Sep 2023 10:46:31 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9EA359C2A40;
	Fri,  1 Sep 2023 10:46:31 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 9EA359C2A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579591; bh=Ld48BtjguABGFoT9Tu4EHwP0So3rOE0HKY9Qeb0+aGU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uGL1j1GloTV3cs1E9uIH6MJ8gv1Augt7BeevqjQq1aM72zvVKSh5WdmhIMkeov9DE
	 JzijQd+aiYYsHvL67XF7Bv1J9F8u7jQ/LzBtZpTXFtFOeE2lKqQp8U7/1GGJFnGSfg
	 9o7ANxSCtjmBLydU4c1a3Y+ecVIGkql+9Jk/tdK+M6l/XS9zMaFptTCTIOfgTX/0rH
	 bNZJndzleAoPn4LjG9UX9/ot6Xl3PKOgUrYx8M2lE1EjasiPeyhxAQ2wU0Phqr0fP3
	 LSyjtdxyQJTXE1T1nZeNOWqci8wZEhT0Qj37J4Cfjh9zrl63IlkfVazi4QOomt9CtR
	 55HJtoMNYZtEg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id c6gn2rhC1vMB; Fri,  1 Sep 2023 10:46:31 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B0F389C1115;
	Fri,  1 Sep 2023 10:46:30 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 02/10] ASoC: fsl-asoc-card: prevent deferment with dummy codec
Date: Fri,  1 Sep 2023 16:45:42 +0200
Message-Id: <20230901144550.520072-3-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: NEWDIKDEG7A23NJBJCPUHKRO5RA7GIOR
X-Message-ID-Hash: NEWDIKDEG7A23NJBJCPUHKRO5RA7GIOR
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEWDIKDEG7A23NJBJCPUHKRO5RA7GIOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Prevent deferment during sound card initialisation when using the
dummy codec.
If the codec isn't an ac97, it is expected to have a device tree node
for the codec. If not, the sound card initialisation is deferred.
However, the dummy codec has no device tree node, thus we must
handle this specific use case.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index c12a356a86d5..d656df0b0eea 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -748,7 +748,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	of_node_put(bitclkprovider);
 	of_node_put(frameprovider);
=20
-	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
+	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev
+	  && !of_device_is_compatible(np, "fsl,imx-audio-dummy-codec")) {
 		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
--=20
2.25.1

