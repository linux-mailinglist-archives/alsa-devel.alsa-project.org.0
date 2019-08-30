Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B0A316D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 09:45:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAE3515F9;
	Fri, 30 Aug 2019 09:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAE3515F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567151124;
	bh=IBldaDh/ruxrlL49ZkRDP5DAH0dru6sRXkASBVo2QQg=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kGAVjraE1/BYngfAqPvZdmnD1p5CrSMZ1gCS7FKPZmAOoci6DA+0a2JFqo3I0rJ7W
	 I0PsZQ4/qJ2aWKOLiw58+Ywz7l2kw3MXiCbP1DEiKVvUqddR+H+syKnGyX9rTUEAy1
	 ilUS5EJIzx85vB+JUa0HDwBGMAuLP5NA+pfGPpKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B5C2F80444;
	Fri, 30 Aug 2019 09:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52260F80444; Fri, 30 Aug 2019 09:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD31AF80376
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 09:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD31AF80376
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QagXLyie"
Received: by mail-yw1-xc49.google.com with SMTP id a12so4513446ywm.10
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sdpo8UCYK/o3EiQB7yiJhWSi+mMUBEUueW2VdVsa4oY=;
 b=QagXLyiezDzIoHiRHvlDtzWyaF2tX/b8EVOOlv9Rh0V8NxjwjEdpHIiQbkRVoFOF4q
 emg039k5YoI9sc7N3zlIq1EOqmTTTt78iOdceRIM4ed25mToIGilgpjI5qt58rAHSX6s
 vZ8NQasNplcF1f4dtHeghwfsAEg1xRVn9dKeIrY+P9ryJnSfCVj/iXridrCsZsB2tE9P
 T2BkbKhRapL8qXq0tfriN9MQ28szTYeEaxv2mmSffTvdr0CqbvQreB0wx/lvYQNKVA4g
 Wyk70daXuAoOc4O0urEx7IVDL6LYvZMIZ90To5SpLaUzGCXdVFWAScGrG35AcgZP0iuI
 Asjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sdpo8UCYK/o3EiQB7yiJhWSi+mMUBEUueW2VdVsa4oY=;
 b=uew3fZe5LOIuYbyKW2wU1qLBM2Ng/cBrKlV/Z/Thb4umDmfWCjfjqfFnNzbRt6CxXx
 wroTwGiYqUuiuJEtJoF1wWNx4iMYbqIGyJfVlbN5GY7/t77RYmwq2WKEqkTH5hTsI+Sm
 /v/MvUXdaFKUbTv6dCvCSNLYG39rSdbmQNFAcJcM27UcDLbzLDKVA5wRLCCIxVv7VXg1
 f8xUZMVWC8l+sAu1k4iEI35OQ323F2Z2yY9vek8auj+9ko9JetNuviwbJhUSZqrMwkBJ
 aBC3BlJP2NNE8+O6ay3Fj1/IOmSqhBVuvTTl+FAg8meWnFc9fN6UfnW1/3k8QW5Vfnee
 eCLA==
X-Gm-Message-State: APjAAAWZpYFNgVduPbavzNI8hEquSaAsD6L3F7Oyhcl3nMHhn7PyuMWv
 FoeOBNXN/d5eyF60NSP/LeEjhF/09uD1
X-Google-Smtp-Source: APXvYqzqdT3ZvV606lM/PmRFiW/rjxQD0upWZWL09z7bUl9MATrk4p5+5CfguA96YXMx5R19VEDy4p327TSd
X-Received: by 2002:a25:240e:: with SMTP id k14mr10060288ybk.178.1567150971326; 
 Fri, 30 Aug 2019 00:42:51 -0700 (PDT)
Date: Fri, 30 Aug 2019 15:42:37 +0800
In-Reply-To: <20190830074240.195166-1-tzungbi@google.com>
Message-Id: <20190830074240.195166-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20190830074240.195166-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/4] ASoC: mediatek: mt8183: move private
	structure
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

Move private structure to the beginning of file to declare earlier
so that most functions can see it.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 560fcc5923a4..1d4a1600f768 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -17,6 +17,22 @@
 
 static struct snd_soc_jack headset_jack;
 
+enum PINCTRL_PIN_STATE {
+	PIN_STATE_DEFAULT = 0,
+	PIN_TDM_OUT_ON,
+	PIN_TDM_OUT_OFF,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
+	"default", "aud_tdm_out_on", "aud_tdm_out_off",
+};
+
+struct mt8183_mt6358_ts3a227_max98357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -46,22 +62,6 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-enum PINCTRL_PIN_STATE {
-	PIN_STATE_DEFAULT = 0,
-	PIN_TDM_OUT_ON,
-	PIN_TDM_OUT_OFF,
-	PIN_STATE_MAX
-};
-
-static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
-	"default", "aud_tdm_out_on", "aud_tdm_out_off",
-};
-
-struct mt8183_mt6358_ts3a227_max98357_priv {
-	struct pinctrl *pinctrl;
-	struct pinctrl_state *pin_states[PIN_STATE_MAX];
-};
-
 static int
 mt8183_mt6358_ts3a227_max98357_bt_sco_startup(
 	struct snd_pcm_substream *substream)
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
