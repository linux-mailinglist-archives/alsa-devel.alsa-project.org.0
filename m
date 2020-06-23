Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F952052DF
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933F717F6;
	Tue, 23 Jun 2020 14:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933F717F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592916651;
	bh=mDZRnAWXxUc01VOaqrlbzSe1EoQy57r5X4eZZgjwveI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzC9Ixb0gZ5EDdp/I0zvBLqGJlptqSydASNrG7E4ijBeCLfLb+EBnXczkyXnkpd8R
	 Kevz6id2bmcXaZQyoi3vMbU9YkRPUM5/CEwEblTNCQi4w8Er42yrLzHpxnqEp6Hruu
	 X6vUDy9Yx7mpiF1wMjAIzmG4JAYefsDqbJQ0SfnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCEF7F8025E;
	Tue, 23 Jun 2020 14:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C557BF80218; Tue, 23 Jun 2020 14:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52577F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52577F800B2
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05NClfui068788;
 Tue, 23 Jun 2020 21:47:41 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Tue, 23 Jun 2020 21:47:41 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from localhost.localdomain (121.252.232.153.ap.dti.ne.jp
 [153.232.252.121]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05NClbP6068743
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 23 Jun 2020 21:47:41 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: sound: add missing clock description of
 rk3328 DT schema
Date: Tue, 23 Jun 2020 21:47:34 +0900
Message-Id: <20200623124734.1736470-2-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623124734.1736470-1-katsuhiro@katsuster.net>
References: <20200623124734.1736470-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds description about "mclk" clock and fixes some errors
which are dt_binding_check reported.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/rockchip,rk3328-codec.yaml     | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
index 08a74e28e483..525b48c2f5de 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
@@ -19,10 +19,12 @@ properties:
   clocks:
     items:
       - description: clock for audio codec
+      - description: clock for I2S master clock
 
   clock-names:
     items:
       - const: pclk
+      - const: mclk
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -41,21 +43,28 @@ properties:
       GPIO specifier for external line driver control (typically the
       dedicated GPIO_MUTE pin)
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - rockchip,grf
+  - "#sound-dai-cells"
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/rk3328-cru.h>
     codec: codec@ff410000 {
       compatible = "rockchip,rk3328-codec";
       reg = <0xff410000 0x1000>;
-      clocks = <&cru PCLK_ACODEC>;
-      clock-names = "pclk";
+      clocks = <&cru PCLK_ACODECPHY>, <&cru SCLK_I2S1>;
+      clock-names = "pclk", "mclk";
       rockchip,grf = <&grf>;
       mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
-      spk-depop-time-ms = 100;
+      spk-depop-time-ms = <100>;
+      #sound-dai-cells = <0>;
     };
-- 
2.27.0

