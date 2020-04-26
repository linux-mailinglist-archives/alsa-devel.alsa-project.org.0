Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186A1B8EFA
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 12:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2329167C;
	Sun, 26 Apr 2020 12:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2329167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587897786;
	bh=/fKcNaAvhjwya1M5UqrQg4UeCaq+yHRc9nqE23laxe8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cVCuWXCaBLtZy+d8QFnQ55ZT4FuPdvPGVBhUMGM9EnmdyUbtzLobn99IxRvPXUjY3
	 p9kKFPTcRM+UUlgc7+84d0C+csjxBL42F0nVYJGMAUhtTdrIm1dV3xQR4pjDehoJvb
	 /dL6trSVsDLKbo8/vPvMy/JfHztnFD9CgN2juWGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C10BEF801F7;
	Sun, 26 Apr 2020 12:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2999F801EB; Sun, 26 Apr 2020 12:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B022BF80105
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 12:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B022BF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DJTyWott"
Received: by mail-wr1-x443.google.com with SMTP id i10so16960872wrv.10
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t36awUAxBdURHa0pPaeUAx2wGUximeZMbTRyNuoxFJQ=;
 b=DJTyWottTMVyc6z8QE28iZUq89K4lfUqv7E0bZ5i00aryQAtf8IQhI6iOj+qjELeIL
 Mai5Ks/HBGmUe3f7su0WhujgOQzyX4MjfVB3gYYAVGu3i46Yl2RLQFhZtHu/Vrt+vQpa
 AYOYXLSc9siKKV81KymabDWHdPxvIN30C3zeirXkQ2lIIfkuf1KRIlrwmLJzK8mTevax
 yWqeX7zL5XPo8nnlZE0SJR/6piBu4vwO/zoSeRNcPPe64a7zzSfbj2tPy05R9xal7yRH
 w/tso/JEplt8R4PEiwW2rxUX/GnjzdVNJbsk5lQMSOy1xeEReNkWKcIW1m5HTC4I93Yg
 xG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t36awUAxBdURHa0pPaeUAx2wGUximeZMbTRyNuoxFJQ=;
 b=F/o5ubvHuivRGm0hLGCIMJ4K4rP1g3chUM7p65KRAi6kak/CfVWSy3+F6gC3pqWYP6
 mNXWguAUTBTbgBTGq1wcwWnXZ7UFP7KlzMaHF43cB73ZhMIzSZJctrTbQWjzZ5XOGZTp
 qQuOak0jQw0hYZKoiy9/tKFQ9E2K091317J0dXPwqxLwGrt/+kJK+THeADoZexkW4k3x
 AfdY7jYWV91MBS31iYwwBeU9MtxMrOEFl3gkFEhwMSumN/URknVlyeStBAc8/44RtzXt
 8P6T18OU+UGZi4mp+B7uS/jZoxwfppksLLtP4AQiNhlfSQRBjBJzDQEXiyXQn68XU6Ba
 qKJA==
X-Gm-Message-State: AGi0PuZYuTbVSKJ0KyeCV05vJWikJ4mcKN2PAsVwi8+rSzfzVx61Q1t7
 WdHxn56Y4dd9YheY0PASMuM=
X-Google-Smtp-Source: APiQypKFE6ZvIpfTdcTCsjnX6lRWOkKiGHpgutcqgs8f5RsTU7gCLlhGaKzJPimh6XbZNz2/ILqSwA==
X-Received: by 2002:a5d:4e12:: with SMTP id p18mr22033146wrt.148.1587897678658; 
 Sun, 26 Apr 2020 03:41:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 y10sm10491793wma.5.2020.04.26.03.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 03:41:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/7] Add H6 I2S support
Date: Sun, 26 Apr 2020 12:41:08 +0200
Message-Id: <20200426104115.22630-1-peron.clem@gmail.com>
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

Changes since v2 (thanks Maxime):
 - Add details in commit log about sign extend sample
 - Only set FIFO regs as volatile in regmap
 - Missing a space (detected by checkpatch)

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
 sound/soc/sunxi/sun4i-i2s.c                   | 265 +++++++++++++++++-
 3 files changed, 296 insertions(+), 2 deletions(-)

-- 
2.20.1

