Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD08FC4FD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 09:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C37483B;
	Wed,  5 Jun 2024 09:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C37483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717573839;
	bh=o5B9iFgRdLEuWzTsvxMS5YhYvIPIwuL/1em8/1g25UM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PXTqBGtAxGUwH8dEsWAZ4hxxNEQhtW5rwww3FYUNBSjwKt1AFs+YCCsPUaZL4aQVl
	 KCHfH0VFdKq3/4EW/pOG38t6F5ioJfT5GiHeOXPAeYf1BQytTC3BA46Di2MMnFzCc3
	 GsVxp3VZHQ0uZKz9KGPDBc661Y03Z7yE4MyOU1TE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE56DF80525; Wed,  5 Jun 2024 09:50:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEC9F805A0;
	Wed,  5 Jun 2024 09:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2C72F802DB; Wed,  5 Jun 2024 09:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E3CEF800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 09:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E3CEF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L+jhS/aC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717573668; x=1749109668;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o5B9iFgRdLEuWzTsvxMS5YhYvIPIwuL/1em8/1g25UM=;
  b=L+jhS/aCXWck9qDN8BEpkjD95xX+fGWrsEDRNqNLuu/etyEbk6IhIa5M
   c+oe5JPHP2gssdHYJgzk2OE/VurE+P9+DDa7LBkFiakTr3vZ1PRjSTepU
   X7AkU/bNySPWSyO0024+B0b5ybbrkzbt+xLf/YtKRbFWhGnjA79BhYMWs
   S7ggf/Ywai30g7zZgRS1XjKJjTwtMoj7Nu3x9rdfaDrcARki9wVHJoax2
   5uHIL5aDs9IuHZ+xTNHgY1KrdwUfA9tXeLJg6nAV8U8DLRN2e4/X6f3fs
   +F3V86GXvzxzw1tE7pK05hTXzS1If+SJzALYW1fQaEJazV+CInkl7JUBf
   A==;
X-CSE-ConnectionGUID: EV5nx4+1QlWccK9g0s0BKg==
X-CSE-MsgGUID: Xkxxqk4+S8mfr6kjKyRgHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24817172"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000";
   d="scan'208";a="24817172"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:47:39 -0700
X-CSE-ConnectionGUID: JJvP2is7QvGMc8YAbysXvA==
X-CSE-MsgGUID: MbUefzlaRQW/UN4kziApoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000";
   d="scan'208";a="37947782"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.201])
 ([10.245.246.201])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:47:37 -0700
Message-ID: <e20101f0-8a86-435c-b8c8-25f82ff2a775@linux.intel.com>
Date: Wed, 5 Jun 2024 09:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HEI3QMBVD6VY637ASMHWLKPWKDTK7G3S
X-Message-ID-Hash: HEI3QMBVD6VY637ASMHWLKPWKDTK7G3S
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEI3QMBVD6VY637ASMHWLKPWKDTK7G3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +struct rt1318_init_reg {
> +	u32 reg;
> +	u8 val;
> +	u8 delay;
> +};

That looks like a 'struct reg_sequence' ?

> +static struct rt1318_init_reg init_list[] = {
> +	{ 0x0000C000, 0x01, 0},
> +	{ 0x0000F20D, 0x00, 0},
> +	{ 0x0000F212, 0x3E, 0},

...

> +
> +static int rt1318_reg_init(struct snd_soc_component *component)
> +{
> +	struct rt1318_priv *rt1318 = snd_soc_component_get_drvdata(component);
> +	int i;
> +
> +	for (i = 0; i < rt1318_INIT_REG_LEN; i++) {
> +		regmap_write(rt1318->regmap, init_list[i].reg, init_list[i].val);
> +		mdelay(init_list[i].delay);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct reg_default rt1318_reg[] = {
> +	{ 0xc000, 0x00 },
> +	{ 0xc001, 0x43 },
> +	{ 0xc003, 0x22 },
> +	{ 0xc004, 0x44 },

...

> +	{ 0xf20d, 0x00 },
> +	{ 0xf212, 0x00 },
> +	{ 0xf21a, 0x00 },
> +	{ 0xf223, 0x40 },

And this looks to me as as a set of defaults patches by a reg_sequence -
similar to what is done for rt1308 and rt1316.

Is there any opportunity to use regmap_register_patch() instead of
open-coding the loop?
