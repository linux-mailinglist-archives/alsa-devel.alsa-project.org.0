Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A034FA196
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 04:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D221893;
	Sat,  9 Apr 2022 04:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D221893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649470531;
	bh=3tUjl2++P+P69FIWniii1miB7GtpSqLNh00DWBbUWjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=alnihj196kVyY69/f1uoGwMSFIDfisGS0UZEOGvUvzJazUZUG+BGTUr0W8gryN68q
	 ufoW5UQOl2awne45eGqK3CuUIJ8fMMmLrdhstynwb4Q/tuyge/mY0QJ6GEF6pp9nhV
	 lNpH8DifQ/BJ4R0GoadZl4SK1VVHBJrWEu9cwKXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036B3F80054;
	Sat,  9 Apr 2022 04:14:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50524F80253; Sat,  9 Apr 2022 04:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8199F80054
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 04:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8199F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FDEynsur"
Received: by mail-qk1-x734.google.com with SMTP id e10so4623234qka.6
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 19:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HdHisndypV31+5Xb1kmi6gvlBiyR0g/rMDVNCI91T2s=;
 b=FDEynsurvlEHtPbdzTAWyrnFJuhhtr3tSxaiK0pzbHqYC1Khgiil7ZWwrP8nxGk55k
 p7CugPnY+OFXz45s7Zx3edwoemMtvW9ypaI0PEgzwSUjxLaGMFBmxAOzpN0Nok556ksm
 6QZZepFFQZhLRuZa58C58DrDWbViP8hdQ7Cd040lpZOxttpnlBdSYjc+Twnb/mvUM0x7
 YlEpbGOTp+Vd8ChKVDIN4VyIhUttvCeqYQIDadh0ZQgzaddDtBKpxIyiKjQlVxC9MCmV
 /1CiiFXr64vfeoobzspfid1QQ3NudZ+7Dd9LTzQP/zlRARpJD+JOodyZc4IBPuMP11Ig
 ZSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HdHisndypV31+5Xb1kmi6gvlBiyR0g/rMDVNCI91T2s=;
 b=toW8Hj2Lj96oijCSUS9XFAmk8bJoFsFWFpu2duDJw4bVJb320CVSU+lt1EnUnbS3tS
 UgjquVwVm2u01YxdC6lHNQ0PPT7m3ebGG8GiBbaLqmFEbvhkFoT8IYq7JSaqw07g3SIU
 +NhBPGk+kNp6CY33zjA/y/X2Hee0Bg9izqNDXHJ8M51VmtqIGoDPJXVYHsxq+eNnHhFR
 Se1pwJLmu+TKeGSELDylyz42XSlvm7FCZQbzhtCkRz9a1r3hxU6ATxKXmxnkkhut5r1C
 oaBbwmE+r2a2IZzp8UicXiimeVL4rn5MlXws0LVVigRcdaEm4jFjitWV9XwRRlcsvK8M
 jF4Q==
X-Gm-Message-State: AOAM532MQz1Zqn4e1tJPy0twhappTXZo174cD25BnGNW2joH6AAVRnDu
 3J4rBFzMhH46XENGvcNjKzMBomXuocFLClGfJzs=
X-Google-Smtp-Source: ABdhPJziDg40H8CUMy2CF0kWXphgtfTQ2MmSaTQHslg6vDBbw9geJBbZSrflduoaKXC64N9bUIm7f3z3s7lu7D9Fa38=
X-Received: by 2002:a05:620a:254f:b0:680:f510:22e4 with SMTP id
 s15-20020a05620a254f00b00680f51022e4mr14772116qko.554.1649470459747; Fri, 08
 Apr 2022 19:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AadRQ6B-xbvZenppf6YHMcWERoYuo=kr_gRx03aPsOeg@mail.gmail.com>
In-Reply-To: <CAOMZO5AadRQ6B-xbvZenppf6YHMcWERoYuo=kr_gRx03aPsOeg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 9 Apr 2022 10:14:08 +0800
Message-ID: <CAA+D8APY4RZTF=-i3KNbgQK-m18z6ymvxCaQkgy8w9rb5++oQw@mail.gmail.com>
Subject: Re: imx8mn: Using the easrc driver
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Mark Brown <broonie@kernel.org>, Adam Ford <aford173@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

On Sat, Apr 9, 2022 at 3:30 AM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Shengjiu,
>
> I am running kernel 5.18-rc1 on an imx8mn-ddr4-evk board.
>
> The following playback devices are available:
>
> # aplay -l
> **** List of PLAYBACK Hardware Devices ****
> card 0: imxspdif [imx-spdif], device 0: S/PDIF PCM snd-soc-dummy-dai-0
> [S/PDIF PCM snd-soc-dummy-dai-0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: wm8524audio [wm8524-audio], device 0: HiFi wm8524-hifi-0 [HiFi
> wm8524-hifi-0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: wm8524audio [wm8524-audio], device 1: HiFi-ASRC-FE (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> #
>
> I would like to use the sample rate conversion (provided by the easrc
> driver):
>
> # aplay -D hw:1,1 /media/f2bjrop1.0.wav
> Playing WAVE '/media/f2bjrop1.0.wav' : Signed 16 bit Little Endian,
> Rate 16000 Hz, Mono
> Warning: rate is not accurate (requested = 16000Hz, got = 32000Hz)
>          please, try the plug plugin
>
> , but the playback does not play at the correct speed. It plays at a
> much faster rate.
>
> The f2bjrop1.0.wav file I got from:
> http://www.fit.vutbr.cz/~motlicek/speech_hnm.html
>
> What should be done for the easrc to convert the sampling rates properly?
>
>
> Maybe it is caused by this "constraint is not needed for back end
bitstream for
the sample rate is fixed by dts and the constraint is propagated to front
end
bitstream for they share the same snd_soc_pcm_runtime."

Please try the below change.  this change hasn't been upstreamed yet.

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 81f858f6bd67..442a59857875 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -61,6 +61,7 @@ static int wm8524_startup(struct snd_pcm_substream
*substream,
 {
        struct snd_soc_component *component = dai->component;
        struct wm8524_priv *wm8524 =
snd_soc_component_get_drvdata(component);
+       struct snd_soc_pcm_runtime *rtd = substream->private_data;

        /* The set of sample rates that can be supported depends on the
         * MCLK supplied to the CODEC - enforce this.
@@ -71,9 +72,10 @@ static int wm8524_startup(struct snd_pcm_substream
*substream,
                return -EINVAL;
        }

-       snd_pcm_hw_constraint_list(substream->runtime, 0,
-                                  SNDRV_PCM_HW_PARAM_RATE,
-                                  &wm8524->rate_constraint);
+       if (!rtd->dai_link->be_hw_params_fixup)
+               snd_pcm_hw_constraint_list(substream->runtime, 0,
+                                          SNDRV_PCM_HW_PARAM_RATE,
+                                          &wm8524->rate_constraint);

        gpiod_set_value_cansleep(wm8524->mute, 1);

best regards
wang shengjiu
