Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55439685D09
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:05:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9001F0;
	Wed,  1 Feb 2023 03:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9001F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217121;
	bh=zQEHpWFfNSyitaLvBhEXmkncdRfOLcou64NXF+6nmxw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YxtPTEMN6C1gOwRaRwuPNxnPaOxw8fnir29Z0zNc/LGYTOh888JvZ/9tAB7mI9+gr
	 yyQZtx2YIoDKZx4sqa/rbfdHW1S1w2hFbfbozWYX05mQxCunbBw04gg8hxbdk2Im56
	 21q7dpzhCJBEDF+HvtlBT8vx8rDO7AxQXLGSuQkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB1BF80553;
	Wed,  1 Feb 2023 03:03:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8648F80557; Wed,  1 Feb 2023 03:03:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 830BAF80520
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830BAF80520
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kCSnxQS7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675217015; x=1706753015;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zQEHpWFfNSyitaLvBhEXmkncdRfOLcou64NXF+6nmxw=;
 b=kCSnxQS72RRlfIOqIHsU8EQZPVNJWpuYhfDA6GPGLRhsTFiOi/igM6EF
 01UXDZtALCAeuzu0i8d/yJFY4A2Xb0KW0TKMIulWxyPqKovUev0pT5WEr
 Kn5pA/N0Hhi5KghDcqjBl8aGOqr8F2j4FYgWsnfxZgbNwCgmYL8mDiqIo
 FrBTay4IWl/51SZIqlkz29YczqQQR0fPd7BfOx4qFdTfGew8CrV5ZIhhJ
 ochBMOtFVjCQ7K9vQoqe25VQ3bUfDiTj0anWmmFBNmheSR/yy18WNDlA/
 t70Do7E1OneGTK84ly2zRZATqEhUXqOn1MPAdSGdI4JhKXdVjLlER2PxN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="315985993"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="315985993"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 18:03:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910134328"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="910134328"
Received: from ncollins-mobl.amr.corp.intel.com (HELO [10.212.85.244])
 ([10.212.85.244])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 18:03:17 -0800
Message-ID: <815ab487-a1a3-1978-94fc-b60e931c2848@linux.intel.com>
Date: Tue, 31 Jan 2023 20:03:17 -0600
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2ea354bc-4263-1db6-4423-4de1b0d4e535@amd.com>
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



> Yes Controller has ACPI scope. Under controller based on
> "mipi-sdw-manager-list" property manager instances will be created.
> Manager and Link terms are interchangeable.
> 
> Below is the sample DSDT file if we go with two ACPI companion
> devices.
> 
> Scope (\_SB.ACP)
>     {
> 
>         Device (SWC0)
>         {
>             Name (_ADR, 0x05)  // _ADR: Address
>         Name(_DSD, Package() {
>                                         ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                         Package () {
>                                         Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},
>                                         Package (2) {"mipi-sdw-manager-list", 1}, // v 1.0
>                                         },
>                                         ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"), // Hierarchical Extension
>                                         Package () {
>                                         Package (2) {"mipi-sdw-link-0-subproperties", "SWM0"},
>                                         }
>                                         }) // End _DSD
>         Name(SWM0, Package() {
>                                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                 Package () {
>                                 Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},
>                                 // ... place holder for SWM0 additional properties
>                                 }
>                                 }) // End SWM0.SWM
> 
>     Device (SLV0) { // SoundWire Slave 0
>                         Name(_ADR, 0x000032025D131601)
>                   } // END SLV0   
> 
>         } // END SWC0
> 
>      Device (SWC1)
>         {
>             Name (_ADR, 0x09)  // _ADR: Address
>         Name(_DSD, Package() {
>                                         ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                         Package () {
>                                         Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},
>                                         Package (2) {"mipi-sdw-manager-list", 1},
>                                         },
>                                         ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
>                                         Package () {
>                                         Package (2) {"mipi-sdw-link-0-subproperties", "SWM0"},
>                                       
>                                         }
>                                         }) // End _DSD
>         Name(SWM0, Package() {
>                                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                 Package () {
>                                 Package (2) {"mipi-sdw-sw-interface-revision", 0x00010000},
>                                 // ... place holder for SWM0 additional properties
>                                 }
>                                 }) // End SWM0.SWM
> 
>     Device (SLV0) { // SoundWire Slave 0
>                         Name(_ADR, 0x000032025D131601)
>                   } // END SLV0
> 
>         } // END SWC1
>     }
> }

that looks good to me.

> In above case, two manager instances will be created.
> When manager under SWC1 scope tries to add peripheral
> device, In sdw_slave_add() API its failing because peripheral
> device descriptor uses link id followed by 48bit encoded address.
> In above scenarios, both the manager's link id is zero only.

what fails exactly? The device_register() ?

If yes, what the issue. the device name?

I wonder if we need to use something like

"name shall be sdw:bus_id:link:mfg:part:class"

so as to uniquify the device name, if that was the problem.
