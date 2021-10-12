Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE842A8E9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 17:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3068168C;
	Tue, 12 Oct 2021 17:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3068168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634054203;
	bh=HptCr8BZIgr4lhgUQkMZuzvptNOCvQLk/P1AcIlppQI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kl6BWSZo0jBzOp1q+isJ38lU5UwMYRaZyXFqH16cxvXi+tAhE7SC9WrxSoeGHxgov
	 hDmTmLihvD3ZXyC03ItkaiWzeA0RfzffTH66SRha1U4j2Y9MEVEop/oFC6I+WnEbHv
	 PyKiiRKOU3Z+Sw5mcdj/Bi8JfLm34wRgDtCQNk/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA30F80088;
	Tue, 12 Oct 2021 17:55:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D96F80212; Tue, 12 Oct 2021 17:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BDACF800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 17:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BDACF800CB
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288063977"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="288063977"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 08:55:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="491035592"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 08:55:12 -0700
Date: Tue, 12 Oct 2021 18:48:12 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: avoid write to STATESTS if controller is in
 reset
In-Reply-To: <s5ho87u1e5o.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2110121805270.3554566@eliteleevi.tm.intel.com>
References: <20211012142935.3731820-1-kai.vehmanen@linux.intel.com>
 <s5ho87u1e5o.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Danny Tholen <obiwan@mailmij.org>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Alex Deucher <alexander.deucher@amd.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>
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

On Tue, 12 Oct 2021, Takashi Iwai wrote:

> > The snd_hdac_bus_reset_link() contains logic to clear STATESTS register
> > before performing controller reset. This code dates back to an old
> > bugfix in commit e8a7f136f5ed ("[ALSA] hda-intel - Improve HD-audio
> > codec probing robustness"). Originally the code was added to
> > azx_reset().
[...]
> Do we have a bug reference?  I guess it worth to be pushed to 5.15-rc
> and Cc-to-stable, if this is hitting already on the recent machines.

I unfortunately don't have a public bug reference to share. This will 
impact PCIe based Intel hardware like DG1. The DRM support is quite 
recent for these, so in practise this only affects 5.15-rc and newer.

And even on these, the functionality will be ok, it's just the warnings 
that fill the kernel log that are a problem.

Br, Kai
