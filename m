Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446D6B9C3C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 17:53:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052091349;
	Tue, 14 Mar 2023 17:52:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052091349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678812809;
	bh=oNi4BX+iKjrFr9Qkqgho/ks/S4QSnsTm6ASF6mIQHk4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BTd13RbCbiKOpHnWNYegxxuxLWFHB/hGFsjBzaJv9N/va/3HhRoAMoTBsGWrrPdFW
	 /vtjkUiaXKTUjtpWHNLcvt9B6JkGwN3ljJuooExfq3GP+5ohc57vTmwWyUhEDRBcnz
	 oi/+GxKLqLMYZZMBdDmc4g3ZqDc3AC+XbXQsA9GY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC38F8032D;
	Tue, 14 Mar 2023 17:52:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4368F80423; Tue, 14 Mar 2023 17:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D103BF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 17:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D103BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NAf7vKZp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678812750; x=1710348750;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oNi4BX+iKjrFr9Qkqgho/ks/S4QSnsTm6ASF6mIQHk4=;
  b=NAf7vKZp7sFEdcT9s0Oip29vz9g5huG7hYBg2BwQPs7zlDvZn+JXXLXX
   eQx82Vji12B2SZTO47hQtQ/tpI4p/7OdGVoM1R81weun+tV3T0ptURojV
   oVYoMod90NshK8KG4vigY0Qq+2x+oX/CEf+3eyfhqWma8NxvpT4JD2mA7
   HIqLnqWUCIm4DZsV49VwUubUn0+b/U6SrR0J+PBlouchkI38j39WU0q9z
   wXub4BZDr1ne54amiSoK8LaRFUwtIqVLEmsN3uPqk8l5W/qI8YHFtbhxj
   /kdKQ3aQh7oCn25ncUfrRzWloDRW8hCvmPdEOo+y2YDCAhrZ+K99wnY8i
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317879564"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400";
   d="scan'208";a="317879564"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672417494"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400";
   d="scan'208";a="672417494"
Received: from hsaquing-mobl.amr.corp.intel.com (HELO [10.255.35.31])
 ([10.255.35.31])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:52:24 -0700
Message-ID: <5e26ef3e-1319-25cd-f7d5-245eaea66769@linux.intel.com>
Date: Tue, 14 Mar 2023 11:52:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: soc-compress: Inherit atomicity from DAI link for
 Compress FE
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>
References: <20230314153409.1805280-1-daniel.baluta@oss.nxp.com>
 <6d9d09aa-d83e-e811-1d43-34780ea05d4d@linux.intel.com>
 <CAEnQRZAj-FW-fCWsyupUDAH4Z2kTf0RL1acivyDHszMuU-75pg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAEnQRZAj-FW-fCWsyupUDAH4Z2kTf0RL1acivyDHszMuU-75pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OQKSO72G5Z5PCR2CM2CQRNOTGGDOUR4R
X-Message-ID-Hash: OQKSO72G5Z5PCR2CM2CQRNOTGGDOUR4R
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, paul.olaru@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQKSO72G5Z5PCR2CM2CQRNOTGGDOUR4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/14/23 11:37, Daniel Baluta wrote:
> On Tue, Mar 14, 2023 at 6:14 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 3/14/23 10:34, Daniel Baluta wrote:
>>> From: Daniel Baluta <daniel.baluta@nxp.com>
>>>
>>> After commit bbf7d3b1c4f40 ("ASoC: soc-pcm: align BE 'atomicity' with
>>> that of the FE") BE and FE atomicity must match.
>>>
>>> In the case of Compress PCM there is a mismatch in atomicity between FE
>>> and BE and we get errors like this:
>>>
>>> [   36.434566]  sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE
>>> is nonatomic, invalid configuration
>>
>> Not clear on the 'FE is atomic' in the case of a compressed stream,
>> which has to be handled with some sort of IPC, i.e. be nonatomic.
>>
> 
> 'FE is atomic' in this message is printed because this is the default value
> of nonatomic field when PCM struct associated for a Compress PCM
> struct is allocated.
> 
> No one changes 'nonatomic' field for Compress FE until my current patch.
> 
>> Also not sure why the FE is not set as nonatomic by the SOF parts?
>> If it's needed for PCM, why wouldn't it be needed for compressed data?
> 
> FE is not touched for SOF parts. Only BE is set to nonatomic by SOF.

Where do you see the BE being changed by SOF?

> 
> See: sound/soc/topology.c
> 
> »       /* Set nonatomic property for FE dai links as their trigger
> action involves IPC's */
> »       if (!link->no_pcm) {
> »       »       link->nonatomic = true;
> »       »       return 0;
> »       }

that's a FE property, not BE.

> FE for PCM is modified by sound/soc/soc-pcm.c
> 
> int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
> »       pcm->nonatomic = rtd->dai_link->nonatomic;
> 
> So, I guess people assumed that is enough to use RTD dai link to set
> pcm->noatomic field
> and didn't look at it in SOF.

Ah yes, now I see your point now. You still had a logical inversion
above but you're correct here.

> When FE for Compress PCM is created, we don't use soc_new_pcm but instead
> we use snd_pcm_new_internal which doesn't inherit the nonatomic field
> of the rtd->dai_link
> as Normal PCM does inside soc_pcm_new.
> 
> So, my patch makes sure we inherit the nonatomic field from
> rtd->dai_link also for Compress PCM
> similar with what already happens for Normal PCM.
> 
> tl;dr: when creating a Normal PCM pcm->nonatomic is inherited from RTD
> DAI link. when creating a
> Compress PCM pcm->nonatomic field is not set. This patch makes sure
> that for Compres PCM
> we also inherit nonatomic from RTD DAI link.

That makes sense. It's quite likely that the compress PCM should be
nonatomic by default, not sure how it can work otherwise.


