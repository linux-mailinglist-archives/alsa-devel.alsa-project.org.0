Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B475D20469
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B16716C9;
	Thu, 16 May 2019 13:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B16716C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005495;
	bh=Dnb3twcUZDqNH2Fe6vk4I0lpN/2zww6Zp0l2Po7ktko=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jgbR+1i4r9SlMRABrNMeu+jMN9zjH+UX9ph8EtQgLU3ZN7qzvoYlQonm8X7EZFu7t
	 IV2AcDB/dQRZK/KtNnhVmIL3zDhP+5dgKkd/hxlFx4ONnNsOemVQP41nxGL2E24l7U
	 RAXSNKFj0VnRD45kSwTmNL0wl0XvK6IkhsWfeSbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99C39F8973E;
	Thu, 16 May 2019 13:14:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF19DF8972F; Thu, 16 May 2019 13:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44E52F896B6
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44E52F896B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="buIQ0JjH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=37loz0j4/OZ5il819QfI9xzcVbzdXjCr6lBxULO4KQU=; b=buIQ0JjHLY0E
 8DfILar/uGpDIyQoIxTmvvTZRzXylL6XAk+JVEopDmE4CFMJXrIK7vSia+un0vZC/s1nK7rSmgRWU
 CGYpnl9/Sfowa/qK8/372m/BqzoTc/F+7NHQKtkIgPaJ/64oXlJuhdvWRD2L65I5TDFjb1Czobb+J
 BWWTw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hREKj-00066j-FX; Thu, 16 May 2019 11:13:57 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3D1DD1126D47; Thu, 16 May 2019 12:13:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190515131858.32130-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190516111354.3D1DD1126D47@debutante.sirena.org.uk>
Date: Thu, 16 May 2019 12:13:54 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: add tohdmitx DT bindings" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: meson: add tohdmitx DT bindings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e35f5ad6a965de5d301ca5957a1c48c53fe366fb Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 15 May 2019 15:18:56 +0200
Subject: [PATCH] ASoC: meson: add tohdmitx DT bindings

Add the bindings and the related documentation for the audio hdmitx
control glue of the Amlogic g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  | 55 +++++++++++++++++++
 .../dt-bindings/sound/meson-g12a-tohdmitx.h   | 13 +++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 include/dt-bindings/sound/meson-g12a-tohdmitx.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
new file mode 100644
index 000000000000..aa6c35570d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -0,0 +1,55 @@
+* Amlogic HDMI Tx control glue
+
+Required properties:
+- compatible: "amlogic,g12a-tohdmitx"
+- reg: physical base address of the controller and length of memory
+       mapped region.
+- #sound-dai-cells: should be 1.
+
+Example on the S905X2 SoC:
+
+tohdmitx: audio-controller@744 {
+	compatible = "amlogic,g12a-tohdmitx";
+	reg = <0x0 0x744 0x0 0x4>;
+	#sound-dai-cells = <1>;
+};
+
+Example of an 'amlogic,axg-sound-card':
+
+sound {
+	compatible = "amlogic,axg-sound-card";
+
+[...]
+
+	dai-link-x {
+		sound-dai = <&tdmif_a>;
+		dai-format = "i2s";
+		dai-tdm-slot-tx-mask-0 = <1 1>;
+
+		codec-0 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+		};
+
+		codec-1 {
+			sound-dai = <&external_dac>;
+		};
+	};
+
+	dai-link-y {
+		sound-dai = <&tdmif_c>;
+		dai-format = "i2s";
+		dai-tdm-slot-tx-mask-0 = <1 1>;
+
+		codec {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
+		};
+	};
+
+	dai-link-z {
+		sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+		codec {
+			sound-dai = <&hdmi_tx>;
+		};
+	};
+};
diff --git a/include/dt-bindings/sound/meson-g12a-tohdmitx.h b/include/dt-bindings/sound/meson-g12a-tohdmitx.h
new file mode 100644
index 000000000000..c5e1f48d30d0
--- /dev/null
+++ b/include/dt-bindings/sound/meson-g12a-tohdmitx.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_G12A_TOHDMITX_H
+#define __DT_MESON_G12A_TOHDMITX_H
+
+#define TOHDMITX_I2S_IN_A	0
+#define TOHDMITX_I2S_IN_B	1
+#define TOHDMITX_I2S_IN_C	2
+#define TOHDMITX_I2S_OUT	3
+#define TOHDMITX_SPDIF_IN_A	4
+#define TOHDMITX_SPDIF_IN_B	5
+#define TOHDMITX_SPDIF_OUT	6
+
+#endif /* __DT_MESON_G12A_TOHDMITX_H */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
