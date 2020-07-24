Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF422BEA6
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 09:09:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3925D1683;
	Fri, 24 Jul 2020 09:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3925D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595574573;
	bh=0B8PL1burz9qgIqdqABnDhtRKH4mXVi1zGHQ6FbyvIo=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o8lZmDUpConXqHKR41IS9FUCVP934Nf/QnxffqR5u128fH2wl5ymYCry1qU4Mt86y
	 aEh922kmqitbQRYtbr+ujNQCXDXLFGpMMxRZjc9yTsSUQplhGiKGYzEDwtjCr4dPz+
	 vJgZLArqWE7XTs6JUuRYcueXdONqSKTDW1VL3Hq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5554EF80150;
	Fri, 24 Jul 2020 09:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 314E6F800CE; Fri, 24 Jul 2020 09:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A61F800CE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 09:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A61F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="deXjA9hP"
Received: by mail-qv1-xf49.google.com with SMTP id l12so5228781qvu.21
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 00:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=r/rAmoQsTdsTViUYbqX2XptN21p3L49kWCsxVj66Ap4=;
 b=deXjA9hPyDqlLjfQanuydAygiTjLrMDEQXU1g2zEiL8h7NIiDBRwqSnF32FZR3GK2M
 7u9b58eKOPqVlezJkOijiF40s/2DX+mFBWThAdVTW7YCpO98U8thR2WhzHJPVJBySA5i
 q0k2TC9DlHVM6DvlqTT4oyGve3uvCv04XXWdLfy76Li0Rjmz6il4xNnpXuQAIkBV9cbS
 KZMTXMDkSZ9GxNWdR1YoiN7caLIrU2PLKs41OsTZeCeTG5m9CktV0Xmoo/n9b1JCy3F0
 9VVvYYpVy5e2BzgcGmWS3v/+WIQt/bdg4JHs/+vdbrKCQCSYqfkG7auePajDQDbsLyaX
 u7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=r/rAmoQsTdsTViUYbqX2XptN21p3L49kWCsxVj66Ap4=;
 b=WCRhGyu3Xj9FHasIPQ9aKOt9+lwaIeaAz2ZtpYS5nVDH5exg3P59FbQ82vRQ8pb1jK
 /gVet6HC7lF/5+rdA1qwm1Al4rI90rtMP3Qnv6Wkrt8F6e7kI5QyJNeLOo4PXUelor12
 YBYFPyh+o79nNjNTfY+3bteKLHTyZhd5s8k9AtK75JQTmh61hjnvBtXhGHxV5dt05Xvz
 gpRG+FNv8u08I41UxPBByFUjHDzJgGUF2o9vT3flo7raXw5mao3NEZkY3KwAjvFZRUxu
 SckrOpJEtmh3nQt/yOmnGKxoR4Xab3vpE+w+LuBZiI3J9l+mU6S9ZAU1CD8yTkxe3NrU
 iuWA==
X-Gm-Message-State: AOAM5339b7hz0Ys3GWvsIMKp78Qfn5sFIHBEEA8eZdhxu6oMufh8gUXV
 MdH1pSlANkjq4gyG8jyFV7ikNl0Fv3iS
X-Google-Smtp-Source: ABdhPJyRH3jG4t4Dn6OTcnh/F6zlSIJhuA2JjAt2PWmoF6K+Qo9i6Um1mOf00pZGD58/x2rNfIblXKzg1pJU
X-Received: by 2002:a0c:f307:: with SMTP id j7mr8314268qvl.55.1595574455629;
 Fri, 24 Jul 2020 00:07:35 -0700 (PDT)
Date: Fri, 24 Jul 2020 15:07:31 +0800
Message-Id: <20200724070731.451377-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [PATCH] ASoC: dapm: don't call pm_runtime_* on card device
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, lgirdwood@gmail.com
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

runtime_usage of sound card has been observed to grow without bound.
For example:
$ cat /sys/devices/platform/sound/power/runtime_usage
46
$ sox -n -t s16 -r 48000 -c 2 - synth 1 sine 440 vol 0.1 | \
  aplay -q -D hw:0,0 -f S16_LE -r 48000 -c 2
$ cat /sys/devices/platform/sound/power/runtime_usage
52

Commit 4e872a46823c ("ASoC: dapm: Don't force card bias level to be
updated") stops to force update bias_level on card.  If card doesn't
provide set_bias_level callback, the snd_soc_dapm_set_bias_level()
is equivalent to NOP for card device.

As a result, dapm_pre_sequence_async() doesn't change the bias_level of
card device correctly.  Thus, pm_runtime_get_sync() would be called in
dapm_pre_sequence_async() without symmetric pm_runtime_put() in
dapm_post_sequence_async().

Don't call pm_runtime_* on card device.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/soc-dapm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Hi,
I'm not very sure if the patch makes sense.

I was considering:
(1) update the bias_level of card device correctly
(2) skip pm_runtime_* for card device

Per commit message on 4e872a46823c, I believe there is some context
I'm not aware of it.  Thus, the patch adopts (2).

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5076299abf37..3273161e2787 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1798,7 +1798,7 @@ static void dapm_pre_sequence_async(void *data, async_cookie_t cookie)
 	/* If we're off and we're not supposed to go into STANDBY */
 	if (d->bias_level == SND_SOC_BIAS_OFF &&
 	    d->target_bias_level != SND_SOC_BIAS_OFF) {
-		if (d->dev)
+		if (d->dev && cookie)
 			pm_runtime_get_sync(d->dev);
 
 		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_STANDBY);
@@ -1845,7 +1845,7 @@ static void dapm_post_sequence_async(void *data, async_cookie_t cookie)
 			dev_err(d->dev, "ASoC: Failed to turn off bias: %d\n",
 				ret);
 
-		if (d->dev)
+		if (d->dev && cookie)
 			pm_runtime_put(d->dev);
 	}
 
-- 
2.28.0.rc0.142.g3c755180ce-goog

