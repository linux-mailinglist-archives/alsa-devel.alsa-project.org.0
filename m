Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5C554F36
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519671F1E;
	Wed, 22 Jun 2022 17:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519671F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911715;
	bh=iLy66Lw0SMbdo9GPdFSGx1ltZOR8xWhO4QeV7gdGmCk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bo3kJyAq5YXx/SiRwzZrYj0QFmMNtXfB1v84vgi9jRO1y0tXIO38SzugQavpMPqmh
	 O8y35c4ES7C2DU/WkokqimAOs2p/xm47D11E4c3DWiarWXi3C/XA+poduy5ESU5Rd9
	 +E4ivkbkd2Mwyfvxve3cvebr+bg6hpAaInj9USrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D81F805BE;
	Wed, 22 Jun 2022 17:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A006F804D2; Mon, 20 Jun 2022 22:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0016BF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0016BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ltBWD1dr"
Received: by mail-wm1-x32e.google.com with SMTP id q15so6374680wmj.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6euAwHf+u1ItA2eK0so1Yr2FypSsHdAXRoV366E1T7A=;
 b=ltBWD1dr5RteubU05COvdKRAItNBE3XGRxsyg7vyiQ01v6gFjKkGQCa7AxlmlAlEzY
 AezfAXia6RuJ38Bg9CC3TjmJVkv+VhSCZoabV6MHfCWW/xklUdcZ/WY/1zIABVKL88nB
 WIUir0+yDu0HI5+CAA3jsSyTlvoO/BMKRYNcAGaUDoqrRUi7MUBaYNF+YGqEKRDqHCrk
 6NWMWphH7cTh+N4d7Wj2CRuYxpEAqY1ZRwT8qgOSayGNQKBdURajaEjI6DjrBNeapqlB
 yYOfUhgVlTPPPj0QyHa5BKMwDnq4P6Qhr+RaXEI/210OX3LUMTHtrnc7u7e9RyvHCH4H
 a21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6euAwHf+u1ItA2eK0so1Yr2FypSsHdAXRoV366E1T7A=;
 b=F8hY/Y7Aq1JNsJ70/49eG81VrtmCboB74vtnO479D3RNOG4pOiF+d5ks5lWKM0Du/Y
 Pun1I+KfxNu5aiwhzGHxXwY6nKkvF7T9b4OFEWpZ/iZDD4WhHN2Yi7idGuUY3/gnnUqx
 4RNakap4+qgEMMdeGwrWXuDEvp9bZjrGLbdJS1omKtL/Qqc/1pulQ7L6vud9FRfB4oNw
 7zoJpFtx5Y5Wx5A4Fm92EXTirRHRVxRq5215+C1SBfs2yy5PPu6HdgTQDriRDnESS3CD
 ZMsS1yaEkZhLsyRLNwk/zlPsNlWpHaItzdNYzUlRFRGoE7qL2zCS+NBcM4jz60ynTqoY
 uXbw==
X-Gm-Message-State: AJIora92ZgyDmds7tGNq6dFPEY6uP7+SWd0BVr74zyUqD/86McQXV9Ks
 mDhc9QHQcUOGYhTNKJPYOpE=
X-Google-Smtp-Source: AGRyM1vvGym6dIu1dzL5D9w5ByCyaMzKJVi5dIkF/tCPnAULV9l/JONes8lGy1VG4OGs+OyJ5i+Pgg==
X-Received: by 2002:a7b:c012:0:b0:39c:529a:7590 with SMTP id
 c18-20020a7bc012000000b0039c529a7590mr26485917wmb.6.1655755601453; 
 Mon, 20 Jun 2022 13:06:41 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b003973c54bd69sm19423794wme.1.2022.06.20.13.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:41 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 17/49] regmap-irq: Add broken_mask_unmask flag
Date: Mon, 20 Jun 2022 21:06:12 +0100
Message-Id: <20220620200644.1961936-18-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

This flag is necessary to prepare for fixing the behavior of unmask
registers. Existing chips that set mask_base and unmask_base must
set broken_mask_unmask=1 to declare that they expect the mask bits
will be inverted in both registers, contrary to the usual behavior
of mask registers.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 include/linux/regmap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index ee2567a0465c..21a70fd99493 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1523,6 +1523,7 @@ struct regmap_irq_chip {
 	bool clear_on_unmask:1;
 	bool not_fixed_stride:1;
 	bool status_invert:1;
+	bool broken_mask_unmask:1;
 
 	int num_regs;
 
-- 
2.35.1

