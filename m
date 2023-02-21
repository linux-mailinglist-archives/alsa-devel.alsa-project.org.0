Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5969EB81
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 00:54:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4433E8B;
	Wed, 22 Feb 2023 00:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4433E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677023650;
	bh=QoqD8P6ikBakoLwMBIWameGKAp9SzS0lMN/1Sy3cuio=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MlBzRn35HcmeZjMUtv0Q/XyyEXLewZisZnPaQxgpuc65CnBMZdfyXMEsZiLR2l2wd
	 LsIkYribqZ3R1I14RlxNazCNTm8CfA/0Z27EvrcavoK2fi8il+hMbkZi8o+x24+G4O
	 p/bYVTWX4VtRqZgwobMELUd8zRV6xQXIo7rH5s8k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E318CF8025A;
	Wed, 22 Feb 2023 00:53:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26697F80266; Wed, 22 Feb 2023 00:53:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F776F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 00:53:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F776F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bFRsjx4u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677023586; x=1708559586;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QoqD8P6ikBakoLwMBIWameGKAp9SzS0lMN/1Sy3cuio=;
  b=bFRsjx4u/rZpNNU7wxMwYNi1Jq1m1hIAIlKQVkhcDtdhResDXqZnvJaY
   jdumPlFBdEoH6KjglAwrbts5hwXSJaMRLLZm6rS5tJDjPg1CkKGGgH+/5
   TJpmPtucj0oNqInl+PjND72u2t5xf79mEUIMzK+u9bGBT5J3+jKpw8Ell
   x/r/bO/npKzIz91Am8qERTZym/1mRzQYGBkzOyqPo06nnQuMR2pJQs8nn
   HFvlF3QNpMV33HVaCduso1QZg9CX3dxz4LycbeHLDkR8xNxt3LMOofsum
   eS1krfWHPW43TvZ1NBs/AyAzj5nNA4+l5hEbNxRx+sqQ/cexpPZUhmJhY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332789095"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000";
   d="scan'208";a="332789095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:53:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="735660217"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000";
   d="scan'208";a="735660217"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:52:59 -0800
Message-ID: <84a9fb4c-daf3-84ac-3946-f554a8d5d309@linux.intel.com>
Date: Tue, 21 Feb 2023 18:48:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 3/8] soundwire: amd: register SoundWire manager dai ops
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-4-Vijendar.Mukunda@amd.com>
 <b6f06e29-22cb-a996-5dfb-91544059051f@linux.intel.com>
 <70f873a4-5b41-aede-55b5-8a731c892198@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <70f873a4-5b41-aede-55b5-8a731c892198@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GLB5J4PNGKOB5QQ4OHZI3CUZWYQ5OA7C
X-Message-ID-Hash: GLB5J4PNGKOB5QQ4OHZI3CUZWYQ5OA7C
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 Mario.Limonciello@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLB5J4PNGKOB5QQ4OHZI3CUZWYQ5OA7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/21/23 16:05, Mukunda,Vijendar wrote:
> On 21/02/23 21:29, Pierre-Louis Bossart wrote:
>>
>>
>>> +static const struct snd_soc_dai_ops amd_sdw_dai_ops = {
>>> +	.hw_params = amd_sdw_hw_params,
>> don't you need a .prepare to deal with suspend-resume?
> DSP based solution is not implemented yet.
> As per our understanding In .prepare () callback, there is
> no extra logic needs to be implemented. Because of it,
> we have dropped .prepare() callback.

You don't need any logic IF the IP keeps its context while suspended.
That wasn't the case for us, we had to re-program the registers when
resuming.
