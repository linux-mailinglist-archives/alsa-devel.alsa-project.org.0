Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7782D0542
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 14:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50353176F;
	Sun,  6 Dec 2020 14:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50353176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607261752;
	bh=ydGB/YO868+yVDanbmOQAeGPSjo2g+SvAO+70FxKaI0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Crb3896jbPcwwmxNIv0lJ3dRVjqj8/WbgBos0540GehYpxe3d/mBmnuR8O0qOkYzP
	 BxVArLcXi1mqkvac+BPAbYyxKqmU8QvcrKQa9Nqxczmmi/juDKPXBZ0EAhgr1bq9Z0
	 6lyUQBpwBgEgfr31GKX+LKocHDFGYO+M0NAKGP+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA8E0F8019D;
	Sun,  6 Dec 2020 14:34:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC733F80253; Sun,  6 Dec 2020 14:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA643F8015F
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 14:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA643F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CfD7avGj"
Received: by mail-ed1-x541.google.com with SMTP id r5so10770255eda.12
 for <alsa-devel@alsa-project.org>; Sun, 06 Dec 2020 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ClADTS0QuKL62E36tFTJGwg2N6O3ikpA70hf73VQQnA=;
 b=CfD7avGjj9/HgOdFJm+Jgte+0mkMn+vGKFsqCQBDCZ50PATgRCsdgmcytM62CytxJC
 rvoAvmj62E3Fr8aYb3+wz3KU0pQ5tky/PGHGKhwth6triY4yAZRF9ayyBvVmA5HAp09P
 GW63o62egMZJHFzOX8EFlLGGbIj9FbCeI/fC99/r3EUs7hnZDLRqHi3fHe3NaYBUvi/L
 nq+BPdt0JUKhyhaUFbnmjY7niejby0WuKHKarxrQiTeI2BEEl1KFyw9cAXSb3CBRKOx8
 yPXMonW2DgspzsUmWeu0dsKjV4AokqjBVObeHzytEsmZF0vAqySZm5Hz0fyTciWeK2TC
 6Uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ClADTS0QuKL62E36tFTJGwg2N6O3ikpA70hf73VQQnA=;
 b=Rrtp4FfsEP+eA3bTRJBCimcIQPF0zAoXXrr5cN/KXqIXKORlnyHO1tvoc52QE72Vue
 NYbhDbD89+hC8U6w6YqO6dHYSFDh/2HpUTh2jA8MG2r6smjCMM7GDmGmn9yvQHVQv73+
 bQeM/Bl4xe1KukVBMbeCcEAfXj6IUL+1svaYNtKpBdGNInSE8mFO9x3Lx+Am4Qjg12Nt
 p1u3sxjxV+xl52pdempXalXacoLixNltYt1BJzKz1XFQMID4MHlXpvysIlgVNtTMgufT
 hx3u5D0zAGUlseq3Csz7Sr/RL5mlLgDI7lY0vK2wF1ayp1bl+nDwUYzHOOjRwTecmZ+/
 7l4g==
X-Gm-Message-State: AOAM533y348clQpH3PAd6Ct9qDuFqlNiTgCpZflqENxAFOrqZ1Q9QZmc
 09ProoVRJYgiMD1Iu8MwLd0=
X-Google-Smtp-Source: ABdhPJwPC3fbAsKPZT91sG3R8CMEf4NtuXxEwAQprJeqKkicBpn3851hCBqQkQzBx3hOuH58dimu0A==
X-Received: by 2002:aa7:db59:: with SMTP id n25mr14352860edt.203.1607261645894; 
 Sun, 06 Dec 2020 05:34:05 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:05 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 0/5] Enable rk3066a HDMI sound
Date: Sun,  6 Dec 2020 14:33:50 +0100
Message-Id: <20201206133355.16007-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, broonie@kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org, daniel@ffwll.ch,
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

Update the rk3066a HDMI documents with a #sound-dai-cells property.
Include the code for sound in the HDMI driver.
Add a simple-sound-card compatible node to rk3066a.dtsi,
because I2S0 and HDMI TX are connected internally.
And as last enable rk3066a HDMI sound in the rk3066a-mk808.dts file.

make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- -j4
cp ./arch/arm/boot/zImage ../zImage-dtb
cat ./arch/arm/boot/dts/rk3066a-mk808.dtb >> ../zImage-dtb
../tools/rkcrc -k ../zImage-dtb ../mk808.img
sudo ../tools/rkflashtool w 0x4000 0x8000 < ../mk808.img
sudo ../tools/rkflashtool b

Changed v6:
  remove patches that are applied to linux-next
  add platform_device_unregister()
  restyle

Changed v5:
  removed unused variable
  fill frame structure

Johan Jonker (4):
  dt-bindings: display: add #sound-dai-cells property to rockchip rk3066
    hdmi
  ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node
  ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
  ARM: dts: rockchip: enable hdmi_sound and i2s0 for rk3066a-mk808

Zheng Yang (1):
  drm: rockchip: add sound support to rk3066 hdmi driver

 .../display/rockchip/rockchip,rk3066-hdmi.yaml     |   4 +
 arch/arm/boot/dts/rk3066a-mk808.dts                |   8 +
 arch/arm/boot/dts/rk3066a.dtsi                     |  17 ++
 drivers/gpu/drm/rockchip/Kconfig                   |   2 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 277 ++++++++++++++++++++-
 5 files changed, 307 insertions(+), 1 deletion(-)

-- 
2.11.0

