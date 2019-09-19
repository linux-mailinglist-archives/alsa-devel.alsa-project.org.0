Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79040B7B59
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 15:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1255F1680;
	Thu, 19 Sep 2019 15:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1255F1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568901474;
	bh=cOfcExrkyCAERzSFmXJQbcP8wvf+n36bA8F8PxLVy2U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VeoJQFkJC1bof1TWixXIfiKcQ/gm4NVhytshui66DjPm0w3v1JkQ+ouaNLR2FIenk
	 +uhlADtZ/2x7vNqVuWyE0lWP/PX/93BEdozImJnd1DysBSsszl2h4x9QJGEIk9JzkM
	 cjtOrgC7MnhQa+ABjuGt/qYAzhH9bWZ3Mr2wjPnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F171FF805FD;
	Thu, 19 Sep 2019 15:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C6CFF805FB; Thu, 19 Sep 2019 15:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5494F805F7
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 15:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5494F805F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iWJDh8Ao"
Received: by mail-pg1-x541.google.com with SMTP id u72so1946520pgb.10
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcI+2qu3SHO1kkNhBRtR499gEhJVXFuDOb0iaJPJu1o=;
 b=iWJDh8AorH8nEJumZm/WKDcQuo+qYc151hnc2ynZHB08lu8t45FcSFc3XK8W4mnp1c
 T3000UZZfeJmfDdnixCbXHBmimTrjln/Z/hDuuTKRAyWMnJ9IL3M2Pgs8uVYZ8Okmtj9
 olBky5YGCY5LZ6wfafMKw7O8qXwRl3ZWMAZ34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hcI+2qu3SHO1kkNhBRtR499gEhJVXFuDOb0iaJPJu1o=;
 b=DvjS5AnIr2zO1IibCTXijK5AcW1XS+75H+0weWyEUNiekhVjN5KriIQwKNyRdnJjoj
 LILRTamzqPtaAH0jmIJ7p4rlSeytCAsEutwOk0ao+5faIxEIDiJWAXNzL0vde62FqFcp
 uVGPVX1XSR1pzhYZ6bHoJpmgMC7n8wyLed+ycjseu+q9igfJtuiHFsskqcQuLXxIyUE2
 cpHgZ8oebWvhGnJ1DpB6+NglbrupUOpg8UEdFDyjjkmq/aJ/u/SNiyjz8LMUdET/byWw
 s/x1etRvWqNG3OtW3neg/KYHoVRDCTWGjg7eBwCoYWC823gmeVi1XNyg7g9gLWmylYcu
 Vaog==
X-Gm-Message-State: APjAAAVJ9tkbw5Sm0uJ5dWXQQ/TCC6cCfx0i+lsQ92xTAVoKgvlrTjrF
 7m7ILz9GchomrtjlJMNg421L1g==
X-Google-Smtp-Source: APXvYqxyO8jD+PyDoTHkQIAYtp40Pex0/Mt27q7YWzADpFPuYqtJNqaFngWeKrfqiIca+BqjDGsIqA==
X-Received: by 2002:aa7:8acf:: with SMTP id b15mr4201816pfd.191.1568901324804; 
 Thu, 19 Sep 2019 06:55:24 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q88sm6395907pjq.9.2019.09.19.06.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:55:24 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 19 Sep 2019 21:54:48 +0800
Message-Id: <20190919135450.62309-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190919135450.62309-1-cychiang@chromium.org>
References: <20190919135450.62309-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH v7 2/4] ASoC: rockchip-max98090: Add
	description for rockchip, hdmi-codec
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

Add support for HDMI codec in rockchip-max98090.
Let user specify HDMI device node in DTS so machine driver can find
hdmi-codec device node for codec DAI.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 Documentation/devicetree/bindings/sound/rockchip-max98090.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
index a805aa99ad75..97fc838458f7 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
@@ -7,6 +7,7 @@ Required properties:
   connected to the CODEC
 - rockchip,audio-codec: The phandle of the MAX98090 audio codec
 - rockchip,headset-codec: The phandle of Ext chip for jack detection
+- rockchip,hdmi-codec: The phandle of HDMI device for HDMI codec.
 
 Example:
 
@@ -16,4 +17,5 @@ sound {
 	rockchip,i2s-controller = <&i2s>;
 	rockchip,audio-codec = <&max98090>;
 	rockchip,headset-codec = <&headsetcodec>;
+	rockchip,hdmi-codec = <&hdmi>;
 };
-- 
2.23.0.237.gc6a4ce50a0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
