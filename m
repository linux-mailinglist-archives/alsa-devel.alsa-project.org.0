Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA051E6D28
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430861AB0;
	Mon, 28 Oct 2019 08:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430861AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572247362;
	bh=VernQarc60YQT0y8+2baT5ONQE4vgx4u2b0FCodxRnw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eiHTnUA7btywQ1vV/9fqGrG6vBaYowGUWj+WUwTeIR086iMYYWvmWbCfSaOoi2ir0
	 Z0j7MWKKnAg5pID5NB3RdaMdk3swikkQ/7voNIRBx2U0vsJ7vaIcatSN1EqNPTR+9p
	 eRpnMpNK0oUOCP7tp3e4Rf3vk48ykkEgCZdfrMgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BF1F805FD;
	Mon, 28 Oct 2019 08:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39B22F805FB; Mon, 28 Oct 2019 08:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85E65F802BD
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 08:21:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85E65F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HfeGmQVG"
Received: by mail-pf1-x442.google.com with SMTP id b25so6267607pfi.13
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2B2ccVWNv2j7+/d4B7YKqZ8gCfpCMSxayY7L9g0kOPM=;
 b=HfeGmQVGeCotDSEIC2+EPqxjUZiFb6AMi1k5sTZJi/m46coFpAY9tdk6wLR6YsijdN
 bAHb+Lmgn+Np7i5yEzDTx8O5UYxOREy51lzOXKcD2pq7DwjUM+wo0GVeTj+bGIJC8v4n
 3WJi68+vvMUxY7dKw539iuLRzhUbJBLmZPIAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2B2ccVWNv2j7+/d4B7YKqZ8gCfpCMSxayY7L9g0kOPM=;
 b=e2g103hmX56DOhMONZ9ZS2ZUoFsVWVHyl2TECPoRB5zffiD2NTe5qZGRbdPYVjNXch
 06AQflhe13XHED6ayK1LeIv4rZaln+lUnYE5I8Y9ix84/0MzmImbWMFHD+mQp90gxKk4
 tq5SHjswVAoYqEZknEcVEiY+loV/CeukvkzTUJx9FNPjZgX0HIuB+TkpHUEqmlJjDIT8
 mSmOjmKmaz3oIPxACL3TXyd4Dqu2jNCy6N21Mc37yyoFOyZkc6aMSIs/V9hwwqvq/av9
 lAvJqvAmY4hSpMse9xUai27tb2IsyrotrqUIfmykys7erpJpCLWEvf/876B55LuVZbXC
 EeoQ==
X-Gm-Message-State: APjAAAUzaL1G0wBb5AMUt3iBfkNij7O5gmniURfREvTO4a1meRujaxTK
 Zq7dFy3trkc8e6CC41+jNKmcmw==
X-Google-Smtp-Source: APXvYqxOOfKgzUuiw+4gq3DdkbHGmJjTwiVoT2so9rPzmlcr7wli/aEgCmP0/huEUSTQC3mCW+zoZA==
X-Received: by 2002:a62:30c5:: with SMTP id
 w188mr19170809pfw.105.1572247259280; 
 Mon, 28 Oct 2019 00:20:59 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id l11sm11260152pgf.73.2019.10.28.00.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:20:58 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2019 15:19:26 +0800
Message-Id: <20191028071930.145899-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH v9 2/6] ASoC: rockchip-max98090: Support usage
	with and without HDMI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add one optional property "rockchip,hdmi-codec" to let user specify HDMI
device node in DTS so machine driver can find hdmi-codec device node for
HDMI codec DAI.

Use the presence of rockchip,audio-codec and rockchip,hdmi-codec to
specify the use case.

Use max98090 only : specify rockchip,audio-codec.
Use HDMI only: specify rockchip,hdmi-codec.
Use both max98090 and HDMI: specify rockchip,audio-codec and
rockchip,hdmi-codec.

Move these properties to optional because they are not needed for
HDMI-only use case.
"rockchip,audio-codec": The phandle of the MAX98090 audio codec
"rockchip,headset-codec": The phandle of Ext chip for jack detection

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../bindings/sound/rockchip-max98090.txt      | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
index a805aa99ad75..e9c58b204399 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
@@ -5,15 +5,38 @@ Required properties:
 - rockchip,model: The user-visible name of this sound complex
 - rockchip,i2s-controller: The phandle of the Rockchip I2S controller that's
   connected to the CODEC
-- rockchip,audio-codec: The phandle of the MAX98090 audio codec
-- rockchip,headset-codec: The phandle of Ext chip for jack detection
+
+Optional properties:
+- rockchip,audio-codec: The phandle of the MAX98090 audio codec.
+- rockchip,headset-codec: The phandle of Ext chip for jack detection. This is
+                          required if there is rockchip,audio-codec.
+- rockchip,hdmi-codec: The phandle of HDMI device for HDMI codec.
 
 Example:
 
+/* For max98090-only board. */
+sound {
+	compatible = "rockchip,rockchip-audio-max98090";
+	rockchip,model = "ROCKCHIP-I2S";
+	rockchip,i2s-controller = <&i2s>;
+	rockchip,audio-codec = <&max98090>;
+	rockchip,headset-codec = <&headsetcodec>;
+};
+
+/* For HDMI-only board. */
+sound {
+	compatible = "rockchip,rockchip-audio-max98090";
+	rockchip,model = "ROCKCHIP-I2S";
+	rockchip,i2s-controller = <&i2s>;
+	rockchip,hdmi-codec = <&hdmi>;
+};
+
+/* For max98090 plus HDMI board. */
 sound {
 	compatible = "rockchip,rockchip-audio-max98090";
 	rockchip,model = "ROCKCHIP-I2S";
 	rockchip,i2s-controller = <&i2s>;
 	rockchip,audio-codec = <&max98090>;
 	rockchip,headset-codec = <&headsetcodec>;
+	rockchip,hdmi-codec = <&hdmi>;
 };
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
