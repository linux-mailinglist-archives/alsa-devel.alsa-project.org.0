Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3E620E5C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 12:14:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA158836;
	Tue,  8 Nov 2022 12:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA158836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667906083;
	bh=SG2KOW8IpHQ/cgSwFxFS74e9sORdsT1d4PhikDg76iA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vAwGYEuL797StxjlvsEFhIFA/4WLiNKoa4aIH0qnC2B2qEX+Zw3L/GRuni0QLQQbC
	 63qJ4WfvjrAlpSBAjrjTJ0cm+7/upy8coTi3kLqLYEIjGGFwkpgb4qy4YQqhsKPk8h
	 8QEjHjO6e0cg76MgVuVlnGnMfpIwRsZzCHXHgDQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EC2F8020D;
	Tue,  8 Nov 2022 12:13:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CB79F801D8; Tue,  8 Nov 2022 12:13:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 138EDF800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 12:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 138EDF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FcEGwYjC"
Received: by mail-wr1-x433.google.com with SMTP id bk15so20365480wrb.13
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 03:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ji1uJ+VLtBXdsvcmViF94zHW4mvj6ILjubVPOBa2RGk=;
 b=FcEGwYjCjOAWlZBOIMa7ZQ4a0r7fjKHCjXGwv6eEgRptjbks2AcaLEjE4LXrZ6/cwR
 6fVi8OZK2w3hjePpvuZYFdSpywBj2bBLzGVnQYaqioLDYdLPmqY3peQsKsycb03l15Z8
 ZA4yGIGnf8jjE/EK6x+qdno7S0q67sTqlm63dD4vNUYtoJTvtCB0DaylSu9tLarF2hZ0
 Ff/DF28CFfw2W0nHpQBZyWA6x80H0IzIkILhxuH7GttHNZWRnfaRIZTXiyzwXmKjd7uw
 n7o73pWfkqcOudywpPZwp1fiJ3Dn7HkFMpDIoqwSatAioYA2JmzgoijK9zxDvEgvSzcJ
 n7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ji1uJ+VLtBXdsvcmViF94zHW4mvj6ILjubVPOBa2RGk=;
 b=ncKt8cexvetsHnWqG7hdxQYb7tC46akV6YtCkd+DkcAtVlGG8pczHocAW9BPdktJU7
 Xw54C4vjZpPFdHdVnSgUr6rN7QOyJdCXq8JKMAThjMOUx/a5JePuVEE2lD7+ex1ydL2F
 b8Fn7jFbn4sgQiyeHASi/a74FknG+pL+9l2D0ceXDx6tPiysQbmLqRzqtrkPeD5Bisy7
 sJnNePknrTyx5QfSS+q5QJc7iLtwGMK/JrtCOpSHBdOv3dAM5Y08J1FMGBHu5sUxht21
 IVkCK6eNhOzSyukFHVDIAXkcHUZlYXOfNnqkwnMieQkJS6o2h9fIui5PZVLW9ZJYsUYp
 K39g==
X-Gm-Message-State: ACrzQf1kEQDnuMxwS7Hy2j72prtBKEcwv4IcK0vM0vF3lsRSsC1eQ4MM
 Rmm3O9sw2oQWTxgGrH5Xx60=
X-Google-Smtp-Source: AMsMyM4l7Rfl+oM7BrNdp0vHXFkwDB6KbmzTO/A7TvXqqrdeNjv10bttLp2lz1DOqxrjbIbx1pUiEw==
X-Received: by 2002:adf:a45a:0:b0:236:9aa8:e675 with SMTP id
 e26-20020adfa45a000000b002369aa8e675mr35498723wra.407.1667906022008; 
 Tue, 08 Nov 2022 03:13:42 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d420a000000b0023682011c1dsm9840843wrq.104.2022.11.08.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:13:41 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
Date: Tue,  8 Nov 2022 11:13:40 +0000
Message-Id: <20221108111340.115387-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There is a spelling mistake in struct member fliter_structure.
Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/tegra/tegra210_mbdrc.c | 4 ++--
 sound/soc/tegra/tegra210_mbdrc.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index d786daa6aba6..eeacb1220268 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -54,7 +54,7 @@ static const struct tegra210_mbdrc_config mbdrc_init_config = {
 	.mode			= 0, /* Bypass */
 	.rms_off		= 48,
 	.peak_rms_mode		= 1, /* PEAK */
-	.fliter_structure	= 0, /* All-pass tree */
+	.filter_structure	= 0, /* All-pass tree */
 	.shift_ctrl		= 30,
 	.frame_size		= 32,
 	.channel_mask		= 0x3,
@@ -819,7 +819,7 @@ int tegra210_mbdrc_component_init(struct snd_soc_component *cmpnt)
 
 	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
 		TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_MASK,
-		conf->fliter_structure <<
+		conf->filter_structure <<
 		TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_SHIFT);
 
 	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
diff --git a/sound/soc/tegra/tegra210_mbdrc.h b/sound/soc/tegra/tegra210_mbdrc.h
index 4c48da0e1dea..76e443a7934e 100644
--- a/sound/soc/tegra/tegra210_mbdrc.h
+++ b/sound/soc/tegra/tegra210_mbdrc.h
@@ -199,7 +199,7 @@ struct tegra210_mbdrc_config {
 	unsigned int mode;
 	unsigned int rms_off;
 	unsigned int peak_rms_mode;
-	unsigned int fliter_structure;
+	unsigned int filter_structure;
 	unsigned int shift_ctrl;
 	unsigned int frame_size;
 	unsigned int channel_mask;
-- 
2.38.1

