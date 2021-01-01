Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858042E8539
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 18:52:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1019016BF;
	Fri,  1 Jan 2021 18:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1019016BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609523525;
	bh=zY7KikxfEZVEKn0pSa4SyJ8bgTIikPPXbCWbsGpsFac=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGlQnTu+Hhdx/VGduknwrD/uY2ixokmFTvr7WHkoIWZwrgC/aK0gxgGp7rJc1/5pS
	 BcwsMYU1V+VqsqEKJ63ovQ5kEYin/orRrCcEkzfrUamB0VsEX3pEuOZPFuaW9sH0Ar
	 QbzVRygRUkyk7CvrEljRPErzMd1RlM/BwvbsJIKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F125F8020B;
	Fri,  1 Jan 2021 18:50:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD1F9F801F5; Fri,  1 Jan 2021 18:50:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACF7AF8015F
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 18:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF7AF8015F
IronPort-SDR: aPfJPCASeysaccqWzvT7FpLikxpoWaLpHqFQwyOibMfR1A6JkgN9BphSAkbZ/v3wmbwCivUWXM
 soMwpE2nYjng==
X-IronPort-AV: E=McAfee;i="6000,8403,9851"; a="173280566"
X-IronPort-AV: E=Sophos;i="5.78,467,1599548400"; d="scan'208";a="173280566"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2021 09:50:18 -0800
IronPort-SDR: Xw7AFN160ANT5nl22RCkUkfTmiTiM45KujxaeMWZJuGPpqabRj1yGWd1rWT1ZIhkJznxyJioU5
 kvNaRTrjiYsg==
X-IronPort-AV: E=Sophos;i="5.78,467,1599548400"; d="scan'208";a="348913388"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2021 09:50:17 -0800
Date: Fri, 1 Jan 2021 19:47:23 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: Fix incorrect mutex unlock in
 silent_stream_disable()
In-Reply-To: <20210101083852.12094-1-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2101011936070.864696@eliteleevi.tm.intel.com>
References: <20210101083852.12094-1-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Jan Alexander Steffens <heftig@archlinux.org>, alsa-devel@alsa-project.org,
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

uh oh, I need to do some soul searching on how this slipped through. Seems
to have been introduced in the V2 of the patch. Fix is correct, thanks 
Jan for reporting!

On Fri, 1 Jan 2021, Takashi Iwai wrote:

> The silent_stream_disable() function introduced by the commit
> b1a5039759cb ("ALSA: hda/hdmi: fix silent stream for first playback to
> DP") takes the per_pin->lock mutex, but it unlocks the wrong one,
> spec->pcm_lock, which causes a deadlock.  This patch corrects it.

Acked-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
