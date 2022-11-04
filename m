Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8D619ED0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 18:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37921664;
	Fri,  4 Nov 2022 18:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37921664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667583286;
	bh=5EVt633C6FjYMJCoDyyLdZcnFXxZLw/+AxJGFjKIWPE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZfJA4NgPNgKWo4QN3KffCmwcvPeUFvZFUAlHfcVP4r+COkbIuJSshSwcbiumeB/N
	 d4meDQPyZiWuzFrDPow8jFLVz0iuDX+Qrsn/J7WD/0NkZBlMOqW4xzrkkDKgUsHMXx
	 rRZvXpfIOqzB6zo3flUcoibtuD3dNWviAGoceXsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E91DF8047D;
	Fri,  4 Nov 2022 18:33:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5356CF80448; Fri,  4 Nov 2022 18:33:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97E33F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 18:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E33F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mglurZ92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667583226; x=1699119226;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=5EVt633C6FjYMJCoDyyLdZcnFXxZLw/+AxJGFjKIWPE=;
 b=mglurZ92R0Ifw1/MOsiPd/h5sYFbDDrFXDR0VmQZ782HyYMEGM7cr9S1
 esaEuG9a6MFC0i+6av+ZPuf6BUJ5Fj2jYsy8bQ4x6XhNYxsWxTviplVmn
 7MY9uOYxRl2jfWNcODXCmNzMH22SsAJaWX/SFLH9BMdKk9yu9HaOeRdSP
 MO9X1RbmD/7+gVq3/1jPLiWq4OiuWuIR2pXGGzUyAnQ5b3yQYxa1hXRwL
 lBsBOmO1NzLmy6xQkZ8sNTQG7px0FQ4uGBaMT3Zu0q+ICn9Q/7OqUAxoX
 5VQ9pTti05eR/KvVOCCC51uvHfiYcCdueNAbaJIIFEC0BEibmldMYw6Vm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="396324242"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="396324242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:33:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="740704599"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="740704599"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:33:42 -0700
Date: Fri, 4 Nov 2022 19:33:47 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: regression with SG DMA buf allocations and IOMMU in low-mem
In-Reply-To: <87k04aiuo1.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2211041930270.3532114@eliteleevi.tm.intel.com>
References: <alpine.DEB.2.22.394.2211041541090.3532114@eliteleevi.tm.intel.com>
 <87r0yiiw6s.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2211041741520.3532114@eliteleevi.tm.intel.com>
 <87k04aiuo1.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Fri, 4 Nov 2022, Takashi Iwai wrote:

> On Fri, 04 Nov 2022 16:42:29 +0100, Kai Vehmanen wrote:
> > I think an explicit error would be best. The problem now is that the 
> > driver will think the allocation (and mapping to device) is fine and 
> > proceeds to program the hardware to use the address. This will then create 
> > an IOMMU fault down the line that is not so straighforward to recover from 
> > (worst case is that a full device level reset needs to be done). And given 
> > driver doesn't know it got a faulty mapping, it's hard to make the 
> > decision why the fault happened.
> 
> OK, then what I posted in another mail (it went to nirvana) might
> work.  Attached below again.

thanks! Let me put this through testing and get back to you next 
week. We'll also debug a bit more what exactly goes on that leads to 
dma_alloc_noncontiguous failing.

Br, Kai
