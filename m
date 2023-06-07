Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62557266E3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 19:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1058F10E;
	Wed,  7 Jun 2023 19:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1058F10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686158030;
	bh=OklYrbUhtMfT/BZ1Iakr2Sj+ArNQxOndyvM4TVjtnSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cTEDsHLBct6SZnGcRYeJBtQvMIIR5sXDtsVY4/MDHq0NcamHfqa2RZ0tCZBOlu8W/
	 Hj3t5QbyAq0ELtCjm9XhP64SIdVYYbrA1IbDbo7av0oZn1HjThqwK5S9JhcohXyqdg
	 SVwotc7g+iG/2XdLRnsAjhn5mychKzlHZr7xmk6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE689F8016C; Wed,  7 Jun 2023 19:12:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EF9F8016C;
	Wed,  7 Jun 2023 19:12:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB222F80199; Wed,  7 Jun 2023 19:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F4B4F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 19:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F4B4F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FtUCYaXV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686157951; x=1717693951;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OklYrbUhtMfT/BZ1Iakr2Sj+ArNQxOndyvM4TVjtnSA=;
  b=FtUCYaXVhw3lICS3iHlFaxgPbvpIDXroh/Brxlq8ywxKwjMuJ9rSCJN2
   jmzjlVdoEJZpQ/7szWxMIkAD/Vh1nPyLa1Mrq207dpDLnW2hFlgtKvxFl
   +yacetfjMVlCP409bu5zuajpGh2okJ228IfEPlRvS0vWHir+OIg284Oc5
   862j/m2Cw34c97ca5PszO3pnzzYnhhgodGIa6phPU5drFjq7KSFsa5c8w
   VY0jsMX6b57y+qUSRKAV77pVTozSRnO0Cgqq8sSjP3hLimhVMcKKCl7W5
   7xcWwFfwUqYkFS3cYst8P0yOrgEjh82hs34oj1CmYDhK5iTq816PqhiOj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="359521278"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="359521278"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703737859"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="703737859"
Received: from sorrin-mobl3.amr.corp.intel.com (HELO [10.209.124.63])
 ([10.209.124.63])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:12:27 -0700
Message-ID: <4d19592c-34a3-d847-3790-0aa39a10e2da@linux.intel.com>
Date: Wed, 7 Jun 2023 12:12:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, bard.liao@intel.com,
 - <patches@opensource.cirrus.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
 <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
 <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
 <20230607170520.GM68926@ediswmail.ad.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230607170520.GM68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H53AENOZI2XGB5QKEEJQFL335OUWULN7
X-Message-ID-Hash: H53AENOZI2XGB5QKEEJQFL335OUWULN7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H53AENOZI2XGB5QKEEJQFL335OUWULN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/7/23 12:05, Charles Keepax wrote:
> On Wed, Jun 07, 2023 at 05:22:45PM +0100, Mark Brown wrote:
>> On Wed, Jun 07, 2023 at 10:10:24AM -0500, Pierre-Louis Bossart wrote:
>>> On 6/7/23 04:29, Richard Fitzgerald wrote:
>>>> On 07/06/2023 04:12, Bard Liao wrote:
>>
>>>> You are declaring that all the CPU and CODEC in the dailink behave as a
>>>> single logical link. So you can just connect all CPUs to all CODECS.
>>
>>>> That also fixes a problem with the existing N CPU to N CODEC mapping. It
>>>> assumes that means CPU0 is connected to CODEC0, CPU1 is connected to
>>>> CODEC1, ... But that isn't necessarily true. You could have an N:N
>>>> mapping where multiple CPUs have been combined to create a multi-channel
>>>> stream that is sent to all CODECs. 
>>
>>> This is questionable when the CPUs are connected to different links.
>>> SoundWire is not a giant switch matrix, there's a clear parent-child
>>> dependency and limited scope.
>>
>>> Example topology for a 2 link/4 amplifier solution.
>>
>> Or a system with two distinct I2S DAIs (TDM is another thing).
> 
> I guess the bit that slightly phases me here is, historically a
> DAI link has been the thing that specifies what is connected to
> what. What kinda happened when we added multi-cpu is we bent
> that assumption, at least for the N -> N case, and now even
> more so for the N -> M case, where only a subset of the DAI link
> is actually connected.
> 
> If your system looks like:
> 
> CPU A -> CODEC A
> CPU B -> CODEC B
> 
> What makes this a single DAI link, rather than 2 DAI links? And
> does the information within the DAI link about what is connected
> to what not just start looking like DAI links?

Synchronized starts/operation is the big difference IMHO. There's one
TRIGGER_START, not two.
