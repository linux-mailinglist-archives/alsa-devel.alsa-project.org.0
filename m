Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D979C7EC
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 05:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89251166D;
	Mon, 26 Aug 2019 05:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89251166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566790126;
	bh=ngPyV+9xN9JwLir0fwIfjRuJhhOsBnFrYgwkx/xTyQs=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TzVSs7CXJ/Pltj7QIUXQgc4NHn8+e+tT+DOz6EA4qHxv0RpN66TvkYGoPACBGIVv8
	 17UVB5y6KCfQxNZ/EE1qZeFrB5pkrXnkIUdvOiGkZUiB07YlmR0WNcnBofK/KKG+Hw
	 9rUmadF7wEC7Hj/uwRAozDgtI+GeLbiMnCN3EOs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C55BF80377;
	Mon, 26 Aug 2019 05:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27342F80362; Mon, 26 Aug 2019 05:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A52E8F80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 05:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A52E8F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="aREEtG+w"
Received: by mail-qt1-x84a.google.com with SMTP id 91so16376904qtf.13
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=4xlfEBFQAicTeF+gqSwRBognrnXWO9iYsPJHBxYVgNM=;
 b=aREEtG+waJkh77tS7e7MeQrHHoKKIYRXRquogkfDk6jDs64nc68TUWPug7UU2W/5wC
 T+kYWDtNnQjH5QyjA/D11WIVWMIk+Vn6dq43TKh++136VKhUC3nnXCsODL0nDoO60t05
 n0seygXS4KNEW304T4rMxHBGXEXY5qUL+KgSYlq5wuLqBS9DATs2TZ+YRpY9OkXAVLpN
 vS+FiC3rFkbYfLv4ZNXIYWbS2wo31EdYQfeoiNKd1TU4zMI7cdQ6ay9POasS8UaoTBAj
 h6ajHeX/kSfEvZJlugZXLi5Bpi+0yFA0EQakrRHrWJDmtAbcqRhWfFtdX29x3CojrwcJ
 eoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=4xlfEBFQAicTeF+gqSwRBognrnXWO9iYsPJHBxYVgNM=;
 b=U2OLKZ+6ain71RHmN4RBR9v4pGxtHS+UQ7Q0FsxRq+mRt7GRNH5yX4aszutUga1w0q
 TlDRgz/vsWrbTscksw7qntRoVlGcdiLXlwsMZnK35FkVZcBHKWRDsV12Q3LOpyfp5bUj
 5+B1gqSQdUI5gkshDhrfzkbh6uVdaabiUFtEAjJTBUX2KH/0+mDUtAGyRFoTOW1+dk6/
 SR+czHIJKr7IbW4ZDz5n0Gq8SuvID7+ETgEBcRF0xd0cZ0hOO1RLuUerqFrTLTsk3DxO
 1zS+AzEUjKqhnI+ypFeIPA25zfHderExm1Gzzz7fP6xJfXQliVbk6bUW7UxVcct3QVcJ
 gYoA==
X-Gm-Message-State: APjAAAXB8j78yloR/aB+2kEKP/sdhRmLlcrH44klmHd/ZdCrpQHl/4WR
 P4aLhidmOGRGLMLTgwEvtTnceIauRt50
X-Google-Smtp-Source: APXvYqwM8zfomDwfqcpjR3i6Tp0T4cVNt85yUvuM6B6wc2w4sADh0dmSTm8vtn84uEFlq5FEdwc/1fIjcwLH
X-Received: by 2002:ac8:67cc:: with SMTP id r12mr14576368qtp.330.1566790011354; 
 Sun, 25 Aug 2019 20:26:51 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:26:42 +0800
Message-Id: <20190826032642.27324-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
Subject: [alsa-devel] [PATCH] ASoC: mediatek: mt8183: remove unused
	DAPM-related variables
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

Remove unused variable mt8183_mt6358_ts3a227_max98357_dapm_widgets and
mt8183_mt6358_ts3a227_max98357_dapm_routes.  They are accidentially
included when rebasing commits.

Fixes: 6191cbde5ff0 ("ASoC: mediatek: mt8183: switch tdm pins gpio function when playback on or off")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c   | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index fe8a7461ace5..951706fa75fc 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -46,16 +46,6 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static const struct snd_soc_dapm_widget
-mt8183_mt6358_ts3a227_max98357_dapm_widgets[] = {
-	SND_SOC_DAPM_OUTPUT("IT6505_8CH"),
-};
-
-static const struct snd_soc_dapm_route
-mt8183_mt6358_ts3a227_max98357_dapm_routes[] = {
-	{"IT6505_8CH", NULL, "TDM"},
-};
-
 enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
 	PIN_TDM_OUT_ON,
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
