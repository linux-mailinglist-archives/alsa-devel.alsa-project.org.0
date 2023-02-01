Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21556685E1F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 04:53:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B8882C;
	Wed,  1 Feb 2023 04:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B8882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675223610;
	bh=rmCcr90OIBPdiIGNAQ9gadT4jTI03VlYZhtAK3NArTU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T2f8AjDP/qHE7xSuKivcHLCwf9OpRRAIwH5sADGN3bFffbKbTRm91VcVi0LqtGnBv
	 om7H8UdrQ4ZdKly1p0nB05ABi+5eT4XJf0niCWNKnD+I/0TQMcdwxwptOo9WM3vY+8
	 eGh7Te2TwNCiGVhRL6juJqliaGsy6tNa53AYudG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00898F8045D;
	Wed,  1 Feb 2023 04:52:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4483AF80423; Wed,  1 Feb 2023 04:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E464F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 04:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E464F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TvIuKIk3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675223542; x=1706759542;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rmCcr90OIBPdiIGNAQ9gadT4jTI03VlYZhtAK3NArTU=;
 b=TvIuKIk3/LGy6/4ilBfEpQ5dPx1b8S45j1wa4LEXY2LKrE1K1uIo6KuC
 u6fvf5czzvoQVFctlXNDQOlqMIvjUUpURoz0a0bvHqf18cGhoT0JL2MJW
 +ub9sur9nm9H9XLvxbroxYdE+56mWxstBxEWsf4nhCWucwszcoAJus0SC
 VtcW9w+H+j3vrlSXfedaKTJe/o0XRgEEQjkmmY3DMKOQ5eU2PKSehLc+4
 Q3D5ngzdriXvfmual/CWZKgDTwV3VFtPfgsqoZfSGjfc9PuiBFd0OibH4
 csB3SwDPz1ht1UZnTndXY3+3cvqnJwWKx774ko45sSPnUufsAoAewJo+N w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414238354"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="414238354"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 19:52:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788686482"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788686482"
Received: from ncollins-mobl.amr.corp.intel.com (HELO [10.212.85.244])
 ([10.212.85.244])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 19:52:15 -0800
Message-ID: <7b8fe2b6-84cb-e8c8-22aa-2d940a5c68b7@linux.intel.com>
Date: Tue, 31 Jan 2023 21:52:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 01/19] ASoC: amd: ps: create platform devices based on acp
 config
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
 <9f2229fb-499b-f802-993b-56a7ad2ce361@linux.intel.com>
 <257b6f1e-f403-573f-3978-13ffb14342ad@amd.com>
 <2b4c12ce-2586-0277-ede0-560f8317e4e4@linux.intel.com>
 <27eabbf2-eff2-0964-b72b-f9db251c3b57@amd.com>
 <87ddd91b-fb5f-4f27-942b-dc439b32ce20@amd.com>
 <fa4cdd91-b430-eb1b-a151-d144f62e827d@linux.intel.com>
 <MN0PR12MB6101DBF0419C2C565F7F6840E2D09@MN0PR12MB6101.namprd12.prod.outlook.com>
 <c5161bc3-62cb-d0a1-2ba2-d670285b6958@linux.intel.com>
 <2ea354bc-4263-1db6-4423-4de1b0d4e535@amd.com>
 <815ab487-a1a3-1978-94fc-b60e931c2848@linux.intel.com>
 <ac734e4e-2f61-b9b8-0751-4e3293084696@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ac734e4e-2f61-b9b8-0751-4e3293084696@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "Katragadda, Mastan" <Mastan.Katragadda@amd.com>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>, "kondaveeti,
 Arungopal" <Arungopal.kondaveeti@amd.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




>>> In above case, two manager instances will be created.
>>> When manager under SWC1 scope tries to add peripheral
>>> device, In sdw_slave_add() API its failing because peripheral
>>> device descriptor uses link id followed by 48bit encoded address.
>>> In above scenarios, both the manager's link id is zero only.
>> what fails exactly? The device_register() ?
>>
>> If yes, what the issue. the device name?
> device_register() is failing because of duplication of
> device name.
>> I wonder if we need to use something like
>>
>> "name shall be sdw:bus_id:link:mfg:part:class"
>>
>> so as to uniquify the device name, if that was the problem.
> Yes correct.

can you check https://github.com/thesofproject/linux/pull/4165 and see
if this works for you? I tested it on Intel platforms.
