Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFE1B8FB4
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 14:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED541167B;
	Sun, 26 Apr 2020 14:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED541167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587902795;
	bh=V6S/1Khh3EVfqBYC9dI2eupCRQgPIGUpEHRf/CT0jH8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EhghGBs9yEzWHCFizxTSYK/uiSqcGFGRy0QHXw6pQIcqc3qbbKboiHQHX8z7j/0zj
	 BM/EQd/9G4uuXCKy+OAGo1HMzyzbbBbfqY5Kh5qUTjVls0ye1dA7nFxLFcRRLcaSNI
	 FFl4Kf5EhoX5Zi3JaB8ZpdftE29e+b1+pUX5ZI9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4DE9F8021C;
	Sun, 26 Apr 2020 14:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D60B8F801EB; Sun, 26 Apr 2020 14:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72C2EF80105
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 14:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C2EF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sfuva1sx"
Received: by mail-wm1-x341.google.com with SMTP id u127so17069223wmg.1
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJJgAhfk7oMElKUFRIFXFOYn/qywwEUjFDBuFThEtAQ=;
 b=sfuva1sxBAzZHPvMiK3XuIgAyvFBdMlVYiBHcD57MfQ6+50qw2HX4NmbS1P1I8eKKZ
 /aMgB6u6q36iOGdnSL+BiS0R0gtIYIwuTng8Aqz8O66NHAfRaTAdCEAg01mQBr9SrKWf
 0OckZWSg/C0ujFHCTQzzYIZ1NB/kinnelZK9nPLzlowzGZLn/qqnhxYB9MEWY5L5boJW
 a3BnY5WcUie1SWiCN40liJeF42CZR3g0F/J76siR9kwYFzvaeYOzbaGtU2JyeBT8VG/T
 B1JCreV3F0iK4bHSFNsHtrSCEzoe2s3Ub/em30d6/p3ZKWec8gpRhsGuit6HksSHc9Ub
 C+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJJgAhfk7oMElKUFRIFXFOYn/qywwEUjFDBuFThEtAQ=;
 b=n3JVqnKNNmt30+aeD07tZRBIfbmLvYTh8N3RjYbTKUTn6L3cvA6hNEDVbFeETJvmOm
 y6QXSpj86cq4T++C9O/o+TH/UeGUX9fZYizMXYfiZvH6wwvjeOcuB+Vzle8yXp0eIfa6
 ilntbQHANQl2hb8B9dNibBaQh/HeDtBu5Kagvdlp8Nrq/OhNK7w/1ViP0v7z686ceFC9
 vZjoL4H8uLkg5F3yC84BoMyhC9BTYyt3CFCdWBUoXOyzwvB9EP8C1b3Cr8PAi0jAJLaE
 5k1ssoacwC66hbdxf/dinRBH33Qq5O0VYSbKVyt0idPTsdAtuDwXb3wTuSQyxj33754Q
 Rncw==
X-Gm-Message-State: AGi0PuZkl8uV4AXxj3Xn1TcvoxkscxxH3dswJ4LXdnGsAbo5zMJCOc64
 bau197LsC6OWIha0UIBzzAc=
X-Google-Smtp-Source: APiQypJpOD8D5Q3WlZ2OFG6gGKUKug+LlEpJrzk93HqNzrSsg2E8ZE0xp0/y6N/oThQlA3vs6r+5eA==
X-Received: by 2002:a1c:1985:: with SMTP id 127mr22090541wmz.13.1587902686745; 
 Sun, 26 Apr 2020 05:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 s24sm11120026wmj.28.2020.04.26.05.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 05:04:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [RFT PATCH 0/7] Add Allwinner H3/H5/A64 HDMI audio
Date: Sun, 26 Apr 2020 14:04:35 +0200
Message-Id: <20200426120442.11560-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>,
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

Hi,

This is some work done by Marcus Cooper and Jernej Škrabec.
These patches are present in LibreElec kernel and have been
tested by LE users.

I have rework them to follow kernel rules but I can't test
them as I don't have H3, H5 or A64 boards.

If some sunxi users could confirm they worked as expected!

This serie goes in top off "Add H6 I2S support"[0].
You can find a branch for testing here[1].

Thanks,
Clement

0: https://lwn.net/Articles/817914/
1: https://github.com/clementperon/linux/tree/allwinner_hdmi

Marcus Cooper (7):
  arm: dts: sunxi: h3/h5: Add DAI node for HDMI
  arm: dts: sunxi: h3/h5: Add HDMI audio
  arm64: dts: allwinner: a64: Add DAI node for HDMI
  arm64: dts: allwinner: a64: Add HDMI audio
  arm: sun8i: h3: Add HDMI audio to Orange Pi 2
  arm: sun8i: h3: Add HDMI audio to Beelink X2
  arm64: dts: allwinner: a64: Add HDMI audio to Pine64

 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts     |  8 +++++
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     |  8 +++++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            | 34 ++++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  8 +++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 35 +++++++++++++++++++
 5 files changed, 93 insertions(+)

-- 
2.20.1

