Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F036BA1F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 21:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2ACE16FC;
	Mon, 26 Apr 2021 21:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2ACE16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619465817;
	bh=tStKzraodU3QSSuNlK1Ht7HlomY2keS67uevCWOTHEk=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScRjtUQewTpQNcIKlhDiCwIZXlGKDAq2mjImBtJrO6NfnPIMKa/x4PCIkaYpGB1O5
	 sciRPJlSBL9QZfLnEl7KlD2+EOAXD/Bj950AtYzoPz187tlEYdqi9tC3deHsisN2Ch
	 L21FjcfvepEAIHydarrXYT2bR4KV51ysylFlabI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0331DF800F0;
	Mon, 26 Apr 2021 21:35:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F460F8016C; Mon, 26 Apr 2021 21:35:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C079F8012A
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 21:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C079F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="UgEJ4d6l"
Received: by mail-ed1-x530.google.com with SMTP id g14so7450601edy.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=CQWUshTzpRmPn2kJI0awd5uuYv8OmvrDOIgcP4epbdo=;
 b=UgEJ4d6lj6QZe9Wb9lBm+Sehhc2qr51WrpP8QFbbM9d582S2l/LI9xlU7m3bqnZV+h
 YWzj9SXTma6HfNiA3yZNNiZHB1fHM64TBQJVV8r0RbJa6ODKehpCdz2Akhg9hNypvUvX
 UbN3SANLkszu/zz9p4k4rAiA/WO8ht1mTb2l9KGWGavhR+iOOkwURlkfKCr/SFHV+tsG
 /mhEjnHgjUUfaH4vMywpldGudvXfIzx4JOWXEzl/uLiPO2iAHwL79TSA4GuKIiWspdsy
 3FkCTfwkw9zRlOY/TVf5LCzZ1h1ChQgXrxrvWrKCwmpQhZuH7CScSbdoot+QkkBVHZ77
 prWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=CQWUshTzpRmPn2kJI0awd5uuYv8OmvrDOIgcP4epbdo=;
 b=BqxlcROlXh/ieMyz+ekq4qEBvjb104L6VDPo2LIhZUQd0bQ0yAR/Anw3Nwt64cE9Tb
 A9PRlvS8HLr19sb3Vq4h9lX7CBZwpzUpAprIevceyH/Brq+vqM5K1E/VVweftHiIsQwW
 Ckylv3rl+dJxHWcbota+B9lF7A2P0tiaKCMRsOLGcBMXR90k3Mf/IbrprhxIYj12KGg/
 OplG+XmB94R+tTg82fY94bsf6XxJHxMMsEQ1i27i8gf+4gV+bt3XdhxcuTY1FryfzVAb
 Oq8ITqDuq9fBOvziVFZd1HZjmvjCwuRI1ZLFKTr8JPmtb7lyvUmruxaCGNZ7UCHZZ++9
 n2wQ==
X-Gm-Message-State: AOAM5335Jf8JBa1XvSL+IjQHB5CPogIkB0+VqG3RDK46TFUWjwS/K64S
 6G/2xxUAHwLPuLWNSTCm6vIy/NG+eoLtuTu7
X-Google-Smtp-Source: ABdhPJxM0NPc0wTLTrpZQiQ9fEaasVr+Fn2nyt6rZifY1v4dPxvGYPoILKkyK9YLax7we0Yhx9f4HQ==
X-Received: by 2002:a50:9e4f:: with SMTP id z73mr294004ede.338.1619465715126; 
 Mon, 26 Apr 2021 12:35:15 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id d24sm602306edp.31.2021.04.26.12.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:14 -0700 (PDT)
References: <20210421120512.413057-1-jbrunet@baylibre.com>
 <20210421120512.413057-6-jbrunet@baylibre.com>
 <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
In-reply-to: <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
Message-ID: <1j7dkon8jy.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 26 Apr 2021 21:35:13 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


On Mon 26 Apr 2021 at 20:10, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> On 4/21/21 7:05 AM, Jerome Brunet wrote:
>> Instead of using the clk embedded in the clk_hw (which is meant to go
>> away), a clock provider which need to interact with its own clock should
>> request clk reference through the clock provider API.
>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> This patch seems to introduce a regression in our modprobe/rmmod tests

Really sorry about that :/

>
> https://github.com/thesofproject/linux/pull/2870
>
> RMMOD	snd_soc_da7219
> rmmod: ERROR: Module snd_soc_da7219 is in use
>
> Reverting this patch restores the ability to remove the module.
>
> Wondering if devm_ increases a module/device refcount somehow?

The driver is the provider and consumer, so it is consuming itself.
This was the intent, I think the patch should be correct like
this. Maybe I overlooked something on the clock side. I'll check.

I'm not sure the problem is devm_ variant, it might be 
clk_hw_get_clk() simpler variant which also plays with module ref counts.

I don't have this particular HW to check but I'll try to replicate the
test with a dummy module and report ASAP.

Of course, I suppose the same problem applies to PATCH 1 of the series

>
>> ---
>>   sound/soc/codecs/da7219.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
>> index 13009d08b09a..bd3c523a8617 100644
>> --- a/sound/soc/codecs/da7219.c
>> +++ b/sound/soc/codecs/da7219.c
>> @@ -2181,7 +2181,10 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
>>   				 ret);
>>   			goto err;
>>   		}
>> -		da7219->dai_clks[i] = dai_clk_hw->clk;
>> +
>> +		da7219->dai_clks[i] = devm_clk_hw_get_clk(dev, dai_clk_hw, NULL);
>> +		if (IS_ERR(da7219->dai_clks[i]))
>> +			return PTR_ERR(da7219->dai_clks[i]);
>>     		/* For DT setup onecell data, otherwise create lookup */
>>   		if (np) {
>> 

