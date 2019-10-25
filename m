Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FC7E4C50
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 15:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF3161801;
	Fri, 25 Oct 2019 15:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF3161801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572010428;
	bh=iHqUXxxhog/49xkN6z0Lr9UZ0ENU1HeznHmkECpD8wc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A73bbryKoEwZHXi53iXkOkZBZMkHGAKpSWs/5080ILGDSauApiqMS3EdpDp1rZIHz
	 r5XJOkBUa8oIvAIwGYwcYd5k//1fzjeKgFYaHhuiYQaWajA1Db4wmX/cphey4SuQmS
	 EqUG5uY7tHSXEWourfYUCvEnCftCUML62eX48OFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA44F80633;
	Fri, 25 Oct 2019 15:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B81E3F80611; Fri, 25 Oct 2019 15:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F33DAF80600
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 15:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F33DAF80600
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ALs7cBkQ"
Received: by mail-pl1-x641.google.com with SMTP id c16so1238784plz.9
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSyCYud2FH3n+k9xbUM5DyhXCO7gVkxyPIn3KZPMoVk=;
 b=ALs7cBkQVNo8Fjg8m921Llfxbt4MVCf1rdkYs1AcXTM9C09gmEnNUXT7yWsplEi+Mf
 Fyejp8alA8EbzYFsN56GPkbqtFESHfu6RZQUVFLVTT3/korWMFAnqfvBBovvWHUxiL25
 PgbWjppTeshaG6YvdyZkW8o7x6NOK7A5YAYGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSyCYud2FH3n+k9xbUM5DyhXCO7gVkxyPIn3KZPMoVk=;
 b=RmJjP/wyktnM9ktVZfvLsFxqC+67xyQ00gghBXCO6bGR8x9Q7vAbzxUtBF3Nme4+Fl
 z7sd1b5khi5wyWl0DmHucg3hVulrUPBvL1UDThjmSxYZXlLVfYMWvqXL8YMhBgK0jSCh
 O7o++raUpePYF/s6qrGvSVYUlpBUUUQUYUA4d1cv0UXYqO4QSIOV8sodpaIxBiPv0lTK
 Gq4w6v5oDP8CUK2AsopO0CO5at16K13Ojkz+W3xgtha4JDCrA01dEWvRCv0EtiX8iUm8
 sIbYgHm6ks+zBK1xRLUSaAj/vkrfhj3NJBaGAnDYJl5vud3tEnOaHYZ2mztVo9udpd6y
 WUrQ==
X-Gm-Message-State: APjAAAWe7BxVVEqHAHCOqyBiCuALF1vChnyR1OaB/wEZSqZ21EEv6oDj
 CO7DaTim9YNaP1QCDwgb1KNFQQ==
X-Google-Smtp-Source: APXvYqycQHeVv2f79P4vAiHHa3Pb9F7SMzCFxXTSqpZwuyvYWP563v5bjWFJjMgio5zv8hLxW+r38w==
X-Received: by 2002:a17:902:ab89:: with SMTP id
 f9mr3842331plr.295.1572010241727; 
 Fri, 25 Oct 2019 06:30:41 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id p2sm384312pfn.140.2019.10.25.06.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:30:41 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2019 21:30:03 +0800
Message-Id: <20191025133007.11190-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191025133007.11190-1-cychiang@chromium.org>
References: <20191025133007.11190-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v8 2/6] ASoC: rockchip-max98090: Support usage
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

There will be multiple boards sharing this machine driver.
Use compatible string to specify the use case.

"rockchip,rockchip-audio-max98090" for max98090-only.
"rockchip,rockchip-audio-hdmi" for HDMI-only
"rockchip,rockchip-audio-max98090-hdmi" for max98090 plus

Move these properties to optional because they are not needed for
HDMI-only use case.
"rockchip,audio-codec": The phandle of the MAX98090 audio codec
"rockchip,headset-codec": The phandle of Ext chip for jack detection

The machine driver change will add support for HDMI codec in
rockchip-max98090.
Add one optional property "rockchip,hdmi-codec" to let user specify HDMI
device node in DTS so machine driver can find hdmi-codec device node for
codec DAI.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../bindings/sound/rockchip-max98090.txt      | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
index a805aa99ad75..75f438741ca6 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
@@ -1,15 +1,29 @@
 ROCKCHIP with MAX98090 CODEC
 
 Required properties:
-- compatible: "rockchip,rockchip-audio-max98090"
+- compatible: Set this property to one of the strings below depending on the
+              usage on the board:
+              "rockchip,rockchip-audio-max98090" for max98090-only.
+              "rockchip,rockchip-audio-hdmi" for HDMI-only
+              "rockchip,rockchip-audio-max98090-hdmi" for max98090 plus HDMI.
 - rockchip,model: The user-visible name of this sound complex
 - rockchip,i2s-controller: The phandle of the Rockchip I2S controller that's
   connected to the CODEC
-- rockchip,audio-codec: The phandle of the MAX98090 audio codec
-- rockchip,headset-codec: The phandle of Ext chip for jack detection
+
+Optional properties:
+- rockchip,audio-codec: The phandle of the MAX98090 audio codec. This is
+                        required if compatible string is set to the one
+                        with max98090.
+- rockchip,headset-codec: The phandle of Ext chip for jack detection. This is
+                          required if compatible string is set to the one
+                          with max98090.
+- rockchip,hdmi-codec: The phandle of HDMI device for HDMI codec. This is
+                       required if compatible string is set to the one with
+                       HDMI.
 
 Example:
 
+/* For max98090-only board. */
 sound {
 	compatible = "rockchip,rockchip-audio-max98090";
 	rockchip,model = "ROCKCHIP-I2S";
@@ -17,3 +31,21 @@ sound {
 	rockchip,audio-codec = <&max98090>;
 	rockchip,headset-codec = <&headsetcodec>;
 };
+
+/* For HDMI-only board. */
+sound {
+	compatible = "rockchip,rockchip-audio-hdmi";
+	rockchip,model = "ROCKCHIP-I2S";
+	rockchip,i2s-controller = <&i2s>;
+	rockchip,hdmi-codec = <&hdmi>;
+};
+
+/* For max98090 plus HDMI board. */
+sound {
+	compatible = "rockchip,rockchip-audio-max98090-hdmi";
+	rockchip,model = "ROCKCHIP-I2S";
+	rockchip,i2s-controller = <&i2s>;
+	rockchip,audio-codec = <&max98090>;
+	rockchip,headset-codec = <&headsetcodec>;
+	rockchip,hdmi-codec = <&hdmi>;
+};
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
