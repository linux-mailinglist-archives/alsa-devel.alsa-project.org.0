Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098AD511828
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820E3175F;
	Wed, 27 Apr 2022 15:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820E3175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651065257;
	bh=tuOORYVtReGl+OkaPdyAAnN6S4hP4eSUBYI72nHm5YM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X93uLGpyni5NmY8cXHJYrwxfIwe5bSYePDAHeeLpX7TQDUzv3VUTkNHSFEK7qVtec
	 KClgiI3pWngz8c6jvpdY+41AMGyTCP0ziRiNEl4Co3O74h6Q+MeMytL3u8Kythz6U7
	 LCdrongb5OB/aNwI3UVQrcd9/BrSOXwgMuKvOxUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0808DF80253;
	Wed, 27 Apr 2022 15:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5526F80152; Wed, 27 Apr 2022 15:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9944EF800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9944EF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eAbx9o6M"
Received: by mail-ej1-x629.google.com with SMTP id l18so3305722ejc.7
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BYt6s7EgHuLGC4TAypu6h/0IfajDEyZ4jHY5i7KAMN4=;
 b=eAbx9o6MKnZElI9veihhhbIfQ3AtsOXWS2SmMP2MwAAxLXXmJIUqBNP4D6Vx6IKsaO
 4Jc4WzsE8T4HZXUswRt9/lgnNIpitr+hQB4BJkmbgRTpNiZmfrla/y8mtG5HgiUBNzVY
 jgA4flaeYq+VrX9ZzRy8uJE6aou6D65E8eDfgbDBxzoKJpAbWB/wpnZIFz7OU1kdjFQj
 Y2ZyfBWtCNnq8cn0kyPUnlhqUIqm092j2YidaBD2u2wOX3NiwgmR7wu2Duo92XHQcki3
 xmhVXcg2fnYWvoD5iPGJyY/4JRj5k/QMnW6Z91sEeoioVp+dHNeRhbXtSkuWzxxzUnkU
 G96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYt6s7EgHuLGC4TAypu6h/0IfajDEyZ4jHY5i7KAMN4=;
 b=v+jKnaGTnb5nsDO258uGUTfWkAyfmGaQwONCC6oSKkyUtO8kRss5ysncwIpLW5T26e
 Ot6mylc7CwW7+It2fbGx5YLW3PFiVF8U9VLI+fVEF15pBoii0ZEo4U7+6jvkjytXmUvw
 qAngUTQoapJGL0Zx1hkeYkocBMLP6Lf2wLF4+DXFvQPzok3PVdI1pY/RIQPnXJymgqKN
 Q+fs6gscE4Y7ZVZ9ttF10qjHE+jHuV7RuTRTw1K15Cv7bs4reBfsubWA1n4NayiV1tSV
 zwx6wbkGYXttycCRHFLiEkhA7lK3wa2fW7gGbfkLua3kzLeFuN1Tl1wHXcAobbZBrCkf
 RF0A==
X-Gm-Message-State: AOAM531SY5ClHOQVIQmexmUbt/Q5XJtPJ88hdxejlAS7F3+EBYtPsV75
 3Wvdwrcu7L5ie6I2igJs1a3941RSkPsWNtFAVHU=
X-Google-Smtp-Source: ABdhPJzSyVewch82Zaea7zZ4HUaGOQW+pHtACc2D7nrWgAIDWb1nr3sPuYI4K+H687iDMIb0i+z7s+PH8ZlOncY6ZJI=
X-Received: by 2002:a17:907:3e25:b0:6ef:e246:cfc7 with SMTP id
 hp37-20020a1709073e2500b006efe246cfc7mr26087043ejc.613.1651065187136; Wed, 27
 Apr 2022 06:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 27 Apr 2022 08:12:56 -0500
Message-ID: <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
Subject: Re: WM8962 crashing on suspend
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Tue, Apr 26, 2022 at 12:41 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Tue, Apr 26, 2022 at 11:36:26AM -0500, Adam Ford wrote:
> > I have an imx8m Mini with a wm8962 codec.  If I run a speaker test and
> > suspend the board while the speaker test is running, I get the
> > following upon wake:
> >
> > wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a: -16
> >
> > This message repeats itself over and over again.  If I attempt to use
> > any audio, it fails until I reboot the board.
> >
> > If I run the audio test, then exit and suspend, the audio works upon
> > resume, so it appears to be related to suspending while running.
> >
> > I am hoping someone might have a suggestion as to what I might be able
> > to do or try to allow this to successfully suspend and resume if the
> > device is playing sound.
> >
>
> Hmm... EBUSY is what regmap returns when a volatile register is
> read whilst the chip is still in cache only. The driver does
> appear to be missing the usually fairly important work around to
> avoid the IRQ and the PM runtime deadlocking on resume. Although
> not sure that would actually lead to the error message you are
> seeing.
>
> Would be really handy to see a little more of the log leading up
> to the failure if that is possible? And would be really awesome
> if you had any idea which read was returning the error? You could
> shove a dump_stack in _soc_component_ret next to the error
> message.

Because NXP had a downstream kernel, and it didn't appear to happen
when using their downstream kernel, I wanted to see the difference.
I found this:

static const struct dev_pm_ops wm8962_pm = {
+ SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
};

I applied this, and it appears to make the issue go away on a 5.15
kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
would that be an acceptable solution to push upstream?

adam
>
> Thanks,
> Charles
