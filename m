Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56469A7F66
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 11:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A42516B2;
	Wed,  4 Sep 2019 11:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A42516B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567589424;
	bh=wfSWDHgF3QVpNmXWnOMjZMwwO7JFojTjD+cBetFJkto=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpKyOaap20cBJYgYd0o4HVh9XbhH6SEfSrsoQBcHN51ddENmUQXBty426Xzws5BsL
	 4CJ4fvcboOVx4zj4BLcC9b6v2jVjKToNYuJgtOYRCkdS68FfMwrvwUnZHklemJKFOg
	 Zo76J71GeHNgIg8RqXC35FJHgkUaGFNTz1sX4ArI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F47F80171;
	Wed,  4 Sep 2019 11:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC155F80447; Wed,  4 Sep 2019 11:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 945A7F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 11:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 945A7F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tUQsvJFX"
Received: by mail-wr1-x442.google.com with SMTP id l16so2125846wrv.12
 for <alsa-devel@alsa-project.org>; Wed, 04 Sep 2019 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6fL1hpfLYe08Ws3YBIXWyZd5f0wTH/9sezUAVRLte9Y=;
 b=tUQsvJFXQvKqEiJDJHEDJlgbSnmzprzTucKnhqbHQF1csLTBlYAa4nzFCMoRIgfUAv
 1SFnCiJi3bB3wMMC71e2yvGhUP2J6FxsbE7TheQr0xEwVp7VM1u81j4SWNwJTQZFnjk1
 2PPj7WcvulyZC5qFUZ9JxSKaHb+KUACogizum5JkRFIAJIdbt41Buu+r+f2qsGKMi9pZ
 1yimNwftFLDxlZWmYy2QdBvHWOuAUmNpDZfqu5SNhxpb4rtl0A9HL9UXMK7ZO7R9aAms
 dF2M4HLmUq4RN783TokZilzZdoKeJet4RymKLkaaCBKMv1z3Y5xqWmA9Hfs/ti8KC/P9
 ijsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6fL1hpfLYe08Ws3YBIXWyZd5f0wTH/9sezUAVRLte9Y=;
 b=WLuN67GCaTQQ5TGGBH+QoAsU/ACfCldd++xZx47rhwVqyy8vASmPALww22wbb/oAGU
 F6nEYArHc80XRm4A6Iykfl3av3RTsj34QfdoGk+a3nhi1vUMVuzNof4NbGnaZQOfgxwA
 2kyczBRDtsf1w10/pdIjYR0s8mIYLSu2IUz0u6d/S7OwZU13XE6GqGcmKg85wm9dPROy
 3taythqeG/8+4FutfmIlj+kL1jKAOR6rHLmx8jK1lh0dT6rRiuZdSMA7xHs1RqNnsi43
 jxBqEOEJ4p9Bp7Y/XdI21dWdlCrFCcrQWr2TfulM8sZRFHELe9zFREVKMBFJFIcAld2A
 1tHw==
X-Gm-Message-State: APjAAAXhjkscGrf66dXkiU5Mt5RSixCsAl4nssdRLMzkOQ8D5CTxfczX
 5axQtw+GJJ3GB/dQCpxTIswEHA==
X-Google-Smtp-Source: APXvYqzucI4nn7YutWvX8L0uE//H9lUG6xI41cD+IcPFnSMlnTrRp12aMq5GDHQ7A5tyjYtBqPXG2A==
X-Received: by 2002:a5d:4742:: with SMTP id o2mr1107006wrs.253.1567589314143; 
 Wed, 04 Sep 2019 02:28:34 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm41635607wra.79.2019.09.04.02.28.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2019 02:28:33 -0700 (PDT)
To: Cheng-yi Chiang <cychiang@chromium.org>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1a167659-2eb1-d9be-c1ae-4958ac3f7929@baylibre.com>
Date: Wed, 4 Sep 2019 11:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Doug Anderson <dianders@chromium.org>,
 kuninori.morimoto.gx@renesas.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yakir Yang <ykk@rock-chips.com>, sam@ravnborg.org,
 Xing Zheng <zhengxing@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 =?UTF-8?B?6JSh5p6r?= <eddie.cai@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 cain.cai@rock-chips.com, Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, kuankuan.y@gmail.com
