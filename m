Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D162FC5E2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:35:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235BD18BF;
	Wed, 20 Jan 2021 01:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235BD18BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611102911;
	bh=ss+jizyG3B3bT8TGr0FyKLNCllM3n+oGtFOQHp2wRp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPKu7HpZBdg7wEEprN08545osCy866lagRTQgcSH57++Oy2IFBVT8MxNJfDQ4Mi++
	 8jaLZHb2b3s/yY+blrdPWdEy78z1godU+GUEyFL9my+xvAem5F7b/y7Bcdd0BDULML
	 1MsEouvkYrcNmm9onirBRuG2cTrBz83vCE2F3exU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C52A6F804E5;
	Wed, 20 Jan 2021 01:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 561A4F804E2; Wed, 20 Jan 2021 01:32:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B35F8027D
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B35F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J+dTeFs0"
Received: by mail-lj1-x22a.google.com with SMTP id f17so24007328ljg.12
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8rBTMV7FjiQ0b57vNb8pEJGf3JqjCIY3wyHC8onGf2E=;
 b=J+dTeFs0G/gPtQBXzLmy9VAY3WYWQYtCnJwxVvcso1iLW+bjH8KoHJzTdOqBplAy4x
 QN/kvogo4QEwGJHC1X6TF8wF6T+268CND1QL2CjYoERr0heDSsL0YLVZ+zEXtoWOnzBu
 VcBaXAlPw94yzYf79lktexjCiqDS82VAk4pw6UG+jwThaPKklMYZdIyh+oIBlM2tK7/y
 rVaPa4z4hfNp9bTUQCmgik6/CgSLeucvh3RcHR7sDwR2OfC9EEsLKIUvawTC56FBWiVz
 TPq59qF+z+R7pRaG1BCQdGLQ2iO9khXGCh2OloBsdGSaaFZAU1qK3H9CSjykd/rFYrfQ
 5aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rBTMV7FjiQ0b57vNb8pEJGf3JqjCIY3wyHC8onGf2E=;
 b=Yq2XK/0mopwuvP9MUQspY/ucIjAWT4BIKfXlknj41teAoqcBM37doDVSs1qp9763Zp
 W0I5KPe+zA9wHVySUJB21n8Y+KRHcQiZ9s2IM8NrVXZS9uFOZqdaZb47Xj3pilfETQNr
 WWL1IcjFCTPbiThGosa/Rz4AVTbhO9HPENZkVvuIHYl271AEzHib+dHnD+D2BtfRs3Kf
 6B86WLjVMfZob+M6iU3wGuTbwcHCl9orBPXlnFSmaf4DKgWcPDXHPueR93Z2PEcjBJRd
 VORcmt/MK37uNjXeB+pM2ZrCmL1GLGIb6x9fVeOn8hC+jDNDuXqz4FX1aIHLxG2EY91n
 +vzA==
X-Gm-Message-State: AOAM530EoAmG7loxMV9xNXAaWIxrCwoBrhvQ59s3nxw2OLU18DthW1S6
 p8WxsAnT8gpFaQz/55r2IDo=
X-Google-Smtp-Source: ABdhPJyYzq3WELdEjQx9P0zrMxgpxwEJcvLCdOapxWF0zilScuPvg7luG9e2xB8ENxkGhpqwlXDp2g==
X-Received: by 2002:a2e:bc28:: with SMTP id b40mr1742191ljf.167.1611102725701; 
 Tue, 19 Jan 2021 16:32:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:32:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Matt Merhar <mattmerhar@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 3/6] ALSA: hda/tegra: Remove unnecessary null-check from
 hda_tegra_runtime_resume()
Date: Wed, 20 Jan 2021 03:31:51 +0300
Message-Id: <20210120003154.26749-4-digetx@gmail.com>
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

The "chip" can't be NULL in hda_tegra_runtime_resume() because code would
crash otherwise. Let's remove the unnecessary check in order to clean up
code a tad.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Suggested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 04dcd4cdfd9e..6f2b743b9d75 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -178,7 +178,7 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
-	if (chip && chip->running) {
+	if (chip->running) {
 		hda_tegra_init(hda);
 		azx_init_chip(chip, 1);
 		/* disable controller wake up event*/
-- 
2.29.2

