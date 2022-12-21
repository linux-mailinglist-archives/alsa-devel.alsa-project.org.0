Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F22653566
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 18:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3671E16D6;
	Wed, 21 Dec 2022 18:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3671E16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671644354;
	bh=tx1+1J35x7V4rrsSsmOSSbfeVBdPup/KanT39QHAYE4=;
	h=From:Date:Subject:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qGRvCdl9ht3QZkSvU1jRJV7wB/ahSCo5teYcmjACaecEUA8Y0cjwwlkROXK7dcpuM
	 Z5IlTv2uxf/skWGWhQ8scGUpzEbEPEx/wFdd6PMAyD31Fdyz2vjLr+Wzow0TIOTFZa
	 9m/eQUeUNjzl2t4i9uZcf2E5ihkbkwi0kWF3dtuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1477F804B0;
	Wed, 21 Dec 2022 18:38:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E095F801C1; Wed, 21 Dec 2022 18:38:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60324F801C1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 18:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60324F801C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cMI0xPx1
Received: by mail-ej1-x62d.google.com with SMTP id gh17so38550574ejb.6
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 09:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D2X4VHxgbsENAINCLFdWB6eEEr0+NXwAY2cyGTtVAtQ=;
 b=cMI0xPx1KLhKAo0ZAXTX2ZqYji9CAyWpljdyjrojOzA0RA/+73J6te4tKVrMSdwOAJ
 QNLwl7yDmJH7lUVazpP2kXvcsYstHnrI6c0bg2yctBV0kVaRfAKUXpxh9CFoIAiXYVio
 e77nZxlJ+MetKwqHq4NoL/agiP2w1bMl3WyDagw8ZWWoDi/JoqXi4D41s0P9av4MX6vI
 i/UtFk9KFlIs4zXDzHmyrtFd78gfgCOcNlyv5luWKb49iATYyA4P+Jsz65SXpDoKKb8H
 jO+tRLmthk5+9tVyF39Cqv5fBltUY1AR66eaOj1Wpg1+QemPRd2QRd1wFJ8rZYOEiPRC
 8pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D2X4VHxgbsENAINCLFdWB6eEEr0+NXwAY2cyGTtVAtQ=;
 b=X1ZgbT4yiWfDSIvc9ZSoh0g7CZjtKDaQ+WPx20+pkJaHH46Qcys7Aya5A03ZTuB1ov
 thZXy7OTzHvpBzyKZvtLC8iYfJt4UQEnDFU0Va3KZtbJEROJio7/IDC6WgedBporUA1s
 YMaNEQdwTgpzYSTgtM3A59JaEls6f5x3LfTVg5rUeaAlM08xQixM1eafrnvGmoC7fRs1
 SpGF+ERXC8SGanUBgSdGYWogCzJxbYCcdkNIRVJBpT2WdAEd5brCnMWFTrQPHLc7IekE
 +krLgbYSgeioEsbOI9NEv2zSfbzuZ9aLmNAmU9/Vtpm0zMNyRxHpU7+mj9fTXY7tsnJR
 UEKw==
X-Gm-Message-State: AFqh2kodjP/T/TZC5aj4bYiXoxS1kApj7HwwscOJYtkfL7RUTBBgUkFN
 DDKQ7BH7gZR4tJNWcyewjCWKkqXGWdXtoSWTdN4=
X-Google-Smtp-Source: AMrXdXs7bTvWWGvc/64fDn9aRH71gOnkqebQzFbPkvo7H6OyBFZXKTCXNOLjjdyf0aUPhuKmit8U9A==
X-Received: by 2002:a17:906:d18f:b0:7c1:80d7:55f2 with SMTP id
 c15-20020a170906d18f00b007c180d755f2mr2362004ejz.48.1671644297368; 
 Wed, 21 Dec 2022 09:38:17 -0800 (PST)
Received: from [10.0.0.144] (31-10-206-125.static.upc.ch. [31.10.206.125])
 by smtp.gmail.com with ESMTPSA id
 24-20020a170906309800b007bd28b50305sm7176098ejv.200.2022.12.21.09.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:38:16 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
X-Google-Original-From: Emanuele Ghidoli <ghidoli.emanuele@gmail.com>
Message-ID: <3d8c6f60-954d-c5b7-85bc-72509002f3df@gmail.com>
Date: Wed, 21 Dec 2022 18:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: wm8904 and output volume control
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
 <20221219095846.GC36097@ediswmail.ad.cirrus.com>
 <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
 <20221220100005.GD36097@ediswmail.ad.cirrus.com>
 <9657ab8d-0c60-7c81-b1cb-8a5b43d07c40@gmail.com>
 <20221221165601.GE36097@ediswmail.ad.cirrus.com>
