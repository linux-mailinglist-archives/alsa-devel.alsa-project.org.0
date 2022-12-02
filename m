Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3264074A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C8821849;
	Fri,  2 Dec 2022 13:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C8821849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669985863;
	bh=3wdT5/fcO5/2Tyd7yBxYPkfqDO6zbNT50/zyANQmZs0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+7aya2zgvCyuqC81p2D3ihYyibE35wTgFrk3pQjellmMfx9oI/TvYW4yjthNPEYD
	 +k51ebaCxJIuVxbT8aUe5pmRxuMcRJO6LNAkoIE1mjWPMBMrQrUNPmjzjfpg/eq5r/
	 4Pv0lMC7vzSgu/lbCkilqwCVAUtNffBoZXr3YZi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 397D4F80566;
	Fri,  2 Dec 2022 13:56:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 512BDF800BD; Fri,  2 Dec 2022 13:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98657F800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 13:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98657F800BD
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
 by albert.telenet-ops.be with bizsmtp
 id rQvn2800c0ys3B706QvnRD; Fri, 02 Dec 2022 13:55:48 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1p15Zz-002Isp-70; Fri, 02 Dec 2022 13:55:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1p15Zy-005gPI-JY; Fri, 02 Dec 2022 13:55:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH/RFC 2/2] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio
 codec node
Date: Fri,  2 Dec 2022 13:55:44 +0100
Message-Id: <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669980383.git.geert+renesas@glider.be>
References: <cover.1669980383.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>
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

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinctrl-[0-9]+'
	    From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports:port@0:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
	    From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports:port@1:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
	    From schema: Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

Fix this by:
  1. Moving the "mclk-fs" property to the endpoint nodes, where it
     belongs according to .../sound/audio-graph-port.yaml,
  2. Dropping the bogus "clocks" properties.

Fixes: 80c07701d5918928 ("arm64: dts: renesas: ulcb-kf: add pcm3168 sound codec")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 408871c2859d144d..8e46acbe3a203759 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -216,19 +216,18 @@ pcm3168a: audio-codec@44 {
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					mclk-fs = <512>;
 					port@0 {
 						reg = <0>;
 						pcm3168a_endpoint_p: endpoint {
+							mclk-fs = <512>;
 							remote-endpoint = <&rsnd_for_pcm3168a_play>;
-							clocks = <&clksndsel>;
 						};
 					};
 					port@1 {
 						reg = <1>;
 						pcm3168a_endpoint_c: endpoint {
+							mclk-fs = <512>;
 							remote-endpoint = <&rsnd_for_pcm3168a_capture>;
-							clocks = <&clksndsel>;
 						};
 					};
 				};
-- 
2.25.1

