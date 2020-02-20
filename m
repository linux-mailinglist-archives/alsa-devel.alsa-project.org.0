Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA0165A3C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 10:35:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D3916A6;
	Thu, 20 Feb 2020 10:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D3916A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582191300;
	bh=IM1vHeeCevaUrnKimt4957z/IPuEUG/L6WWnMDDAcc4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOiEKZ4cHYbEnV8lqfrMIqo3cJY355hqk2jARtuqIb1CAZiZ8v2UY9eTO6UGzS4gs
	 ziqXPV+BKaEzRRX5YvP9FBC6Brs+zWKi8TjQo1GQD0aR80bUFE13XPlH2bMyJVTyn1
	 zMtRN10adRYgR6XKp3/izG6NiIRbsWaeyGb8FmhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033C1F80101;
	Thu, 20 Feb 2020 10:33:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 467EBF80148; Thu, 20 Feb 2020 10:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A84F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 10:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A84F80101
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 01:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,463,1574150400"; d="scan'208";a="269521635"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2020 01:33:04 -0800
Date: Thu, 20 Feb 2020 11:33:03 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
In-Reply-To: <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.21.2002201103060.2957@eliteleevi.tm.intel.com>
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, digetx@gmail.com
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

Hi,

On Thu, 20 Feb 2020, Kuninori Morimoto wrote:

> > ASoC component open/close and snd_soc_component_module_get/put are
> > called independently for each component-substream pair, so the logic
> > in the reverted patch was not sufficient and led to PCM playback and
> > module unload errors.
> 
> But, unfortunately I don't want spaghetti error handling code again.
> I think we can solve it if we can *count* open / module ?
> Can you please test this patch ?

I tested and this version works as well, so:
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

... but, but, I have some doubts about th "opened" tracking as a solution.

A single counter will track the overall number of component-substream 
combinations, but if we have bugs in calling code and e.g. same 
component-substream is passed multiple times to open or close, the 
the single counter will go out of sync.

So if the primary problem is the messy rollback in case one open fails, 
what if we do the rollback directly in soc_pcm_components_open() and do
not add any additional tracking..?

Let me send a proposal patch for that.

Br, Kai
