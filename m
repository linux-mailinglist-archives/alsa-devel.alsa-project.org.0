Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B676115029E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 09:31:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5375516A2;
	Mon,  3 Feb 2020 09:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5375516A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580718661;
	bh=Qy9FsU5ewVOVzxfc/uQz4ZDmmpZ4OSrsiw2HQWfHkx4=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hC0iWUvGpyHVzZhQUljoN51yxZE3dGcTs9l9jX5djkExM0rZaMEoI8cCBJcq9EqtI
	 DgNpqN8yQe/WRvL2BgCDRHkLGzLUZagxKrfklzdQG3fHmKy9q0ROsaO0UKHTlHj+Z0
	 75QH81TWjLkg+fqiOWLMOlkUoUEBl1TyfWYcSfoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 331F9F80278;
	Mon,  3 Feb 2020 09:27:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C2CF80279; Mon,  3 Feb 2020 09:27:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D135CF80273
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 09:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D135CF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ww9WsRe0"
Received: by mail-vs1-xe4a.google.com with SMTP id s23so1270497vsl.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0K1UnRjQODC0nNijTaG1o4tf21ySpZfP140PiAiGiBA=;
 b=Ww9WsRe0v6oeYy4U9K+OWzzDOZpmpjfnqqIHug84Hw/xdMrOgGYzJMwViYREzKANVh
 gcvRJQkPjfqooz/oIhEKF2u+OL7sEzlrC+LcT8w5cCeSGrrUYeaVizJwDjhXyRSoWfo4
 PU8USp7/i9zcj5blvz3Q8493d748RC7vLVjdSoOoce+UPauxSEbS7kn/tiKaoudNheao
 rKN029MY4tQMWSFWxDZ6Q/teo1O+ppfvr3jcaSuIHtxUsaqKt7P5M39NJNsQJjZHrLsZ
 3bjXv1CPffsIEQSmnYo5DXTA9ey0zz3RvrD3YTUhEAHw5cbWg+IIsS1M43jD9Tvgwbxa
 +ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0K1UnRjQODC0nNijTaG1o4tf21ySpZfP140PiAiGiBA=;
 b=tRF29ct1knYKV9a0/HKBzoMMVGHkdtm+lg3F6n7gi+B96hJV3UvUoZiAPqa6PM6o0L
 7ip+tlkKL0M9oZvtyMYD/HWlqkzJt/qieKrPxOzRHpl4D8hHsqwJA6o5u7nSfIk2OiiA
 1XO49SruKXLBCW8bwdsESoaHyCsCBGZiDfDoNoUoX42zEr8eQjVwLvz+WKkOrO1pghUS
 tg8JJm4rQg4cVAmfO0WqQ8tl0BjHhlAUmxTHAJhbFX55hqcBMYic5lmm1m+kL3mCweXm
 AQAH212JGFblik5mYgU0u+pW2f5hUi4X3V0ILJsWW8euOAuByjKCriKWzmBkJJD2xskQ
 ccqw==
X-Gm-Message-State: APjAAAUb67l+3dkCJ6tm+McAL8l4Denpebn/GpVGsMatJJQSyA3jOVdA
 k6LOagwu4s2i+Tr2d5EvvFIC1JGrBxqb
X-Google-Smtp-Source: APXvYqyW6Ill+9/DDHwoTusyeTQLTCQYbQpaPUD9wUms3qnST+9r3Cm81IQdWqLCgAVou+GoVUMQHrqm2zfR
X-Received: by 2002:a67:fc96:: with SMTP id x22mr13925669vsp.33.1580718464515; 
 Mon, 03 Feb 2020 00:27:44 -0800 (PST)
Date: Mon,  3 Feb 2020 16:27:17 +0800
In-Reply-To: <20200203082718.59614-1-tzungbi@google.com>
Message-Id: <20200203151250.3.I30f0b8c87d5ec2a0e5f1b0fabf0a8ccef374f5ea@changeid>
Mime-Version: 1.0
References: <20200203082718.59614-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 3/4] ASoC: mediatek: mt8183-da7219: support TDM
 out and 8ch I2S out
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

Supports TDM out and 8ch I2S out.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 450fb1efa239..7052210e8325 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -450,6 +450,9 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 	{
 		.name = "TDM",
 		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			   SND_SOC_DAIFMT_IB_IF |
+			   SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
