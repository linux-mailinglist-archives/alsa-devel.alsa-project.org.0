Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE52B7EC0
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5186B17B0;
	Wed, 18 Nov 2020 15:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5186B17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605708080;
	bh=e1CdGycGD6LX6+DJfyJDdmzXiXHPLIi8pyzGeSRKKJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNTGNgTV8NYp07bz9P/DZo97gjbVrroh+rjC6EURJNZdCHosAG//EDmimnfJQsYns
	 02KuHh9ehYGwFZ3OS/m8Trsqz/TSkOLHgylt5aFkPvngQ/w4zDLDqvk81U/0NrC1F8
	 MRVIb4l2R8EApZrkNupz9HIuqVXjgo0EPfZE62+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C40BF804E0;
	Wed, 18 Nov 2020 14:58:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D2AF804E1; Wed, 18 Nov 2020 14:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB760F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB760F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WzfS5ftW"
Received: by mail-ej1-x641.google.com with SMTP id o9so2920368ejg.1
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=WzfS5ftWkRMUzolpSh5HCyN4cmp70soK14s87h+2M08gwqkRfSM1li/SeATS7MA8CA
 n/sY36cmWUjV1SvmUdcnwVr88B4NjXCBd+xogRlmqDnN7DqOLXdQuISdhL57o6jwPxee
 IawguAG9hPu0NW7aAXvvmQ1fW4WTfO8oOP7dScEJdK0PnNfDMu27k9qRigi+sJu4VF3b
 Bxoik+iaaYnm1yT8K2F4x8HHZKjjlkbPX0lbLt7LpEQvd0TKi3Me4dyadjHW11Onb46M
 xYjT0zw3/9G6+6KLQJwPFviF+W9Sf6NNTpaw0SBLiN2PLCWcq6h5hvUlWV8NfZRGOh+h
 YOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=UqxBUKvgTFOjMzA1UlKCrubFOczPomI5G0biao1SCTkQch1wQ8y1sKrV7vUr9+bSjo
 v1e3GREXblNDeqqWQZsR0ARxnb2uQVGpvniDz4Jj7WOkWH3YcljbLEoe+Oc+otPr1v4x
 48Xu/aGEN4zcfxKn40ABypSLM32vTOQS0YHJ1TMVi+3Fer4lWROcwPBPEYlVddDADAH0
 Cc4SWEBWsQXKMWGbgpOt+h0xHCMEauTIH8Y2QqpqQhQTEfx3zyH9NqV/n7AInb8KD+Bz
 PTpUTaYsrdgNxG2esYETXFWBCskUxYDPbTNmvACwIbbO3IoiWpnA+yjhn3das60LXtur
 F9YA==
X-Gm-Message-State: AOAM5334IbCwGrJy2kRgOIwl8nt38qdkuJhKGgmWLtL202CXO/S3mcSv
 rkFRL+QzavV6LmXbUuR3oIU=
X-Google-Smtp-Source: ABdhPJzjtTA6aSJDvhbh3mZRYc7KQzylCh451tX0U9bpOnGQQ2ddCN9W+I66OX1Z3ial8hqeM8QM/w==
X-Received: by 2002:a17:907:4335:: with SMTP id
 ni5mr20187759ejb.459.1605707917128; 
 Wed, 18 Nov 2020 05:58:37 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:36 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 6/7] ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
Date: Wed, 18 Nov 2020 14:58:21 +0100
Message-Id: <20201118135822.9582-7-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org, daniel@ffwll.ch,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Add hdmi-sound node to rk3066a.dtsi, so that it
can be reused by boards with HDMI support.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 67fcb0dc9..f91ce3054 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -49,6 +49,22 @@
 		ports = <&vop0_out>, <&vop1_out>;
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HDMI";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0>;
+		};
+	};
+
 	sram: sram@10080000 {
 		compatible = "mmio-sram";
 		reg = <0x10080000 0x10000>;
-- 
2.11.0