Subject: Re: [alsa-devel] [PATCH] drm: bridge/dw_hdmi: add audio sample
 channel status setting
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

Hi,

On 04/09/2019 11:09, Cheng-yi Chiang wrote:
> Hi,
> 
> On Tue, Sep 3, 2019 at 5:53 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi,
>>
>> On 03/09/2019 07:51, Cheng-Yi Chiang wrote:
>>> From: Yakir Yang <ykk@rock-chips.com>
>>>
>>> When transmitting IEC60985 linear PCM audio, we configure the
>>> Audio Sample Channel Status information of all the channel
>>> status bits in the IEC60958 frame.
>>> Refer to 60958-3 page 10 for frequency, original frequency, and
>>> wordlength setting.
>>>
>>> This fix the issue that audio does not come out on some monitors
>>> (e.g. LG 22CV241)
>>>
>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
>>> ---
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++++
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h | 20 ++++++++
>>>  2 files changed, 79 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index bd65d0479683..34d46e25d610 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -582,6 +582,63 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
>>>       return n;
>>>  }
>>>
>>> +static void hdmi_set_schnl(struct dw_hdmi *hdmi)
>>> +{
>>> +     u8 aud_schnl_samplerate;
>>> +     u8 aud_schnl_8;
>>> +
>>> +     /* These registers are on RK3288 using version 2.0a. */
>>> +     if (hdmi->version != 0x200a)
>>> +             return;
>>
>> Are these limited to the 2.0a version *in* RK3288, or 2.0a version on all
>> SoCs ?
>>
> 
> In the original patch by Yakir,
> 
> https://lore.kernel.org/patchwork/patch/539653/   (sorry, I should
> have added this link in the "after the cut" note)
> 
> The fix is limited to version 2.0.
> Since I am only testing on RK3288 with 2.0a, I change the check to 2.0a only.
> I can not test 2.0a version on other SoCs.
> The databook I have at hand is 2.0a (not specific to RK3288) so I
> think all 2.0a should have this register.
> 
> As for other version like version 1.3 on iMX6, there is no such
> register, as stated by Russell
> 
> http://lkml.iu.edu/hypermail/linux/kernel/1501.3/06268.html.

Russell assumes the registers are not present on the iMX6 IP not having
the I2S registers, but they are present on the IPs configured with I2S
at any versions.

My databook version (1.40.a) specifies :

fc_audschnls0 to fc_audschnls8

```
When transmitting IEC60958 linear PCM audio, this registers allow to configure the channel status
information of all the channel status bits in the IEC60958 frame. For the moment this configuration is only
used when the I2S audio interface, General Purpose Audio (GPA), or AHB audio DMA (AHBAUDDMA)
interface is active (for S/PDIF interface this information comes from the stream).
```

But the databook Revision History shows these registers were present since version 1.10a.

I propose you remove the version check, but you only setup these registers when I2S is enabled:
(hdmi_readb(hdmi, HDMI_CONFIG0_ID) & HDMI_CONFIG0_I2S) until a AHBAUDDMA user needs this,
with a small comment explaining the situation.

Neil

