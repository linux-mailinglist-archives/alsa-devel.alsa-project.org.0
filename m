Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37E31C6A4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 07:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A0E83D;
	Tue, 16 Feb 2021 07:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A0E83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613458683;
	bh=m50MopKZGl+mvg8z6f8ZybOQKxURD3z89fRPGRcba/I=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQkOyqFj5KsmPH53s/zOiCyLCLcNtrbV/VoNSRZ5x7F3256QYcaIC/Pa8dKNDsxdD
	 ZMp1KZ5A8VxYH2UO9rSIiBcVDOugWPElQg6odXLrGRL7qODWhDERXYbRZf32YnBcYV
	 Kv7Gtt0WgcDkh/xKP7MdprSPa8GVg59C0bOdKrCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F03F8016E;
	Tue, 16 Feb 2021 07:56:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C40F8015A; Tue, 16 Feb 2021 07:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1ECFF8014D
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 07:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1ECFF8014D
IronPort-SDR: hTsNK/SRZGrwIL+yudUovAUiQ67TeuOYtOZOtp66sWnTmP2Wn+jKiCFuMOsZ8xNXqN/AgozKXK
 G9A2C2iqHXQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="169953426"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="169953426"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 22:56:11 -0800
IronPort-SDR: 0BcEl9lAGUqxKy1YRpRPLlXNBNJ2IhKmp8F6hi5B4Vagy3o+/vsdW2PcNA5xtAjINWtIkhtYPR
 4+we+kxs4LDA==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="399383939"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 22:56:09 -0800
Date: Tue, 16 Feb 2021 08:52:38 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: add soc_pcm_hw_update_chan()
In-Reply-To: <20210215204527.GC4378@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2102160840420.864696@eliteleevi.tm.intel.com>
References: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
 <87r1lw90oo.wl-kuninori.morimoto.gx@renesas.com>
 <62f03ec8-7b9c-4550-d63d-cc50693e62fa@linux.intel.com>
 <alpine.DEB.2.22.394.2102142311050.864696@eliteleevi.tm.intel.com>
 <20210215204527.GC4378@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 15 Feb 2021, Mark Brown wrote:

> On Sun, Feb 14, 2021 at 11:17:03PM +0200, Kai Vehmanen wrote:
> > On Fri, 12 Feb 2021, Pierre-Louis Bossart wrote:
> > > This patch seems to break all SOF platforms. I tested manually to try and
> > > reproduce the CI results and it's indeed not so good:
> > The new helper functions seem all correct, but the problem would seem to 
> > be in the dpcm_init_runtime_hw() as some of the inputs are not initialized 
> 
> I've applied the fixup patch, if someone could confirm that the CI looks
> good I'll send the pull request for this release.

SOF CI now has had multiple all-passed runs with the fixup included while 
it fails systematically without it:
https://sof-ci.01.org/linuxpr/PR2756/build5292/devicetest/

Morimoto-san, did you have a look at the code changes? 

I think we might still have issues if we have multiple CPU DAIs per
runtime and dpcm_init_runtime_hw() is called multiple times. With the 
fixup, the limits are taken from the last CPU DAI.

But if you look at original code, the same issues seems to be there
(rate and channels taken from the stream directly with no consideration
of already set values). Only exception is runtime->hw.formats, which
is handled differently:

»       runtime->hw.rate_min = stream->rate_min;
»       runtime->hw.rate_max = min_not_zero(stream->rate_max, UINT_MAX);
»       runtime->hw.channels_min = stream->channels_min;
»       runtime->hw.channels_max = stream->channels_max;
»       if (runtime->hw.formats)
»       »       runtime->hw.formats &= stream->formats;
»       else
»       »       runtime->hw.formats = stream->formats;
»       runtime->hw.rates = stream->rates;

... so the fixup also resets hw.formats, but it does not seem logical to 
have different treatment only for hw.formats in the mult-CPU-DAI case.

But yes, more reviewers are welcome. 

Br, Kai
