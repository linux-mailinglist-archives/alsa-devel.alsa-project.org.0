Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 560956C400E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 02:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268CC210;
	Wed, 22 Mar 2023 02:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268CC210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679450369;
	bh=3Gh9EtYgNBOUaS3nSeIeyhsENXuq+d6Y7mIFyooKfiY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=maNkjFeho+trWbASIr3OuEfzWEsWi0Ch8VRTctrC8cNOLTyENq0lYr3araaxP+hEI
	 P+D1C3e24EhNHxt///k+wHGsAJuVhfsuF/aqLHOPQv8lyyBr2M6OTc+w8o9/qKvW3J
	 zkPXtHVJNypRgpylODjRqskmxNRyKj7FUrIrFq38=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F573F8024E;
	Wed, 22 Mar 2023 02:58:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53C3EF80254; Wed, 22 Mar 2023 02:58:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C322F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 02:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C322F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HwW1tlUu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679450309; x=1710986309;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3Gh9EtYgNBOUaS3nSeIeyhsENXuq+d6Y7mIFyooKfiY=;
  b=HwW1tlUuu/mFmAunbIG1hc0en85HYJUjKa+Xki8I3wsEZFIkLms9WYr6
   mfkpPWIVg16jYfxQVd8p3pENVBgtn7PJH3YfOGV5odJ2nzmnqoK05Fbns
   sNTbv01uqB4iw699zxtRpmLtixqUcyB+Awg7L4xoGV5jxpVBeTN8vW54D
   Qb+uqm9Vh1uqKfPlqrbkj0oN2X19cxNhOJfMC/5VZE3vrpj9zgFqzSz/g
   HtihwF+TCLg2qKwgzQ+v9NQlnVOgBWdVWntH9m3tdcP609UcLLM+idrAc
   +WGG2avFDhAvwysyeInOlGD0FvxPkLO8NsmBwRmrQ4cIiqDzYGVqM0EDR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319492600"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="319492600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 18:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750867887"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="750867887"
Received: from bkerker-mobl.amr.corp.intel.com (HELO [10.212.160.104])
 ([10.212.160.104])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 18:58:24 -0700
Message-ID: <cf458a5a-a0c0-ded7-1819-a85e548cb491@linux.intel.com>
Date: Tue, 21 Mar 2023 20:58:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables sound
 for systems with a ES8336 codec
Content-Language: en-US
To: Marian Postevca <posteuca@mutex.one>, Mark Brown <broonie@kernel.org>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87lejpwxzf.fsf@mutex.one>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WKTIHKTQBK3PZBJQCFIG7X7SZM6QFMFI
X-Message-ID-Hash: WKTIHKTQBK3PZBJQCFIG7X7SZM6QFMFI
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKTIHKTQBK3PZBJQCFIG7X7SZM6QFMFI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>>> +static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
>>> +					    struct snd_kcontrol *kcontrol, int event)
>>> +{
>>> +	struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
>>> +
>>> +	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
>>> +	if (SND_SOC_DAPM_EVENT_ON(event))
>>> +		acp3x_es83xx_set_gpios_values(priv, 1, 0);
>>> +	else
>>> +		acp3x_es83xx_set_gpios_values(priv, 0, 1);
>>
>> Why are these two GPIOs tied together like this?
>>
> 
> These GPIOs represent the speaker and the headphone switches. When
> activating the speaker GPIO you have to deactivate the headphone GPIO
> and vice versa. The logic is taken from the discussion on the sofproject
> pull request:
> https://github.com/thesofproject/linux/pull/4112/commits/810d03e0aecdf0caf580a5179ee6873fb33485ab
> and
> https://github.com/thesofproject/linux/pull/4066

These threads didn't exactly lead to a firm conclusion on how the GPIOs
should be used, IIRC there are cases where the levels are inverted and
all kinds of issues still not clear at all even after reading the tables
from ACPI _DSM methods.

I personally gave up, and I would recommend you take these threads as
inputs rather than firm directions.
