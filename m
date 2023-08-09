Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C97767A6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 20:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 462A9836;
	Wed,  9 Aug 2023 20:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 462A9836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691607143;
	bh=QR7PGlGJxX1FnGMewO2dUOVxGCbTYpN2NpFiKiuKBXY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VWQucDf9CgC+hcpUmTval9zQv6k5o5O9Dg+LYOFQbKn2xtfC8j0CakJPs0bXSrUoU
	 C/SIIjGEXZTxlrc1rP5coRzTSY1OHEVInTwDixLee6a4R2OebkPhgvpgPYuAWx+WTf
	 siTW0fg/Km4DTZlr/MAWoQSIXsLg8kXKY5mjsDrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23B0EF80563; Wed,  9 Aug 2023 20:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D68F800FE;
	Wed,  9 Aug 2023 20:50:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0903CF8016E; Wed,  9 Aug 2023 20:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10EA5F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 20:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10EA5F800FB
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 6C47AFB09;
	Wed,  9 Aug 2023 20:50:30 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyyE5NNQkE41; Wed,  9 Aug 2023 20:50:27 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	kernel@puri.sm,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 1/5] dt-bindings: sound: gtm601: Add description
Date: Wed,  9 Aug 2023 20:50:10 +0200
Message-Id: 
 <b6e85fdfaa87d7684a120ccedc1e07d8fe87957f.1691606520.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1691606520.git.agx@sigxcpu.org>
References: <cover.1691606520.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QB4DGIJHQQFSJUEXANUBV6JRCA2A5JSB
X-Message-ID-Hash: QB4DGIJHQQFSJUEXANUBV6JRCA2A5JSB
X-MailFrom: agx@sigxcpu.org
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QB4DGIJHQQFSJUEXANUBV6JRCA2A5JSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This allows to us to document the channel and sampling
rate requirements.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 Documentation/devicetree/bindings/sound/option,gtm601.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/option,gtm601.yaml b/Documentation/devicetree/bindings/sound/option,gtm601.yaml
index 69c2ccc79dc5..ff813d97fc59 100644
--- a/Documentation/devicetree/bindings/sound/option,gtm601.yaml
+++ b/Documentation/devicetree/bindings/sound/option,gtm601.yaml
@@ -16,10 +16,12 @@ description: >
 properties:
   compatible:
     oneOf:
-      - items:  # 48 kHz stereo
+      - description: Broadmobi BM818 (48Khz stereo)
+        items:
           - const: broadmobi,bm818
           - const: option,gtm601
-      - const: option,gtm601  # 8 kHz mono
+      - description: GTM601 (8kHz mono)
+        const: option,gtm601
 
   '#sound-dai-cells':
     const: 0
-- 
2.40.1

