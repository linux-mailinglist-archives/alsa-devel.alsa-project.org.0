Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E000363BFCF
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A7316C1;
	Tue, 29 Nov 2022 13:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A7316C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669723999;
	bh=syqkRepxkIQCwrzgin/klTRI4EpfJPD3DQtz+X7x25E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eD69J9SscBB4kl5d9PVfP6A7/ofBBjAIUldugF5+TprGpcAsfYeFUfIsaM778jF3n
	 /tzMMpKUlCN7PxtGvEBG3Bo+ufzx/uyhNFS7eRV2/arOmXM1Yb/7udZ0TIKvtgDmTV
	 zRPft8JhkJQLgene7f5jwQ06zDnj4QHefgLIiups=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69720F80482;
	Tue, 29 Nov 2022 13:12:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93120F801F7; Tue, 29 Nov 2022 13:12:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D859EF80166;
 Tue, 29 Nov 2022 13:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D859EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mO5Fzgta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669723939; x=1701259939;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=syqkRepxkIQCwrzgin/klTRI4EpfJPD3DQtz+X7x25E=;
 b=mO5FzgtaYihNPXpRDYL0agPNWLH9UJftFvaYVTUciZ7tMDgW5afHHQW+
 //8LSjTCLXHNRLpSd11HyRKugX8mHIo7GobQV/NIUiOY0mNX3MlXDaEvC
 3rkXVss27GisnP9tJ0ERf9/rEOK8uxNMZougUFV9PRG1uVPD7J0EalJXY
 r9kWrdgJhO8CZp86KWdKKzGzHhcErvkq1SiZcKo47xQGPQeemt7NYakqI
 Dvln6BSvVYzoxLleoxMPFBFwKxOf493o8wozhSRsNMUDP0DF3uupAHDk5
 zZM4xCL1L9h2JQKDUoedGGMx7nBmtRJsZ7iYKASoagpzRBBf6XNQQmO5J Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="313794976"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="313794976"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 04:11:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="712349561"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="712349561"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 04:11:49 -0800
Date: Tue, 29 Nov 2022 14:11:34 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4] ALSA: core: Fix deadlock when shutdown a frozen
 userspace
In-Reply-To: <87edtmqjtd.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2211291355350.3532114@eliteleevi.tm.intel.com>
References: <20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org>
 <5171929e-b750-d2f1-fec9-b34d76c18dcb@linux.intel.com>
 <87mt8bqaca.wl-tiwai@suse.de>
 <16ddcbb9-8afa-ff18-05f9-2e9e01baf3ea@linux.intel.com>
 <87edtmqjtd.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

Hi

On Tue, 29 Nov 2022, Takashi Iwai wrote:

> On Mon, 28 Nov 2022 18:26:03 +0100, Pierre-Louis Bossart wrote:
> > As Kai mentioned it, this step helped with a S5 issue earlier in 2022.
> > Removing this will mechanically bring the issue back and break other
> > Chromebooks.
> 
> Yeah I don't mean that this fix is right, either.  But the earlier fix
> has apparently a problem and needs another fix.
> 
> Though, it's not clear why the full unregister of clients is needed at
> the first place; judging only from the patch description of commit
> 83bfc7e793b5, what we want is only to shut up the further user space
> action?  If so, just call snd_card_disconnect() would suffice?

I think the snd_card_disconnect() is what we are looking after here, but 
it's just easiest to do via unregister in SOF as that will trigger will 
look up the platform device, unregister it, and it eventually the driver 
owning the card will do the disconnect. Possibility for sure to do a more
direct implementation and not run the full unregister.

On the other end of the solution spectrum, we had this alternative to let 
user-space stay connected and just have the DSP implementations handle 
any pending work in their respective shutdown handlers. I.e. we had
"ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
https://github.com/thesofproject/linux/pull/3388

This was eventually dropped (and never sent upstream) as 83bfc7e793b5 got 
the same result, and covered all SOF platforms with a single code path.
Bringing this back is of course one option, but then this might suprise 
other platforms (which might have got used to user-space getting 
disconnected at shutdown via 83bfc7e793b5).

Br, Kai
