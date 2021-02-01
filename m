Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11F30AC71
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 17:16:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22746175F;
	Mon,  1 Feb 2021 17:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22746175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612196176;
	bh=BrQayajtL3u72xR2CaytuwIPhm8So/3+Chmm23mxLHw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bzPttTZZ1aZlzYzfTnmM/v+xn77O7d4MbDlc0w9LoXz5rZTNqwmZRUHDnpgNqEUbJ
	 X9W1EIMwBBOGY5eLZ3dq7U4t1/sIg0YOsbdlunK6zEyEdXWQc1raG0LnXt9vbByy3h
	 sRLNQEv/B+aQqSC/DM7KaInB6c2jQxoYCofkktrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E04F80154;
	Mon,  1 Feb 2021 17:14:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1159F80153; Mon,  1 Feb 2021 17:14:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C19AF80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 17:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C19AF80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x7vVGDj9"
Received: by mail-wr1-x435.google.com with SMTP id a1so17216455wrq.6
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 08:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Sc8HrNbNzr7EkYfVerEBW1a3Yr6pb0g+SBRh2dP5aU=;
 b=x7vVGDj9TzIFhACvAUd9rk5AXnb/M228ghcnXZmSzBJKDz2374Uc1YSYsxdfgD36KP
 HHEIswk3DhRZmcwxRnFbexKg5of/3SVR0o/B08AH8hJZBLDWhlvg6/TMrRDFXwEQZLxH
 vniI5qIRDhsPeCAmf5pYiBNtm1Fqs12nKJuzXur/Vt6PjQujIvXJku41G1JnagpjjVGv
 FdBwFk+i0OPJrT8bTLDlvDfPq54aZj0bTc1sYjpzc6vdxt0usLVYCo4GJVbgZ13qLfyU
 wahBfFCF2I2MqVHtM8Sxcko+3oqmgjwfFWkfR84PQf8a5QP0wqzjIAbmydStExc9JTLC
 W07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Sc8HrNbNzr7EkYfVerEBW1a3Yr6pb0g+SBRh2dP5aU=;
 b=mFIiX+IoTy7BMloS9D3p5j5yeyjy5g6l+BmFHXs76fS7E5ZT/jkC2+ouBTWRwZIF3/
 kQhdMU+kavs4xiEcfk+uD+NDusDDREUS80XIgLYLP/Or/O1es8Aj1NKIKDrF4n6et65E
 HY2EWld+ID5yObT/H0qxh4NGt2w3NtduhxSKAdz6SkwtsSnfyxu7noYmwiBGwPW8SzM0
 SOQIWpB4pwGQyv1Uznf1W5bdFjgpBa5d5+wJyw8rOTjKjVNUZ1xZVOrqnF42MyXq8d/n
 9oPPMmPeTQ0f0/73lun5KEiDETSbPk4iz8ejq73kctDLbgyZLeCZA1+krGOpO12+C8F4
 8pWA==
X-Gm-Message-State: AOAM5313vh7VI2BQZLcioykAhIzybD0ZH5Y0+ja4etHg5MqWr0zHVrKi
 hD8xAyQ7S8ASFbrL2BiBUXl/cA==
X-Google-Smtp-Source: ABdhPJw2qAboWdH9n62YQqAACUMGCNBbJj9wAfkZ0ZfVXEnfnDod78K0LfB+QPJ6f6FNxXDRVrX7yw==
X-Received: by 2002:a05:6000:1249:: with SMTP id
 j9mr19487793wrx.307.1612196074682; 
 Mon, 01 Feb 2021 08:14:34 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id k131sm22226533wmb.37.2021.02.01.08.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 08:14:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: add missing max_register in regmap config
Date: Mon,  1 Feb 2021 16:14:29 +0000
Message-Id: <20210201161429.28060-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

For some reason setting max_register was missed from regmap_config.
Without this cat /sys/kernel/debug/regmap/sdw:0:217:2010:0:1/range
actually throws below Warning.

WARNING: CPU: 7 PID: 540 at drivers/base/regmap/regmap-debugfs.c:160
 regmap_debugfs_get_dump_start.part.10+0x1e0/0x220
...
Call trace:
 regmap_debugfs_get_dump_start.part.10+0x1e0/0x220
 regmap_reg_ranges_read_file+0xc0/0x2e0
 full_proxy_read+0x64/0x98
 vfs_read+0xa8/0x1e0
 ksys_read+0x6c/0x100
 __arm64_sys_read+0x1c/0x28
 el0_svc_common.constprop.3+0x6c/0x190
 do_el0_svc+0x24/0x90
 el0_svc+0x14/0x20
 el0_sync_handler+0x90/0xb8
 el0_sync+0x158/0x180
...

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 4530b74f5921..db87e07b11c9 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -640,6 +640,7 @@ static struct regmap_config wsa881x_regmap_config = {
 	.val_bits = 8,
 	.cache_type = REGCACHE_RBTREE,
 	.reg_defaults = wsa881x_defaults,
+	.max_register = WSA881X_SPKR_STATUS3,
 	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
 	.volatile_reg = wsa881x_volatile_register,
 	.readable_reg = wsa881x_readable_register,
-- 
2.21.0

