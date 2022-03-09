Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E9D4D3A98
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 20:48:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0819716F2;
	Wed,  9 Mar 2022 20:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0819716F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646855296;
	bh=RoZQXzEm1sxwQIEyY20T2ZTchgo0hd0AXvKg7urY0B0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4a09val+Ns3QLK8ONroTOLRa1mL1dZu+eOeoVm+SxMmU9Twb9K0Yp9Rk7XHmnlIb
	 KrAWXO/OVuSWUYjRxum5YkSgjdKMdRYymKlFijm9bYdNCBp+hrpK+/moAa6ZPG4fIy
	 1I3sIjBbNrLlurAlQmO+qrqdwHAWp1uWk96Esa/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 611FFF80236;
	Wed,  9 Mar 2022 20:47:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC845F8016C; Wed,  9 Mar 2022 20:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A622CF80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 20:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A622CF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="moRl3Vqr"
Received: by mail-ed1-x534.google.com with SMTP id c20so4233792edr.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eJLW/eZDU7cgCCuYkQHvfMFPuHtxGiM/4asfC8lKWQs=;
 b=moRl3VqrzFzYV/i/A6DfyrbnNw3xVbz0aSV6xzlKloEZVGE/kTXNZbAiONcGlevVM0
 HMVZxvgJakmTfy+IeE5v5fQnfDLhlqMihDMsWxsOlP9wa9/okDrI4NhNgMBfIdulaYG1
 sopoaEGfxm9p1AJEZMBpw276dwkArx5tk8xThEw9fGij/vd0sBSGGeJMNbn9baQFL4m1
 JxecuUts+hEWaWlZ8XIGBpfZhNH/gdIvUXJWH7QRMDzXaCpqFxgYt82LtNbOhNX3Iztq
 94nlmGik7veLnxIj79b4mMTVnpCOdhpUAz+XhH9Tiaus+gqXnt6tR5IxNgz3eKieHe6Z
 JTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eJLW/eZDU7cgCCuYkQHvfMFPuHtxGiM/4asfC8lKWQs=;
 b=bAfYmGjAzg4iQQj3yHOAye/6UtKIKjx+6YHFbmBjm6/zch1okxegBFzVqwMP1VPATZ
 XCbJoh52Px9KBOkEtISvUY/exagDFE1C0GIxdz48ZZdaXckJzRl0RGJAeAzKW3CQV+5f
 Gy0+/cfnx967lF2hG8HyUlzQuI+tuqxtJpPFa3AgkC0HXxsPlEDFSY4HJ0vwYzJKbEcZ
 sf7sdMBu41ArnjTI8wqIadhkprtUjl13GQJ6tkbXiEBBbru1cE4Zjx/ygMccypn1mhkq
 Zzh0JbahHDzKw74whKdJJdYaNjBPprbON4NaBoewbacIIcKrPr9o16gLqPOF0iTPCNH3
 f3og==
X-Gm-Message-State: AOAM533TPgimHlWheQ3k/2eblDM+4YF7Xa6epoFdq/RvW3hJe2aiz1tx
 uThH6K/ouyA56SBqQrn+qtg=
X-Google-Smtp-Source: ABdhPJzE+teccexKViOHUw3lh1KruK2n2PlRayWqntrATahOiP/TNsQt2o0l/S7jWH2WCxcY/ibJdQ==
X-Received: by 2002:a50:fc12:0:b0:415:cf24:f6c2 with SMTP id
 i18-20020a50fc12000000b00415cf24f6c2mr1059117edr.3.1646855222064; 
 Wed, 09 Mar 2022 11:47:02 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020a50cfce000000b00415b0730921sm1277649edk.42.2022.03.09.11.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 11:47:01 -0800 (PST)
Message-ID: <4568c9bf-50d3-1fe5-795c-1d98136dba93@gmail.com>
Date: Wed, 9 Mar 2022 20:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
 <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On 09.03.2022 00:42, Jerome Brunet wrote:
> 
> On Tue 08 Mar 2022 at 20:00, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> On a S905W-based system I get the following error:
>> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
>>
>> Turned out that multiple components having the same name triggers this
>> error in soc_init_component_debugfs().
> 
> Because the component name is directly derived from the dev name
> 
>> With the patch the error is
>> gone and that's the debugfs entries.
>>
>> /sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
>> /sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
>> /sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller
>>
>> Because debugfs is affected only, this may not be something for stable.
> 
> It is not entirely true that only debugfs is affected, though it is the
> only thing really complaining.
> 
> I had a similar tweak around debugfs entry when I first submitted the
> AIU. There was a discussion around that:
> 
> https://patchwork.kernel.org/project/linux-amlogic/patch/20200213155159.3235792-6-jbrunet@baylibre.com/
> 
> I proposed a solution which got merged but ended up breaking other cards
> because there was some assumptions around what the component name
> is: basically the dev_name since there was originally 1:1 mapping
> So it had to be reverted.
> 
> Full details here:
> https://patchwork.kernel.org/project/alsa-devel/patch/20200214134704.342501-1-jbrunet@baylibre.com/
> 
> Unfortunately I did not had the time to continue working on it since them
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  sound/soc/meson/aiu.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
>> index d299a70db..c1a2aea5f 100644
>> --- a/sound/soc/meson/aiu.c
>> +++ b/sound/soc/meson/aiu.c
>> @@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>>  
>>  	*dai_name = dai->driver->name;
> 
> While I don't really mind one way or the other about the prefix itself,
> aiu_of_xlate_dai_name() is not the place to tweak it.
> 
> This should be done before adding the component, not when parsing the DAI
> with DT.
> 
> If this is really a problem and Mark is Ok with, what you want to do is
> revert commit 024714223323 ("ASoC: meson: aiu: simplify component addition")
>>  
Thanks a lot for the links and for pointing me in the right direction.
The revert you mentioned would need a little bit of trivial tweaking
due to changes of the underlying code.
However based on what I read so far in the linked discussions I have
another idea to make the solution more generic. I'll submit the
patches and then we can decide how to go on.

>> +	switch (component_id) {
>> +	case AIU_CPU:
>> +		component->debugfs_prefix = "aiu_cpu";
>> +		break;
>> +	case AIU_HDMI:
>> +		component->debugfs_prefix = "aiu_hdmi";
>> +		break;
>> +	case AIU_ACODEC:
>> +		component->debugfs_prefix = "aiu_acodec";
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>>  	return 0;
>>  }
> 

