Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C47814AE5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B709E8C;
	Fri, 15 Dec 2023 15:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B709E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651490;
	bh=eUKIlchFvAnm5RsuGG/p/fslRn62rv2jSMscgpfvjo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gxb9H0t3VK0mINOGn6qJTjBqkiqO5AwG9fEA5BEsDYeznSgvioHDwj73pCn0iXGQW
	 7sl1Sr1IOE5Xt10ZGCUl25FOQENNVFN5bmKlIZhrSn5YlmvuY9ZVBv62FTK0zrBv0Q
	 IlqZddyLqq8xPJ9+HE5gHMLYWri3zELBUimtqP+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 254FDF806D4; Fri, 15 Dec 2023 15:42:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44289F806D8;
	Fri, 15 Dec 2023 15:42:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6F3EF806C8; Fri, 15 Dec 2023 15:42:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 47CB8F80568
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CB8F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=uSjsEpp0
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 00F929C2A93;
	Fri, 15 Dec 2023 09:42:24 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id YKf96SW3eZAF; Fri, 15 Dec 2023 09:42:23 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AB4719C094E;
	Fri, 15 Dec 2023 09:42:23 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AB4719C094E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651343; bh=KtxwE8Nf9NfqMzcAEjPfPhN3k9SXvXZrYJX8fn3taU4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uSjsEpp0zvLOaQOEiPm+EtYb6JyhGJsq3yuVL4uvyTNY2wUAnVdHk45EYtNpehkRR
	 F6/510PwAqV7Lzp5Mm/31AAcU0wTx8pozkBAWQF8DM6AeeyZWfLNv9ZGrdy3iiqDk1
	 IMmlLHNEC6f2/3A7/41M7jez+2dT+Uz26BKWVFXbeJumw1zJHSdVgGdpzBE11nHePY
	 LfKm+Jtkg02nBhUw63DarRB3ZkNzawEMkDdToaqgoNmiMmTgwuzYLRCSZynXM5zVNw
	 6G81YiIU/ieMbEtyN4Z+ZqhQanyyLAFsYVYRyTeA8C6iuHkd9pnNQP+XCyiRF8anGn
	 faqI9NA3XPKGg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id SLPl2DgJovb9; Fri, 15 Dec 2023 09:42:23 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C18CB9C411B;
	Fri, 15 Dec 2023 09:42:22 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 09/10] ASoC: fsl-asoc-card: add dts properties
 "cpu-sysclk-dir-out"
Date: Fri, 15 Dec 2023 15:40:04 +0100
Message-Id: <20231215144005.934728-10-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MQKZJ7XZEVDGG2D62634PECJ34NGO7AN
X-Message-ID-Hash: MQKZJ7XZEVDGG2D62634PECJ34NGO7AN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQKZJ7XZEVDGG2D62634PECJ34NGO7AN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts properties "cpu-sysclk-dir-out" to set
sysclk directions as "out" for the CPU DAI when using the generic codec.
This can be set for Tx and Rx.
If not set, the direction is "in".
The way values are used is up to the CPU DAI driver implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 7b0d7df7ae27..5f8fb724e29d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -751,6 +751,12 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 					(u32 *)&priv->cpu_priv.sysclk_freq[RX]);
 		of_property_read_u32(np, "cpu-sysclk-freq-tx",
 					(u32 *)&priv->cpu_priv.sysclk_freq[TX]);
+		priv->cpu_priv.sysclk_dir[RX] =3D
+			of_property_read_bool(np, "cpu-sysclk-dir-rx-out") ?
+			SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
+		priv->cpu_priv.sysclk_dir[TX] =3D
+			of_property_read_bool(np, "cpu-sysclk-dir-tx-out") ?
+			SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

