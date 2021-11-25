Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3645D7BD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 10:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1CD182B;
	Thu, 25 Nov 2021 10:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1CD182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637834072;
	bh=gOuDt6W0slJTV7dJTXbraLrUX4vGcsQEhXMOyWojq/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQu4ij4c/lMOfNkfCaYMJwrZ0xxdSwOiRQubZIQ9uGB1lmhEXp2oJj3aLqjSO31fT
	 pD6tkXTPvqUgDL8qH4dae1PwnKxEzO0s1nPVDQOfDVeavhNHNlbUfD97sgCsWpNRwz
	 HwQkwDXWJ/DjeW0SEZi+rhRUdYvPulRQ7zmIok0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75710F804E7;
	Thu, 25 Nov 2021 10:52:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F5EFF804B1; Thu, 25 Nov 2021 10:52:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D301AF80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 10:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D301AF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YBkfENrK"
Received: by mail-wm1-x32b.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso7812556wmr.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 01:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtPmrpYr9FiDpTXd3LZYhMSJMkf3FHjKgX90xdY/MZw=;
 b=YBkfENrKTMYdi9hDB53l+uFIF16Y5kzRKjai/iYLc2I96/s1EbbQpiPsiPJWdr2JJr
 cShpznljdZ9kxttFrsMDjUuD713GsmrHwU9YSvhNMmCaYFM/wQnWy68UvE86rUTuoOVN
 Z8hLDEFyFBWbw6TVcW1VlRI7vyBq0Bq2qggYJhOUmVVqMbRGTdenTBYJUxY0OGVtMF2h
 5UIgtg5ghYHiyimrBgRXLubqDbNmlFyC8MRfW5UjVTHd+ybLH1OU5D7FrFa6SwVkZN9f
 eI/3Rr93o30kjnYZTBmSq9tAIRXaKdBCHeFDn6mAW9JzOr8IukAGy5rHY4Dc/q0F/Mgy
 1KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtPmrpYr9FiDpTXd3LZYhMSJMkf3FHjKgX90xdY/MZw=;
 b=TsfqqlGw0PJrdU/x9UlRmxqflA9vNY4i3fVwwarocuyqs/ZQYMJi/bnIdG8lCe1C+9
 jxiGcHVpKx2GS6XFy4iyrN74o3rgSz+DHYPRtG0ueuZPQ3d11m9CPy8CCr96YN/762Cq
 UOTHbQQM1nGlwdkPZpHQ03x/XdV48genR9nNQ4xPpRtbsyUAoDSvxwgzIKL5hmFqOZ5V
 KsbaXSr/KF8ETllyR9jveq+1Jqrjn7uaqnYQEefVriSWKs5dtVzApvEkEqoLvv1i7Cs3
 EG38l/Y4dBADBht0k/lukYfxE9aDQXNX2IqvWCMaXWWPZ0xEUkF/yzRxBFk+GZknHziT
 VAeg==
X-Gm-Message-State: AOAM532xYnn2ilo6k9T9ydYUpRsQCnwg3Wt6EmN1aTkfi9q6lNHETNUK
 9y/wNlHh8LJk6+YlZ00ZXZI=
X-Google-Smtp-Source: ABdhPJzNEFk8SIxr8fH/3pyKqDj4fbQ2NQd6f198nSEoiAOLdUwr6rkVWXEhhfB4xZQ0YHzNSfucFQ==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr5608253wmi.46.1637833945112; 
 Thu, 25 Nov 2021 01:52:25 -0800 (PST)
Received: from localhost.elektrobit.com (eth1-fw1-nbg6.eb.noris.de.
 [213.95.148.172])
 by smtp.gmail.com with ESMTPSA id c1sm2310853wrt.14.2021.11.25.01.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 01:52:24 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ASoC: codecs: wcd938x: add SND_SOC_WCD938_SDW to codec
 list instead
Date: Thu, 25 Nov 2021 10:51:58 +0100
Message-Id: <20211125095158.8394-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
References: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
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

Commit 045442228868 ("ASoC: codecs: wcd938x: add audio routing and
Kconfig") adds SND_SOC_WCD937X, which does not exist, and
SND_SOC_WCD938X, which seems not really to be the intended config to be
selected, but only a supporting config symbol to the actual config
SND_SOC_WCD938X_SDW for the codec.

Add SND_SOC_WCD938_SDW to the list instead of SND_SOC_WCD93{7,8}X.

The issue was identified with ./scripts/checkkconfigsymbols.py.

Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 sound/soc/codecs/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3fe62df32238..b6d1827e7986 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -241,8 +241,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
-	imply SND_SOC_WCD937X
-	imply SND_SOC_WCD938X
+	imply SND_SOC_WCD938X_SDW
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
 	imply SND_SOC_WL1273
-- 
2.26.2

