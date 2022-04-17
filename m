Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976EF504794
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Apr 2022 12:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEC316BD;
	Sun, 17 Apr 2022 12:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEC316BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650191080;
	bh=4On0Cbfe3F9jJRPrNu/4wPAof3QOsnIgvlEOmaEeLjI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPvwtWN6Pvkx/hs47+CU71k3Ikk59mlxR8B5LFUyrEseJtndv21kLPDao7iQbIyNH
	 l9rSAi20j0tsckHb9rQeWBHg1w13EggiH02Pl/GqoDY14j4ZpwBqTXPaJJNGFWAdVV
	 6RDxbz0hPRO0PZOTeYzuok8tNKfns2kzByUQKXGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4ABAF80107;
	Sun, 17 Apr 2022 12:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87BE7F80256; Sun, 17 Apr 2022 12:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE67CF800FB
 for <alsa-devel@alsa-project.org>; Sun, 17 Apr 2022 12:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE67CF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Tw9hToxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650191016; x=1681727016;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=4On0Cbfe3F9jJRPrNu/4wPAof3QOsnIgvlEOmaEeLjI=;
 b=Tw9hToxPhXioN9ZwqDwfCIVJbuhCof7RD9MTn/pu7UxSUfZzXcsaiQ7j
 dgqoBP+3x5nUeOzsluNPG2S8b+M3b7yqWwdlqs2KTsheQxzpOk9O2IJ8a
 7SMXCvQ7lqDNAs0TYV7ono16fRPCavo82CEqkXwwh47LH1S9xVp7LH1X9
 vgbJnYWATkALr+0PgTON49DjkxoIxBZL4PurYUR0DdmtLs7aMVh0znjcH
 wFrwU+APgkjTHj81zq9U+eJ9CXUWL6MMoa6kStMstpDDJciP8hQTduuxn
 xpqZNi9SIcM7iwhLJDXTX9ieTnP2kBcHseNJrdvXJikQNzgh0rjjicJWK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="288455507"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="288455507"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 03:23:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="664299045"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 03:23:29 -0700
Date: Sun, 17 Apr 2022 13:13:49 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] ALSA: hda/i915: Fix one too many pci_dev_put()
In-Reply-To: <20220416064418.2364582-1-lucas.demarchi@intel.com>
Message-ID: <alpine.DEB.2.22.394.2204171309420.1532214@eliteleevi.tm.intel.com>
References: <20220416064418.2364582-1-lucas.demarchi@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Fri, 15 Apr 2022, Lucas De Marchi wrote:

> pci_get_class() will already unref the pci device passed as argument.
> So if it's unconditionally unref'ed, even if the loop is not stopped,

thanks Lucas. And yes indeed, overlooked that pci_get_class() 
will decrement the from device is specified.

> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -127,11 +127,10 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>  		display_dev = pci_get_class(class, display_dev);
>  
>  		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
> -		    connectivity_check(display_dev, hdac_pci))
> +		    connectivity_check(display_dev, hdac_pci)) {
> +			pci_dev_put(display_dev);
>  			match = true;
> -
> -		pci_dev_put(display_dev);
> -
> +		}

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
