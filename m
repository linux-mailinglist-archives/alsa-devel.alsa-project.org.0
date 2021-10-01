Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB441EC99
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 13:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D3316E7;
	Fri,  1 Oct 2021 13:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D3316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633089139;
	bh=LKig4MrPzfslwphRF1C+TQxSwRMj5tYu3qW2lxnVEJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JgoDDf+jtVX3NvFoQwk3vHkY6zqh3mZh7gLPoIkrH/VX0xC4JTByYH3Z0hAjifPgR
	 T0rBj+OSq+fMwYevaJOq7x+TNiAlDObHeYc8jqee/geHzR2qp6toGzKZPl4HQQ5nZU
	 Uc8rUjXuPgPLmVeUzJqVq9Sxuv32mnGmQ9L8gJtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E856FF80301;
	Fri,  1 Oct 2021 13:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F054F802C4; Fri,  1 Oct 2021 13:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 347CEF80227
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 13:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 347CEF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WTBuQ0rP"
Received: by mail-lf1-x133.google.com with SMTP id x27so37305579lfa.9
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tikr9EZMT945WPgYWh9Nfqx3BfJVYbeGQaW2V2Yhcjc=;
 b=WTBuQ0rPJV/Ok7LCI1PrJ5Kfqf/f8P4JU0bXCUh8b+0fVB+ECaS+PnN6ERStQR/Qgr
 o490bxUOqMG9zVsqcsc/uS0JK/q8anPUCMONRy0F26ul+BBL1nKAOd625zXLpttdoUDO
 /dK6/2+JWkofULHsShHZs0UfKsD4DW5IB2QkXkDv3xw9Or3qkd6Inu7jpaPug9zUyzqS
 LkvOOr4i00ugU+lwpwcaPqyAn8yJE5FU0cr4J+G67Z/5PEpTMh4MCJn5a6b0Wb6SP6Ga
 2Di5bptMVEkg90mEgQWXg9nDavmQ62EhKEmzfGrdfg8xH8BsFl5L3O019Qn1IWQg+dJn
 uLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tikr9EZMT945WPgYWh9Nfqx3BfJVYbeGQaW2V2Yhcjc=;
 b=7l7hauGiKR2EDJLg1R/+HFtqko1R6DeknQ8B8TsLxE2d3NKmMoz1YtJtvfwzdCQM2P
 FY6MpGx9sVaFWlAe/baBOjPwlxjc3RGkCzsD9ll083X7xcSeOE37lWJL4xMBZsu64v5w
 Dj2pAnpq4CYPPzbR9OQ6cMNHEIZpjbPy1/X18t89MrcllzbpqFv/3/44vXphXgQy1aZ7
 vIAb7CqZHyIWm2obXpYccBaN6Ez90MZEZdlcG/w4na7Bx0Jz362EaeexsjuiPedFYARc
 yGgRDmLz+zIswpSifPKOra71/EzccoDVUSDCqT6FMepHXFDWdY4riR9nPLqblIhJ6JpM
 6WOg==
X-Gm-Message-State: AOAM530Wq6GL6BZa9txd9XZeS57qzhaQP8XeKvNVrzQVh/Vwgad4W/9q
 i+8nK48Uc/qj8IQOfyziTc2bCHoKj80F2A==
X-Google-Smtp-Source: ABdhPJxJDmWHcrZik6HLvUlDJZz6hv3jM85md+Uns+Jp1F0snEfO/mWYcaJEPiAfhnFmZ3RcGB8RCw==
X-Received: by 2002:ac2:5c50:: with SMTP id s16mr5003776lfp.605.1633089035692; 
 Fri, 01 Oct 2021 04:50:35 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id j7sm346340lfh.23.2021.10.01.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 04:50:35 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>
Subject: [PATCH] ASoC: qcom: apq8096: Constify static snd_soc_ops
Date: Fri,  1 Oct 2021 13:50:30 +0200
Message-Id: <20211001115030.10402-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

The struct iapq8096_ops is only assigned to the ops field in the
snd_soc_dai_link struct which is a pointer to const struct snd_soc_ops.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/qcom/apq8096.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 1a69baefc5ce..c7b7d0864d1a 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -60,7 +60,7 @@ static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops apq8096_ops = {
+static const struct snd_soc_ops apq8096_ops = {
 	.hw_params = msm_snd_hw_params,
 };
 
-- 
2.33.0

