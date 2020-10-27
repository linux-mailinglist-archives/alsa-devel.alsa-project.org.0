Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4729AB10
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 12:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129C2168E;
	Tue, 27 Oct 2020 12:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129C2168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603798963;
	bh=x5vBDAQA3vwASRaDE2A+sxJdjP48ablZBQzpW7Xycpo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fd/d4OyVn99LvaOC/jcEsot23sp3bFNzrbcJQkKhqeFCDk0+U7WTFzNiiaHo288sM
	 iYHmgV28Wm4DW5VwKv8UpW35lAg4Fmdk9THGNYE84sCX9x/2pBDX2KQpKMFg+/MHUQ
	 kHi5oewXuT/BgEdhog8Z6RdXh+zH6UR4j9KbW/+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F92F80217;
	Tue, 27 Oct 2020 12:41:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23098F8020D; Tue, 27 Oct 2020 12:41:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB15F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 12:41:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB15F80086
IronPort-SDR: Iw+7oGkvZ7Z9LXWjE49PWehU1+tP3oVOzdg9yiQg4pPH4RmKFQhKkd5RlwmqAMO3RQ5A7XYAiO
 j9ATMdERUzHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="168163656"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="168163656"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 04:41:04 -0700
IronPort-SDR: SUivjGOGsc0c2mmPKR5lmGTTCBFs/D170rHhrqy8P1w337Ch8cRtlYiR/V0I4x/W5Fu9YN0bCY
 IdkxspCNIPuA==
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="525856545"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 04:41:02 -0700
Date: Tue, 27 Oct 2020 13:38:56 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 3/4] ALSA: hda: Separate runtime and system suspend
In-Reply-To: <20201027054001.1800-4-kai.heng.feng@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2010271317430.864696@eliteleevi.tm.intel.com>
References: <20201027054001.1800-1-kai.heng.feng@canonical.com>
 <20201027054001.1800-4-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: hui.wang@canonical.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org
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

thanks, this looks like a good improvement! Some minor notes:

On Tue, 27 Oct 2020, Kai-Heng Feng wrote:

> Both pm_runtime_force_suspend() and pm_runtime_force_resume() have
> some implicit checks, so it can make code flow more straightfoward if we
> separate runtime and systemd suspend callbacks.

straightforward -> straightforward

and systemd? Maybe just "system suspend"? :)

> While at it, also remove AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP, as the
> original bug commit a6630529aecb ("ALSA: hda: Workaround for spurious
> wakeups on some Intel platforms") solves doesn't happen with this
> patch.

Hmm, so this was gone already with the v1 version (so not related to 
programming the WAKEEN when going to system suspend)?

> @@ -143,6 +143,7 @@ struct azx {
>  	unsigned int align_buffer_size:1;
>  	unsigned int region_requested:1;
>  	unsigned int disabled:1; /* disabled by vga_switcheroo */
> +	unsigned int prepared:1;

I wonder if "pm_prepared" would be better as ALSA API has a prepare method 
as well and this is not related. OTOH, if ok to Takashi, ok for me as 
well. 

> +	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
> +		   ~STATESTS_INT_MASK);

This would fit to one line now. 

Br, Kai