Content-Language: en-US
In-Reply-To: <20221221165601.GE36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 21/12/2022 17:56, Charles Keepax wrote:
> On Tue, Dec 20, 2022 at 08:12:23PM +0100, Emanuele Ghidoli wrote:
>> On 20/12/2022 11:00, Charles Keepax wrote:
>>> On Mon, Dec 19, 2022 at 04:20:10PM +0100, Emanuele Ghidoli wrote:
>>>> On 19/12/2022 10:58, Charles Keepax wrote:
>>>>> On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
>>> I see that that CP_DYN_PWR bit is disabled when audio is going
>>> through one of the bypass paths. Would you be able to enable one
>>> of the bypass paths and see if you can manually adjust the volume
>>> on the headphone output, with a bypass path active?
>> With the previous change, I tested all the possible combination with
>> one channel from the DAC and the other toggling from DAC to Bypass
>> changing the volume and it's always correct.
>>
>>> Would also perhaps be interesting as a test to completely remove
>>> the write to CP_DYN_PWR from probe and leave things set to manual
>>> and see how the volume behaves then?
>> When I tried to remove any write to this register my modification
>> stopped working.
>>
> 
> Apologies just to be totally clear here, you are saying that
> whilst a bypass path is active (ie. the class G widget has
> cleared CP_DYN_PWR), you can still control the volume? But if you
> remove the set of CP_DYN_PWR from probe, the volume doesn't
> update at all, audio playing or not?
Yes, exactly. But I have also commented:
SND_SOC_DAPM_SUPPLY("Class G", WM8904_CLASS_W_0, 0, 1, NULL, 0)

In every case the volume updates, while playing, when you write the relevant register
(raw i2cset or changing volume using amixer).

To be clear:
The volume is not updated, after BIAS off, if we are in CLASS G WITH
bypass DISABLED (that, without these modification, it is a condition we
cannot trigger. Normally: Bypass ON->class G, bypass OFF->class W).

Effectively, maybe, the test with bypass enabled is affected by the fact
codec is not switched off (bias is kept on... otherwise as soon I stop
playing something from my linux device bypass will stop working due to
codec reset/power off).
In other words the Dynamic Audio Power Managent (DAPM),
which I "understand" only now, is doing its work.

> 
>>> I guess the interests here are to find out if the SYSCLK is
>>> involved at all.
>> I tested keep the clock always enabled, removing
>> clk_disable_unprepare when going into SND_SOC_BIAS_OFF and it has
>> zero effects.
>> Or did you mean something else?
>>
> 
> Yeah that is not quite what I was getting at. I am wondering if
> volume updates work whilst CP_DYN_PWR==0 and CLK_SYS_ENA==1.
Why are you wondering? It should be a standard working case (obviously
with MCLK running). I know, from datasheet, that:
"CLK_SYS_ENA = 1 and MCLK is not present, then register access will be
unsuccessful". But it is not our case.
> 
>> Said all of that, I did one last test, forcing a volume update on
>> the charge pump enable callback, cp_event(), with this and only this
>> modification in everything is working fine.
>>
>> Could it just be as easy as that the volume is applied only when the
>> charge pump is already active?
>>
>>  From the datasheet this seems a good explanation:
>>
>>   The Charge Pump is enabled by setting the CP_ENA bit. When enabled, the
>>   charge pump adjusts the output voltages (CPVOUTP and CPVOUTN).
>>
>> What do you think?
> 
> I think we are getting pretty close, but we need to try and
> narrow down what the requirement is here, is it the charge pump,
> or the sysclk? That needs to be on for the volume update to work.
Watching another codec driver (wm8964: see out_pga_event comment) and
the Startup-sequence (of WM8904) in datasheet we figure out that volume
update must be done after PGA enable.
I tested another patch, I'm pretty convinced that it is the right way to
do it. Now it is working in all conditions (even Class G with disabled bypass).
Maybe some hw guy in Cirrus Logic can dig around?
Anyway, this is the tested patch, that, to me, sound good:

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index ca6a01a230af..791d8738d1c0 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -697,6 +697,7 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
         int dcs_mask;
         int dcs_l, dcs_r;
         int dcs_l_reg, dcs_r_reg;
+       int an_out_reg;
         int timeout;
         int pwr_reg;
  
@@ -712,6 +713,7 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
                 dcs_mask = WM8904_DCS_ENA_CHAN_0 | WM8904_DCS_ENA_CHAN_1;
                 dcs_r_reg = WM8904_DC_SERVO_8;
                 dcs_l_reg = WM8904_DC_SERVO_9;
+               an_out_reg = WM8904_ANALOGUE_OUT1_LEFT;
                 dcs_l = 0;
                 dcs_r = 1;
                 break;
@@ -720,6 +722,7 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
                 dcs_mask = WM8904_DCS_ENA_CHAN_2 | WM8904_DCS_ENA_CHAN_3;
                 dcs_r_reg = WM8904_DC_SERVO_6;
                 dcs_l_reg = WM8904_DC_SERVO_7;
+               an_out_reg = WM8904_ANALOGUE_OUT2_LEFT;
                 dcs_l = 2;
                 dcs_r = 3;
                 break;
@@ -792,6 +795,10 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
                 snd_soc_component_update_bits(component, reg,
                                     WM8904_HPL_ENA_OUTP | WM8904_HPR_ENA_OUTP,
                                     WM8904_HPL_ENA_OUTP | WM8904_HPR_ENA_OUTP);
+
+               /* Update volume, requires PGA to be powered */
+               val = snd_soc_component_read(component, an_out_reg);
+               snd_soc_component_write(component, an_out_reg, val);
                 break;
  
         case SND_SOC_DAPM_POST_PMU:


> 
> Thanks,
> Charles

Thank you.
Best regards,

Emanuele

