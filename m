Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFE2A66C3
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 15:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0AAD16A6;
	Wed,  4 Nov 2020 15:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0AAD16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604501575;
	bh=GQcQhuG0HTWYteR1uKgt9mcRsMAWwoiO4ALTvFtjCSs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S3CZl37ANOxOcQEkNPe6QUmco9LqHV8HSqnmWSQ57O9EX0E50sd22TOadn4c+6Tje
	 O7gxlOzUvtW5DkQ/yvCcu9jP+1cqWmgpss/UNXRc2+cbHNpjInGr5fiXAKqrWtHpOE
	 F9qsZCMs54V6FZ6ferpu0n+QbcCWUvPl7OznvC14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDB8F80232;
	Wed,  4 Nov 2020 15:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1A68F80234; Wed,  4 Nov 2020 15:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D88E3F8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 15:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88E3F8015A
IronPort-SDR: TO+m3/m07O80xDgnhLuL67HaicM01/wiZ0ZE93OZmTA1+CPwNQua4Hx/9mkEGjPktvc1osdHWQ
 1MybepQzeb3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="253935677"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="253935677"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 06:51:11 -0800
IronPort-SDR: hlFBiTNFsOJqqlDPiYvP+xSO+/1+lxfw6jdCUwsPtxzUeqTO70zMupkCVKg+HHSK+9ZJzAYoAV
 Or4THkom3b5g==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="538946985"
Received: from msridhar-mobl1.amr.corp.intel.com (HELO [10.254.96.252])
 ([10.254.96.252])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 06:51:09 -0800
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: CTLIN0 <CTLIN0@nuvoton.com>, broonie@kernel.org
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
Date: Wed, 4 Nov 2020 08:51:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@google.com>,
 WTLI@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


>>> +static int nau8315_enpin_event(struct snd_soc_dapm_widget *w,
>>> +        struct snd_kcontrol *kcontrol, int event)
>>> +{
>>> +    struct snd_soc_component *component =
>>> +        snd_soc_dapm_to_component(w->dapm);
>>> +    struct nau8315_priv *nau8315 =
>>> +        snd_soc_component_get_drvdata(component);
>>> +
>>
>> [1]
>>
>>> +    if (event & SND_SOC_DAPM_POST_PMU)
>>> +        nau8315->enpin_switch = 1;
>>> +    else if (event & SND_SOC_DAPM_POST_PMD)
>>> +        nau8315->enpin_switch = 0;
>>
>> And even if this variable was useful, for symmetry should it be
>> PRE_PMU/POST_PMD?
>>
> Yes, I agree with your opinion.
> 
>  From the above description, I suppose you might want to point whether
> the dapm widget of EN_PIN is redundant, right? That's a reason the
> physical hardware pin is set to high/low in trigger function point of
> snd_soc_dai_ops, it always occurred after dapm event.
> If yes, from my current platform of verification, even if the dapm
> widget of EN_PIN is removed, the result of sound output is same yet.
> Maybe the first version, I should submit a simpler version.

The model from the Max98357a seems to come from 128f825aeab79 (' 
ASoC: max98357a: move control of SD_MODE to DAPM')

It doesn't seem like this additional EN_PIN is useful at the codec level 
but may help with machine integration.

I still don't get the POST_PMU/POST_PMD. This was changed in 
04a646ff5acaa by Tzung-Bi Shih @ Google, wondering if there is an 
explanation?

Not pushing back, just trying to get what makes sense for amplifiers.
