Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 687396BAF9D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 12:50:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ABCC12A6;
	Wed, 15 Mar 2023 12:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ABCC12A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678881006;
	bh=INziK5MCGdJQSotd1jYkpsuE12l/jtQmfYBjK//4A8E=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=vQD6nyqCRhOE4PDvH15QsLIoM5vTkC/hlw7mCPmFvaFL1j/WgGMsQkOazJvjuaOyF
	 wnt5Q3FsPzeTayy0R7TJrym/c9RzipWl+LYMGVbRVCJLOnI67TfZu7UAFi1Cs5Z5QO
	 0GLHNsEISY1Qaqgjdx31qcYlC/+Hm6srlrEMypYQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FB0F804FE;
	Wed, 15 Mar 2023 12:48:26 +0100 (CET)
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax dma-names
 order constraint
Date: Wed, 15 Mar 2023 13:47:57 +0200
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167888090614.26.10648599279214988765@mailman-core.alsa-project.org>
From: Cristian Ciocaltea via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35595F80425; Wed, 15 Mar 2023 12:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3A68F8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 12:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A68F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=X58SfGRM
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 57B026603058;
	Wed, 15 Mar 2023 11:48:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880898;
	bh=C+CkBCBIxEIFOAjzgyNm1268qn0Q1m0JZg82+SgLbSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X58SfGRMKG9NMnROtcQIsHKPqTiN3hEwxxvjMK1CBZAuNkvJZzsUYX46U7ZK9w6S6
	 dF4cWgtlSfBpB8jUa/4djaWG13TVCtFcT45OS/83t3Yw6fakhmegMNTgKGABCsilX/
	 wHS2lvwEUTbpSNOotY3XW9z1pVo7f5vlTrQWiLpSupOFiyAOoNrA8OYMPLMmr5TPyN
	 JcBcMmqRoAFaPZMBUMUwP7t2IyoYiSr8EtaBYoSFn2xK3I5BULLPfOYbfOu6Wk2QXq
	 wcRNhblusYn5BaeQW5QYIAVEuJsdJVOaqvBKDSUpfN1l8nBSghvjXURdUp51ZFH4+v
	 PCS7fq1RtkfSA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax dma-names
 order constraint
Date: Wed, 15 Mar 2023 13:47:57 +0200
Message-Id: <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BF3UEHZWEY7NY3KWUFRZSFOHH6NCZDQ3
X-Message-ID-Hash: BF3UEHZWEY7NY3KWUFRZSFOHH6NCZDQ3
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
dma-names properties") documented dma-names property to handle Allwiner
D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
the reverse of what a different board expects:

  rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected

A quick and incomplete check shows the inconsistency is present in many
other DT files:

$ git grep -A10 snps,dw-apb-uart | grep dma-names | sort -u
arch/arm64/boot/dts/rockchip/px30.dtsi-         dma-names = "tx", "rx";
arch/arm64/boot/dts/rockchip/rk3328.dtsi-       dma-names = "tx", "rx";
arch/arm64/boot/dts/rockchip/rk3588s.dtsi-      dma-names = "tx", "rx";
arch/arm/boot/dts/rk3066a.dtsi-                 dma-names = "tx", "rx";
arch/arm/boot/dts/rk3128.dtsi-                  dma-names = "tx", "rx";
arch/arm/boot/dts/rk3288.dtsi-                  dma-names = "tx", "rx";
arch/arm/boot/dts/rv1126.dtsi-                  dma-names = "tx", "rx";
arch/arm/boot/dts/socfpga.dtsi-                 dma-names = "tx", "rx";
arch/arm/boot/dts/sun6i-a31.dtsi-               dma-names = "rx", "tx";
arch/arm/boot/dts/sun8i-a23-a33.dtsi-           dma-names = "rx", "tx";
arch/arm/boot/dts/sun8i-v3s.dtsi-               dma-names = "rx", "tx";
arch/arm/boot/dts/sunxi-h3-h5.dtsi-             dma-names = "rx", "tx";
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dma-names = "rx", "tx";

Do not enforce the order of the dma-names items.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 2becdfab4f15..d374844a61a5 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -71,9 +71,13 @@ properties:
     minItems: 2
 
   dma-names:
-    items:
-      - const: rx
-      - const: tx
+    oneOf:
+      - items:
+          - const: tx
+          - const: rx
+      - items:
+          - const: rx
+          - const: tx
 
   snps,uart-16550-compatible:
     description: reflects the value of UART_16550_COMPATIBLE configuration
-- 
2.39.1

