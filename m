Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77B28311B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 09:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CCA1826;
	Mon,  5 Oct 2020 09:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CCA1826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601884189;
	bh=98EEz077o6IrvIISa3mto8WxdwUxJh29EhnlgvmSjlE=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YGHEUnw7KtquqoVzDzF3hQ5cvCG8nF6Po4nZyNZfFynd2Ze66C+Eg8NRHiILWwgwT
	 tu7xKqTuWYK2zEWGG3Z7L9hmAs281f/JGzE6GF3HN4uh166ZYHg3xMdh2yFxqEiGHL
	 4Dp/DqP6TyQsevVu95mZZChPChLMKN9EUZMWdyLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A962F800EF;
	Mon,  5 Oct 2020 09:48:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4F2F8025A; Mon,  5 Oct 2020 09:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C521FF800EF
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 09:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C521FF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Hef9ryUh"
Received: by mail-yb1-xb49.google.com with SMTP id u64so8939310ybb.8
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=BPjNNLAlclzxHOAP3qwy/4C6CsIqMprUpweA8cMNKeg=;
 b=Hef9ryUhR339ZxwJr98n7ByRFKnhORLDsPpkvIdq/RvoiOLywPPJGgQpLZ72k8ed5g
 DsTkyMelKo0w0v6jb1gIPI2YwaIqylZ/8iYvU3ip7CoA8kOWoA/3s8//iJ90fp8iOos2
 4DTwQzWdJdco3F2e6OQiK1ZXQb3eErQCPwyEnRRzOOA4KnSQgCriLybzwNtjZ7tOa2Lf
 abyrS3akGH60EvY7HM6ydWr40+giEvWfl2dYMHbcHKF2E7vQDtc+27UIvdTieiW54xvY
 j3jDsXMO/4Hb3vpgAkJJXlH7FUxqLffQMDd9Hn0Zd2eETAQ+Il2DXSLZXtDhY9+swlDa
 OjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=BPjNNLAlclzxHOAP3qwy/4C6CsIqMprUpweA8cMNKeg=;
 b=XZb5stTfi02XT5vl7Hckk8iEMbhfQCCkCnmUjw0jPqy6kU3FiA9n2lg8Y1qhErMvAA
 3oQBsjAAU3yn6wEVjmfMf/6DPEWhhQXYcbH2wGvMaT1vSafnbijU9b8xSEv00vq/lNFF
 JxX1qFbYvn/SBxYts0nki3A0yRof5uT+ICK1oc/oHNL7n4qDP3M6zfnWa8mtT/Dw+Yh+
 Z9SU+ASbJdhhU8Z2kW4PVE9QVgK7IX07/FAyxtOWLGzTHulbeNX7ItrprZTdwzSsr46o
 CACdDS7vb4yInXayG7FdS/HV9QN8eCjkx+SACxgqvZ1IiSpu6HQL2sARBMU29yKMnx28
 5OXg==
X-Gm-Message-State: AOAM532Szo+1fMjPwLk7IbOqPiKSIq1ef9Eh7RpHpJ0xSVncptOj4P80
 9rQAgCn9kHk2zOjdytlhtTIdSNpt3ijK
X-Google-Smtp-Source: ABdhPJwDeZtfqlliyFFBJRJ9sgZGAyKXdt5anb7VptO6IOrTb0HI6z5N6iNFYMEFkdxjXHLZLXQm0dAi+x79
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:ac09:: with SMTP id
 w9mr18047338ybi.491.1601884079856; Mon, 05 Oct 2020 00:47:59 -0700 (PDT)
Date: Mon,  5 Oct 2020 15:47:48 +0800
Message-Id: <20201005074748.3394630-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: support jack detection for
 LINEOUT
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Supports jack detection for LINEOUT.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 15e48cde4921..4d69ea31bfe4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -549,7 +549,8 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 				    "Headset Jack",
 				    SND_JACK_HEADSET |
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+				    SND_JACK_LINEOUT,
 				    &priv->headset_jack,
 				    NULL, 0);
 	if (ret)
-- 
2.28.0.806.g8561365e88-goog

