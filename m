Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF7650E86
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 16:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA8862C5F;
	Mon, 19 Dec 2022 16:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA8862C5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671463273;
	bh=r96qAUvcATiwa6rKK9Qc3nb3R8lWx+HcUrpKc39zKRs=;
	h=From:Date:Subject:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pj+T/PV61/zaFWn5q5NgwcNP5tvgdJ127YXyWgYDQYTClA8hc/N+8J3lKtUSciJHp
	 y9qNp1gszViC/G8aF2vvCBDCQ31rqglaAw1nJkO9KyDSUkb8MLvtN++7oX4bub7DTm
	 gNiIzbSfgk1MIOBvgNv2ALiLgZxAom9+8msn7B8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 680E4F801C0;
	Mon, 19 Dec 2022 16:20:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52912F80423; Mon, 19 Dec 2022 16:20:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7347BF801C0
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 16:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7347BF801C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ymt7e2ap
Received: by mail-ej1-x62c.google.com with SMTP id n20so22396898ejh.0
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eg0Ja8aOJGsMmz0yKYDfxRrzxYCpQctOSV5E4yBxsvo=;
 b=Ymt7e2apY6eZGBqshZTsT8bD7tIibveqjh7B7Alswmp00FYQKLchwM55XuBpRVozP/
 1a2oTIQB5GOFt1O66zAPhbPAAMfVCHuFU3IVyG3OY9BqJckeM2bw110o4tDblY+Sc/3x
 1CQ34meGGoC+KozwJ54Xe8s1P7LZzRokrmuaUCgsJvxoq8ODVqaIKEBSWbu84aK2Xi1q
 WW+wEMIrtWGHO1YgveV71x2nh4B9eRsymAGGIbZLa+QQJEho6vgjFqu6QbJYb9GD6IYg
 tRxLTyrgKNm5bLbvGrLRlut9mK8P2MnSJ9Pyzk7Z8JdVuMNom1T6VJXisbCtrW4wIPEq
 iZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eg0Ja8aOJGsMmz0yKYDfxRrzxYCpQctOSV5E4yBxsvo=;
 b=xSFG79h/7CMeTjcj/AqwkLWAp7xHNMHgeChx4UFYLkHCYRSNbOBy6GHH1P7dEjlJhW
 EHhEJcfdgkiqe8sIPgukxOV8DGnToArSGYFD3qAgvUs1V7V/H3E6uP7Cwbv88s7cl4Ga
 jYuSsy6ddniu0a6VESOCKyzBFAvtWUVC442tj/LCTq0Hqaq7JZKXmc89sxi7J7i6hDUP
 l2bnC1ggx2lrjWa8mlJkqCwtBqb9NoW1tKFomCuC17NKcVLxXzhuVygkLiCSWtcxN3a4
 ufDdTeVL3sB5Ze04VVypSd/TZP9n898JNK+onME9kEmG3rD3IVZwqSf709hcZy1wpP8V
 27HQ==
X-Gm-Message-State: ANoB5pki0rw0cXH7oAnU/N2h7QWxx+OyChfSpgpDEa9tibXWrRtlk2Be
 cHmlYlNaKW8IySXTw62k8t4=
X-Google-Smtp-Source: AA0mqf7r9GZh9cRwxJTsDnd9CKSOjlZxQOSLvxkGNypHR0GJ6g1YR5e61aBJZ9H8XqiUkQweEeGPpg==
X-Received: by 2002:a17:906:2a1b:b0:7ae:1724:88dd with SMTP id
 j27-20020a1709062a1b00b007ae172488ddmr35902169eje.73.1671463211272; 
 Mon, 19 Dec 2022 07:20:11 -0800 (PST)
Received: from [10.0.0.144] (31-10-206-125.static.upc.ch. [31.10.206.125])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906088b00b007c11e5ac250sm4534514eje.91.2022.12.19.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 07:20:10 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
X-Google-Original-From: Emanuele Ghidoli <ghidoli.emanuele@gmail.com>
Message-ID: <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
Date: Mon, 19 Dec 2022 16:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: wm8904 and output volume control
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
 <20221219095846.GC36097@ediswmail.ad.cirrus.com>
