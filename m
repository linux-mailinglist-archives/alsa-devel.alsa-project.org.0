Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1B2FC5E0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:34:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2650F189D;
	Wed, 20 Jan 2021 01:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2650F189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611102880;
	bh=MqC5gK+P+4O3GTKWmzh5FbYV3niAaEUkDbiEeAVAjoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ceLAkYWCcZ+soxI8SEtiFxcY75XPcVhzEqmZV5PeBMCCMK3A6QR9QLKTdNTT8i9sv
	 dcWx8LX5IktLWbLzxKkWvQt+avfLKUIG1tNEdPJ4/Uver3cWLetir9yI2B/TxXr2hO
	 yDXHTowGnhy3g7CkpIQEluSstX3L4kmfwcQEuzaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D026BF804E0;
	Wed, 20 Jan 2021 01:32:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61F22F802BE; Wed, 20 Jan 2021 01:32:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5C16F80255
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C16F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mkV3pAoh"
Received: by mail-lf1-x136.google.com with SMTP id b26so31772795lff.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gasc7AXG1NBfUNBujKx9TV2RfDYXzc6wKO2J8rBre4s=;
 b=mkV3pAohbA40bFz9L6eJJypQxBLBcx3Cm8XIM9oiyjuQRBcNRdH222lrN9dSYJx4Ec
 7K1upo/DcM2QwlzeqzCpA/pZ121uoEpOrrq21ud+VUxWvkXuMWXBzTJHWJQXX4Q2yK52
 2N+8+nldvqSqacB2eyAyKlyCmY4BUC9K4EufF0uMmd5fSEN3bwKZt9QK3d9aVIvA0e1A
 bbhjNCEtD8HjQTk3PyZPkhaYxrgd+5voqEVx17Q5Finqp2q5kBBptbmk2Q/AIJvLqS9b
 pkT+zYtJwaGpZZ3+s8J+3a0fX4VlDRFxXekKb/+JqChYmSWdgUNX7+ZsCKEXYBuAe3wQ
 CiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gasc7AXG1NBfUNBujKx9TV2RfDYXzc6wKO2J8rBre4s=;
 b=oWkjBL3+c8cnKBMvwLuCUOT5o8OOPncYu0fGaqeX1giC/CQ3/QzOsbNefxaY5PQ+Z9
 szwvLk1s7GEViecGtDBKa7dfN9bQ+CCz348s3NcRoDXB08/aQQDDa9dnKJb1iUmeh+lK
 5B8moj+iWZUcbZBQfXfTjq2jiKX2rLjx02r2HDWLKueNdAGxRjlNgPV8CAQHS0d0hjl6
 hvxEz9+djI4VDLLcqOmNeUp/q7IvUFU67o5KyQYwKsRR+fN8XXKtBSbE1HLXtUrdez7T
 AmDArI8EJRYYF6NPsV87v9ISwsoikfuOwHmuaswVtUXeGoaesRjaOrPA1OzUebv8XyHV
 8PIA==
X-Gm-Message-State: AOAM531SD52FK989t9jR97rW3ppCMnW64dnvfJcu9osQ7Vc79wQ6apUc
 VD39RHlLcUZBV/pzjIfSwdQ=
X-Google-Smtp-Source: ABdhPJyRRN7rv/LuasYbbuHgPNKP5uJc3S87xRG9nXi6G1X9PH6IYShiTkIxv0xqI2pErkM617osaQ==
X-Received: by 2002:a19:154:: with SMTP id 81mr271043lfb.178.1611102726609;
 Tue, 19 Jan 2021 16:32:06 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:32:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Matt Merhar <mattmerhar@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 4/6] ASoC: tegra: ahub: Add missing resets
Date: Wed, 20 Jan 2021 03:31:52 +0300
Message-Id: <20210120003154.26749-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

AHUB driver misses D_AUDIO and APBIF resets. CPU hangs on trying to
access hardware if resets aren't de-asserted. This problem is currently
masked by the tegra-clk driver which implicitly de-asserts the resets when
the corresponding clocks are enabled. Soon the implicit de-assertion will
be gone from the tegra-clk driver, thus we need to fix the AHUB driver.
Add the missing resets to the driver.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Tested-by: Dmitry Osipenko <digetx@gmail.com> # Nexus7 T30 audio works
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 156e3b9d613c..8c32333cc08c 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -337,6 +337,8 @@ static const struct {
 	const char *rst_name;
 	u32 mod_list_mask;
 } configlink_mods[] = {
+	{ "d_audio", MOD_LIST_MASK_TEGRA30_OR_LATER },
+	{ "apbif", MOD_LIST_MASK_TEGRA30_OR_LATER },
 	{ "i2s0", MOD_LIST_MASK_TEGRA30_OR_LATER },
 	{ "i2s1", MOD_LIST_MASK_TEGRA30_OR_LATER },
 	{ "i2s2", MOD_LIST_MASK_TEGRA30_OR_LATER },
-- 
2.29.2

