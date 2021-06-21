Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C33AEA4E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 15:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CCF16B3;
	Mon, 21 Jun 2021 15:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CCF16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624283237;
	bh=wOSfEPwSQ4z5JMiM/XHRehkYSJOjpij6KcWIayR8SvM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W6g96a1zCBHBhK6XFwdn6AflAQHUOGRG662XsgpCfFLbco7qYOYYqAGYXAYx15iF5
	 cE9KTu8zoEhz9NCv6Qs0A1dJEg1tKpETe/mDaysTy83TWEDvz3Jl41xeLFXdBrJS8I
	 xCPkc9Az1u+XkUnBkxVxVnUuyhTF2Aq08JRfEHaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF34F80245;
	Mon, 21 Jun 2021 15:45:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B7C1F80111; Mon, 21 Jun 2021 15:45:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FF1CF8016A
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 15:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF1CF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RWVK1iYz"
Received: by mail-wm1-x331.google.com with SMTP id
 j21-20020a05600c1c15b02901dde2accccbso3528wms.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8W5nhl+E1Jscrd29RdD//tmI8j2cQzzETvUZPc9CaL0=;
 b=RWVK1iYzzle9AEz+xodpd8RcSevaWoL296o9oBGwPtEOLzygAjgg2AtnDFl0yH/f91
 /SZWyENY/SSJv9yUAirokw3cJIF1kJQ0w5R9f9HU8wWGOomeVoZz5x5Yi548NkqYpuJA
 Ds2y26JuXlCxrMI/UJ5EfbkFDOiV8PZOw8NA63hAw9OQ/GyryE8XjPWp86utBZgQsBJj
 E1Za9IdK+OKfvtLVBbXPPtBjqW8+Bh1sQK9bUZ8IHwSrvKBUMRCl8lxoSah6AGS82+lD
 YQJM57WjNWUb5rki2tDJKnyydogA9+dSNeJ1chXMY1Bvzv0IFoMtwlZPVns7BZbbdPTp
 M8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8W5nhl+E1Jscrd29RdD//tmI8j2cQzzETvUZPc9CaL0=;
 b=FMPTn9JMD8vFGmrxpzjRqwtqJ2018mQoKQQwBGFE+8JvwY5hgYsEth+gOUcfKFhilc
 TBSge5J2UFOkFMtX3CSfPCnH2ukkLrh45i8hrl61H++VJgubXR3Nd/j0hZduybtMgFmZ
 5yZEYAzGv/zcOA1Y3wEDpfQwGtVyOwi8sS6XwCgIrWDGbY5gFBuf3ba080RE+bKQx0yT
 eLWNXkTbAphjCgj47AyPg/bh9d4BrDZAfD41cKdkE7ApSzAvYvzWOL86SucVjX+EEpG8
 Y4ChEcqQT8pkOqhBraDjPK8Tw8bkMwnJtH+798NMr6NIwCSDw9ueRZy6Go84SC6j3YAo
 4lNQ==
X-Gm-Message-State: AOAM531FtYkju7w+1PfseOySd5TVrtvxBrZtaSJ/gIv2PwOk1KX6g/gY
 1As9uAKFwTm/XO1agwCRMTZcGQ==
X-Google-Smtp-Source: ABdhPJywfntwqCOwSS9wjiSUCUjFC/d0VtmUvA0ChK9E9Ep7JTEfxh5L3ggLCOOTT89F61RxASAYfQ==
X-Received: by 2002:a1c:3dc2:: with SMTP id k185mr27324248wma.15.1624283123343; 
 Mon, 21 Jun 2021 06:45:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id e38sm12848741wmp.4.2021.06.21.06.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:45:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: codecs: wcd938x: fix unused variable warning
Date: Mon, 21 Jun 2021 14:45:01 +0100
Message-Id: <20210621134502.19537-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patch fixes below

	warning: unused variable wcd938x_dt_match

by placing device match table under CONFIG_OF

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 4be61122b0b5..427f51fade37 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3714,12 +3714,14 @@ static int wcd938x_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#if defined(CONFIG_OF)
 static const struct of_device_id wcd938x_dt_match[] = {
 	{ .compatible = "qcom,wcd9380-codec" },
 	{ .compatible = "qcom,wcd9385-codec" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, wcd938x_dt_match);
+#endif
 
 static struct platform_driver wcd938x_codec_driver = {
 	.probe = wcd938x_probe,
-- 
2.21.0

