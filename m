Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D582E53B43D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 09:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FE01709;
	Thu,  2 Jun 2022 09:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FE01709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654154363;
	bh=dIsMcqt5tx4Y4cP5EDG4tcjReymdqeeiZi74XxSGc7A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MxH8TkbA9GfunPsrkCXX+lWKF893hHjA2ug+naL7axzaRj2/8uIjynclmagudUBZ5
	 Dy8Yz32vQZhR7LVKRMiVugYZzNsdxlhKRiX1ZDndivx8f5CvJO22bMRPGuxhgin5UO
	 h4d94UHIZ1cm4ghameBvhP5NfeTpjpbFumkaaMt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8645F8025E;
	Thu,  2 Jun 2022 09:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BA38F80236; Thu,  2 Jun 2022 09:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3904F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 09:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3904F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pa6M1iUS"
Received: by mail-pj1-x1031.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso4768347pjb.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8Jzvn4KoI6zyaEC1swBdZnPsmFAJHlige3FcDhZ5Gc=;
 b=Pa6M1iUSEgtHJ+P+TN+zX25lnv33UQYDykQS3F4wk/IJGJiTEko4StIiyBUDfX6R9h
 0HQ59fKfvhydM/hJNnbaDRhY0ixmiF5JhHncDLI+ULMSAdzx/p8ABC1ljPS3Pg1z6ozq
 LhVo9hfZpmU7ELx+hRRzC1s7vs+mahvAJ+bQP06on8d9T94WFtW2CQLqBNA5seEasxPo
 YcT2U36KTqMtQzlZYzLh4/dYrXGMap+jYzbIfeed8TC6+MG7zpEsfxq6RE6T1UR9vhjR
 pyQHjiGHMgbfnTajE1Ae4ztnJyZUj9w3wwNk2X2fH1jfA6GV0NlnGKXluRkLluyDUo+P
 o1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8Jzvn4KoI6zyaEC1swBdZnPsmFAJHlige3FcDhZ5Gc=;
 b=Sk/lloS51R2K/c1do4QYVjsX/ii0ERDkhYYDatD5eJTgEcgWomhVAL2hOBxbSKFG0K
 yZOMY1Rt+zqR5r+PXw+sBa8t6rWdlRuVCZVlpZr2/205/a1HSvXjfbaDI2WtSXB+qyOq
 Dy4Sh4HHlASVaL3ZpugkdvpOP9VrT3ILxTYsQ5y4usfNK+l6njm/1rAC3Ed/bHUUkhBm
 VzZafqoHw4LxpKOHAblqCVBGxYxBGJy5cAsRlsGdQus2hTqohQFqGnPWWPPlR25JHHWF
 EV2fM8rbBdwgwmazpDobLU5PCo4Pm982NbxB8mRDIhWqV11U4p6rXky4KQeUxKO5AFb4
 OIGA==
X-Gm-Message-State: AOAM533AYkM3qI7RQcN7J19UYPT0D0cCf+m09zMT4ATxBeB1v75FN7hu
 0WWLc7Y+XmYFyrXhFDPCKRnLSwsSTY8=
X-Google-Smtp-Source: ABdhPJwCF9zgTxD8Jpl1zz1KmAQnvxwxZhmFVGBpKn7FmZfjlKFdV7MDWp00dul1ao9oGPCp7+0XJQ==
X-Received: by 2002:a17:902:c952:b0:162:14b6:3179 with SMTP id
 i18-20020a170902c95200b0016214b63179mr3390242pla.7.1654154293331; 
 Thu, 02 Jun 2022 00:18:13 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a1709027e0500b0016353696f46sm2741624plm.269.2022.06.02.00.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:18:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: mediatek: remove unnecessary check of
 clk_disable_unprepare
Date: Thu,  2 Jun 2022 07:18:09 +0000
Message-Id: <20220602071809.278134-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Because clk_disable_unprepare already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 31494930433f..dcaeeeb8aac7 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -286,10 +286,8 @@ static int mt8173_afe_dais_set_clks(struct mtk_base_afe *afe,
 static void mt8173_afe_dais_disable_clks(struct mtk_base_afe *afe,
 					 struct clk *m_ck, struct clk *b_ck)
 {
-	if (m_ck)
-		clk_disable_unprepare(m_ck);
-	if (b_ck)
-		clk_disable_unprepare(b_ck);
+	clk_disable_unprepare(m_ck);
+	clk_disable_unprepare(b_ck);
 }
 
 static int mt8173_afe_i2s_startup(struct snd_pcm_substream *substream,
-- 
2.25.1


