Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE6271708
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA0116BD;
	Sun, 20 Sep 2020 20:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA0116BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600626041;
	bh=1jaUTW1IS/d+0xKEIaljMnyEL+efvJY6RnPLC7maicM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=by6d1oQGhDh0XOJbZbr/tDIoC3pqjiWvtODvrQNJmEFmTcl/Iv+3/umlBKlzTQWPX
	 yqKaLoN51LZuu8jINbsuHqLoELCTPsj7VRZuPGyzHYpfIBwscAU+zp84j8giGREzUk
	 JwEybGtePc3ddgKuYMq0QxQlY5iqr1Xhi/b8NRfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40865F80367;
	Sun, 20 Sep 2020 20:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8CF9F80321; Sun, 20 Sep 2020 20:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E2B0F802EB
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E2B0F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aLnfPiVP"
Received: by mail-wr1-x444.google.com with SMTP id c18so10449272wrm.9
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kdiKWYhgrXc/dLuy4QmJOJzV5nCR1FMn7KxcL86B2g=;
 b=aLnfPiVPPCpnSxT7gRCrGZWlE1gaPfcOhdXuh1FLsjOB/5uEOhAZcgUcmfxnZpCY3V
 KlLcr/9ebOgMu3s9PGK450XFUEt9Wy0E45iG568EGKbVtgf0Qbi1FGc9M0Dwvtuc3X2k
 D6OdKOws170TD1DaX/o1QP1YWEWbO3wKMa1suDymqum1gCZlEsWr/zqZ07CX9om9rG62
 kO07ng8XqbRAtnYqyrzNz235LmnripbZyg1ji6Zpzbno83MQu9XR3bG0xhszjzMSxU/Z
 yxxx9VZnTCKxTOTruAS0RMzqo+Vbophk6fApYCAb0N0kq19efrAimdLoSeassHsCqaTC
 f9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kdiKWYhgrXc/dLuy4QmJOJzV5nCR1FMn7KxcL86B2g=;
 b=P1jhsehj0IOngv3X71CEY6HQnolPnuZrhK5mNRlIXGcyJehVc9V0eotscZ0yGMS202
 AVAfBbPMUVCay45UlMlbhbJSzBxpI02b8PRhDdkox/+9bn/S4kQfd78PjAodc8jX3Usm
 wQ7ltDKAu5Qile9Y49tr1ApyOnpPf01nsBfqV9YNzJo5OJDdXV4zoI8IYygkiimDU0T+
 K6l4O9mIE6eUvki4DfJon4tHHvt+pCf/LlW1mz+w6CqfDRPTuEKVpxPffA/3mSTDflW9
 Ql6s48BksWdIRK6V3Q4RBgbn1AMteXYifuLGpKsPU2zPsJ5jR40bqECO+4m2Esm5nS4H
 EYsw==
X-Gm-Message-State: AOAM5315P2VNOBfK+B8x0MPM51Y8UWG4/Hw1UtY+M4qxfIxc7RF9kZFC
 R5AJWTkvyPGR6pGNaU6SSIk=
X-Google-Smtp-Source: ABdhPJw6H9m7msd8uoPY0ml6YAsigr5VvkOU7rlw7A+Gej+eUC90V/VlWpcMOXv3NryjNNqindPSCA==
X-Received: by 2002:adf:f585:: with SMTP id f5mr50500018wro.64.1600625311328; 
 Sun, 20 Sep 2020 11:08:31 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:30 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 16/19] arm64: dts: allwinner: Enable HDMI audio on Orange
 Pi PC 2
Date: Sun, 20 Sep 2020 20:07:55 +0200
Message-Id: <20200920180758.592217-17-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Ondrej Jirman <megous@megous.com>

The board has HDMI output, enable audio on it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 7d7aad18f078..e6ed8774a17f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -144,6 +144,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &ir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_ir_rx_pin>;
-- 
2.25.1

