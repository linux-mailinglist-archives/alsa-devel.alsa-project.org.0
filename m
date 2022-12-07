Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F24645A3E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 13:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49781917;
	Wed,  7 Dec 2022 13:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49781917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670417829;
	bh=0mCc63PYXRSLNyoU3BugGf4BruhyAiG1jc49h4GgrDo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGQem5MZsYudaU0D1rhfU/D3YlXBUlK/CU55w62yxi/EBV2myhvszTmYWE36TxZgm
	 sV3l31AANswdfA//fdyCCb+PsMEP2x/9+Hkc9SLfVfi8rWdmFX2tuHuEd8t9ZSeGVT
	 yEFLWqUmUfCuFZJmWI14OuWa8cobB+DOdLwgyPrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A041F80169;
	Wed,  7 Dec 2022 13:56:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FEF7F802BE; Wed,  7 Dec 2022 13:56:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03089F80169
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 13:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03089F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IGMdNTIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670417769; x=1701953769;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=0mCc63PYXRSLNyoU3BugGf4BruhyAiG1jc49h4GgrDo=;
 b=IGMdNTIMehLy5J9ZwP9lWwr3jxwZbTLPm1tmBuLHW/kedR/nD9sCG/Uj
 fdKeqvQSICdZ1sKazTGxzpXDOGIBmPdPmoyZTQMya4GGpLS3sYFoU+LGL
 q8GerBf0gfZMYcEgoVsZRZ3360lSAcZQkWdbedHWRt2B3M3NIdHtAxe8A
 NRybsijH3DZhb35EhcKeDcqEbpNQ1KLPr37Yl5K2yeh3tIa3p+um6IDCC
 Gs1rwNYwAjdlElnNtnBHFCTUSXpvgcOVOFUb68Bia0XFSfyyF4sYe/qsK
 VCfwXywdSwlfzjifGk0BUN3J1Y9hWjK9Ju57EDdLaWdjj9kAO/tQxEi8u A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="318026084"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="318026084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 04:56:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="624292451"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="624292451"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 04:56:03 -0800
Date: Wed, 7 Dec 2022 14:55:45 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoc: SOF: Fix sof-audio-pci-intel-tgl shutdown timeout
 during hibernation
In-Reply-To: <87cz8va4hc.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2212071452350.3532114@eliteleevi.tm.intel.com>
References: <20221207102229.25962-1-nizhen@uniontech.com>
 <87cz8va4hc.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Zhen Ni <nizhen@uniontech.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>
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

On Wed, 7 Dec 2022, Takashi Iwai wrote:

> On Wed, 07 Dec 2022 11:22:29 +0100, Zhen Ni wrote:
> > On Dell Latitude 3420 Notebook, sof-audio-pci-intel-tgl may fail to shutdown
> > sporadically during hibernation as following log:
> > 
> > [   43.281110] PM: Image saving done
> > [   43.281699] PM: hibernation: Wrote 2828852 kbytes in 2.78 seconds(1017.57 MB/s)
> > [   43.282359] PM: SI
> > [   43.345156] kvm: exiting hardware virtualization
> > [   43.345865] auxiliary snd_sof.hda-probes.0: shutdown
>
> 
> It's a known problem and being discussed (although it's a slightly
> different code path):
>   https://lore.kernel.org/r/20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org

thanks Zhen Ni for the report and patch. We have a fix candidate
in review+testing at:
https://github.com/thesofproject/linux/pull/4072

... that should help in your case as well. Once testing is complete,
we'll be sending the patch series to alsa-devel.

Br, Kai
