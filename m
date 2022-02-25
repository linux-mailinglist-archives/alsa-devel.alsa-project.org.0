Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B714C458D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63D071937;
	Fri, 25 Feb 2022 14:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63D071937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794723;
	bh=bwh3aA9vgYgiNtyB2bydYL/HM2BD7wjkYI0gUnBS/uM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UtjwVMDyCbjidJ1LPjYMlkKQ7TpZT5ZZg91ScNYErwNyTdkaqmJbkcax+Yd5MRcxZ
	 fpy8kOjQMomQpjD0qXk5PPaYl89xPwF+p2bqjskThxjLtD5MVnbtfLOT43Zm1Cfb1M
	 fOlsgT4I4mN0tZv55JF3leauxNSb8i8wGuH9Sm/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD689F80159;
	Fri, 25 Feb 2022 14:10:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24B56F80132; Fri, 25 Feb 2022 14:10:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E09FF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 14:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E09FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zk1vTZUm"
Received: by mail-wr1-x42c.google.com with SMTP id r10so4469070wrp.3
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=fcpSanLXTluEH1o3Di3VGPHlfJFzXldmeWc3Lc0lqLs=;
 b=Zk1vTZUmiGcgGskXNTXtWMVdtBc28Z/taq9E7cQRToI1sWHpLiL0pG2iwpEOoiqEnT
 DifajOEgMkiTp6w4TAkNWoJFa4l8GKcO6umclQvtwbsMZGTkNeEMMhhhieO90DjzyBA1
 vLU8Gwh5/iiSrChSx6OFHHzLTIpwT8mmd3aqd7eqOGcLZzVSi5o8QYxuxxEXBzO62Qm9
 ir6xdbc0uD3c8DGyoHSwN3XmgB7/Tca6UBc0YC6/TDHE9QzTTvECJgcInRz3hrY/DaG+
 TExuv2PP4qJMKcqjSwwMY6ussMfFX8ynFxpgJ09IuA0rYfITvbu+0M+l3UiNN5cmzl1R
 xFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fcpSanLXTluEH1o3Di3VGPHlfJFzXldmeWc3Lc0lqLs=;
 b=M5lMtidh/VDxMdl3N9LwSgnqPABuQUsYauY9feVDJAhpWS3mtf9QtAUImI3cP0+bOO
 JyNGiS7/xwrUui3NJFpLhvnorrKPev/gXIkCq9NPifjqp8OMZuQKgHRmJ8sX942zpF0y
 B1Vd50M3fu/9T1hj0nGj+Hh1wGiuHK+rs+IVW/Iex46UNWehm/eo/4NntAyPgjbmrGid
 qxqc3unnXBmfUhiHaajQbADRcwNWOIhwOYppHwqxh2lt44uUs2mJkN5mDExD7K7j69Pq
 43V+xKuVHzID41JtL5sNknNUQPdZvR8RVtDY4WGPed27i0Pfx/ceIoK4gqLd8CoGZCDP
 AFTg==
X-Gm-Message-State: AOAM531Acle2GAG7q8rXjNzNxcoRRp3Xx6zeLiFz5Ef9BBWLi6BtMQbM
 jnUYzETmHZnkhOgY09kBo+swXTQgmieYug==
X-Google-Smtp-Source: ABdhPJyre3/XXa54d/UN7EUXy/JFbdoL52eQtuhRqP5E+3QcqPH/s40WiFNE1Y8lkp08FQKUN7/IrQ==
X-Received: by 2002:adf:e18d:0:b0:1ef:7c17:cf96 with SMTP id
 az13-20020adfe18d000000b001ef7c17cf96mr330851wrb.444.1645794644476; 
 Fri, 25 Feb 2022 05:10:44 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.58])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b0037d62a899b1sm2494089wmq.6.2022.02.25.05.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:10:43 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ALSA: rt5663: check the return value of devm_kzalloc() in
 rt5663_parse_dp()
Date: Fri, 25 Feb 2022 05:10:30 -0800
Message-Id: <20220225131030.27248-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
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

The function devm_kzalloc() in rt5663_parse_dp() can fail, so its return
value should be checked.

Fixes: 457c25efc592 ("ASoC: rt5663: Add the function of impedance sensing")
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 sound/soc/codecs/rt5663.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 2138f62e6af5..3a8fba101b20 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3478,6 +3478,8 @@ static int rt5663_parse_dp(struct rt5663_priv *rt5663, struct device *dev)
 		table_size = sizeof(struct impedance_mapping_table) *
 			rt5663->pdata.impedance_sensing_num;
 		rt5663->imp_table = devm_kzalloc(dev, table_size, GFP_KERNEL);
+		if (!rt5663->imp_table)
+			return -ENOMEM;
 		ret = device_property_read_u32_array(dev,
 			"realtek,impedance_sensing_table",
 			(u32 *)rt5663->imp_table, table_size);
-- 
2.17.1

