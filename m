Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D454C41DB1A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 15:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 500D716A2;
	Thu, 30 Sep 2021 15:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 500D716A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633008644;
	bh=8vonMpCu+WMbKyUCN9a+5nbVa2eYaAFDqAea06CI+yQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyvZkZhnqjOfOAn04IXrmyuNc7UfYMyhvbaU4i8abSNmC9BMGoHmVXWH0asaggxtS
	 Dmnx2zLxag0jnHomI5gIN7+r+Owe/jiCAROv0umkzmMD9eijZ64l00NA5u2T0WYIzX
	 dJhOuX5RrbSBu0obBonjByAJhCLnbcf+OhaU6zPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F06F8032C;
	Thu, 30 Sep 2021 15:29:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F04B5F804AD; Thu, 30 Sep 2021 15:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80055F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80055F80218
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="212442263"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="212442263"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 06:29:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="521211747"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180])
 ([10.212.88.180])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 06:29:13 -0700
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
To: Ryan Lee <RyanS.Lee@maximintegrated.com>, Mark Brown <broonie@kernel.org>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <SJ0PR11MB5661814BCC6B79EDE1B0967AE7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
 <SJ0PR11MB5661A2F6089A9AEF4143C11CE7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d866050-9fbf-4f76-ab9e-0bb83a933924@linux.intel.com>
Date: Thu, 30 Sep 2021 08:29:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR11MB5661A2F6089A9AEF4143C11CE7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> I do not see #3063 issue on my side. No initialization failure or time-out has occurred.

It's rather random, we've only seen the error in long daily tests.

> Now I'm trying to solve the issue with max98373_io_init() function as suggested instead of adding
> regmap_cache_dirty() in the suspend function.
> max98373_io_init() was not called from max98373_update_status() when audio resume because
> max98373->hw_init was 1 and Status was SDW_SLAVE_ATTACHED.
> max98373_update_status() do not get SDW_SLAVE_UNATTACHED.
> I confirmed that the issue could be resolved if SDW_SLAVE_UNATTACHED event arrives at
> max98373_update_status() before SDW_SLAVE_ATTACHED is triggered.
> Actually sdw_handle_slave_status() get SDW_SLAVE_UNATTACHED but this function exits at
> https://github.com/thesofproject/linux/blob/topic/sof-dev/drivers/soundwire/bus.c#L1765
> before reaching to https://github.com/thesofproject/linux/blob/topic/sof-dev/drivers/soundwire/bus.c#L1825
> I'm not sure how to solve this issue because this code is commonly
used for other Soundwire drivers as well.
>

There may be a confusion here.

The SoundWire spec says the device will show up as Device #0. That means
the status[0] = ATTACHED.

The driver reads the devID registers and programs the device number N.
The device will then report as device #N in PING frames. The controller
hardware will detect that device and call the function to update the
status a second time.

> I share the debug messages for the resume event as your reference.
> [  127.490644] [DEBUG3] intel_resume_runtime
> [  127.490655] [DEBUG3] intel_resume_runtime SDW_INTEL_CLK_STOP_BUS_RESET
> [  127.490658] [DEBUG3] intel_init
> [  127.490660] [DEBUG3] intel_link_power_up
> [  127.490977] [DEBUG3] intel_resume_runtime SDW_UNATTACH_REQUEST_MASTER_RESET ..
> [  127.490980] [DEBUG4] sdw_clear_slave_status request: 1
> [  127.490983] [DEBUG4] sdw_modify_slave_status, ID:7, status: 0
> [  127.490986] [DEBUG4] sdw_modify_slave_status, ID:3, status: 0
> [  127.490994] [DEBUG3] intel_shim_wake wake_enable:0
> [  127.491060] [DEBUG3] intel_shim_wake wake_enable:0
> [  127.491191] [DEBUG] max98373_resume, first_hw_init: 1, unattach_request: 1
> [  127.491194] [DEBUG] max98373_resume, INF MODE: 0
> [  127.491953] [DEBUG4] sdw_handle_slave_status IN
> [  127.491956] [DEBUG4] sdw_handle_slave_status, status[1] : 0, slave->status: 0, id:7	// UNATTACHED
> [  127.491958] [DEBUG4] sdw_handle_slave_status, status[2] : 0, slave->status: 0, id:3
> [  127.491960] [DEBUG4] sdw_handle_slave_status IN2 status[0] = 1
> [  127.492808] [DEBUG4] sdw_handle_slave_status IN
> [  127.492810] [DEBUG4] sdw_handle_slave_status, status[1] : 1, slave->status: 0, id:7	// ATTACHED
> [  127.492812] [DEBUG4] sdw_handle_slave_status, status[2] : 1, slave->status: 0, id:3
> [  127.492814] [DEBUG4] sdw_handle_slave_status IN2 status[0] = 0
> [  127.492816] [DEBUG4] sdw_handle_slave_status IN3
> [  127.492818] [DEBUG4] sdw_handle_slave_status status[1] = SDW_SLAVE_ATTACHED, slave->status : 0, slave:7, prev_status:0
> [  127.492820] [DEBUG4] sdw_modify_slave_status, ID:7, status: 1
> [  127.493008] [DEBUG4] sdw_update_slave_status update_status(1) IN slave:7
> [  127.493010] [DEBUG4] sdw_update_slave_status update_status(1) OUT
> [  127.493012] [DEBUG] max98373_update_status IN hw_init:1, status: 1, slave :7
> [  127.493015] [DEBUG] max98373_update_status IN2 hw_init:1, max98373->first_hw_init: 1, status: 1
> [  127.493017] [DEBUG4] sdw_handle_slave_status status[2] = SDW_SLAVE_ATTACHED, slave->status : 0, slave:3, prev_status:0
> [  127.493019] [DEBUG4] sdw_modify_slave_status, ID:3, status: 1
> [  127.493199] [DEBUG4] sdw_update_slave_status update_status(1) IN slave:3
> [  127.493201] [DEBUG4] sdw_update_slave_status update_status(1) OUT
> [  127.493204] [DEBUG] max98373_update_status IN hw_init:1, status: 1, slave :3
> [  127.493207] [DEBUG] max98373_update_status IN2 hw_init:1, max98373->first_hw_init: 1, status: 1

I don't really see anything in this sequence that differs from my
explanations?

The update_status() is only called when the device has a non-zero device
number.

There may be a real problem with update_status() not being called but I
just don't see it so far.

One way to improve the traces would be to use dev_dbg, that way we'd
have a trace of which device is being handled. There are two devices
managed by the same driver, a trace with pr_dbg doesn't tell us much.
