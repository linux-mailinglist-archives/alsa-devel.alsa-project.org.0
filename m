Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEC814ADC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:44:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE8CE75;
	Fri, 15 Dec 2023 15:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE8CE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651451;
	bh=eIcgxwsPlmas7K2hDexMjPqCN1x9JjKMYN5z+zsn2Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WUafwgDJ1uRa8NnouPxBAgBZlZ0s2sQWUfL8MZrseWfs2YOL26dQuiRwQUG1hCQnu
	 UD8RFyHlyg/ka0p6lSPHIH698L5ESDsUsJspwQ/VHqwGerXmPxN836f70i2D8+BW5i
	 KQ84MUEfpj4JcVjcuWu9KB50+lAA5CsrykGfyId4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E802FF80589; Fri, 15 Dec 2023 15:42:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30240F806AA;
	Fri, 15 Dec 2023 15:42:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76600F8069E; Fri, 15 Dec 2023 15:42:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F32BF8068C
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F32BF8068C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=QO6eOh5T
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C67EA9C284E;
	Fri, 15 Dec 2023 09:42:13 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id YKJ7g_qhioni; Fri, 15 Dec 2023 09:42:13 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7A4869C40FC;
	Fri, 15 Dec 2023 09:42:13 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7A4869C40FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651333; bh=qDza+013LR5YLHqPM6YnPsoEtdDkLVQiJ4ZqxAAikIw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=QO6eOh5TOa2hfv3fG0OrdDdpUIjozxKOJ4BlvSnt1MWV9QVa4HT9/zhAVh8/u6jie
	 x0Xqwv1sZ4UuuPXWm7Yjze1U02soExP3JonWmqtvxA3lKMROqcBrnnijQY2RLHh6ON
	 l4Lv8qk1HeuXLfUOYiIS1MhbtHNCSI//0spGBTZ6yqXeSkDROiVFIoGnZIiAUrZInw
	 BML28WLIPIdphCRubUwVZRHrzTfOTYRvAblsthz+b8pCTwwTEI6RfauERViVcHt8Ag
	 CePq2I3HaIgRvKRJZ8PY0/ZedPbPxC+6jq4//qf7+qAzHnMAu1xf6scx6kpFp3wtJO
	 KyVSskOiJ/mTA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Qruv-a14I1tU; Fri, 15 Dec 2023 09:42:13 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 90B909C094E;
	Fri, 15 Dec 2023 09:42:12 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 07/10] ASoC: fsl-asoc-card: add dts property "cpu-slot-num"
Date: Fri, 15 Dec 2023 15:40:02 +0100
Message-Id: <20231215144005.934728-8-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DO5UZRWS57HEDGFLIQ272K4HC37D3UA7
X-Message-ID-Hash: DO5UZRWS57HEDGFLIQ272K4HC37D3UA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DO5UZRWS57HEDGFLIQ272K4HC37D3UA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts property "cpu-slot-num", which allows setting a
custom number of TDM slots for the CPU DAI when using the generic codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 012c8d3666aa..6f6cc8bd3acd 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -746,6 +746,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->dai_link[2].num_codecs =3D 2;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
+		of_property_read_u32(np, "cpu-slot-num", &priv->cpu_priv.slot_num);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

