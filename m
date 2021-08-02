Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9414C3DD9DA
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00DBF167F;
	Mon,  2 Aug 2021 16:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00DBF167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627913114;
	bh=hwtayGOB2BIA0jCDpr5gOkYOamv+/kZ6DshMfmjmUEU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/ud808hIHO1W74FLrWT/6JUojnIp7u83x15AAcEgwpswPfWrQYbYG/C2TklbRpEv
	 zRjfIr560xTl1wpDSft9GongZoydBtiyNZBSNC5xYBu3kQRVoTjqvXbsh8D58DbJfN
	 Hhysa52PZGel0MYKItE4vG+DqRZ/Far4vboNleDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60930F80268;
	Mon,  2 Aug 2021 16:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3538F8025F; Mon,  2 Aug 2021 16:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DEB1F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DEB1F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="croIUMu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627913015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REeXY46g3LKfX9UPgKPO6rZsEs3Hs04nk2OhQcHScvU=;
 b=croIUMu47Y9LGNEqKZIJeZ9gNaloCZEgWRCtO9PF3ljVUjzdxdupueLjV5htdJPype9msa
 vdKRPBClgTJL2tcEHyhcxily7qN0q89ex7AFwrAF4eydSUr6CM+NG73SgsuliOzE34xC9O
 Om5oa9H9fMtQoojMndUSiIJk2abEfag=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-nYJPNs9QM9O7Q9euMMu_EQ-1; Mon, 02 Aug 2021 10:03:34 -0400
X-MC-Unique: nYJPNs9QM9O7Q9euMMu_EQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 a23-20020a50ff170000b02903b85a16b672so8832730edu.1
 for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021 07:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=REeXY46g3LKfX9UPgKPO6rZsEs3Hs04nk2OhQcHScvU=;
 b=NWO9c3lHiYxXg2uM+iNnZlvVqESilKUAclYCyURCMhpDvTJa191rFCvyfXjmZp9wLR
 CPPF56dpON82cdH5NpL0AhIL7ApRYWxCpehdLZc/eYBCDC17GdgwZ5xbzdonbwcf5JHd
 3PtA8Pp2Zt+a4vz/XbHs33ZthYixZWQU6GBMTBnmsPcN7yEL9cuu+KN6vX1evf3xNsCm
 8zG/bRSkn5JDXQdC0OUV7e5eZaAGw55stoFJ6mRFPlQjLB1uDP9Q0yYs1gzVP2vFRByK
 pq2rvFft5xy7zd65En+yC5EGoBw+9+3AQJCzG1+xrJzCoNEJ1+hqy1BTc5QKfqGbh8LY
 nqKA==
X-Gm-Message-State: AOAM532vN/I7MSd7hSU8mwL7L6sJ3tz1Y10u7m5VHAeFoHoN4Woozkcc
 dJ5QAL8YoTB8h0GYGCuwzr6VyTR95E0CYoK0B0ExH2DekTdk4jYq4R3HO9zntG9hggHalj9FtY0
 6i7ZkjLPy42gsh4qsQkIulLo=
X-Received: by 2002:a17:906:1fd3:: with SMTP id
 e19mr15653859ejt.421.1627913013152; 
 Mon, 02 Aug 2021 07:03:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/CuXWoEgnoYYkXf+CWwwbUnTWeVoDnYsB98pfVf2caRcYcGLB1yJZsIHpfFfBz69LYlK9Vg==
X-Received: by 2002:a17:906:1fd3:: with SMTP id
 e19mr15653842ejt.421.1627913013009; 
 Mon, 02 Aug 2021 07:03:33 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
 by smtp.gmail.com with ESMTPSA id l2sm4561336ejg.37.2021.08.02.07.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 07:03:32 -0700 (PDT)
