Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11DA60D06A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 17:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C6E5087;
	Tue, 25 Oct 2022 17:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C6E5087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666711389;
	bh=/0t6tZKCK3KoiONU7d+bd5mbdYsOOKTTaoh0BVS8pvk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnv7wcokjX2UYPFbAo9t8HHCUIjJfxH3+db/0Qq3JAFUrplK+X8CT8l5rEcIeYd7m
	 UBa5brE4MQ8f9egw/2w4bfGn7S0gWdkaF6hsQa1SdCshIK68+Vni7W08ydd1+ruwTZ
	 hpPfczm1zXXiM8a+cP3Orcolhfm8I27ryhK4JEug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC57AF80100;
	Tue, 25 Oct 2022 17:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC556F80431; Tue, 25 Oct 2022 17:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CD8DF80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 17:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD8DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WlDNcDMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666711328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIx8sP/bB9PeDGsAfmAGW4XbpRMjuK1GotztlJjC/NQ=;
 b=WlDNcDMd8Kq5qs94yUQ4bv64/wSpviT9E8Pp4b1GkiAFdsDyhDVXORB3QKIgkSFOEesCEe
 ourNK4tKY+2vYTLcp0r01CcWFR9b8WiixOvLfMvaKrYDl5ytebDiiy8cEmOg30qRfUWkcR
 bt8UV0NV8QjkaSUURSfzEo0fub1cXtE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-eMK6XuAiMzSjOfG4XsY2UQ-1; Tue, 25 Oct 2022 11:22:06 -0400
X-MC-Unique: eMK6XuAiMzSjOfG4XsY2UQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qw17-20020a1709066a1100b0078e25b6a52fso2956464ejc.3
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 08:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIx8sP/bB9PeDGsAfmAGW4XbpRMjuK1GotztlJjC/NQ=;
 b=T/755gCsXqznT/yLKVGb+RBtCx2YCqtXHE+Gv8HYGTBK1L1E+URMXvkAm0M35ljF3R
 cu3VHxV1+ApBOp9WZ32CmXFhExgoXSxcbbSUaZiMfA+pHYr9INFvsVgD2gYJr5vp7LCi
 aLpbxbHC74xTsZKxjd5adOMKblTqfGhkU5SFpo/sWF0/vjPWRZ6v3mnOLn/NUNSy93+9
 mf+0wWRXWF+UtYw/ZA3rbNSkd6DUuu0wztXe3Fz6HJH60dezBDiI5jEoplwtSX/Yp2dM
 mGfhO97s1Iwa+yzSpY+YHKnfKYF6LEaKGn0Uy3nduF4ariQyu0xgSMkM0KCoh9kFxsEs
 +OEQ==
X-Gm-Message-State: ACrzQf22ccyefd04fCMfFcOAyj4wfg5uEqNm2YgKJj8FHfcCYiLTmX/g
 U7X+ytNWS25smInC/7ZuwcDnhLe3c2bOF6MLOQvJFCTKTuAdxFBi+mbRWJU3H5zp/bDdFB6LBd6
 si/ztny//SSoB/8f/mimAim0=
X-Received: by 2002:a05:6402:11ce:b0:45c:a364:2c3d with SMTP id
 j14-20020a05640211ce00b0045ca3642c3dmr36825950edw.204.1666711325162; 
 Tue, 25 Oct 2022 08:22:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Bn39OENO+HIZh3ff/KKRQZcy69S+6ukEY21ggkFqnYPhOiDTqv0czWlhol/41W36S3OU9lQ==
X-Received: by 2002:a05:6402:11ce:b0:45c:a364:2c3d with SMTP id
 j14-20020a05640211ce00b0045ca3642c3dmr36825937edw.204.1666711324942; 
 Tue, 25 Oct 2022 08:22:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 ky21-20020a170907779500b00788c622fa2csm1542862ejc.135.2022.10.25.08.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 08:22:03 -0700 (PDT)
Message-ID: <c2c3c635-c262-f931-0cfa-4b967f75a861@redhat.com>
Date: Tue, 25 Oct 2022 17:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add quirk for the Nanote
 UMPC-01
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20221025140942.509066-1-hdegoede@redhat.com>
 <91287204-9a3b-af63-463f-99d579db8fe3@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <91287204-9a3b-af63-463f-99d579db8fe3@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 10/25/22 16:29, Pierre-Louis Bossart wrote:
> 
> 
> On 10/25/22 09:09, Hans de Goede wrote:
>> The Nanote UMPC-01 mini laptop has stereo speakers, while the default
>> bytcht_es8316 settings assume a mono speaker setup. Add a quirk for this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  sound/soc/intel/boards/bytcht_es8316.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
>> index 6432b83f616f..a935c5fd9edb 100644
>> --- a/sound/soc/intel/boards/bytcht_es8316.c
>> +++ b/sound/soc/intel/boards/bytcht_es8316.c
>> @@ -443,6 +443,13 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
>>  					| BYT_CHT_ES8316_INTMIC_IN2_MAP
>>  					| BYT_CHT_ES8316_JD_INVERTED),
>>  	},
>> +	{	/* Nanote UMPC-01 */
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
>> +		},
>> +		.driver_data = (void *)BYT_CHT_ES8316_INTMIC_IN1_MAP,
> 
> the commit massage talks about a mono speaker, this quirk changes the
> microphone setup. Is the quirk correct?

The default quirk for a CHT es8316 codec using device is:

        } else {
                /* Others default to internal-mic-in1-map, mono-speaker */
                quirk = BYT_CHT_ES8316_INTMIC_IN1_MAP |
                        BYT_CHT_ES8316_MONO_SPEAKER;
        }

So this just drops the BYT_CHT_ES8316_MONO_SPEAKER from the default quirks.

Yes defaulting to mono is a bit weird, but the es8316 is mostly
used in very low budget devices which often have only 1 speaker.

Regards,

Hans




> 
>> +	},
>>  	{	/* Teclast X98 Plus II */
>>  		.matches = {
>>  			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
> 

