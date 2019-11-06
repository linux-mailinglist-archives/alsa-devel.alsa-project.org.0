Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB441F0B8F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:18:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6B216E0;
	Wed,  6 Nov 2019 02:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6B216E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003107;
	bh=v+/XbxV3uaUZ+rGusO5mFUFyF42JP8krdBEkzqPKBYc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bF5QP8xEOhnFA/VnRY2k89nv3OK6mruBlnUHJiMgNR0plln9G1BN3THTQiqwreXPU
	 cLtsqu6rl/Js8zbNAduqinBehrnyZHr4gO8ZWgX8CVIfhRZXaQ6OLIDeDwzAqb0HJk
	 +GpZzpZoDFPUGFuGxjYGmPT01fvbObeDpMvQuvKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A01DF80671;
	Wed,  6 Nov 2019 02:14:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D36F8065C; Wed,  6 Nov 2019 02:14:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6914CF8063B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6914CF8063B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Lyd6efZP"
Received: by mail-pf1-x442.google.com with SMTP id q26so17490000pfn.11
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXeZhmC6ROZxV87rfu8UjKFhvHZI7+crZ2ychVJglQU=;
 b=Lyd6efZPr15mN35l1actq9SACY92IXPkvs3zdCy5GowHWJNsUIjC2LsnrVvEUmBMgp
 CjuIcw1MeCnG9P53ncgWkL+qCK93U9gXJKVQOfXQJoqr1HM4Qk51AyzOnoyJGY1Rqwqc
 r6B8Kr8VgbQTDMPRWYQw/MTHSukS1kDJs/wig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXeZhmC6ROZxV87rfu8UjKFhvHZI7+crZ2ychVJglQU=;
 b=O31xzwukit6SBzO9KuUzZMvllBbq3iU1Gwvm4hP+2ybCntYbABhTN0C0fnIbZtGi3I
 PHafcdJR0k7p3giTdEH6SfpoO7et37/A0grMaK+8VJ6yITGf5+PXvfv5ui0uouVQkQPc
 tqYeqjZQSMBH7PH/sHnbTdgIo7mKkBwKKRwogmb6NK4kKqN2mpq422vBb1T+lws+EzTU
 g4H4jvzh74Kk0q4mYbjmO4KIeTPU1qRZxZo3hRLCBs7RBt40rh9HtjgLPuPekO0YvxV9
 eQauLNwlwcOkkM2yKbCsmF8LLemGx8GxVKSOtoSSVTMae0iyDFqmaAt2ZNDJshtnFcWQ
 EpgA==
X-Gm-Message-State: APjAAAUjizxvzpphB5aqrMeI065Xip5TF4kGOukghEPRouzK6PProO21
 J2KE5+xPKcgFhZ9uVMIjb3Z9MKUbruKZ
X-Google-Smtp-Source: APXvYqz4AVuVo6fO7OFCFLkxzgc1bIYvP6ZqabTjbfbbZJcaj7QdtYvc6fngJ4kr+oW+7WhwLd5erA==
X-Received: by 2002:a63:9d03:: with SMTP id i3mr4441256pgd.300.1573002841243; 
 Tue, 05 Nov 2019 17:14:01 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id i71sm24112481pfe.103.2019.11.05.17.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:00 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:30 -0800
Message-Id: <20191106011335.223061-6-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 05/11] ASoC: rt5677: Mark reg
	RT5677_PWR_ANLG2 as volatile
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

The codec dies when RT5677_PWR_ANLG2(MX-64h) is set to 0xACE1
while it's streaming audio over SPI. The DSP firmware turns
on PLL2 (MX-64 bit 8) when SPI streaming starts.  However regmap
does not believe that register can change by itself. When
BST1 (bit 15) is turned on with regmap_update_bits(), it doesn't
read the register first before write, so PLL2 power bit is
cleared by accident.

Marking MX-64h as volatile in regmap solved the issue.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ea235f3874ca..e5db9dc60378 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -302,6 +302,7 @@ static bool rt5677_volatile_register(struct device *dev, unsigned int reg)
 	case RT5677_I2C_MASTER_CTRL7:
 	case RT5677_I2C_MASTER_CTRL8:
 	case RT5677_HAP_GENE_CTRL2:
+	case RT5677_PWR_ANLG2: /* Modified by DSP firmware */
 	case RT5677_PWR_DSP_ST:
 	case RT5677_PRIV_DATA:
 	case RT5677_ASRC_22:
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