Subject: Re: [PATCH 4/6] ASoC: Intel: bytcr_rt5640: Add support for a second
 headphones output
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210801210431.161775-1-hdegoede@redhat.com>
 <20210801210431.161775-5-hdegoede@redhat.com>
 <101f39fb-03e3-5512-a9fc-2c569fcb98fc@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a373f102-fe2a-3f64-4023-497a072fc0d5@redhat.com>
Date: Mon, 2 Aug 2021 16:03:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <101f39fb-03e3-5512-a9fc-2c569fcb98fc@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

Hi Pierre-Louis,

On 8/2/21 3:45 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 8/1/21 4:04 PM, Hans de Goede wrote:
>> Some devices (HP Elitepad 1000 G2) have a second headphones output
>> (1 on the dock, 2nd on the tablet itself) which is implemented through
>> the line-out output of the codec combined with an external hp-amp
>> which gets enabled through the codec's GPIO1 pin.
>>
>> Add support for this through a new BYT_RT5640_LINEOUT_AS_HP2 quirk.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  sound/soc/intel/boards/bytcr_rt5640.c | 36 +++++++++++++++++++++++++--
>>  1 file changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
>> index 70faba13450c..51fb44ad9b4b 100644
>> --- a/sound/soc/intel/boards/bytcr_rt5640.c
>> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
>> @@ -74,6 +74,7 @@ enum {
>>  #define BYT_RT5640_MCLK_25MHZ		BIT(23)
>>  #define BYT_RT5640_NO_SPEAKERS		BIT(24)
>>  #define BYT_RT5640_LINEOUT		BIT(25)
>> +#define BYT_RT5640_LINEOUT_AS_HP2	BIT(26)
> 
> The definitions aren't fully clear to me. It seems that the two quirks
> above are mutually exclusive if I read the code below
> 
> +	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT_AS_HP2)
> +		lineout_string = " cfg-hp2:lineout";
> +	else if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
>  		lineout_string = " cfg-lineout:1";
> 
> But in the following patch the two are mixed:
> 
> +		.driver_data = (void *)(BYT_RT5640_DMIC2_MAP |
> +					BYT_RT5640_MCLK_EN |
> +					BYT_RT5640_LINEOUT |
> +					BYT_RT5640_LINEOUT_AS_HP2 |
> +					BYT_RT5640_HSMIC2_ON_IN1),
> 
> so maybe the test above should be
> 
> if (byt_rt5640_quirk & BYT_RT5640_LINEOUT) {
> 	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT_AS_HP2)
> 		lineout_string = " cfg-hp2:lineout";
> 	else
>  		lineout_string = " cfg-lineout:1";
> }

Right, I decided to first add plain line-out support (which may be
useful elsewhere) and then to build the hp2-out using external-amp connected
to lineout on top of that. So your suggestion to change the test to set
the lineout_string makes sense. I'll fix that for v2 of the patch-series.

> I am also not very clear on the hp2 support, is there any sort of jack
> detection or will this require always an explicit user choice?

Quoting from:

"""
I've also figured out how jack-detect works, since the codec's GPIO1 is used for the external-hp-amp enable, the jack-detect signals are directly connected to the Bay Trail SoC's GPIOs:

  -gpioget 'INT33FC:02' 14 && gpioget 'INT33FC:00' 0 && gpioget 'INT33FC:00' 3
   Nothing inserted: 1 1 0
   Headset  in dock: 0 1 0
   Headphon in dock: 0 1 1
   Headset  in tabl: 1 0 0
   Headphon in tabl: 1 0 0
   Conclusion:
   GPO2 pin 14: !jack in dock
   GPO0 pin  0: !jack in tablet
   GPO0 pin  3: 1 when jack in dock with no mic

And I believe that the mic on the tablet jack can be detected using the normal micBIAS over current detection which is normally also used.

This will require some special jack-detect handling inside the machine driver for this model. I plan to also add support for this when I have some time to work on this.
"""

So ATM this requires an explicit user-choice, but I plan to add support for
jack-detect on both jacks when I've some more time to work on this.

Regards,

Hans

