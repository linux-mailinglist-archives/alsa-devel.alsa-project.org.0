Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C170753526C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 19:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A78A16E8;
	Thu, 26 May 2022 19:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A78A16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653585027;
	bh=yWpkIUbHVoIQ8w4m3gi+Ptz/AQTBk6YOZOWTFicwW8c=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvxQQ9AWcyl0K46OlX9xGQt1XjF2w+iQQ4M4Glz7uonE6NF/aAQ1Cxfg5TGcx1acA
	 oEBM12RJF6h1epmBdXTBWwWBI4fKVx0qPM5V5l1S67aaCno0uX0gacfx9+59l3RrMr
	 BD0+8im8NoOpGqlEIt0wgDVrGS5jlK5oXH4OoCvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E24D3F8007E;
	Thu, 26 May 2022 19:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B29EF8014B; Thu, 26 May 2022 19:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF84F8007E
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 19:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF84F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b0GXYFVF"
Received: by mail-oi1-x230.google.com with SMTP id k186so2857924oia.2
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=Z4P1n+RPDwAQhv+HGzLzcTH1XrHOmrd6OBUiuQdQCEU=;
 b=b0GXYFVFkiLZJlLVNjxzcwGU82AbsU1Dp+m68oac1FyMN5IQZ+YpU/qkTYiHCB4ud6
 eDUoDy0PqYeKfCTr/d66stCZvJziwpKh88mUSQz+NrkFmT+TcLSCw3I5p4fbw1MK8wfH
 6PmjFaSnWAJHvs02vUEqmPLrEIgQ8RSRXTE1DV5FrdTvA3yiOmDupNVvG67XwcQPFLYN
 1z+FJV9M2qxrI8BNIYujzKSn4w1b7VhaJXaaeGYeJAr+7f1EuS4nx+5xBTroBP3u5aUk
 ojw14LeNWt88Vw3V5F4wrju92bkBq89RzN7WqhWtioOJEzx00GZSyFgOI7Fnxfsmwgvv
 ekHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Z4P1n+RPDwAQhv+HGzLzcTH1XrHOmrd6OBUiuQdQCEU=;
 b=SbVAplw+EZ4/UehQi50xt6l4VFg81SFONW9dv8Shg3B5SOPC4AHuLPT+CulesNwNbk
 GubU0zIepfXwUCt1YFmGt9SNlb7kJo1w2ZuZrAtmCEVEZaOudKGX2pggBPu21+w5JMkl
 tAjewHkCtE1JJ2N20wTLULTC2efXaK2OVYGOwE5PDqiFDTPx6WIxjWaMBB8e9BUDGBMb
 1tgZN12QGmkSHhWLteGxuzZbaffI8or/tna7j0DrTeOk+BbeV9rh6KJsZAe8mGvZ4bGL
 V8x8+k5o1aP5yW+hAnySFizhhj8L93RNM1DoHjkPVEtHOHeJ+8WIVx1KAm2LuYVyxqVW
 hETg==
X-Gm-Message-State: AOAM531VAr2w1Ub4kFwDsBChqz7PazfBVdDpZYYKRW3ctSQb2T1u2n8I
 A/0NcaaMwbX/V0kC7+birmI=
X-Google-Smtp-Source: ABdhPJw65YqN9xGLY654mtvjeQRDRi9bK6Ndeqos14EuNuMu2mDf/+PMaAwLRrqanUfjR+2jdBuyEw==
X-Received: by 2002:aca:f085:0:b0:328:c4cd:2b53 with SMTP id
 o127-20020acaf085000000b00328c4cd2b53mr1783764oih.197.1653584954095; 
 Thu, 26 May 2022 10:09:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a056870170200b000f29b86f448sm875234oae.38.2022.05.26.10.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 10:09:13 -0700 (PDT)
Message-ID: <d07cae90-4f91-97c6-a5c3-4ed03e099b63@roeck-us.net>
Date: Thu, 26 May 2022 10:09:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net>
 <36c7f378-c45f-8406-2a8a-de6e604405e7@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
In-Reply-To: <36c7f378-c45f-8406-2a8a-de6e604405e7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 5/26/22 09:31, Cezary Rojewski wrote:
> On 2022-05-26 6:24 PM, Guenter Roeck wrote:
>> On Mon, May 16, 2022 at 12:11:12PM +0200, Cezary Rojewski wrote:
>>> AVS driver operates with granular audio card division in mind.
>>> Super-card approach (e.g.: I2S, DMIC and HDA DAIs combined) is
>>> deprecated in favour of individual cards - one per each device. This
>>> provides necessary dynamism, especially for configurations with number
>>> of codecs present and makes it easier to survive auxiliary devices
>>> failures - one card failing to probe does not prevent others from
>>> succeeding.
>>>
>>> All boards spawned by AVS are unregistered on ->remove(). This includes
>>> dummy codecs such as DMIC.
>>>
>>> As all machine boards found in sound/soc/intel/boards are irreversibly
>>> tied to 'super-card' approach, new boards are going to be introduced.
>>> This temporarily increases number of boards available under /intel
>>> directory until skylake-driver becomes deprecated and removed.
>>>
>>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
> 
> 
>>> +
>>> +static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
>>> +{
>>> +    struct platform_device *board;
>>> +    int num_ssps;
>>> +    char *name;
>>> +    int ret;
>>> +
>>> +    num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
>>> +    if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
>>> +        dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
>>
>>     sound/soc/intel/avs/board_selection.c: In function 'avs_register_i2s_board':
>>>> sound/soc/intel/avs/board_selection.c:328:36: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
>>       328 |                 dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
>>                                                                                                    ^^^
>>
>> Reported by 0-day but still made it into mainline.
> 
> 
> Hello,
> 
> Thanks for the report. This seems to be a false-positive and is being addressed by a separate patchset [1]. Perhaps the cover letter for the mentioned series could have looped 0-day.

No, this is not a false positive. More like a false assumption.

> If I'm wrong about this, feel free to correct me.
> 
> 
> [1]: https://lore.kernel.org/lkml/20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com/
> 
This is incomplete. It does not address all definitions of __fls() for arc, and it
does not address the build failure for sparc64 (arch/sparc/include/asm/bitops_64.h).

Guenter
