Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6A41383D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 19:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343D715E2;
	Tue, 21 Sep 2021 19:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343D715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632245031;
	bh=+ie2y2zYefC53OAh0IUj16Ld6gPorVeEa+jGwcR1Lvo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTxSLo4WlEU8nWiBPs2cgvsWXYZKbfBARTYKmu9TUe3eYGfR8uGZ/BTC90gbfWM+I
	 4PXSGEMDtxpmtFMr1M06pK4TgDkRWgos4eg71KQGDQDtM1ewkR8sAqDgkNlDmvvTLA
	 Sq4++YhgwcBsQVthK1CtCcYvIWKZT1J9xhzEVqGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A22FF8026A;
	Tue, 21 Sep 2021 19:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAF03F80268; Tue, 21 Sep 2021 19:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=CTE_8BIT_MISMATCH, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D0A8F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 19:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D0A8F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LseMvNnA"
Received: by mail-lf1-x12f.google.com with SMTP id e15so325522lfr.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=abVBEHhP6Go4xO+SAuzlpZ2XfhQjbo4KJut33mj6ehc=;
 b=LseMvNnAKIS0DE4HVVrAP2uNuO9bLJfbhBJLbVkBfEjyH0C5g3chiU64QrSt5ALabY
 vlmUGNFbEBc9UCcp/CW3o8ZWdZqhqYJ1fSvddoMV47NWzRnyRYlvm7a19Syv3pCuoyhu
 p5rAqwZ/n2GCnj84vRZufrQl1jRp+m164bz70M4nKcBPnk6M2ltMtt1C2aPKm5j5XaRx
 U2ttYvjFmG8CmDs0hpLL/UB+CGwUoiMIe4M332rWW97JmS6J4lQvCCV26VwH+Ani0NGy
 1S6V5tFFMlG+WKypa59mvWZ1KRUHUCSAiuDHuXn3JxjeL6++gvKjuFmrJrP0XF32TkM9
 piRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=abVBEHhP6Go4xO+SAuzlpZ2XfhQjbo4KJut33mj6ehc=;
 b=izMTJcwI6iTUL3FDh0hmg9tDSew97pHGTjfdRq/oLnlwt0uixzTU/XEusS0iDhDpY4
 vs14/Y1IKid7cxecBq5oRqPoPd1rImsRhHBhB2mFxk770zvtZoudXYKCRSJJDt8Qd1UB
 NyNERPEppCrIcUcgR4Uo/F/oQTmYmWubIXnTdnKz52FEPDPcdwZVBSJrtdY8AIUrLt3w
 iCjg6LoDPEV9idrUHMfu2TiRzUGXvov9WHvYx7+JhaOViD8wjLoLB5jWs5eqmpT7wpX2
 EcNzC/5zdxMKwrfgStQvQ6KeiAdWqebjUQ5ROoDD5ctXo0yJqZ0OtI1/9E+LTpACgckv
 EN8w==
X-Gm-Message-State: AOAM532Ofmib4wgxKOEvQhXAy0whQeNU4N1mJgP9W6g4+abCF9N4XFI3
 FOhn5DQGSM9Sa9twzqzkIgU=
X-Google-Smtp-Source: ABdhPJzUn+DO5ulrKIZ6kGD9jrZeBxL5vtrUdRtnSfNzSzu7HZD2BQ9IYewBa/oPIonDSrKEPs5hlQ==
X-Received: by 2002:a19:550c:: with SMTP id n12mr23875660lfe.511.1632244946960; 
 Tue, 21 Sep 2021 10:22:26 -0700 (PDT)
Received: from [10.0.0.115] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id m17sm2180144ljp.80.2021.09.21.10.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 10:22:26 -0700 (PDT)
Message-ID: <bf0e8f5e-1952-e505-fefa-4b09f6a7c726@gmail.com>
Date: Tue, 21 Sep 2021 20:22:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
Content-Language: en-US
To: Peter Rosin <peda@axentia.se>, Mark Brown <broonie@kernel.org>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
 <7537b141-0ef1-fb44-7e02-27b4dd1e772b@gmail.com>
 <d9850534-df41-a6b3-48e2-34823f5866e9@axentia.se>
 <27f903d9-a74e-182e-b715-4124cf666f45@axentia.se>
 <8b96eb7b-8829-443f-481c-ab1772ece098@axentia.se>
 <20210921120113.GA9990@sirena.org.uk>
 <cc8d7cfb-a9ad-7881-6962-77a00118c85d@axentia.se>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <cc8d7cfb-a9ad-7881-6962-77a00118c85d@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>, Takashi Iwai <tiwai@suse.com>
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



On 21/09/2021 16:30, Peter Rosin wrote:
> On 2021-09-21 14:01, Mark Brown wrote:
>> On Tue, Sep 21, 2021 at 10:48:01AM +0200, Peter Rosin wrote:
>>> On 2021-09-21 10:10, Peter Rosin wrote:
>>
>>> Ok, so the attached works for me as well. But I don't know if it's
>>> appropriate to resume/suspend like that?
>>
>>> is:
>>>
>>> pcm512x 0-004c: Failed to set data format: -16
>>>
>>> The root cause is that the chip is in Powerdown mode when
>>> pcm512x_set_fmt runs. So, bring the chip out of suspend for
>>> the update of the format.
>>
>> How would this work if the device looses power while in suspend (eg, due
>> to the regulators being software controllable)?  If the data isn't being
>> stored in the cache then it'll need to be stored somewhere else and
>> restored on resume.
> 
> Right. Scratch v2. I'd go with the original patch. We have verified
> that the original content of the I2S_1 register is the expected 0x02
> (at least on one pcm5142) and besides, the four RSV bits are probably
> don't care anyway.
> 
> Péter might have a different opinion?

The original patch is correct, the defaults are those exactly (by TRM
and by your register read).

This at some point needs to be addressed when someone comes along with
wanting something else than I2S as default format.

Thanks for the debugging!

-- 
Péter
