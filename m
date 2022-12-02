Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551864073D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 13:56:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9439181F;
	Fri,  2 Dec 2022 13:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9439181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669985815;
	bh=wv6gKVeyBbW1kH3wNyk9n9NA82TluBFjyK5ewHojMgE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p1sESK1WXUyPI3P3bcIJUX3yAR+Gs94dDqsV2W7Mp0MV2mgM2pwbx0Z3kZ0yuBSlf
	 nCwUeXHGCzDPmeQ0pllafjj+tfM/0gnIUQ4OVsIek/KTEVKesTK4XwR2DWVmGcN6l3
	 yeE5eUdVNM1W4mXdFZRX+iUbVrDa3mUITEdSBoTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD17F8026A;
	Fri,  2 Dec 2022 13:55:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B7BF8026A; Fri,  2 Dec 2022 13:55:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_135, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92872F80272
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 13:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92872F80272
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
 by laurent.telenet-ops.be with bizsmtp
 id rQvn2800M0ys3B701QvnFx; Fri, 02 Dec 2022 13:55:48 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1p15Zz-002Iso-4R; Fri, 02 Dec 2022 13:55:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1p15Zy-005gP8-Hi; Fri, 02 Dec 2022 13:55:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] dt-bindings: sound: ti,
 pcm3168a: json-schema conversion and fixes
Date: Fri,  2 Dec 2022 13:55:42 +0100
Message-Id: <cover.1669980383.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

	Hi all,

This patch series is an attempt to convert the existing DT binding
documentation for the Texas Instruments PCM3168A Audio Codec to
json-schema ("another one bites the dust" ;-).

It consists of two parts:
  1. The actual DT binding conversion,
  2. An RFC patch to fix the impedance mismatch between the bindings
     and the description in the Shimafuji Kingfisher board DTS.

I'm not super-familiar with the audio details, so I would be very
grateful to receive your comments.

Thanks!

Geert Uytterhoeven (2):
  dt-bindings: sound: ti,pcm3168a: Convert to json-schema
  [RFC] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio codec node

 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ----------
 .../bindings/sound/ti,pcm3168a.yaml           | 105 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   5 +-
 3 files changed, 107 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
