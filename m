Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF664CD35
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 16:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4364A2A6C;
	Wed, 14 Dec 2022 16:42:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4364A2A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671032619;
	bh=/tFLehCAzM84E9C+o+H9cH56sC+XHk7hf8Zjk2VARkk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EbeMFqTyy8sUOEMN+5E7nZTTdfQ8mNoPryOWxIzEoa80mAhWZCE7uLlm9oy42kFcj
	 ePITgztBDEghaih0+TJmMqGXljxInp/SUW9dHbO1cqlX3onw4wtnD1hBTsoY+GryiE
	 0ItQ3xg2Z8LpPs4casJAmNHiybsKTbWn3ccvem/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB88F801D5;
	Wed, 14 Dec 2022 16:42:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B39F804D0; Wed, 14 Dec 2022 16:42:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7C1CF80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 16:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7C1CF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=L9rdWYUu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671032558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQzHZwjuXupiqlJusdYzgBRFmDan+a9C8lcInQhXBVM=;
 b=L9rdWYUuWyAsojbfDi2YyoSIYOuWD2M4eF0FmJT9j+lOvLScZgJTL3MC6gBs7CkajxiFGE
 irA/zI85sEfojX3DwPKyP2x+z6ddlYOUNFhm3CzwSEujWuYGjci9+3ncAgegbKJeBK24QJ
 vjvfGcpamdWpaJEfDoKfibuz1gg3Lg4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-cW6wGrkCOzGu5jDl4ZFM8g-1; Wed, 14 Dec 2022 10:42:37 -0500
X-MC-Unique: cW6wGrkCOzGu5jDl4ZFM8g-1
Received: by mail-ej1-f71.google.com with SMTP id
 hs18-20020a1709073e9200b007c0f9ac75f9so11560905ejc.9
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 07:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQzHZwjuXupiqlJusdYzgBRFmDan+a9C8lcInQhXBVM=;
 b=TvzHrH6WaYfAANjwwcyVL1a/qBbHTD8PxFKFKF/I70AlUrsvvY3GInjMMQDarQgViQ
 PZNPdpS9vNxQ6l4gQ/qQafKLwpRhrmXYGlIPR510nx5b4dSCXE+JwU69nD02dAKnZYB3
 zqrhakQoFPYSeebx+30HsKYonGS4lLNAisIlPtfPVjWH1KrA6ReYZnSaKJCJuZB9prB6
 sA7UsSAIia06LQquFc3XVCw+YFdCNA5TgDGXrjwsPL8Zctry8CBTyHPO2xZMPnLos+u1
 mX6hNlPyLAJv2JxkqTGA4banciaCmHnGf9LfWvpMozolLKeMPcw6V3oT9Lg9YMqlTBQb
 jUUg==
X-Gm-Message-State: ANoB5pnT+qONjj1Klc4CXibgpEzbZ8BhssAeBBhOOUguQeXOGrcBOWYe
 D0PmFcgRm/VCA6IVvjCgQqBSMbZ1aggr5wzjhD7t7tldQTZm00IvOJocDTGagoPSWwTaZz0yCnD
 42IVDlcF8JoasflHzuUmc/Ws=
X-Received: by 2002:a17:907:90d8:b0:7c0:e302:b523 with SMTP id
 gk24-20020a17090790d800b007c0e302b523mr16515536ejb.59.1671032556382; 
 Wed, 14 Dec 2022 07:42:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf63c7L8UGtfrL6TE+DGeYWq+KxeHIlGEceOMBDac035oAfK6UfailMlLf0IPYbKTOyjFxbIWg==
X-Received: by 2002:a17:907:90d8:b0:7c0:e302:b523 with SMTP id
 gk24-20020a17090790d800b007c0e302b523mr16515530ejb.59.1671032556231; 
 Wed, 14 Dec 2022 07:42:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a17090676ca00b007c4ed5ced79sm888756ejn.73.2022.12.14.07.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 07:42:35 -0800 (PST)
Message-ID: <92358ff1-86ca-76b0-c4f3-3d4e0dddc80a@redhat.com>
Date: Wed, 14 Dec 2022 16:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Add HP Stream 8 to bytcr_rt5640.c
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Moises Cardona <moisesmcardona@gmail.com>, cezary.rojewski@intel.com
References: <20221213173550.1567875-1-moisesmcardona@gmail.com>
 <08403fff-359b-b5f4-d039-18eeef660637@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <08403fff-359b-b5f4-d039-18eeef660637@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, akihiko.odaki@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 12/13/22 20:04, Pierre-Louis Bossart wrote:
> 
> 
> On 12/13/22 11:35, Moises Cardona wrote:
>> The HP Stream 8 tablet is identical to the HP Stream 7 in terms of the PCB,
>> with the exception of the added SIM Card Slot. 
>> Therefore, I'm submitting this patch which properly initializes the audio 
>> and enables the headphone jack to work, just like it does in the 
>> HP Stream 7.
>>
>> Signed-off-by: Moises Cardona <moisesmcardona@gmail.com>
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Note this is the old version which wrongly contains the
BYT_RT5640_MONO_SPEAKER flag.

Mark, please merge the new version (which unfortunately
was not marked as v2) which correctly drops
the BYT_RT5640_MONO_SPEAKER flag.

(this tablet has 2 speakers so it should not have the mono flag)

Regards,

Hans


> 
>> ---
>>  sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
>> index fb9d9e271845..1d964b1ceff4 100644
>> --- a/sound/soc/intel/boards/bytcr_rt5640.c
>> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
>> @@ -796,6 +796,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>>  					BYT_RT5640_SSP0_AIF1 |
>>  					BYT_RT5640_MCLK_EN),
>>  	},
>> +	{	/* HP Stream 8 */
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP Stream 8 Tablet"),
>> +		},
>> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
>> +					BYT_RT5640_MONO_SPEAKER |
>> +					BYT_RT5640_JD_NOT_INV |
>> +					BYT_RT5640_SSP0_AIF1 |
>> +					BYT_RT5640_MCLK_EN),
>> +	},
>>  	{	/* I.T.Works TW891 */
>>  		.matches = {
>>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
> 

