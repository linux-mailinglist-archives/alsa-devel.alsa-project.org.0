Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59641E1EF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 21:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809D716AD;
	Thu, 30 Sep 2021 21:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809D716AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633028556;
	bh=Qz863+bWEaL8o/BWGl2odr26gsnLbkYJA7sh+47YBIA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+MfWszR6O80zqnJKMyD/sAuGgc3+wq1L8WxQK6WLjE9hhHPTcVzMxtH7cA6ALJEg
	 FJ8y2wVwFTrpx9PHMc7g4kpNLzdD7Jlw4s6+1aXgYRyKkecffeqXG0+cHoPB/2nyiK
	 zV4/xZsCdv3Q/icGfg+r5ZfxbrugNRfhovk51K5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F30F800F3;
	Thu, 30 Sep 2021 21:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12D83F804AD; Thu, 30 Sep 2021 21:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89CB8F800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 21:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CB8F800F3
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="247812573"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="247812573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 12:01:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="521314581"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180])
 ([10.212.88.180])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 12:01:01 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
 perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <40f098c8-b9e3-8da6-849a-eb9a39fefdb0@linux.intel.com>
Date: Thu, 30 Sep 2021 14:00:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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


> 1. The original issue at my end was not just a configuration redundancy.
> I realize now that with more stream addition following error print is seen.
>    "ASoC: too many users playback at open 4"
> 
>    This is because the max DPCM users is capped at 8. Increasing this
> may help (need to see what number is better), but does not address the
> redundancy problem.
Going back to this DPCM_MAX_BE_USERS definition, it seems rather
arbitrary and not so useful indeed.

	/* first time the dpcm is open ? */
	if (be->dpcm[stream].users == DPCM_MAX_BE_USERS) {
		dev_err(be->dev, "ASoC: too many users %s at open %d\n",
			stream ? "capture" : "playback",
			be->dpcm[stream].state);
		continue;
	}

The comment is no longer aligned with the code, wondering if this is a
feature or a bug. There's no reason to arbitrarily restrict the number
of users of a BE, or the check would need to use platform-specific
information such as the number of inputs/outputs supported by a mixer/demux.

Maybe Morimoto-san can comment since this was added in:

1db19c151819 ('ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count')

We're not done with soc-pcm.c cleanups :-)
