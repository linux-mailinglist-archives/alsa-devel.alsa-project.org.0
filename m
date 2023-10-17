Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D077CD0BE
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11C0DF1;
	Wed, 18 Oct 2023 01:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11C0DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585270;
	bh=+nR7voVu9E6cM5UVFVpm5Nh+7Uh8hmXLmgaIcz+rKVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qza/CRR2XRG9dgd2WXHURx/jJ51tgTe2MuQd2tgba0mW/E/geej34+RUAlGCojBBY
	 pFNdKXQ0WN2uAWBBZ94ARCVdXxsJZ5BBuz84sI6OWKppVrFe1OW3ADqhC2XZO8role
	 qATpWxMfaZBskADeJP6FNYsyy3VCZ7/eEtGrxOgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81E14F8060B; Wed, 18 Oct 2023 01:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 382B1F8060A;
	Wed, 18 Oct 2023 01:23:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D2B0F805BF; Wed, 18 Oct 2023 01:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D292F80571
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D292F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QK2QUIAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585015; x=1729121015;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+nR7voVu9E6cM5UVFVpm5Nh+7Uh8hmXLmgaIcz+rKVA=;
  b=QK2QUIAFk3tPZHY8voARSb3Dh5sHe/WP2tJvDKqB29tZB6bwRqT7OAOg
   s7eArPYBxxe4ZltUtMZ2oF8sZd4dif/OtNPSuMBcQXWdgkF99fSpGt/LP
   FAQP+/Cqq8/ICDZ5UoZpfczyuKoLFygItaKhC4ERZpie94ANmcBQkT11z
   uFS/s4/sQsWwmrqWz3RrcH0/3buep+IFiMMqVe03KN4xJwp24DMhgeFjh
   LmmfZXdcLbPP/mssVmuneYgORq8w1Y5QGOOubYbd8zykvbw87b8sYXLvn
   M8M0h/ANGn6Q5tK3ESs3Nxxdh2CU5apLMAzocZu2IacESf0gE1uQ+ta2I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778258"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778258"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637534"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637534"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:32 -0700
Message-ID: <5667241d-6976-4b44-8edd-79ee426415eb@linux.intel.com>
Date: Tue, 17 Oct 2023 18:16:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
 <87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
 <d3c97c54-d149-4bed-9013-3f07bc6a7f52@linux.intel.com>
 <874jiokg1r.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <874jiokg1r.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: I4TLZJYNFNPZHAEATKA22CUANNWP7RAE
X-Message-ID-Hash: I4TLZJYNFNPZHAEATKA22CUANNWP7RAE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4TLZJYNFNPZHAEATKA22CUANNWP7RAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 18:03, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your test.
> 
>>>  		/*
>>>  		 * construct cpu channel mask by combining ch_mask of each
>>>  		 * codec which maps to the cpu.
>>> +		 * see
>>> +		 *	soc.h :: [dai_link->ch_maps Image sample]
>>>  		 */
>>> -		for_each_rtd_codec_dais(rtd, j, codec_dai) {
>>> -			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
>>> -				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
>>> +		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
>>> +			/* .ch_map is from CPU */
>>> +			ch_mask = rtd->dai_link->ch_maps[i].ch_mask;
>>
>> ... and for a FE dailink there's no ch_maps so this results in a kernel
>> oops.
> 
> Hmm... this is strange...
> 
> New snd_soc_compensate_connection_map() will add default ch_maps for all
> dai_link...
> 
> Oh, is it using topology or something which doesn't call
> snd_soc_bind_card() ? If so could you please try to call
> snd_soc_compensate_connection_map() ?
> (I guess it is using soc_tplg_fe_link_create() ?)
> 
> If it could solve your issue, v5 will handle it.

Sorry, not following what the suggestion is.

Yes all our solutions are based on the topology, and I don't really
understand the benefit of a ch_map for an FE? the codec_dai is a dummy
one...
