Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E58628928
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 20:20:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D8F7850;
	Mon, 14 Nov 2022 20:19:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D8F7850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668453601;
	bh=SmOGH9GAvvWbsbbz3DUyvFJ5Uw4ATMKcIvcmDbTz4f4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qx1TQzhf0gzR/Cdt2nhMOln2Ydvm6eKJBPg56hpPSWY1T9OM+Z6MaNIW5qYX798T0
	 IYyZyhUKF/g/PME7OmcxrPwl1vbJLVUxBUj+apd3AcV7Pgp6aXPZJg7Fx5EgQ7SPwv
	 zUDa7L+jkIn1+ahZLya50f3ZAisOD7NrLIrtLZss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB61F800B6;
	Mon, 14 Nov 2022 20:19:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F36F80431; Mon, 14 Nov 2022 20:19:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 972DFF800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 20:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 972DFF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wb+SyGRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668453542; x=1699989542;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=SmOGH9GAvvWbsbbz3DUyvFJ5Uw4ATMKcIvcmDbTz4f4=;
 b=Wb+SyGRol0hrwc3ii3WsX/8e8s6HiByfBmHcNQq1RuHX0F+mvjssh8CW
 1qwgP5kfR409xdF+4S8oH4aZyVnHK02+1iNcoFrMIILsVm8m3xCUgZO1l
 SXnLpBlafcg33IcUoQXYcJBkcH3WSdN4V9yx/peebUxcT8Xy77+VG3D8R
 fBv7TFCqcIcZpA2NpjCRZ2a0oenCjvHSLTRwyEAdKCnujnucQvK4uZRgB
 ++CGknNvxPVmZ0EZX60gWQZomc2jtWwdetYjjGyn/8ApRtl4py5fAypRm
 EUdZEWrWpb5h3k1MyptgMz+egUkL1GiB1Au+7yzbo+K2z/IGR8CarqEvQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="309688444"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="309688444"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 11:18:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="669787573"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="669787573"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 11:18:54 -0800
Date: Mon, 14 Nov 2022 21:18:56 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: memalloc: Allocate more contiguous pages for
 fallback case
In-Reply-To: <20221114141658.29620-1-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2211142116270.3532114@eliteleevi.tm.intel.com>
References: <20221114141658.29620-1-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Mon, 14 Nov 2022, Takashi Iwai wrote:

> free page from the top to the bottom in the zone.  The end result
> looks as if non-contiguous (although it actually is).  What's worth is
> that it leads to an overflow of BDL entries for HD-audio.

typo I'm guessing: "What's worse is"

> For avoiding such a problem, this patch modifies the allocation code
> slightly; now it tries to allocate the larger contiguous chunks as
> much as possible, then reduces to the smaller chunks only if the
> allocation failed -- a similar strategy as the existing
> snd_dma_alloc_pages_fallback() function.

Ack, this seems like a good change. I can see the BDL entries could
run out in some cases with the old code.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
