Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC43C40A0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 02:52:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8251664;
	Mon, 12 Jul 2021 02:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8251664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626051176;
	bh=TwnDq+xL2PbqxUx7K0I/6jeiiVWk8OLPfZMuxzwIyh4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QlD6bvGzQVqGvGTb6KXzlzpOFduJXQ0CzXBgjqlONWt0AhQEuwmfJSCXQoRyDbcZn
	 TVqp5b6iE3RxWK/dMCwQwYuTYGBvqarEnrLSaTR1yPytAZvjnhagOFKKhOXkH3yNcE
	 2vNHx8LccOesLNFhC5xQfnkEssrTE+Vl9TLa8bx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1A3F80229;
	Mon, 12 Jul 2021 02:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD158F80217; Mon, 12 Jul 2021 02:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E99CFF800E8
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 02:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E99CFF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uHRAjl4K"
Received: by mail-qt1-x82c.google.com with SMTP id z25so9931755qto.12
 for <alsa-devel@alsa-project.org>; Sun, 11 Jul 2021 17:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ntp2N+FnF9cu5TY3c6BDZ2BT3tHEvf2ZI4kcZulyHTY=;
 b=uHRAjl4KstuBPiKhxZ/W2fwEeSj+KSOWzTOs7yoFGqBCagx4RutvdyTA4i9jzSxs6r
 qMeTPktyK+HLKWxe1tFIbZ4vEica8vJqrKnuk5vh98okN7K1OOxKmYWXFdBpsYrv11aL
 VSYymD+OdKs74nc6yPT6P/mGeINh0QMJebIj5hZblC47OyGHWJpJhVRjKr+MuLYStI2J
 PPwNdB6fvbSHB8YAgkX7hJwhpi+z/beYQKDkqY7U5I3hzLBVW4hw5PHsB1nyIcLxweCu
 6IvG0Y4jVRSFUwMTxoqjC7B/MrI23J1jDv6YUQkefqj8hCpDuKkYE8iGZGxL0k25+urj
 GIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ntp2N+FnF9cu5TY3c6BDZ2BT3tHEvf2ZI4kcZulyHTY=;
 b=YOOAcOBitJzZsuootEM0R0UdXRDvwfD0yfAWG3AOZxj2Xs3bpOQ0tKBZ0mV/k6ie4t
 kbEDvzSS1DpkqesqSQbeyomCwrn3yE9yhlPRSRtTuPrg6EhIqi80qScaf20ixznnSpr2
 SKwmnyjgQzIfPzDWCyOJxSauQvD7e6K5dkLw8VCp+5cnnXnYB0HyKRdUb6Zb4KRNT7zY
 XZWiO0GHQiQ7dBPncCIAIMgYvKaWvzPCVhQwQZlYEm5Yt9qq5b/ijR2xpyV4+9ahm37I
 EbaZlN9t38HRHjizR1Jek3fvFJYDnS9BnlFTYKSsq6FxE8MvohhT8ijW7s9ajgtOxhS1
 98Zg==
X-Gm-Message-State: AOAM532D9O7tlIcCZuUEaNLFHpCpwHXTP6sedsWijqIYcrUhv3RlmJD0
 tv/MIZF6jKt8snWXZ5m38xs=
X-Google-Smtp-Source: ABdhPJzNcone+ITVv7tkPYfnB6EEZgMOxjj87y/qt9w5WIUrmXKgrsDgfl4sb4P2cLPSiGqztPWqmg==
X-Received: by 2002:ac8:7c85:: with SMTP id y5mr43954762qtv.376.1626051076421; 
 Sun, 11 Jul 2021 17:51:16 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.gmail.com with ESMTPSA id x15sm5783823qkm.66.2021.07.11.17.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 17:51:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1] ASoC: rt5631: Fix regcache sync errors on resume
Date: Mon, 12 Jul 2021 03:50:11 +0300
Message-Id: <20210712005011.28536-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Maxim Schwalm <maxim.schwalm@gmail.com>

The ALC5631 does not like multi-write accesses, avoid them. This fixes:

rt5631 4-001a: Unable to sync registers 0x3a-0x3c. -121

errors on resume from suspend (and all registers after the registers in
the error not being synced).

Inspired by commit 2d30e9494f1e ("ASoC: rt5651: Fix regcache sync errors
on resume") from Hans de Geode, which fixed the same errors on ALC5651.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
---
 sound/soc/codecs/rt5631.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 3000bc128b5b..38356ea2bd6e 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1695,6 +1695,8 @@ static const struct regmap_config rt5631_regmap_config = {
 	.reg_defaults = rt5631_reg,
 	.num_reg_defaults = ARRAY_SIZE(rt5631_reg),
 	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
 };
 
 static int rt5631_i2c_probe(struct i2c_client *i2c,
-- 
2.32.0

