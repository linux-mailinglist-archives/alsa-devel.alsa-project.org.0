Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8880814AD8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:44:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E9AE0F;
	Fri, 15 Dec 2023 15:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E9AE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651440;
	bh=HXCS5StPz/ifq66mFe/Jj3Q65TF3SlpI4W5seWeLOEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iw2W1KKsF18TqOMv+elTK8Y5ZVQo+g+Sxmb2c1r8yEG857LW65ej+BFfYNR5/u+po
	 7Yma/Hqu+u1FNi7re4hTSgUx7acjA4neHAgkpwrmyayYfYzgkJPzgpfW4oovEz3to1
	 +XoA6BEUMIrnk1d5XQ11guIVLr42EacNq5fAdWgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F03F80691; Fri, 15 Dec 2023 15:42:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59408F80691;
	Fri, 15 Dec 2023 15:42:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4224AF80494; Fri, 15 Dec 2023 15:42:11 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 95410F8019B
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95410F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=B/1d+ZDK
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A7C139C094E;
	Fri, 15 Dec 2023 09:42:07 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id UrFSvh_CqOh1; Fri, 15 Dec 2023 09:42:07 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 640DD9C411A;
	Fri, 15 Dec 2023 09:42:07 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 640DD9C411A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651327; bh=1tWHBsC3u+nkZ6XpND0qMR0c3tv5xGsM8B4rjwBEpB0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=B/1d+ZDKai6iRqQ00hd2bzYtVIRc3vT77vfogHBM5/4H1PRRK8NZmCMB8soCAky1G
	 ZjKWe8e8CLoCjO5uqihJ8Af5krlYjNKx8F3/7kjxS0oTofOrR434MdFtwBNnvsf1Xc
	 lB0f0U8KZW7/I38Ax4GfKvtqRlIO/1SFYGFrbnEdxWPUKwrrs4gJb36SRV0U1Al5Na
	 8eyRCxbTfVhSZ7w4hq50rrDIDBHdzwW9QMJbUTst2g+pcmedi6W8z/MmhyzE9hq5Sa
	 nQKFWFVUA3uzi4GAQrW42UOe26OjiT9sXEYHLfTy8ea/6op/GR0xI2vMY2DbAn4ZJL
	 SgBbMCpuSU+HQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id kA6fq4dqu6iZ; Fri, 15 Dec 2023 09:42:07 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 7B56C9C094E;
	Fri, 15 Dec 2023 09:42:06 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 06/10] ASoC: fsl-asoc-card: add dts property
 "cpu-slot-width"
Date: Fri, 15 Dec 2023 15:40:01 +0100
Message-Id: <20231215144005.934728-7-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: L5IBK2HELNITWRD6YDYV3F4G3G47E3YP
X-Message-ID-Hash: L5IBK2HELNITWRD6YDYV3F4G3G47E3YP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5IBK2HELNITWRD6YDYV3F4G3G47E3YP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts property "cpu-slot-width", which allows setting a
custom TDM slot width in bits for the CPU DAI
when using the generic codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 3a57d9bfbb48..012c8d3666aa 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -745,6 +745,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->dai_link[0].num_codecs =3D 2;
 		priv->dai_link[2].num_codecs =3D 2;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
+		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

