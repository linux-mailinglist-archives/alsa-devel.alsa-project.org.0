Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E979105F0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 15:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42198E64;
	Thu, 20 Jun 2024 15:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42198E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718890174;
	bh=dzpFwyNp+pQPgfQmVxgbYBcFHA5gR50/XR282v0SEcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vrorqXjrmpzw/A1HWdxa21VaQCoPwg1TTk25FG1m+GnXXghVTKXKjrVrCm3zjv+cM
	 dI4SwaNzpZhJKbWnrzrXkn4e4/21HzS+CGL7SUhv/o6IqG3r0VaCOp2P4iNsX3DdsL
	 piu5QrRXUN53cqxwJJcUCDK3zC6g1TNeQw1EAv0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77998F805F9; Thu, 20 Jun 2024 15:28:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C04F80609;
	Thu, 20 Jun 2024 15:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C4CDF8058C; Thu, 20 Jun 2024 15:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A1FEF805B1
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 15:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1FEF805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=SPJOThOj
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 86F019C5BCC;
	Thu, 20 Jun 2024 09:26:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id nTj3k_ahoqKC; Thu, 20 Jun 2024 09:26:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AEAC49C5B16;
	Thu, 20 Jun 2024 09:26:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AEAC49C5B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718890001; bh=kZy1t3SqU/2B4N94w0esQiUo5Iw1qFVhQrzWef9QttY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=SPJOThOj6CLFR4t1Cy7pxc+I+BJgSv37PQCaD4U5PbgZA1lAlOtoeiylRGKH5d7ue
	 JmUuZnVGAOf7tUP1lkMCOTYB+tFYmRegjuZlsHZLMzAW9oF+FAo52SJBsKyhz4ysXg
	 OzjUtAs9J+/H9GaVepDBF5auwtyQz8WkuKbQaaAOcAnG3lT9AXLHUE6o/ea8rnYq51
	 gDll4eOCnSOLx9Ms6UXKcLQKZIy4ZwgGa7kwrLCog8fYhRt/xIu8ulG5zM5n3r96N9
	 rUZZBJOs/8t09KAMeqYacFjF9cBp8nwABFCVIHr7Zte4JixFLQMzfNMS6Pq8gK+LnB
	 lAQkpf7ibb6sw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BB1ZjeK5dvWS; Thu, 20 Jun 2024 09:26:41 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D55729C5BCC;
	Thu, 20 Jun 2024 09:26:38 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv5 7/9] ASoC: dt-bindings: imx-audio-spdif: remove binding
Date: Thu, 20 Jun 2024 15:25:09 +0200
Message-Id: <20240620132511.4291-8-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: K747ASHP542GRXA2EVJYEI2AJXGLQJYQ
X-Message-ID-Hash: K747ASHP542GRXA2EVJYEI2AJXGLQJYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K747ASHP542GRXA2EVJYEI2AJXGLQJYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

imx-audio-spdif was merged into the fsl-asoc-card driver, and therefore
removed.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 .../bindings/sound/fsl,imx-audio-spdif.yaml   | 66 -------------------
 1 file changed, 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-s=
pdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.ya=
ml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
deleted file mode 100644
index 5fc543d02ecb..000000000000
--- a/Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
+++ /dev/null
@@ -1,66 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/fsl,imx-audio-spdif.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale i.MX audio complex with S/PDIF transceiver
-
-maintainers:
-  - Shengjiu Wang <shengjiu.wang@nxp.com>
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - enum:
-              - fsl,imx-sabreauto-spdif
-              - fsl,imx6sx-sdb-spdif
-          - const: fsl,imx-audio-spdif
-      - enum:
-          - fsl,imx-audio-spdif
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  spdif-controller:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of the i.MX S/PDIF controller
-
-  spdif-out:
-    type: boolean
-    description:
-      If present, the transmitting function of S/PDIF will be enabled,
-      indicating there's a physical S/PDIF out connector or jack on the
-      board or it's connecting to some other IP block, such as an HDMI
-      encoder or display-controller.
-
-  spdif-in:
-    type: boolean
-    description:
-      If present, the receiving function of S/PDIF will be enabled,
-      indicating there is a physical S/PDIF in connector/jack on the board.
-
-required:
-  - compatible
-  - model
-  - spdif-controller
-
-anyOf:
-  - required:
-      - spdif-in
-  - required:
-      - spdif-out
-
-additionalProperties: false
-
-examples:
-  - |
-    sound-spdif {
-        compatible =3D "fsl,imx-audio-spdif";
-        model =3D "imx-spdif";
-        spdif-controller =3D <&spdif>;
-        spdif-out;
-        spdif-in;
-    };
--=20
2.34.1

