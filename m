Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656770E555
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9803E;
	Tue, 23 May 2023 21:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9803E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684869970;
	bh=IEyG284yltYb9FSRi5HqYAoWA0nmo4cXvLBD26DsZN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ymhr9F0bmdl4Wbkaa5YikDEN8rsaZtpYqg53qh9CKVlMGB1DNSSNCS3XYULPG4T/r
	 3oPUe3uRBPGeFOT2QrLHhBKG99tQzi1EDV+u7wABTGMbjjflor1jljNfasVW8sgxyj
	 8+m6Nc/chDr9udjp02gMps1j1lti1OwRjuvcb+8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13289F80549; Tue, 23 May 2023 21:25:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58768F80249;
	Tue, 23 May 2023 21:25:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8A3AF8024E; Tue, 23 May 2023 21:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97B38F8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 21:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97B38F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jwuHTsDv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684869901; x=1716405901;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IEyG284yltYb9FSRi5HqYAoWA0nmo4cXvLBD26DsZN8=;
  b=jwuHTsDv3TuT8Nl4P6QvQUR5whyLzyfcoZXCW1nuJ3/Z7sF3u0i7CEaz
   6Vvjmn7H3GI+n3wooWR5cUuFOvvTGqUCtf9fpLwnzRzWf9rfqwVgKA7Xw
   wCs/T4ZwpI+UxYqtHpIBwyFaU4bN7KT5j//IT4n5H4fVlb3y6UafR/bwn
   JT8ghqhciSZD2MzlIU6e5IE0uSBsadmzt2BQandYzww/WvIK0w5hjVdp9
   K81QpUURxn+khba2HlK8PZKJrX5rKkPlaubeQ9KfGwnqR2ndhgaq+yWm/
   4EXGEtAfpexn2Bt8+Gg8KnYQVTtYZz+PhG2kwoQ9OxmRx7/IhnROZv4Mo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="350847609"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="350847609"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 12:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816254807"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="816254807"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 12:24:54 -0700
Message-ID: <1ce6bb84-3140-3953-e995-00eb7b16f386@linux.intel.com>
Date: Tue, 23 May 2023 14:24:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: rt5682: Use a maple tree based register cache
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230419-asoc-rt5682-maple-v1-1-ed40369c9099@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230419-asoc-rt5682-maple-v1-1-ed40369c9099@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: E42CJVWHXZMWQTDUGUCQS3ACHLDOGYD2
X-Message-ID-Hash: E42CJVWHXZMWQTDUGUCQS3ACHLDOGYD2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E42CJVWHXZMWQTDUGUCQS3ACHLDOGYD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/25/23 12:22, Mark Brown wrote:
> regmap has introduced a maple tree based register cache which makes use of
> this more advanced data structure which has been added to the kernel
> recently. Maple trees are much flatter than rbtrees, meaning that they do
> not grow to such depths when the register map is sparse which makes access
> a bit more efficient. The maple tree cache type is still a bit of a work
> in progress but should be effective for some devices already.
> 
> RT5682 seems like a good candidate for maple tree. It only supports single
> register read/write operations so will gain minimal benefit from storing
> the register data in device native format like rbtree does (none for
> SoundWire) and has some sparsity in the register map which is a good fit
> for maple tree.
> 
> Convert to use maple tree. There should be little if any visible difference
> at runtime.

Wondering if this is the root cause of the regression we're seeing in
[1] on a Chromebook with rt5682 in SoundWire mode?

I don't see any other changes to this codec driver and the first problem
detected seemed to happen when we did an upstream merge last week.
Unfortunately the last merge was on April 24 (sof-dev-rebase-20230424)
which is just the day before this commit was added...

[1] https://github.com/thesofproject/linux/issues/4371

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/rt5682-sdw.c | 2 +-
>  sound/soc/codecs/rt5682s.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
> index 5f80a5d59b65..fb7951f11c92 100644
> --- a/sound/soc/codecs/rt5682-sdw.c
> +++ b/sound/soc/codecs/rt5682-sdw.c
> @@ -79,7 +79,7 @@ static const struct regmap_config rt5682_sdw_indirect_regmap = {
>  	.max_register = RT5682_I2C_MODE,
>  	.volatile_reg = rt5682_volatile_register,
>  	.readable_reg = rt5682_readable_register,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>  	.reg_defaults = rt5682_reg,
>  	.num_reg_defaults = RT5682_REG_NUM,
>  	.use_single_read = true,
> diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
> index 9c34dca58f54..36102fa2b806 100644
> --- a/sound/soc/codecs/rt5682s.c
> +++ b/sound/soc/codecs/rt5682s.c
> @@ -3046,7 +3046,7 @@ static const struct regmap_config rt5682s_regmap = {
>  	.max_register = RT5682S_MAX_REG,
>  	.volatile_reg = rt5682s_volatile_register,
>  	.readable_reg = rt5682s_readable_register,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>  	.reg_defaults = rt5682s_reg,
>  	.num_reg_defaults = ARRAY_SIZE(rt5682s_reg),
>  	.use_single_read = true,
> 
> ---
> base-commit: 4a670ac3e75e517c96cbd01ef870dbd598c3ce71
> change-id: 20230419-asoc-rt5682-maple-7da060991ca4
> 
> Best regards,
