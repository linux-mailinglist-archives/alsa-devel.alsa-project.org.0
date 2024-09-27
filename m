Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA77988566
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 14:45:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B88FDEE;
	Fri, 27 Sep 2024 14:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B88FDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727441114;
	bh=ysNXCS5d03ZwzODzN3Ux5C/aLATkpUW/PgOS0n4jwzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T7VR8RKm7FLPkG86tem40H3zcl6nYR8nz8XOWWXeuYCz7ohSlVMXbrjYc7ZJw6X+x
	 GNUlD7H1EEqhaxlXY+n6DpiEN9HQd+q7Rq2akztVcKbg9WTnxgagD3UQL4Z4Pe5kp/
	 vu0aoOmNVihgr6viQGzoUUY6SJNIqb2oeDMtIafQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5587F80692; Fri, 27 Sep 2024 14:43:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C26B2F80685;
	Fri, 27 Sep 2024 14:43:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C92F7F80266; Fri, 27 Sep 2024 14:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EA54F80266
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA54F80266
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00D3BfLyr01Qicjt; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPs-HD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDj-Vr;
	Fri, 27 Sep 2024 14:42:30 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 03/11] ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch
 to {hp,mic}-det-gpios
Date: Fri, 27 Sep 2024 14:42:18 +0200
Message-Id: 
 <7b4d7d735189fb346175a95e29db33f01c8cf93d.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CQVL37GD5YLFYXQ6OZVJXLZWMGL7UEOK
X-Message-ID-Hash: CQVL37GD5YLFYXQ6OZVJXLZWMGL7UEOK
X-MailFrom: geert@linux-m68k.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQVL37GD5YLFYXQ6OZVJXLZWMGL7UEOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
"hp-det-gpios" resp. "mic-det-gpios" in Audio Graph Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
index 55ea87870af3e039..86c425b72fa711b5 100644
--- a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
@@ -113,8 +113,8 @@ sound-card {
 			  "Headphones", "HPOR",
 			  "MIC2", "Mic Jack";
 		widgets = "Headphone", "Headphones", "Microphone", "Mic Jack";
-		hp-det-gpio = <&gpio 97 GPIO_ACTIVE_HIGH>;
-		mic-det-gpio = <&gpio 96 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
+		mic-det-gpios = <&gpio 96 GPIO_ACTIVE_HIGH>;
 	};
 
 	soc {
-- 
2.34.1

