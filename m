Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D993201FC
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82BE1670;
	Sat, 20 Feb 2021 00:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82BE1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613778853;
	bh=/r1rJVqB8/LN1nHheftFxJIosf4eljuH9LZ8BHYzd0I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kb3SLx9OZdn/WB2aNieepqRx5w+Nk0QX4212kMGb1jhHEDaXWI2A5e2xsLSB+D8zt
	 hoz3SefmS8N/sMYm4lYlwlEgqF0EzPhF4T836QWcI3nyu3uO8o+A4asO0PV7i0WqGP
	 UVgdNx28icXejPLahEIY250SIvqtKL24KvGnXuP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15789F80258;
	Sat, 20 Feb 2021 00:52:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB73F8020B; Sat, 20 Feb 2021 00:52:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8BADAF8013F
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BADAF8013F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1613778752188235044-webhooks-bot@alsa-project.org>
References: <1613778752188235044-webhooks-bot@alsa-project.org>
Subject: What is the semantics of snd_pcm_hw_params_any?
Message-Id: <20210219235241.CBB73F8020B@alsa1.perex.cz>
Date: Sat, 20 Feb 2021 00:52:41 +0100 (CET)
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

alsa-project/alsa-lib issue #119 was opened from jpalus:

It is not really a bug report but rather a request for clarification in attempt to figure out who is to blame for incorrect pulseaudio behavior.

I've got two different cards -- one internal and one USB -- which behave quite differently for this simple high level code:
```
snd_pcm_open()
snd_pcm_hw_params_any()
iterate snd_pcm_hw_params_test_rate() to check for supported rates
snd_pcm_hw_params_set_rate_near(44100)
snd_pcm_hw_params()
snd_pcm_hw_params_any()
iterate snd_pcm_hw_params_test_rate() to check for supported rates
```

In essence supported sample rates are queried twice, always with snd_pcm_hw_params_any() before them, but separated by snd_pcm_hw_params_set_rate_near().

Now with internal card both iterations report 7 supported rates while for USB first iteration reports 4 rates and second only one (44100). Is that expected or is snd_pcm_hw_params_any() supposed to provide configuration which would result in all rates reported again?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/119
Repository URL: https://github.com/alsa-project/alsa-lib
