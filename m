Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37941E523
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 01:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CA9A16B8;
	Fri,  1 Oct 2021 01:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CA9A16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633046108;
	bh=JJU1oSNl4UsYn8rYPjmGhZBMvPkGacuCGgT7yzXxKzY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuCmn2la7Sx4NI4NuVFHU+HEGCLOpf+4p+KLJd2ZITAv3X+Pj0zJSFkZyLKRLawmo
	 3hr63/Plx7FMKHVM86RiA5ZDACjM8+YlDd564m7QpnGC34hQ3yPupvl0ABSUetGhrF
	 fBm3DVqZ8pXJAM1yjyCrRYAhcYd2omJ02Xh5ip+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8497CF80113;
	Fri,  1 Oct 2021 01:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 047EFF804BC; Fri,  1 Oct 2021 01:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AF16F8032C
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 01:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF16F8032C
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="286338782"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="286338782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 16:53:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="521394356"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180])
 ([10.212.88.180])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 16:53:41 -0700
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
 <SJ0PR11MB5661A19958E5E41125FDD695E7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <15dd3868-7023-67c2-991c-a0083f59f0b5@linux.intel.com>
Date: Thu, 30 Sep 2021 18:53:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR11MB5661A19958E5E41125FDD695E7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
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


> I tried to find the reason why the amp was not detached from the bus properly and
> found information about CLOCK_STOP_NOW bit in 0x0044 SCP_Ctrl register.
> It seems like 0x2(ClockStopNow) needs to be configured before the host CLOCK STOP.
> I was able to get a good result if I add this command in the amp driver suspend function.
> The amp driver receives the detachment event and register restoration was done properly
> after the audio resume.
> I can modify the amp driver for this change but it looks like this needs to be done
> from the host side. May I have a comment on this? Thanks.

This register is already taken care of in drivers/soundwire/intel.c and
cadence_master.c

for pm_runtime suspend, the sequence uses sdw_cdns_clock_stop(), which
will try and prepare devices for clock-stop with a callback, in case any
imp-def registers is required, then it will call sdw_bus_clk_stop()
which does a broadcast write:

sdw_bus_clk_stop(struct sdw_bus *bus)
{
	int ret;

	/*
	 * broadcast clock stop now, attached Slaves will ACK this,
	 * unattached will ignore
	 */
	ret = sdw_bwrite_no_pm(bus, SDW_BROADCAST_DEV_NUM,
			       SDW_SCP_CTRL, SDW_SCP_CTRL_CLK_STP_NOW);
	if (ret < 0) {
		if (ret != -ENODATA)
			dev_err(bus->dev, "ClockStopNow Broadcast msg failed %d\n", ret);
		return ret;
	}

The codec driver is not supposed to set this bit on its own, what this
indicates is that the clock will actually stop at the end of the frame.
Only the master/controller driver can transmit this - there's a very
strong reason why its a bus functionality.

The other point is that on pm_runtime resume, the Intel host will start
a SEVERE_RESET sequence. That's a bit different from the 'traditional'
description of the clock stop due to a power optimization on the Intel
side (see more below), but doing a reset has precedence over any other
configuration that might have happened before the clock stopped so the
amplifier SHALL transition to UNATTACHED on a reset.

Somehow it looks like the amplifiers don't see the clock stopped and
don't see the reset, that's rather surprising.

If this happens for system suspend/resume, then it's a different story:
we don't use the clock stop mode at all, the bus will be completely
reconfigured.

You could try to see if the results change by using the 'traditional'
clock stop mode with a kernel module parameters

option snd-sof-intel-hda-common sdw_clock_stop_quirks=0

the default is SDW_INTEL_CLK_STOP_BUS_RESET

/*
 * Require a bus reset (and complete re-enumeration) when exiting
 * clock stop modes. This may be needed if the controller power was
 * turned off and all context lost. This quirk shall not be used if a
 * Slave device needs to remain enumerated and keep its context,
 * e.g. to provide the reasons for the wake, report acoustic events or
 * pass a history buffer.
 */
#define SDW_INTEL_CLK_STOP_BUS_RESET		BIT(3)

In this case, the bus will not be reset, I wonder if this is the part
that's problematic for the amplifier.

Hope this helps
-Pierre
