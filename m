Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FEE8A4934
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C92E15FA;
	Mon, 15 Apr 2024 09:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C92E15FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713166730;
	bh=tMhPX6/CEOlOG6cMkUOLb/uDvm16rguRgCsCYIerTXY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gWtzuF4qG8FiAYRU932JWXSdYF7nr5sWTV/kHrnL+JMLhVwuiFb+5ekJ5B5iM2Qfc
	 CEVL8/2HH7yp/rR7l+bEG9bvdL7enhwHT9d+plNBb7tLTPLWyy4vzFRuOEwFpdfxK/
	 4BP+xYJ/Y7bdCOsL9DZdXdd1nO1ULzSScjHEqOYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 057CFF805F0; Mon, 15 Apr 2024 09:37:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46C38F805D9;
	Mon, 15 Apr 2024 09:37:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1116EF801C0; Mon, 15 Apr 2024 09:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19FB2F8025A
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19FB2F8025A
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D3D5D1A0197;
	Mon, 15 Apr 2024 09:35:31 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9CAB11A018D;
	Mon, 15 Apr 2024 09:35:31 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B69C9183AD16;
	Mon, 15 Apr 2024 15:35:29 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl-asoc-card: Add compatbile string
 for wm8904 codec
Date: Mon, 15 Apr 2024 15:17:36 +0800
Message-Id: <1713165456-3494-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
References: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: G3V7IGWXC6JOTOGKVKEZNZWCYGNMM4IM
X-Message-ID-Hash: G3V7IGWXC6JOTOGKVKEZNZWCYGNMM4IM
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3V7IGWXC6JOTOGKVKEZNZWCYGNMM4IM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8904 codec is used on an i.MX95 Toradex board.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
index 42ca39eebd49..16093b48823a 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
@@ -76,6 +76,7 @@ properties:
               - fsl,imx-audio-tlv320aic31xx
               - fsl,imx-audio-tlv320aic32x4
               - fsl,imx-audio-wm8524
+              - fsl,imx-audio-wm8904
               - fsl,imx-audio-wm8960
               - fsl,imx-audio-wm8962
               - fsl,imx-audio-wm8958
-- 
2.34.1

