Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE7E4C61
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 15:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320711812;
	Fri, 25 Oct 2019 15:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320711812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572010587;
	bh=6Rx4Fhbs1iDwRqZXW47Cxq5aJcZbFTGJkLE+c+NJs4Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qj5VIeqfhfBAyxXD8cSSGcTCRERyKTaujEIb46UbnFvCKeLLmhy9pvHY03/LQljtW
	 iV7u14LUbLHk6YabsWsEPHTz98E5eoAZ4qnYbltMPZM7OLQF0jWfBgnUTiumkh9gbl
	 PUKS25Mc5+7TcWdFZTHW7KfVS+A5zQRRPxXqfJic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A736F805FD;
	Fri, 25 Oct 2019 15:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E165F8049B; Fri, 25 Oct 2019 15:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7256BF80393
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 15:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7256BF80393
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VTVnd3DJ"
Received: by mail-pg1-x542.google.com with SMTP id 15so1561109pgt.7
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z55UMaWEIEJNVekf1KUtXJqZFUzcCvdu1bfEeskovPo=;
 b=VTVnd3DJJxvlTLtyPGznBCDcaWFHpqt3B2OWsYufUi5PjNkalSZF7zX2RHBscVJH34
 NvmlefixU2wv6mbtZk2HQh7csJV0v1aqD+k6gpFFRvJ06om6HBZe7CBPz+9dC/yss4fK
 lh1QNLMpzK6BbmRsTQuBp3GKYRt0JrHDTgHCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z55UMaWEIEJNVekf1KUtXJqZFUzcCvdu1bfEeskovPo=;
 b=CcPI3BDNdeeNvoUPcmd1gwGK7CG7+H2XjvAiuH7GOV3StD2Ng6A2S89SdW4j8V5HAc
 f2ChnmTz+B33J9RbUPEaG1fL/QyMSFNTAANcdR2G/LnTdIuikdA3ZtlnYpcA/3/+ipyn
 hZ/2qIk0QOfE5FMV944T+74kn4CUWdoMzfHVzkjI7PyzztvaxxsJQ0BGmDNxZTHz+D9c
 H/o2BHhHtiUrJW8zpqAtoTcOY8MvA50/4q1hgDmziIANp1AS6LloI8p5kxgOOMzaLVjH
 dJiqHsMaf5UblxWs9WHHJ2LQrUJQqOLEB+hpfXcBWeuJIacQ7iCvva7RHlpWXOYmfLTZ
 ozTA==
X-Gm-Message-State: APjAAAVPZ6+qW1Jj28XLxVAWADqkN3RY/LN2Pb//nK4DPaf5+48/kXbQ
 /bZrajmIMcu7LlFqkKXhql/vJLWVOB3dkg==
X-Google-Smtp-Source: APXvYqzEBEK954f+cnTf4ONcLs7stQK9JprT2+giiC3WqbjcH+UZmlt6EYuRfIZ58RAxo7Z4G+ogsw==
X-Received: by 2002:a17:90a:ff11:: with SMTP id
 ce17mr4114202pjb.110.1572010290956; 
 Fri, 25 Oct 2019 06:31:30 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id z13sm3706421pgz.42.2019.10.25.06.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:31:30 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2019 21:30:07 +0800
Message-Id: <20191025133007.11190-7-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v8 6/6] ARM: dts: rockchip: Add HDMI audio
	support to rk3288-veyron-mickey.dts
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

Add HDMI audio support to veyron-mickey. The sound card should expose
one audio device for HDMI.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron-mickey.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index aa352d40c991..98a2aee240f1 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -28,6 +28,13 @@
 		regulator-boot-on;
 		vin-supply = <&vcc33_sys>;
 	};
+
+	sound {
+		compatible = "rockchip,rockchip-audio-hdmi";
+		rockchip,model = "VEYRON-HDMI";
+		rockchip,i2s-controller = <&i2s>;
+		rockchip,hdmi-codec = <&hdmi>;
+	};
 };
 
 &cpu_thermal {
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
