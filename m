Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D2551FC4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D4618A7;
	Mon, 20 Jun 2022 17:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D4618A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737711;
	bh=pI4UBinB39INTVyE7x8PXU0bGWSK9OTM7FkVvtmcuzw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cp6n9gXSIUwNsVl/N4a8NhC8XrbEJTL8pNsrj94ni5s/Dw5AymIHSLuojjBCCvetC
	 vLxgQNx097WJyeazbeErHARS8WFDyyiUzLYjaFEwyLPdM0TCOQk5K3edaA/cg4bN7P
	 pTdMWtxBwv5pfK17F+c+UdjhUUij6loEpaCgE63E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C19F800FB;
	Mon, 20 Jun 2022 17:06:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90B49F80527; Fri, 17 Jun 2022 13:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4258EF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 13:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4258EF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WEXQJ2c0"
Received: by mail-pj1-x1030.google.com with SMTP id
 h34-20020a17090a29a500b001eb01527d9eso3008267pjd.3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQLjYSyO5bnT1k2cMo+qtFEL9roIKTpXUxzFJ5E7YeU=;
 b=WEXQJ2c0zXPPo70AqX4ePE2lo2jfTA7rpG+C5RBXENB1K0P1BBjGTUBKWrVNIRgYMx
 HldHvQtAl/hTE2t7F2GKPeB/yiddMus1F8uOtTiwN9+rR9c0CSzHVt8S5NTgrhhhnsSe
 xRiJJZNKdeC7o73Bc1I3uTPEccX3CTIDbP26E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQLjYSyO5bnT1k2cMo+qtFEL9roIKTpXUxzFJ5E7YeU=;
 b=hIJZeS2lE2moACNefTNQkQ0OtZi4eOMRkxaPs4XXh7CrUO8MqBgmLBCCSmgdhTeX+g
 mfBWOgdsfZtHSJi+sKqprYTAh1AoL+aXgMeiJ5NCgLqkBOlHcXliWP8WEtmeOHQjYwJ3
 KlSnl/9lLMMSrldjLKRylPv7jj1LGAdfeYDAykYSwpDvEgxxKsvK6XpaxXj9ffb8Fjc1
 fH7hEtFw3nUUgXGVGc/XaiX8RhZR8fsOvMAYGjcruMNXBn0V4DVlkRmPmII8OKlYGuaX
 uTGdg4utUxKuAw4DoM315tCjPJWRh94qYwpriREhlvspCVmU2hQiknhcTKV9vDFsWa3Q
 EUzg==
X-Gm-Message-State: AJIora9zNAwmPWvuFgznBJAKX+iMjuY/lW0XRz9k1DBUXs+PN1kTSrqF
 Ae1PoWPKa6G5HrJTfhHmsHnsFw==
X-Google-Smtp-Source: AGRyM1tf2bQGeUv5328p9BV+crG8b7G31H6qrJWwNOzsEDjIHBFrwQCM7E2x9VN5sMfX6/KCSapUnw==
X-Received: by 2002:a17:903:32c4:b0:167:6e6f:204b with SMTP id
 i4-20020a17090332c400b001676e6f204bmr9221820plr.117.1655464315709; 
 Fri, 17 Jun 2022 04:11:55 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:e616:b34a:9b5b:24ef])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170902c20900b00163f7935772sm3296754pll.46.2022.06.17.04.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 04:11:55 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v2] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO
 request
Date: Fri, 17 Jun 2022 19:10:04 +0800
Message-Id: <20220617111003.2014395-1-fshao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fei Shao <fshao@chromium.org>
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

The lockdep mechanism revealed an unbalanced unlocking on MT8186:

  [    2.993966] WARNING: bad unlock balance detected!
  [    2.993978] -------------------------------------
  [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
  [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
  [    2.994012] but there are no more locks to release!

The cause is that the mutex will be double unlocked if dai is unknown
during GPIO selection, and this patch fixes it.

Fixes: cfa9a966f12a ("ASoC: mediatek: mt8186: support gpio control in platform driver")

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Trimmed the commit message

 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 255ffba637d3..274c0c8ec2f2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -230,7 +230,6 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		sel = enable ? MT8186_AFE_GPIO_PCM_ON : MT8186_AFE_GPIO_PCM_OFF;
 		break;
 	default:
-		mutex_unlock(&gpio_request_mutex);
 		dev_err(dev, "%s(), invalid dai %d\n", __func__, dai);
 		goto unlock;
 	}
-- 
2.36.1.476.g0c4daa206d-goog

