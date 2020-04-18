Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86E1AF59A
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 00:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E841669;
	Sun, 19 Apr 2020 00:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E841669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587249990;
	bh=YXemFhkVFhzuZ07SroHOFCZPF3V9COJNfF6AwQVuobI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXOGNkH+UG4+a5oMdigWoJ+NCzUbDRyEQp1gFuOzH21V32vcN1jXWlDnTzTGGuNYy
	 DE/auEXAlIhvZoK14+J40YW49ujzfqN8++dUGfVuAYCibI3GDDvupVuYP8POXHVefX
	 r5nEo+h/kJ6lsAo4reBSwfApjLgnKDyixtUxmm44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4DBF8026A;
	Sun, 19 Apr 2020 00:44:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 736A6F8016F; Sun, 19 Apr 2020 00:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA404F80122
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA404F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S8KltfH+"
Received: by mail-wr1-x443.google.com with SMTP id d17so7375961wrg.11
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wutgCaF9Zt/dkeWGofK0wxzxUn+L+6837DjwQz9y1UY=;
 b=S8KltfH+/O56KBksVXD14TzKEOLFfEQyo4KgSjFu66oO3Uk5cwNWg5nBnLAjoS5ztX
 4xjow8fTnW0ns/pNDHxBa5a5+HshR5W40o9c/ct5OZrf1o1ZG4g/xKmOfwpk1WBfCTQ0
 ojGBTITEANi7ER1oclt1vO3TzETC08kH/nIk2fi7a9QfgpGFae5VLrbgydJdH1SHsDAX
 o1rZrKERoVYwEZEV+PLbbMA7oMVaXf7LID9r6dRhyaPDcSslUQfQlZglgE/ClFrKpR80
 syrlPCDBugz7YHcQpyH8KXBE/bZOSNAz4isuXF2RD/fSJPp3i54pYPc9E2Bpl5wTZwIC
 fKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wutgCaF9Zt/dkeWGofK0wxzxUn+L+6837DjwQz9y1UY=;
 b=G2q6o+nJMRfaVujC4CMZVoBIDJ7LSjjcUXwDTJa0VUWJ69SqMqecTeRm3dJLRgBK/u
 lAq3eA/fRdbmPlg78zKl/8WQiOBJIN/GhRMkXUN+oKeMY2TlMHSHXDtxUd35ow3ETjlv
 Vn3/tcmAu6fXS3cO2YwKqNTKMpLFJxi8j2JPKlOwMaUfxRb8K0JBkRHHAGR+WhSCiamf
 4une14dsTmFaNP7qoNYDwAZf82ovjZNM5R4k1G/dvT6RyGAjUBTrbw/ZPPt5IKGZ5xN+
 nQtZYqE1LorRia17S/6c8jfpeVqr6iClDIDQAZAFjyO40wkWIA9NNh8KQlBdB+ZZ/qjD
 7Rkw==
X-Gm-Message-State: AGi0PuZ64KP58l+vxo/FNsdcwBi0CU6CyDana6m/ui++FEfuXYGggImT
 uSmQQ6FFjZbdBqQmLWTk2Ps=
X-Google-Smtp-Source: APiQypLOwYrHCgIWndZgkcTL4l0O4nIwWLNdaqPiGUU1qxzWWClq+DqLkuqfQGwqt4juRRHwGPellQ==
X-Received: by 2002:adf:dd07:: with SMTP id a7mr10688193wrm.349.1587249878341; 
 Sat, 18 Apr 2020 15:44:38 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id t16sm13371559wmi.27.2020.04.18.15.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 15:44:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/7] Add H6 I2S support
Date: Sun, 19 Apr 2020 00:44:28 +0200
Message-Id: <20200418224435.23672-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

This is a sequel of Marcus Cooper serie[0], where remarks made by Maxime
have been fixed.

I have tested it on my Beelink GS1 board.

Thanks,
Clement

0: https://lore.kernel.org/patchwork/cover/1139949/

Changes since v1:
 - Fix missing header in set sign extend sample

Jernej Skrabec (3):
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  ASoC: sun4i-i2s: Add support for H6 I2S
  arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI

Marcus Cooper (4):
  ASoC: sun4i-i2s: Adjust LRCLK width
  ASoC: sun4i-i2s: Set sign extend sample
  ASoc: sun4i-i2s: Add 20 and 24 bit support
  ASoC: sun4i-i2s: Adjust regmap settings

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  31 ++
 sound/soc/sunxi/sun4i-i2s.c                   | 292 ++++++++++++++++--
 3 files changed, 301 insertions(+), 24 deletions(-)

-- 
2.20.1

