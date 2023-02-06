Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4E68C13A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:21:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C89A1F0;
	Mon,  6 Feb 2023 16:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C89A1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675696903;
	bh=SmEtjgYS88GoKO+Jlag8lErD47phbH2mwUwDEnVaPJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YgoEqseHo291CgWHSHL+1ue7jW1ryhhQJ09f4UnlUsejPh9eNi9y3D6gPYMJOis3t
	 EedUvDANrk7EyqXPXx5ZzJYofqla62is1A2i6u7W/VXjVNVNHVGPZBFqod35n/S6TN
	 7PfC2MOji147G97hN9Qo/NNcwooGBNFNSDAb7ifc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86BB6F80534;
	Mon,  6 Feb 2023 16:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A2B3F8014B; Mon,  6 Feb 2023 16:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93EBBF8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EBBF8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W+Lyitai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675696812; x=1707232812;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SmEtjgYS88GoKO+Jlag8lErD47phbH2mwUwDEnVaPJ4=;
 b=W+LyitaiK3JFLncWeD3t9THcuJrpJwmizuRNa7LL5lOAO7KA6m9oG142
 tn4oW9fnUlJc3O/D28X/XriAzgDaLxNEkkmsdTiDCHbMD5N55HOoYmk8M
 3Qpnu4/FcYhqvmEQP7yU0odsmpleFXXCZlMsL0DtXBFM3f5jnZE+bexVG
 J8WktAI+PUuuhuboHWgSRddJdQrEE39Q3GpcgUn9aICPdtBxmtYKkGd22
 0VWGgnsAcyfm/f3+I5kMwTv4qJQNPiCNMAxGGHo5GbospBjbU4gssJ5Dc
 dIsOUgjIbmraOWpmsaeVx7QhsSMkKRcBQ3AM7/vwx/MAH2yzpkMcwAfpT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331360731"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="331360731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 07:20:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="696888685"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="696888685"
Received: from pmagdum-mobl1.amr.corp.intel.com (HELO [10.209.159.190])
 ([10.209.159.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 07:20:03 -0800
Message-ID: <8ff49f42-95c5-dbe0-e9a4-f4982185dd63@linux.intel.com>
Date: Mon, 6 Feb 2023 08:50:09 -0600
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
 <7b8fe2b6-84cb-e8c8-22aa-2d940a5c68b7@linux.intel.com>
 <9e6200ee-9b21-66d1-6bb1-832ec7399111@amd.com>
 <1473e1e9-b368-d8f3-c1f5-1b64e6e2ed90@linux.intel.com>
 <4c860ef0-d22d-5c2a-9657-7e2436b00101@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4c860ef0-d22d-5c2a-9657-7e2436b00101@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


>>>>>>> In above case, two manager instances will be created.
>>>>>>> When manager under SWC1 scope tries to add peripheral
>>>>>>> device, In sdw_slave_add() API its failing because peripheral
>>>>>>> device descriptor uses link id followed by 48bit encoded address.
>>>>>>> In above scenarios, both the manager's link id is zero only.

So here you're reporting that the issue is that all devices use link0 ...

>>>>>> what fails exactly? The device_register() ?
>>>>>>
>>>>>> If yes, what the issue. the device name?
>>>>> device_register() is failing because of duplication of
>>>>> device name.
>>>>>> I wonder if we need to use something like
>>>>>>
>>>>>> "name shall be sdw:bus_id:link:mfg:part:class"
>>>>>>
>>>>>> so as to uniquify the device name, if that was the problem.
>>>>> Yes correct.
>>>> can you check https://github.com/thesofproject/linux/pull/4165 and see
>>>> if this works for you? I tested it on Intel platforms.
>>> It's working fine on our platform. As mentioned earlier in this thread,
>>> we can't go with two ACPI companion device approach due to
>>> limitations on windows stack for current platform.
>> Thanks for testing.
>>
>> So if you can't go with 2 ACPI companion devices, what does the
>> 'Windows' DSDT look like and how would you identify that there are two
>> controllers on the platform?
> We are not populating two controller devices. Instead of it, we are populating
> single controller device with two independent manager instances under the same
> ACPI device scope.
> We have configuration register to identify sound wire manager instances on the platform.
> Below is the sample DSDT for Windows & Linux.
> 
> Scope (\_SB.ACP)
>     {
>     
>         Device (SDWC)
>         {
>             Name (_ADR, 0x05)  // _ADR: Address
>         Name(_DSD, Package() {
>                                         ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                         Package () {
>                                         Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},
>                                         Package (2) {"mipi-sdw-manager-list", 2},
>                                         },
>                                         ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
>                                         Package () {
>                                         Package (2) {"mipi-sdw-link-0-subproperties", "SWM0"},
>                                         Package (2) {"mipi-sdw-link-1-subproperties", "SWM1"},
>                                         }
>                                         }) // End _DSD
>         Name(SWM0, Package() {
>                                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                 Package () {
>                                 Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},                                 
>                                 
>                                 // ... place holder for SWM0 additional properties
>                                 }
>                                 }) // End SWM0.SWM
>        Name(SWM1,Package(){
>                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                 Package () {
>                                 Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},                                
>                                 
>                                 // ... place holder for SWM1 additional properties
>                                 }
>                                 }) // End SWM1.SWM
> 
>     Device (SLV0) { // SoundWire Slave 0
>                         Name(_ADR, 0x000032025D131601)
>         } // END SLV0
> 
>     Device (SLV1) { // SoundWire Slave 1
>                         Name(_ADR, 0x000130025D131601)
>             } // END SLV1   

... but here you have two different link numbers.

I interpret this as SLV0 on link0 and SLV1 on link1.

So what's the issue?
