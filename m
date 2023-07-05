Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC64B747E76
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 09:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 876F1741;
	Wed,  5 Jul 2023 09:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 876F1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688543204;
	bh=SRLxnqr5pqVMpviaILvPpBMmGEgfRwA/VPCI4RMxp+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sAa4G3BgSSIBxBA09DPPV4g6aB+eOoZKKzsYhwIoCEHxGtllSzKye+mKlJVP91vUJ
	 QPIi7bnO7nboL4ymyaR7F3FVD2Dj9QxjUBpdfK1d8lD0L9jUxbS6q05JI2vewW+kC4
	 zN3WhKsNaTwo/zlPCDEynIog387LBZrqcJzkd6fk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C6B0F80272; Wed,  5 Jul 2023 09:45:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B52DCF80124;
	Wed,  5 Jul 2023 09:45:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A441DF80125; Wed,  5 Jul 2023 09:45:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B728BF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 09:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B728BF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ku632GIv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688543143; x=1720079143;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SRLxnqr5pqVMpviaILvPpBMmGEgfRwA/VPCI4RMxp+E=;
  b=ku632GIvldMRyrGtBP4vW7UKroAjf/+WhfL701exFdwb+l+cGEo/waTC
   5eK9/vsN4QTRxFr1OKCxIdlKnPU0eNBK2BBh1QEjNVR/8ikjNgzMftgjn
   ig6NjTklARK9M9blJdcPD3h4WrIWuj1s+F9rFbLSdawloZcWXXOWeEWGo
   MA9xJSjqtZ8oyB6Dhk0+sRY/LoGNZSZRCh9R/edwPHQEbonywrkLmbitY
   /KojhpjQfZir1oSaIBjkso9mpFNccycrS96CzXP5C7hSTZ9tyOFiX+zOW
   SsxXiizaZvXHCvqsYB6eKoFJmTICkr1n1lnGsqwn8mh7bKxJ47RmM9rCa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366757974"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200";
   d="scan'208";a="366757974"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 00:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="809166707"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200";
   d="scan'208";a="809166707"
Received: from meggieha-mobl.ger.corp.intel.com (HELO [10.252.48.235])
 ([10.252.48.235])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 00:45:32 -0700
Message-ID: <ae06b00a-f3f7-f9d1-0b58-4d71f3394416@linux.intel.com>
Date: Wed, 5 Jul 2023 09:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: snd_soc_dai_ops.startup called for all codecs
To: Peter Suti <peter.suti@streamunlimited.com>, alsa-devel@alsa-project.org
Cc: =?UTF-8?Q?Radek_Dost=c3=a1l?= <radek.dostal@streamunlimited.com>,
 Martin Pietryka <martin.pietryka@streamunlimited.com>,
 Mark Brown <broonie@kernel.org>
References: 
 <CACMGZgY9SLGJ3d+66DxXwddwh2LTw3BXeEWUBGN=7fyrO0QkeQ@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CACMGZgY9SLGJ3d+66DxXwddwh2LTw3BXeEWUBGN=7fyrO0QkeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IE63BZVG343PY3YIYUBRV5IS6QINAEXK
X-Message-ID-Hash: IE63BZVG343PY3YIYUBRV5IS6QINAEXK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IE63BZVG343PY3YIYUBRV5IS6QINAEXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[Adding Mark Brown - ASoC maintainer]

On 7/4/23 14:17, Peter Suti wrote
> Hi,
> 
> I'm trying to create a sound card which has two codecs associated with
> one DAI. One codec is responsible for playback and the other one for
> capture. I can see in soc-pcm.c that
> __soc_pcm_hw_params() is checking if the stream is valid for the
> current codec with
> snd_soc_dai_stream_valid() and if it isn't it is not calling the
> hw_params() callback.
> But this check is not there in __soc_pcm_open() which calls
> snd_soc_dai_startup() for every codec. Can someone shed some light on
> this? Why is startup() called for codecs that don't support the
> current stream?

We have a similar issue but with the .trigger callback.

We will send a patch when the merge window closes, see
https://github.com/thesofproject/linux/pull/4434

You may need a similar test for the startup?