> 
> So at least we should check the version.
> Maybe we can set the criteria as version 2.0 or above to make it a safe patch ?
> If there is the same need on other SoC with version < 2.0, it can be
> added later.
> Presumably, there will be databook of that version to help confirming
> this setting.
> 
> Thanks!
>>> +
>>> +     switch (hdmi->sample_rate) {
>>> +     case 32000:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_32K;
>>> +             break;
>>> +     case 44100:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_44K1;
>>> +             break;
>>> +     case 48000:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_48K;
>>> +             break;
>>> +     case 88200:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_88K2;
>>> +             break;
>>> +     case 96000:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_96K;
>>> +             break;
>>> +     case 176400:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_176K4;
>>> +             break;
>>> +     case 192000:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_192K;
>>> +             break;
>>> +     case 768000:
>>> +             aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_768K;
>>> +             break;
>>> +     default:
>>> +             dev_warn(hdmi->dev, "Unsupported audio sample rate (%u)\n",
>>> +                      hdmi->sample_rate);
>>> +             return;
>>> +     }
>>> +
>>> +     /* set channel status register */
>>> +     hdmi_modb(hdmi, aud_schnl_samplerate, HDMI_FC_AUDSCHNLS7_SMPRATE_MASK,
>>> +               HDMI_FC_AUDSCHNLS7);
>>> +
>>> +     /*
>>> +      * Set original frequency to be the same as frequency.
>>> +      * Use one-complement value as stated in IEC60958-3 page 13.
>>> +      */
>>> +     aud_schnl_8 = (~aud_schnl_samplerate) <<
>>> +                     HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_OFFSET;
>>> +
>>> +     /* This means word length is 16 bit. Refer to IEC60958-3 page 12. */
>>> +     aud_schnl_8 |= 2 << HDMI_FC_AUDSCHNLS8_WORDLEGNTH_OFFSET;
>>> +
>>> +     hdmi_writeb(hdmi, aud_schnl_8, HDMI_FC_AUDSCHNLS8);
>>> +}
>>> +
>>>  static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
>>>       unsigned long pixel_clk, unsigned int sample_rate)
>>>  {
>>> @@ -620,6 +677,8 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
>>>       hdmi->audio_cts = cts;
>>>       hdmi_set_cts_n(hdmi, cts, hdmi->audio_enable ? n : 0);
>>>       spin_unlock_irq(&hdmi->audio_lock);
>>> +
>>> +     hdmi_set_schnl(hdmi);
>>>  }
>>>
>>>  static void hdmi_init_clk_regenerator(struct dw_hdmi *hdmi)
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>>> index 6988f12d89d9..619ebc1c8354 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>>> @@ -158,6 +158,17 @@
>>>  #define HDMI_FC_SPDDEVICEINF                    0x1062
>>>  #define HDMI_FC_AUDSCONF                        0x1063
>>>  #define HDMI_FC_AUDSSTAT                        0x1064
>>> +#define HDMI_FC_AUDSV                           0x1065
>>> +#define HDMI_FC_AUDSU                           0x1066
>>> +#define HDMI_FC_AUDSCHNLS0                      0x1067
>>> +#define HDMI_FC_AUDSCHNLS1                      0x1068
>>> +#define HDMI_FC_AUDSCHNLS2                      0x1069
>>> +#define HDMI_FC_AUDSCHNLS3                      0x106a
>>> +#define HDMI_FC_AUDSCHNLS4                      0x106b
>>> +#define HDMI_FC_AUDSCHNLS5                      0x106c
>>> +#define HDMI_FC_AUDSCHNLS6                      0x106d
>>> +#define HDMI_FC_AUDSCHNLS7                      0x106e
>>> +#define HDMI_FC_AUDSCHNLS8                      0x106f
>>>  #define HDMI_FC_DATACH0FILL                     0x1070
>>>  #define HDMI_FC_DATACH1FILL                     0x1071
>>>  #define HDMI_FC_DATACH2FILL                     0x1072
>>> @@ -706,6 +717,15 @@ enum {
>>>  /* HDMI_FC_AUDSCHNLS7 field values */
>>>       HDMI_FC_AUDSCHNLS7_ACCURACY_OFFSET = 4,
>>>       HDMI_FC_AUDSCHNLS7_ACCURACY_MASK = 0x30,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_MASK = 0x0f,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_192K = 0xe,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_176K4 = 0xc,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_96K = 0xa,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_768K = 0x9,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_88K2 = 0x8,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_32K = 0x3,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_48K = 0x2,
>>> +     HDMI_FC_AUDSCHNLS7_SMPRATE_44K1 = 0x0,
>>>
>>>  /* HDMI_FC_AUDSCHNLS8 field values */
>>>       HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_MASK = 0xf0,
>>>
>>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
