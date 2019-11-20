Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB310421E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF201725;
	Wed, 20 Nov 2019 18:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF201725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574271013;
	bh=9UIjkHDZcZNfBf3r9tvCUW7hs2LSxtVAbPJ0+QmXI6w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dky/GyN/K/hpQTo/7b0weeAByW3XwIjeERiqWBZLmpItOV6rsunGx/FBlxXg2OVPh
	 8KZuYeITzTd1rxCOZJwTJoFz5R93y4y3wCZpx4rw940sfRVKeLqB8Ud13FEAhfFW1M
	 c4dcJSS1pRIsdHiGeLmEnYfzWFLBJB2Bdhg+ti/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E5BF8013C;
	Wed, 20 Nov 2019 18:28:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC9CEF8013D; Wed, 20 Nov 2019 18:28:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C89F800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:28:17 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 36F6FA003F;
 Wed, 20 Nov 2019 18:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 36F6FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574270896; bh=Qjt2orkau2Pb0FNV9Z4C13Lufx1adArVJZ3/UaccOs4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U/WXXoEUmhsksyBrA1APDsLyloISujKVeyiLD9XS3rp2x30JiB8kD/yNbsW84EpBB
 0a7P6XtYvUpnAhd/MBXIuZvB8srINVFiwZVENXSeg7/WCZUKTzRiI+0XF00kXZ7HSn
 IanBJ+4+XmUR0Ue9p7rqiwbuTdZ5lkvY8kDyANqg=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Nov 2019 18:28:12 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191120093712.11370-1-perex@perex.cz>
 <dfe78a0b-1cb6-ce19-61bd-86cfded0e3d5@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a1ea1c88-01e2-8226-2577-1be2114f5505@perex.cz>
Date: Wed, 20 Nov 2019 18:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <dfe78a0b-1cb6-ce19-61bd-86cfded0e3d5@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: improve the DMI long card code
 in asoc-core
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 20. 11. 19 v 15:55 Pierre-Louis Bossart napsal(a):
> 
> 
> On 11/20/19 3:37 AM, Jaroslav Kysela wrote:
>> Add append_dmi_string() function and make the code more readable.
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Mark Brown <broonie@kernel.org>
>> ---
>>    sound/soc/soc-core.c | 66 +++++++++++++++++---------------------------
>>    1 file changed, 25 insertions(+), 41 deletions(-)
>>
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index b4683d4588ee..1d1baf78818c 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -1755,6 +1755,23 @@ static int is_dmi_valid(const char *field)
>>    	return 1;
>>    }
>>    
>> +/*
>> + *
>> + */
> 
> unneeded comments or missing text?

There should be a text, of course.

>> +static void append_dmi_string(struct snd_soc_card *card, const char *str)
>> +{
>> +	char *dst = card->dmi_longname;
>> +	size_t dst_len = sizeof(card->dmi_longname);
>> +	size_t len;
>> +
>> +	len = strlen(dst);
>> +	snprintf(dst + len, dst_len - len, "-%s", str);
>> +
>> +	len++;	/* skip the separator "-" */
>> +	if (len < dst_len)
>> +		cleanup_dmi_name(dst + len);
>> +}
>> +
>>    /**
>>     * snd_soc_set_dmi_name() - Register DMI names to card
>>     * @card: The card to register DMI names
>> @@ -1789,61 +1806,36 @@ static int is_dmi_valid(const char *field)
>>    int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
>>    {
>>    	const char *vendor, *product, *product_version, *board;
>> -	size_t longname_buf_size = sizeof(card->snd_card->longname);
>> -	size_t len;
>>    
>>    	if (card->long_name)
>>    		return 0; /* long name already set by driver or from DMI */
>>    
>> -	/* make up dmi long name as: vendor.product.version.board */
>> +	/* make up dmi long name as: vendor-product-version-board */
> 
> here you are just fixing a misleading comment, yes?
> I don't see any dots to dashes substitution but better ask.

The result is LENOVO-20QE000VMC-ThinkPadX1Carbon7th-20QE000VMC. I think that 
the dots were replaced by dashes as the field separators during the initial 
implementation or so. I just reflect the current state.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
