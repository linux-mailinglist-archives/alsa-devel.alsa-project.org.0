Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB3329E51B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600FA167E;
	Thu, 29 Oct 2020 08:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600FA167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603957947;
	bh=/yptHEfgAHDBUpNeJkQCtilbV87nzjR1vMI4H3rK6/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJfJFogw3jR4ZCqhmizGsGovV+5/WmsqJoSQiethsrhXMsRJUR/QdTDeO0k07qFEd
	 FxJmYLcTvSTVvOxn1GKy+SfTYFVtxsOtWK267ZLhUAw/sWzhRVD94IyHDCBql8KF8F
	 E85Ck55Gk13TB4jLvw24eV4HoB616FfCsyn0YzV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F8BEF804CA;
	Thu, 29 Oct 2020 08:50:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 074ABF800FF; Thu, 29 Oct 2020 08:43:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D932F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D932F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TW8C3K8Z"
Received: by mail-pf1-x443.google.com with SMTP id j18so1665035pfa.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bmwHyHUIe/uWSPHK3YvMcr+QNlICBVXmu7Dmq71Pi0M=;
 b=TW8C3K8ZXzrnZ/kDBmjrdImT1Eh0azgxxqO8H4AGCR1kRROB0CStWcbr6WtfqSABhy
 kXCczW2+hlMauiG/YErbKtsw2wdcj5jzplWFyl7Xpe90BQ7TPzpYJJm11fAEGCBVgQvh
 RYegV/nuBaTdc55uXOQJETTYXuWFacSw6LZhiek/ePJ881lATgHSeSob9TowpLuX/OPq
 U7gVEy/pznph5meEOt8okdP06Oe6K03C1LI8VkSWDJ8kP2hJ9a4AH/M9sSmNV2XvFMga
 2N2PW80BUq2R3aXQi2z6ZKzxxUTMzexnuru3+jnEVGgT+x4ZzwclB5Vv5765mfWOkhXp
 0X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmwHyHUIe/uWSPHK3YvMcr+QNlICBVXmu7Dmq71Pi0M=;
 b=tHQfD87Ad/1jdnMxL5eyy3GPqIE0gxduulJ3oWViPqnfPQG5hDoY6PYwtLALvOzVdM
 +x4k9bQrjVgMticLJDDRbh+qE/DMv6yB61pr4vcot/6Dc5ww+WcGx9NBzQgKJ7xIXVTL
 8qvrXBpc1xj6UfYGDQXbaWmDYd83GUiD6iXH9wzHUyKbNhcFdCs1J78ntgFTmwKZ87E/
 9cnNiDH5ncak224TQcX/JP8R8pqkmiURRv3IVM94fRir12XfB7QvOqHhrmctqtrAp9ro
 gHiPRaBTezQxitll8WjSexrYvrpI5hmcsDBeIi0N2m8EYbUuFTG03Y5FcQW5cpkpfTmw
 Id/w==
X-Gm-Message-State: AOAM531bpB/F40YX253JKFGeijlhE6lX7Lxji61UTVpIvNRQUItBsnN3
 FJPfhfU98Z2mkavJYVlDR5o=
X-Google-Smtp-Source: ABdhPJy0skDQDIihaScK9yxAZVkcjC9QRMMPRrKoqNU1oPRXmYHp15+NFjKFrr9TjeWjwlnY8B2wVQ==
X-Received: by 2002:a62:8f4d:0:b029:163:d24d:e0ae with SMTP id
 n74-20020a628f4d0000b0290163d24de0aemr2904319pfd.49.1603957423589; 
 Thu, 29 Oct 2020 00:43:43 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id z10sm1837779pff.218.2020.10.29.00.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:43 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 04/25] ASoC: rockchip: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:40 +0800
Message-Id: <20201029074301.226644-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/rockchip/rockchip_pdm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 5adb293d0435..f3c19310aeeb 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -574,7 +574,6 @@ static int rockchip_pdm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rockchip_pdm_suspend(struct device *dev)
 {
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
@@ -601,7 +600,6 @@ static int rockchip_pdm_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops rockchip_pdm_pm_ops = {
 	SET_RUNTIME_PM_OPS(rockchip_pdm_runtime_suspend,
-- 
2.28.0

