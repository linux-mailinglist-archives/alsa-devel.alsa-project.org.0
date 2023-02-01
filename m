Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B56689D9E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 16:12:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8D442;
	Fri,  3 Feb 2023 16:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8D442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675437152;
	bh=A3OPBOpZFYUYwUMhLao7aBJ7DMGEYe/S93D8TYK9mmI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mfx8dqrXulrGycyHbBGcEUTlkzPAMocH4F+zBJBnwWKiw32Fi3MXuCssezuBVns2g
	 G24paEmIQ3ZQBC/mi1zpe5kyuZB4VnsPvo26xXmJOIZ+pUfe07A0EOWZTwIaLV4pyf
	 H0dDEM0kuRsjKaF2YjWAF06OLG4WGW3rS0z2GJHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 605EDF8001D;
	Fri,  3 Feb 2023 16:11:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE5E2F802E8; Fri,  3 Feb 2023 16:11:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DATE_IN_PAST_24_48,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E708BF8001D
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 16:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E708BF8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HLkk26oi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675437088; x=1706973088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A3OPBOpZFYUYwUMhLao7aBJ7DMGEYe/S93D8TYK9mmI=;
 b=HLkk26oiethDr91+BUp+RUlbkQ3xEXlSwUML6wCJalS/TBs0FoY2xByJ
 kBxp44hSLLwh4SRxOXhzgC5Hl7QdbmnWhrmc2z9IOUVtDn3RBxfJ0MSpK
 brhoIpwEQZNdOkxWLHDqlRZ4OW2otsZHE1oDdksB1dBaT5KrA1ZF0g7QN
 qgsnklXtILv9rBhhhcpujgncESfWOX/Tq9/bMR6ns1+okO/IqFtu9w70K
 kKoRKH5h1gCpeIQPydGzWCjo5uwNEabL25fX1R26lo23asjejXbyNv3e3
 ZnlLmRYifrpW01chEhZuDha+neG4a3xLGwZozOOXwMHVP0AXPRn5S49Ey g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330898230"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330898230"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729289957"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729289957"
Received: from albuitra-desk.amr.corp.intel.com (HELO [10.209.172.145])
 ([10.209.172.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:23 -0800
Message-ID: <1473e1e9-b368-d8f3-c1f5-1b64e6e2ed90@linux.intel.com>
Date: Wed, 1 Feb 2023 17:08:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 01/19] ASoC: amd: ps: create platform devices based on acp
 config
Content-Language: en-US
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
 <7b8fe2b6-84cb-e8c8-22aa-2d940a5c68b7@linux.intel.com>
 <9e6200ee-9b21-66d1-6bb1-832ec7399111@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9e6200ee-9b21-66d1-6bb1-832ec7399111@amd.com>
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



On 2/1/23 00:01, Mukunda,Vijendar wrote:
> On 01/02/23 09:22, Pierre-Louis Bossart wrote:
>>
>>
>>>>> In above case, two manager instances will be created.
>>>>> When manager under SWC1 scope tries to add peripheral
>>>>> device, In sdw_slave_add() API its failing because peripheral
>>>>> device descriptor uses link id followed by 48bit encoded address.
>>>>> In above scenarios, both the manager's link id is zero only.
>>>> what fails exactly? The device_register() ?
>>>>
>>>> If yes, what the issue. the device name?
>>> device_register() is failing because of duplication of
>>> device name.
>>>> I wonder if we need to use something like
>>>>
>>>> "name shall be sdw:bus_id:link:mfg:part:class"
>>>>
>>>> so as to uniquify the device name, if that was the problem.
>>> Yes correct.
>> can you check https://github.com/thesofproject/linux/pull/4165 and see
>> if this works for you? I tested it on Intel platforms.
> It's working fine on our platform. As mentioned earlier in this thread,
> we can't go with two ACPI companion device approach due to
> limitations on windows stack for current platform.

Thanks for testing.

So if you can't go with 2 ACPI companion devices, what does the
'Windows' DSDT look like and how would you identify that there are two
controllers on the platform?
