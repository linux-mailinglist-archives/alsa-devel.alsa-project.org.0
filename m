Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C863121459C
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4113A16A8;
	Sat,  4 Jul 2020 13:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4113A16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863144;
	bh=fuHTvtKo4YiNa4eSbRC9RiiNp0MOTW5cEcOzXjelMTQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csULfrwgqdFpq8JBhB9Y/C3sT5u6GiqBnEpL2TTuDJNZ7dzuIyM13qQ9ATk1OtMHW
	 5mGI823q/cNdFoNI7sux3QX/MLmRsLJvujP/14DYs8vfg/6diAL+XUxxV1G3n+/GFu
	 vVekil1HTOPuKAkRFYmn+hxqJbdPIz2jLBSngBDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F2A6F8031A;
	Sat,  4 Jul 2020 13:39:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64D5FF802BC; Sat,  4 Jul 2020 13:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3AEAF802BC
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3AEAF802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t7tjbM6q"
Received: by mail-wr1-x441.google.com with SMTP id z13so35434523wrw.5
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=07SzXUrNmaVEvqxJMeRoC1vO5sKNg5xLvcI7+EHrur4=;
 b=t7tjbM6q9DA++HkhhFBRV8bwWXc9Quuf0NpyLkimpVbL8K1VkNjwHTB4ASyTkmIefz
 9J1/NgNi6e1OXX1N2tccVS0Y0fFOpw6FctZvl3ZBzeHj7btm+R+QQp8To+hOuG581hb/
 j4VCBPQXgfAdWmlHJQeAY+dDCbochhyNvFb65r1smYn2PCrfiD3c8TGZtl3ikxTRPKas
 gTBJs9fOJ3EtLq0VZ2YIB/pQM7k8vGx/c+O/zMe28I+K+sOv8loaxpfp/yJ4klayWvY7
 0czoDeOJ4BR/tJs245n15+W5YOXD5+tfMnBYJKIe5iCeewm0b2SvBuYX4TQWgETIdxQP
 F94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07SzXUrNmaVEvqxJMeRoC1vO5sKNg5xLvcI7+EHrur4=;
 b=Ek4uEzL7L4TfWzzw/uU0at3DYUYaQGgn6Q2JL1aYmNkK+42IdaXWKF+wVAgG+3rByL
 QExF74TLLhg8aX2978a3O+T4+feut1aUAUgWbEfK6bO8F4LgfCEAYF8uCT+s7L9r2+8a
 az+7LawEI7d6GuS+8XS80EhJZ5fKKfLThTj07Fi+DABgXov8yix1jsUPwdf1THF0xvUl
 ddAswKHIleSAjXFSppO8sxupAFuuLqxNUOdHETcR0BtYEhcfnqwCDC7t/dk0ye53V+Un
 TiIXPTuWTGVamZZiAnyDAzBQOYYoj+lnOo4VUVwVvlt1gz2G6C54Lv7h81oYdCsw8OOS
 KZsw==
X-Gm-Message-State: AOAM532nl1SG9SCf8RS4BtP3PV9S/qMfMS/gt9x7BH90RcHqOxk2KNXb
 dAbvS01hMuc2HJgbHmdb7b4=
X-Google-Smtp-Source: ABdhPJzj9TjACX1ft7d4WQSD/0GePrc3Tb20hkx7aYSB5nl+CZoGE/JCwfOoqbVepk1s9FU63LnGug==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr38829811wrs.270.1593862752902; 
 Sat, 04 Jul 2020 04:39:12 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 06/16] ASoC: sun4i-i2s: Adjust regmap settings
Date: Sat,  4 Jul 2020 13:38:52 +0200
Message-Id: <20200704113902.336911-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
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

From: Marcus Cooper <codekipper@gmail.com>

Bypass the regmap cache when flushing or reading the i2s FIFOs.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index bc7f9343bc7a..d7484c7e8fa2 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1120,7 +1120,10 @@ static bool sun4i_i2s_wr_reg(struct device *dev, unsigned int reg)
 static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case SUN4I_I2S_FIFO_CTRL_REG:
 	case SUN4I_I2S_FIFO_RX_REG:
+	case SUN4I_I2S_FIFO_STA_REG:
+	case SUN4I_I2S_FIFO_TX_REG:
 	case SUN4I_I2S_INT_STA_REG:
 	case SUN4I_I2S_RX_CNT_REG:
 	case SUN4I_I2S_TX_CNT_REG:
-- 
2.25.1

