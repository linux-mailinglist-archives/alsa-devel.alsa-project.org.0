Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E7791789
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D0993A;
	Mon,  4 Sep 2023 14:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D0993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831655;
	bh=3QF4KtRZO8nKUIjB3WJa1duuIxLgWmoE3PQ5cytBGVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZPbUw9Wfl3UuSrh4F7JnTciB8TZ+Hxi79b+WvtP6rQtm8F945NbKkmreCSuVDwOeq
	 B2smqETWpqYVyWSBkoKonJ5hLvXYE0i4tuHqU2D3cUch+SP6wivtDMJDQgV6+QQJ4k
	 WxnmuvZzwnvE3bBQon23NthVEMpxPI2+eQNTO8SY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11FF0F805E6; Mon,  4 Sep 2023 14:44:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53CE9F805DF;
	Mon,  4 Sep 2023 14:44:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238B8F80249; Fri,  1 Sep 2023 16:46:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 277A1F80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 277A1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=X3lFqZd4
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 232CE9C0919;
	Fri,  1 Sep 2023 10:46:51 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oOc0W1F8q9HX; Fri,  1 Sep 2023 10:46:50 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7C9769C2A5F;
	Fri,  1 Sep 2023 10:46:50 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7C9769C2A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579610; bh=LOHxGESK5L5fl663kVhZ0C4bAojEwCmxoyM8052M+Vw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=X3lFqZd4TTCkHzokJP/9L2vhtrPwsSKGguIlEAD1qHT4Bbu+GRxVINWKcwyEuBDXw
	 BtWd24Bnqp6TJOxKcJdXl35XoSKYTpwkKlWO4tfoMtVRaoDya7KjiFESsb6SfwCiKd
	 QBM9FpfkicAgtgnVcXlBglYgGWiM3FQ0e8zejVcZyNvLnYSP0cxHEYf+hvru5HpMIS
	 SLk6H+sBsS5NTFoRSa2ZbvZh6IpiIh18HyBVKzcde2JpZD3Pd9ESdNEpfpGF3QDani
	 i6qBqSR8I30Dl41gRcJAOOEuj2dyF1HgNnONvUPdY83wBYFERIxcPkZub7MNDCtwFT
	 IaVhOvSpzRW8A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 1Bc7YcOar5j5; Fri,  1 Sep 2023 10:46:50 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A49E79C0919;
	Fri,  1 Sep 2023 10:46:49 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 07/10] ASoC: fsl-asoc-card: add dts property "cpu-slot-num"
Date: Fri,  1 Sep 2023 16:45:47 +0200
Message-Id: <20230901144550.520072-8-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: GOYZUJDSZ3WINHWNXOF3RYCT47QXTDAZ
X-Message-ID-Hash: GOYZUJDSZ3WINHWNXOF3RYCT47QXTDAZ
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOYZUJDSZ3WINHWNXOF3RYCT47QXTDAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add new optional dts property "cpu-slot-num", which allows to set a
custom number of TDM slots for the CPU DAI when using the dummy codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 12d01970850d..66bcb6aa498a 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -722,6 +722,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->card.dapm_routes =3D NULL;
 		priv->card.num_dapm_routes =3D 0;
 		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
+		of_property_read_u32(np, "cpu-slot-num", &priv->cpu_priv.slot_num);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

