Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF762EAAE2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 13:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD450167C;
	Tue,  5 Jan 2021 13:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD450167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609849838;
	bh=zJOCG8hahXefohBeT/21qC3c48jr4mWs+j7APVcd27A=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LME20JvlM41owsg0gJpPahDgJchzMnB584ZRZkBk7Y+L6G1PczexVKtXR2jYaZShW
	 oNLVPgyXVxz/YCd1WZL+Pwz1Lp80jrCYdRBonvXfslhMdu/qBvgvYr+Jz1DNIYTBhY
	 zrSDAvbs5gGpoaTpwx7nyPFEUqkcHZ9CFH+/84T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40308F8027D;
	Tue,  5 Jan 2021 13:29:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CEBCF80258; Tue,  5 Jan 2021 13:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E7C3F8015B;
 Tue,  5 Jan 2021 13:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7C3F8015B
IronPort-SDR: svrZlXU2QMMFwZuUJ85rAtLGRh/eZtcq8C+EDtmHy/LBDZPjeoJ9QW3yZIQzyMIvwAuiAXeFoT
 Vqg9ldUvl8rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="241179960"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="241179960"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 04:28:44 -0800
IronPort-SDR: oV0oLDcpmc1m6hLknczWLIBVxARy3d03mwwTfWBlVhQoOM/I6mJq083EN/khUPNLvtl4oJx7Te
 lk5+boiVwd/w==
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="378851997"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 04:28:40 -0800
Date: Tue, 5 Jan 2021 14:25:43 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 3/3] ASoC: SOF: Intel: hda: Avoid checking jack on
 system suspend
In-Reply-To: <20210104140853.228448-3-kai.heng.feng@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2101051354300.864696@eliteleevi.tm.intel.com>
References: <20210104140853.228448-1-kai.heng.feng@canonical.com>
 <20210104140853.228448-3-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>, daniel.baluta@nxp.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Hey,

On Mon, 4 Jan 2021, Kai-Heng Feng wrote:

> System takes a very long time to suspend after commit 215a22ed31a1
> ("ALSA: hda: Refactor codec PM to use direct-complete optimization"):
> [   90.065964] PM: suspend entry (s2idle)

the patch itself looks good, but can you explain a bit more in what 
conditions you hit the delay?

I tried to reproduce the delay on multiple systems (with tip of 
tiwai/master), but with no luck. I can see hda_jackpoll_work() called, but 
at this point runtime pm has been disabled already (via 
__device_suspend()) and snd_hdac_is_power_on() will return true even when 
pm_runtime_suspended() is true as well (which is expected as runtime-pm is 
disabled at this point for system suspend). End result is codec is not 
powered up in hda_jackpoll_work() and suspend is not delayed.

The patch still seems correct. You would hit the problem you describe if 
jackpoll_interval was set to a non-zero value (not the case on most 
systems supported by SOF, but still a possibility). I'm still curious how 
you hit the problem. At minimum, we are missing a scenario in our testing.

Br, Kai