In-Reply-To: <20221219095846.GC36097@ediswmail.ad.cirrus.com>
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

On 19/12/2022 10:58, Charles Keepax wrote:
> On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
>> Hello,
>> I have found that output volume is set to the default value after a
>> limited time (~4 seconds) after play stop.
>> I have analyzed what is happening:
>> - at first play the volume is the expected one
>> - After stopping playing + ~4 seconds wm8904_set_bias_level (...,
>> SND_SOC_BIAS_OFF) is called
>> - Chip is reset and regulator is switched off if "possible" (not in
>> our case, it is important to note)
>> - at second play wm8904_set_bias_level (..., SND_SOC_BIAS_STANDBY)
>> is called. wm8904_hw_params is also called just before.
>>
>> I see that all I2C transactions are good, registers are written as
>> expected, especially volume control register (even the silly
>> HPOUT_VU bit, to do a volume update is correctly written).
>> Reading out this register, using i2cget (bypassing regcache), report
>> the "expected" value. But the real output volume correspond to the
>> default value (hw default, that it is the same value in
>> wm8904_reg_defaults structure).
>>
>> I checked that SYSCLK_ENA is 0 during register writing (needed if
>> MCLK/SYSCLK is not present). I do not know if there is some other
>> constrain on these registers.
>>
> 
> Yes this might be my guess as well, I wonder if the HPOUT_VU bit
> needs SYSCLK to be present to take effect.
> 
>> If I rewrite the volume control register, a second time, the volume
>> is set (tested with i2cset, from user space. And from kernel space,
>> bypassing regcache).
>>
> 
> When you write the value the second time is that still before
> SYSCLK is present?
> 
> Also does just writing one of HPOUT volumes cause the other to
> get updated? The HPOUT_VU bit should trigger an update to both.
> 
>> I resolve also by reverting e9149b8c00d2 ("ASoC: wm8904: fix
>> regcache handling").
>> I'm not here to say that the commit is wrong. I analyzed it and seem
>> perfect (in few words it align the hw with the regcache avoiding
>> potential incoherence).
>>
> 
> Yeah I think that commit is fine, I would wager that your system
> doesn't turn off the regulators so without that commit the
> register retains the old volume across the "power down".
> 
> Thanks,
> Charles

Hello Charles,
thank you.

With this patch (draft) seem the "bug" is fixed: (bug that is present, 
for sure, also with an effective regulator)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index ca6a01a230af..33452daf1ae8 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1903,6 +1903,7 @@ static int wm8904_set_bias_level(struct 
snd_soc_component *component,
                         }

                         regcache_cache_only(wm8904->regmap, false);
+                       regcache_sync_region(wm8904->regmap, 
WM8904_CLASS_W_0, WM8904_CLASS_W_0);
                         regcache_sync(wm8904->regmap);

                         /* Enable bias */

I infer, from datasheet, that volume update is applied in different way 
based on charge pump dynamic vs register control (CP_DYN_PWR bit in 
CLASS_W register):
"Under Register control, the HPOUTL_VOL, HPOUTR_VOL, LINEOUTL_VOL and 
LINEOUTR_VOL register settings are used to control the charge pump mode 
of operation.
Under Dynamic control, the audio signal level in the DAC is used to 
control the charge pump mode of operation."

The second sentence do not explain that volume register is still 
considered by the component but likely in a different way.

It is important to note that I trace I2C transactions and, without the 
patch, the CLASS_W register is written JUST after volume update 
registers (with the patch is written before and after).

At this point I have no doubt that we have to update that register 
before writing volume.

I guess: is there another way to do same/similar thing (in a better way, 
like just force write to that register a little bit before of volume 
update. I walk around regmap/regcache but I do not find a different 
solution)?

We must pay attention that cached value of this register can be changed 
by widget "Class G" (my patch should work also if you toggle this widget).

Thank you,
best regards.

Emanuele Ghidoli






