Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEE791787
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 120659F6;
	Mon,  4 Sep 2023 14:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 120659F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831637;
	bh=BeaPkRRq0E2gvLSB2/6DRjFDHRPDqk7IiFUOf4FkRME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AeIpDSo7UJZyYSCDnT9pD8pxw4KzZTP8nXWq5FVk66RwpE/xhMWXaJ95CCIXgZhla
	 sy1h0NqYuUDA1TAoKd2S07nkfKCT11Pa+p1mwgtauwspVsalMn2ZfEQ/QwWT2sXVb3
	 2DNm9pJBS7aCX6IW29tjRQRP11ByvILQkIcoMTVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E94FF805C7; Mon,  4 Sep 2023 14:44:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 603D8F805CB;
	Mon,  4 Sep 2023 14:44:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1045F8023B; Fri,  1 Sep 2023 16:46:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D85BF80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D85BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=pugRBITn
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4C5AA9C2A6B;
	Fri,  1 Sep 2023 10:46:46 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id FELlblAHuwwM; Fri,  1 Sep 2023 10:46:45 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 927AF9C2A68;
	Fri,  1 Sep 2023 10:46:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 927AF9C2A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579605; bh=fHyFzyyNmZrVDepXkYzdpiB9Uglj5+vPUiPVRREG/MM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pugRBITnrKZF4sW3DlBEu5pBX4Amy9FEZtTu1Z2ENR8NwK9FQOZ6buuQFsE7Ea/1x
	 pkBIjs9IAcP9dJ4e2HIZoZkHeTx6fNs7z1qPXWgUtT8vElgSAe/ifXAm6vMIordxQr
	 2tsBHXTrYkygyFSrgh/3/C3AjSqHXjGuToeZKGTj+2LVedwCM9WulGzUhS77PXFK26
	 V0JuvBgW6DeLn4YOB5qbuxKw/E9uWHl6VtV6n1XBzAZ4P3L5ydBG2SoOacZx7dhcXG
	 +1tkTzzjQ1yxCxRxeXgtTShCDL3ciRhrWXOi9VoLn9y0Kq4rTQsWHrMgY0eBeAm/rL
	 wJn8Pn65SF2PQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Sai4lqYU5oRn; Fri,  1 Sep 2023 10:46:45 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B21FA9C2A5F;
	Fri,  1 Sep 2023 10:46:44 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 06/10] ASoC: fsl-asoc-card: add dts property "cpu-slot-width"
Date: Fri,  1 Sep 2023 16:45:46 +0200
Message-Id: <20230901144550.520072-7-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: RVSEXL6IHUGQXPW4562TQXEWQMWKPFU6
X-Message-ID-Hash: RVSEXL6IHUGQXPW4562TQXEWQMWKPFU6
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVSEXL6IHUGQXPW4562TQXEWQMWKPFU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add new optional dts property "cpu-slot-width", which allows to set a
custom TDM slot width in bits for the CPU DAI
when using the dummy codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index d8f4412be308..12d01970850d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -721,6 +721,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
 		priv->card.dapm_routes =3D NULL;
 		priv->card.num_dapm_routes =3D 0;
+		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

