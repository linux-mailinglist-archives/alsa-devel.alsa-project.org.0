Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C6C785D37
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28FB1839;
	Wed, 23 Aug 2023 18:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28FB1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808039;
	bh=7B569LUhKKp+C+zwE/8hJRQw8+k1zi7nohpOciRBKA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ayGMSLrtJGEfmQbDvWx4b0JjO3xp9K9XmtnqI/RUkMNrW7ykYFGNrmRen0zf4QOi7
	 MeGbpa9HvMD7hZwtmRi6Y5udiLOn48BzFwt4bgUHrJcRI8HOFOSvnzs6KE/L79eXBf
	 LK5jb12NWnzl4AZbY3/n0yhxN/YLVNfFrGn1KPkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C72DF80158; Wed, 23 Aug 2023 18:26:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32DFEF8025F;
	Wed, 23 Aug 2023 18:26:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 688EBF8023B; Wed, 23 Aug 2023 18:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4E02F800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E02F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gIuBlQu0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692807978; x=1724343978;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7B569LUhKKp+C+zwE/8hJRQw8+k1zi7nohpOciRBKA4=;
  b=gIuBlQu07TiGA7BiMpoyxKUulOvdUngKBWLNmCKwhnZUvZ5HS5vVga4P
   Dcet84KGO304Vuo5Ih4KtljAfBpfW6r6x7Dy2OW64J0XVKd5CKcPKtP2Z
   q1Y6fUUDwYlEst/kgcustJV1eDqE8Fkr69YWNPINwMOso8X7RtijZDVqq
   L2wjemgcXB9J5pqBy7rY5HktPzmCLkuk9Qr7XBJl4gFrfxJXRkL0DcNGn
   N9Zr/o9jR+3kjToBfPwzZUIs/i9FEOuYPsNf4ABdiKhoTAxTQkKs8cns6
   JZk8SUnxous5lp38zaMkk/5Ohkezzrc5nJB1RhEJKag0/x1Rw5kkY2Zx5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364381844"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="364381844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 09:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="880463725"
Received: from cmichiel-mobl.amr.corp.intel.com (HELO [10.212.27.113])
 ([10.212.27.113])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 09:26:18 -0700
Message-ID: <797d83be-feaf-04ec-9be6-9343d2ab3a33@linux.intel.com>
Date: Wed, 23 Aug 2023 11:26:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
 <20230823154958.GF103419@ediswmail.ad.cirrus.com>
 <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: C4SJICEZPB54VHHMHNNJJQM4PNLEJJ6U
X-Message-ID-Hash: C4SJICEZPB54VHHMHNNJJQM4PNLEJJ6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4SJICEZPB54VHHMHNNJJQM4PNLEJJ6U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/23/23 11:19, Mark Brown wrote:
> On Wed, Aug 23, 2023 at 03:49:58PM +0000, Charles Keepax wrote:
>> On Wed, Aug 23, 2023 at 10:21:13AM +0100, Charles Keepax wrote:
>>> Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
>>> added an additional local params in __soc_pmc_hw_params, for the
>>> CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
>>> bytes) and keeping two local copies of it makes the stack frame for
>>> __soc_pcm_hw_params really large. As the two copies are only used
>>> sequentially combine these into a single local variable to shrink the
>>> stack frame.
> 
>> Hmm... this might need a little more thought its not clear why this
>> should change the frame size and it only seems to change the frame
>> size on the ARM cross compiler I am using, not x86.
> 
> Isn't that just going to be a function of the compiler being smart
> enough to work out that there aren't overlapping uses of the two
> variables and they can share stack space?  There's no reason not to help
> it figure that out.

One would think that compilers understand the variable scope, and
free-up the stack when leaving a for loop scope?

