Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB196065CA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 18:29:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CECFA80AE;
	Thu, 20 Oct 2022 18:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CECFA80AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666283343;
	bh=v3x29e4xtmnumtl4cXGI1ghXRjQsG/kJmtpMnkqFM0s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnZ4Ggx5ZL3sMn+O2BvsGCJ1voNdkLMLZFIzZnzP5T4j6rXeJMU2WivBQZxLjKwHO
	 YCRsevMmOhccuT26ABhc1Z0T1vqA4VM3GnqAiX/N9L8/lmxg7/9vkjBhnpzoGEXycX
	 1YxmlCRCPaHgoWIGjSCYsz4Z5Hp8VqbYIrO+sFJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74108F800B5;
	Thu, 20 Oct 2022 18:28:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 060E9F804D8; Thu, 20 Oct 2022 18:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A775F80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 18:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A775F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XULKH6gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666283282; x=1697819282;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v3x29e4xtmnumtl4cXGI1ghXRjQsG/kJmtpMnkqFM0s=;
 b=XULKH6gcJ3+N7G2cE1hKY+stpNrLpy3piIZlRcHbrBTXpsDDmxdseUcX
 lBGiZNBxROZ5kdNi3G8ol8b1iA6wWD+VTfQnq7XDsx9yD/kSPHj+OfF4W
 Z8p/MVJViLbXg5e4PBiJHSu9nZPS6+oNo43hZGNq7egW4Fboq8j1zHgNW
 /o2flHYfqwQMnstd4QekQBstuLEtGShq8p9Hr+CrzTm0MB000buGw/2us
 496rsq9CbRlcwqQGwJwGrno7epgZBVNrHGZXd+CurZ00ahCO2TWZdeVuR
 T6m+HAX6pxAZJXhC5tU7WoJTwzt4vw1Cx8AiFH7hIWChwqCIBGkakk6eM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="393066367"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="393066367"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:27:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755238710"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="755238710"
Received: from awmoore-mobl1.amr.corp.intel.com (HELO [10.212.11.204])
 ([10.212.11.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:27:48 -0700
Message-ID: <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
Date: Thu, 20 Oct 2022 11:27:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
 <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
Content-Type: text/plain; charset=UTF-8
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

Hi Jaroslav,

>>> The driver field in the struct snd_ctl_card_info is a valid
>>> user space identifier. Actually, many ASoC drivers do not care
>>> and let to initialize this field using a standard wrapping method.
>>> Unfortunately, in this way, this field becomes unusable and
>>> unreadable for the drivers with longer card names. Also,
>>> there is a possibility to have clashes (driver field has
>>> only limit of 15 characters).
>>>
>>> This change will print an error when the wrapping is used.
>>> The developers of the affected drivers should fix the problem.
>>
>> How should we fix this problem?
>>
>> I see all kinds of errors thrown in our first CI results based on
>> 6.1-rc1:
>>
>> [   12.684893] kernel: cml_rt1011_rt5682 cml_rt1011_rt5682: ASoC: driver
>> name too long 'sof-cml_rt1011_rt5682' -> 'sof-cml_rt1011_'
>>
>> [   12.219660] kernel: bxt_da7219_max98357a glk_da7219_mx98357a: ASoC:
>> driver name too long 'sof-glkda7219max' -> 'sof-glkda7219ma'
>>
>> I have no idea what is expected here in terms of naming. It's far from
>> obvious to respect the 15-character limit AND have something
>> readable/sensible given the proliferation of hardware skews.
>>
>> Any suggestions?
> 
> The question is, how deep the driver name should describe the hardware
> details. The two drivers covering the majority hardware use "HDA-Intel"
> and "USB-Audio" strings here and there are a lot of variants of the
> codec / user space devices / mixer controls. The codec chain and
> eventually the audio bridge can be described in other identification
> strings like card components or the card name (note that most end users
> are not able to identify the references to hardware - it's a GUI string).
> 
> I would use "SOF-Intel-CML" and "SOF-Intel-GLK" strings or just
> "SOF-Intel" or any other variant as you like (lower case etc.). My
> opinion is that it's not necessary to have an unique string per driver
> here (the drivers should have just something common like the SOF core
> code).

ok, adding 'SOF-Intel' would be fine, but remind me again how to set
the driver name?

We already set the card name to e.g.
	broxton_audio_card.name = "glkda7219max";
then the sof-prefix gets added, and that's what we use for UCM [1]

how would I modify the driver name?

If I just go ahead and set .driver_name = "SOF-Intel" in the card
declaration, isn't this going to impact the calls to

	soc_setup_card_name(card, card->snd_card->shortname,
			    card->name, NULL);
	soc_setup_card_name(card, card->snd_card->longname,
			    card->long_name, card->name);
	soc_setup_card_name(card, card->snd_card->driver,
			    card->driver_name, card->name);


#define soc_setup_card_name(card, name, name1, name2) \
	__soc_setup_card_name(card, name, sizeof(name), name1, name2)
static void __soc_setup_card_name(struct snd_soc_card *card,
				  char *name, int len,
				  const char *name1, const char *name2)
{
	const char *src = name1 ? name1 : name2;
	int i;

	snprintf(name, len, "%s", src);

	if (name != card->snd_card->driver)
		return;

so the shortname and longname would never be used?

I am beyond confused on all this :-)


[1]
https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Intel/sof-glkda7219max
