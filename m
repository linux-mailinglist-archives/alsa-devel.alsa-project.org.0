Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598C7E0689
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:28:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA3BEE6;
	Fri,  3 Nov 2023 17:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA3BEE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028907;
	bh=XB52xSkcW7DlpdxdsDrnjNPD7kW7z6MEd0cFXu6HRPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RkIOY49U7yESu3RVWt0WhR0LXJXDosy+ydX63yJTPj1DHy0YTVH22lVMK7QBEyIk+
	 WJL1U+24L6lL/CNBF9qxxjScY2R7J5yx5H3wT08PnfKsaHGAJGo59kuxvjsNLlXHZW
	 j4fNx8LMC6bV4HD/5WPrEg+c0GrQFQwTAcwgS5ME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110AEF805B3; Fri,  3 Nov 2023 17:26:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51082F805B2;
	Fri,  3 Nov 2023 17:26:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6105F80537; Thu,  2 Nov 2023 16:12:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 911F3F8020D
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 16:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911F3F8020D
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id D0760848D4;
	Thu,  2 Nov 2023 16:12:04 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 02 Nov 2023 16:11:08 +0100
Subject: [PATCH v7 02/10] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231102-pxa1908-lkml-v7-2-cabb1a0cb52b@skole.hr>
References: <20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr>
In-Reply-To: <20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Leo Yan <leoy@marvell.com>, Zhangfei Gao <zhangfei.gao@marvell.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Karel Balej <balejk@matfyz.cz>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=XB52xSkcW7DlpdxdsDrnjNPD7kW7z6MEd0cFXu6HRPY=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlQ7w4s0X/U4LfTPm+d3uM/f8sVLN8kU+aEvTP7
 Uln5kwWiPGJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZUO8OAAKCRCaEZ6wQi2W
 4UBOD/9XSrU6k/VpMh4t2ctpZgfmH9BIW4xIC/g7N2fLI3uAYchePaqWsjv/O2ZDBAQ9rKccpMf
 wzidE0AvYkJQhr/G2EiiDVr4u7b00b2IorTUGkIOkmX8a4tyFI/+KJsaBIVNiBD24va6gZq5Ew2
 PoQsztYvv1p2t9RHpS/d0ceDb2GZX0cNq9SeGcBGlR4NZ7EneBmUuTjb2iUL7cN4ovIKyYhGPgJ
 scW07emNsENae6F/yqJbahnL2HXc4Gi3cDHL/iuNXLos0yzXILsXl7lvIEuhr9IXqhRtJYZ+H9v
 pUWuO7mt8Xg2QgJAi+qX3ZUuUFkdzLgaGz/AOeCQzxJ6PhMcfWrp51ElmRCqUHZgM08ZZ/NLWF7
 PQ1kbIhMN6rgewJvmdr1FfhcXSiUGsAXRdBqvk41wODAjtr0p6u9T7I9IzqrjI0+0t0Bt8XIHIj
 7/E8V/TrQ3mJDVAlrPSTeb30/si5QhEQRU7D0YPwnoHXi0EAS1V/VIdU76gUWYcLk3TE9OOQi95
 ql5iEImrlQmY25Cxq0uR4GPzE4ya4pXjnkKF1ilnqmF0/5WlFTN3fXG0J0MN2qs+JZ8Z6cR1vjj
 0BaJVwy1z8PNobG552NcH0MKhZqvheNQDfRcCaalw1uYiB37dQxAFkiH49UP/xArkEF/aq6Ey/D
 gGqZRowQytonoWA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-MailFrom: duje.mihanovic@skole.hr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R5VRE2ZN4MLFUKHTJWXJQSJSRDBIVZ6J
X-Message-ID-Hash: R5VRE2ZN4MLFUKHTJWXJQSJSRDBIVZ6J
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:26:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5VRE2ZN4MLFUKHTJWXJQSJSRDBIVZ6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index 45a307d3ce16..0f7e16a28990 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -32,6 +32,10 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
           - const: pinctrl-single
+      - items:
+          - enum:
+              - marvell,pxa1908-padconf
+          - const: pinconf-single
 
   reg:
     maxItems: 1

-- 
2.42.0


