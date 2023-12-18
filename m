Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC4816E29
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:44:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF38E79;
	Mon, 18 Dec 2023 13:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF38E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903459;
	bh=MnTxDQ/X0Gu1276RPY1f/BSXX1hXOKOfeOjfCfmzCv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Axu77qZ9vTRnacvadGLd+WeSaGQKYb3JLRdqk6DlglM2OqhpVjZ2JdWwQN4kL/aR6
	 VTVaoVz3keZCR8S4PBwSs+oeH1dF+oHHyXP/97PYloRyDGV8Bl0x75W/qFHstYD76z
	 5L8R6BMii4lKoLR2/ppVyYtY7NfXMwcR8muzenC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96849F80614; Mon, 18 Dec 2023 13:43:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B410F8060F;
	Mon, 18 Dec 2023 13:43:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 164DFF8055C; Mon, 18 Dec 2023 13:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A690F80557
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:43:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A690F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=RdmDdwD6
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 192379C414A;
	Mon, 18 Dec 2023 07:43:03 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5NGF_qYcd4D8; Mon, 18 Dec 2023 07:43:02 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B16B89C414B;
	Mon, 18 Dec 2023 07:43:02 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B16B89C414B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903382; bh=6kRTwfd4Noi281HJPP4aTcZJSr5Bl9jyeAnw8yA/CC0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RdmDdwD6d0HiGxXVZPjDQINlzfaYgVK/jkpvLAolGJscw9kq8I39bp7M427l1pcji
	 zTyFoyzNhVFZ6+uoCpDjej6M4/tR3pi8zAlXXWjBBg051OvRbgfUiUKyBZx2SwDUS1
	 ZgT0BJzZ7tzgWzAe6cvmI2jyo0lEy0Rx/207xKUKtLiiYjQCpij5iHCRG0liAta2Xj
	 J0dzwsmwc1PGIlILgcOwEV0KcIpiaUKXuIw//Cq8ZCWiHChJvXd5Pb4v4Z4s52qHhO
	 JI7r5rth9YYUfBuclJ+MtVKrMSR9LauW9Yb4Kp22s3o/25u5I5nEYQ5YPjBorACPbM
	 dkR37ljjTwHsg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 29IAtLGpfhia; Mon, 18 Dec 2023 07:43:02 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id AFCF29C414A;
	Mon, 18 Dec 2023 07:43:00 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv3 RESEND 05/10] ASoC: fsl-asoc-card: set generic codec as
 clock provider
Date: Mon, 18 Dec 2023 13:40:53 +0100
Message-Id: <20231218124058.2047167-6-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: T5V7Y7EDYVIZBXHQGYLCIKWHHTJH2AUV
X-Message-ID-Hash: T5V7Y7EDYVIZBXHQGYLCIKWHHTJH2AUV
X-MailFrom: elinor.montmasson@savoirfairelinux.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5V7Y7EDYVIZBXHQGYLCIKWHHTJH2AUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The default dai format defined by DAI_FMT_BASE doesn't set if the codec
is consumer or provider of the bit and frame clocks.

S/PDIF DIR usually converts audio signal to an asynchronous I2S/PCM
stream, and doesn't consume a bit or frame clock.

As S/PDIF DIR and DIT are used as codecs for the generic use case,
set codecs as provider of both bit and frame clocks by default.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 71048c1250ec..3a57d9bfbb48 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -744,6 +744,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		generic_codec_dai_names[1] =3D "dir-hifi";
 		priv->dai_link[0].num_codecs =3D 2;
 		priv->dai_link[2].num_codecs =3D 2;
+		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

