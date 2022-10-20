Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2949606743
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 19:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 531DEBB32;
	Thu, 20 Oct 2022 19:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 531DEBB32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666288072;
	bh=L7ZjBSA0TK9lMi6yyFaJdFlAkQ83k7++xezYdVgpueE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6XPhu2gERVvrPoC9X+eCAKqolYuv7Z5j6dihlEoqHtbTUO49Xcm0ygcV8jddOdil
	 XhWKa0neylzQXDLBirY7cU044OAgLHfqxw/k0qVFWpehjhWquwd6jrYrteGi4tpH1k
	 gmZSlNxqXxjCAcLj42ymsXpok0YQv/xoQs//Sxkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C580CF804E5;
	Thu, 20 Oct 2022 19:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1A0EF800EC; Thu, 20 Oct 2022 19:46:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2040F800EC
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 19:46:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EBCA6A003F;
 Thu, 20 Oct 2022 19:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EBCA6A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1666288010; bh=xFX2zwGJ+S6r4P3k40npiR86ViJFmihHz8FfdD200+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=2oAlLK2yeofSrDPqkM7GuCA54yO1W86JHferth189vcCey8L7aVpYPM6ItEndHPfk
 CEAfA0dTaa4gqpUeAZOP3PSRyxdeScn2FFMoCZYyFWwZdIymj6nggDX6wdC689VSjj
 LPJYMdqLrKCmltdTRX/eLj8gOdOAkc9CkUiUMGus=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 20 Oct 2022 19:46:46 +0200 (CEST)
Message-ID: <2285503b-b2cd-bca4-d491-cf4e8eaac92a@perex.cz>
Date: Thu, 20 Oct 2022 19:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
 <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
 <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On 20. 10. 22 18:27, Pierre-Louis Bossart wrote:
> Hi Jaroslav,
> 
>>>> The driver field in the struct snd_ctl_card_info is a valid
>>>> user space identifier. Actually, many ASoC drivers do not care
>>>> and let to initialize this field using a standard wrapping method.
>>>> Unfortunately, in this way, this field becomes unusable and
>>>> unreadable for the drivers with longer card names. Also,
>>>> there is a possibility to have clashes (driver field has
>>>> only limit of 15 characters).
>>>>
>>>> This change will print an error when the wrapping is used.
>>>> The developers of the affected drivers should fix the problem.
>>>
>>> How should we fix this problem?
>>>
>>> I see all kinds of errors thrown in our first CI results based on
>>> 6.1-rc1:
>>>
>>> [   12.684893] kernel: cml_rt1011_rt5682 cml_rt1011_rt5682: ASoC: driver
>>> name too long 'sof-cml_rt1011_rt5682' -> 'sof-cml_rt1011_'
>>>
>>> [   12.219660] kernel: bxt_da7219_max98357a glk_da7219_mx98357a: ASoC:
>>> driver name too long 'sof-glkda7219max' -> 'sof-glkda7219ma'
>>>
>>> I have no idea what is expected here in terms of naming. It's far from
>>> obvious to respect the 15-character limit AND have something
>>> readable/sensible given the proliferation of hardware skews.
>>>
>>> Any suggestions?
>>
>> The question is, how deep the driver name should describe the hardware
>> details. The two drivers covering the majority hardware use "HDA-Intel"
>> and "USB-Audio" strings here and there are a lot of variants of the
>> codec / user space devices / mixer controls. The codec chain and
>> eventually the audio bridge can be described in other identification
>> strings like card components or the card name (note that most end users
>> are not able to identify the references to hardware - it's a GUI string).
>>
>> I would use "SOF-Intel-CML" and "SOF-Intel-GLK" strings or just
>> "SOF-Intel" or any other variant as you like (lower case etc.). My
>> opinion is that it's not necessary to have an unique string per driver
>> here (the drivers should have just something common like the SOF core
>> code).
> 
> ok, adding 'SOF-Intel' would be fine, but remind me again how to set
> the driver name?
> 
> We already set the card name to e.g.
> 	broxton_audio_card.name = "glkda7219max";
> then the sof-prefix gets added, and that's what we use for UCM [1]
> 
> how would I modify the driver name?
> 
> If I just go ahead and set .driver_name = "SOF-Intel" in the card
> declaration, isn't this going to impact the calls to
> 
> 	soc_setup_card_name(card, card->snd_card->shortname,
> 			    card->name, NULL);
> 	soc_setup_card_name(card, card->snd_card->longname,
> 			    card->long_name, card->name);
> 	soc_setup_card_name(card, card->snd_card->driver,
> 			    card->driver_name, card->name);
> 
> 
> #define soc_setup_card_name(card, name, name1, name2) \
> 	__soc_setup_card_name(card, name, sizeof(name), name1, name2)
> static void __soc_setup_card_name(struct snd_soc_card *card,
> 				  char *name, int len,
> 				  const char *name1, const char *name2)
> {
> 	const char *src = name1 ? name1 : name2;
> 	int i;
> 
> 	snprintf(name, len, "%s", src);
> 
> 	if (name != card->snd_card->driver)
> 		return;
> 
> so the shortname and longname would never be used?

Nope. It's just a short path for the non-driver field to not further process 
the destination string (the name argument). The snprintf() call sets all field 
types (it's before the condition). Just set the driver_name field in the soc 
card structure and you will be fine.

The UCM config must be updated to handle the new driver name. The fine 
selection key should probably use the card name, because long name is set from 
DMI:

old:

1 [sofglkda7219max]: sof-glkda7219ma - sof-glkda7219max
                      Google-Phaser360-rev4

new:

1 [sofglkda7219max]: SOF-Intel - sof-glkda7219max
                      Google-Phaser360-rev4

UCM substitutions:

1 [${CardId}      ]: ${CardDriver} - ${CardName}
                      ${CardLongName}

UCM conf:

mkdir -p ucm2/conf.d/SOF-Intel
cat > ucm2/conf.d/SOF-Intel/SOF-Intel.conf <<EOF
Syntax 6
Include.0.File "/Intel/\${CardName}/\${CardName}.conf"
EOF

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
