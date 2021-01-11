Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C922F21C2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 22:26:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 347361751;
	Mon, 11 Jan 2021 22:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 347361751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610400408;
	bh=pJjKYZtiPlODEbYxxbKwFMOMyHssIK7t8LlECH8Q2ig=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Skc7PjeTtSABvNv4kyHZIjNpJLpfdOYJrMnVXJdsjwgrq6Ax8addh8/H0GA78F+5F
	 /AAukQTZR+RUpOpBr7DSuugPCr59Qa1/hj2svS1fHn6f8jx5eNaUNepDByEYZf95is
	 UF838lwPueZaP1EEGo53ud27OHCBMxS0T5cFTI8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A939AF8016C;
	Mon, 11 Jan 2021 22:25:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80ED0F8016D; Mon, 11 Jan 2021 22:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9C6AF800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 22:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C6AF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ABDGd1ry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610400300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TWvqrIVm+eS1cOB00SDFYgHatsARh3E9H2TndpfG6E=;
 b=ABDGd1ryrKsS6u3E95eJ70b5HliMs4b2OZnbaqMEjY4zX6+gbpvvCoJm8/3WPqlVk54Aem
 xOYcvzxacW/cc0DpPl97UsOcxkWmTHUz+sBx0nPpv5RkNEOfYUk78ZC+IjSKTN+kiz9NSb
 leUwbbWTeX9jBawaByz96ERuoS+W7FY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-YRGYXeJbOYm-YhgnXT544A-1; Mon, 11 Jan 2021 16:24:58 -0500
X-MC-Unique: YRGYXeJbOYm-YhgnXT544A-1
Received: by mail-ej1-f70.google.com with SMTP id p1so143932ejo.4
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 13:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5TWvqrIVm+eS1cOB00SDFYgHatsARh3E9H2TndpfG6E=;
 b=kbhIqrhqoAXFprhZZYE2dnEpyg1qV2CmDll8H+TdM0MgIPBDIVWDuOYl0+qTS/ncUh
 jqzRa4yBZtS9oz0+/f9rjVWD4PDaDembjbh09vo94Bbf50vT4rBmX8Lfne0ILtDRKgR5
 fZ3SAcxuTyPZ4UoFHkCfShYyB8khcitWcERJLuitwJ5nDD7Bn6Vzx0THrpgY0FKWNvSC
 bxbR1FhoYJNoj2Sdi2sonMfv2ZRwfDn9Gdzfug504tNTew/WXqL1DdaLR3gLFqv0+A3J
 9RZzIq/50Sh3juckuMDCYn6DYBi0HoCVHzt+C6t0yJ3LazEsbkvTseRRdtdaVwForV72
 DQ8A==
X-Gm-Message-State: AOAM531tnkWzXxF2XLR4y0oC44obpLGlfX4efTN01KG7YkTsP24TIU9W
 IijFQ9xzxD5iytYy5PhSanwafFG4uKeJgJi3p2ofjQ0k7gLvaCELsqus854g1iJvTwsCv8Kz6S8
 0GGE/fZyCu4UhcaJ/jLJ0EoM=
X-Received: by 2002:a17:906:8151:: with SMTP id
 z17mr978464ejw.48.1610400296191; 
 Mon, 11 Jan 2021 13:24:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxXhXldBoE2+pr7QCaS5A+yMjdW8BmlmZyOL9jrU41uAREPuAsgEFGMQIXw8nX9gHpG66zKg==
X-Received: by 2002:a17:906:8151:: with SMTP id
 z17mr978453ejw.48.1610400296046; 
 Mon, 11 Jan 2021 13:24:56 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id rs27sm349583ejb.21.2021.01.11.13.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 13:24:55 -0800 (PST)
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirks for DeeQ X5-Z8300
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chris Chiu <chiu@endlessos.org>, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com
References: <20201216041601.5993-1-chiu@endlessos.org>
 <8d4f7c48-cb3e-a868-3d48-fe63a3113ea1@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <835f8b2e-5e9a-b8db-d126-d0cd5f0ec075@redhat.com>
Date: Mon, 11 Jan 2021 22:24:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8d4f7c48-cb3e-a868-3d48-fe63a3113ea1@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux@endlessos.org
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

Hi,

On 1/11/21 6:05 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 12/15/20 10:16 PM, Chris Chiu wrote:
>> DeeQ X5-Z8300 is a laptop empowered by Intel Atom Cherry Trail. Add
>> quirks to select the correct input map, jack-detect options to enable
>> jack sensing and internal/headset microphones.
>>
>> Signed-off-by: Chris Chiu <chiu@endlessos.org>
> 
> You probably need to re-send and CC: maintainers (Mark Brown, Takashi Iwai) and Hans de Goede who's been supporting all those quirks.
> 
> I don't think the changes below are fully correct, most quirks start with       
> .driver_data = (void *)(BYT_RT5651_DEFAULT_QUIRKS |
> 
> which e.g. enables the MCLK and overcurrent handling.
> 
> I wonder if what you need is
> 
> .driver_data = (void *)(BYT_RT5651_DEFAULT_QUIRKS | BYT_RT5651_IN1_IN2_MAP)

Ack, BYT_RT5651_DEFAULT_QUIRKS is:

#define BYT_RT5651_DEFAULT_QUIRKS       (BYT_RT5651_MCLK_EN | \
                                         BYT_RT5651_JD1_1   | \
                                         BYT_RT5651_OVCD_TH_2000UA | \
                                         BYT_RT5651_OVCD_SF_0P75)

So compared to the quirk from the original patch that will add:

BYT_RT5651_MCLK_EN
BYT_RT5651_OVCD_TH_2000UA
BYT_RT5651_OVCD_SF_0P75

Since you have working jack-detect you will definitely want the latter 2
which will make headset vs headphones detection work and will add
button-press detection for headsets.

BYT_RT5651_MCLK_EN is also a quirk which you almost always want,
the sole exception is boards where the mclk is not connected which
are very rare. Boards where the mclk is not connected are easy to
spot, since they will not work at all when setting BYT_RT5651_MCLK_EN,
so if things work with BYT_RT5651_DEFAULT_QUIRKS then setting
BYT_RT5651_MCLK_EN is the right thing to do.

Tl;DR: use (BYT_RT5651_DEFAULT_QUIRKS | BYT_RT5651_IN1_IN2_MAP) as
Pierre-Louis suggests.

Regards,

Hans






> 
>> ---
>>   sound/soc/intel/boards/bytcr_rt5651.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
>> index 688b5e0a49e3..9df09e26b05a 100644
>> --- a/sound/soc/intel/boards/bytcr_rt5651.c
>> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
>> @@ -507,6 +507,14 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
>>                       BYT_RT5651_SSP0_AIF1 |
>>                       BYT_RT5651_MONO_SPEAKER),
>>       },
>> +    {
>> +        .callback = byt_rt5651_quirk_cb,
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "DeeQ"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "X5-Z8300"),
>> +        },
>> +        .driver_data = (void *)(BYT_RT5651_IN1_IN2_MAP | BYT_RT5651_JD1_1),
>> +    },
>>       {}
>>   };
>>  
> 

