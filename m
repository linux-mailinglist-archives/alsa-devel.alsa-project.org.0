Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57D689DA4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 16:13:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E27DF7;
	Fri,  3 Feb 2023 16:13:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E27DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675437231;
	bh=ASJ+o+dz7Zdb1J3xF+wzEvQk899fpw/RgDv+krI9snA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IO1lat2ryqaSlnSIzSiFsDCWAXHqQYpCWrDH2892VurdtxmqLFrMEJW659WCB4vy8
	 5WM9PZzAKxqYTKgBEb245bOTj0SlEGAslJeL2yerbD2uaukAZuxixSIytbl3YBEoRE
	 Z/KF3/LblP5EVVFQJ+fYykWaj6+Y09K54+YUM21U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B03F80568;
	Fri,  3 Feb 2023 16:11:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 849DCF80558; Fri,  3 Feb 2023 16:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDC41F80519
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 16:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC41F80519
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ImsaIaX+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675437107; x=1706973107;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ASJ+o+dz7Zdb1J3xF+wzEvQk899fpw/RgDv+krI9snA=;
 b=ImsaIaX+8VHM85ynRn+tgDguE+ZtzPbH1tR27UcqAOO58xdekuiYD74y
 3EdYQTkeNrz4bVP/9FqlzhMvWeH7VLXvT8BhvWtFuoKStB+fUpEzBtTPz
 SqTETbTdhKZHMFAUrEtaMkGs/NHRjrTYlbP4QoiGv7tK0X/mlFtPTP/vf
 nWaw5e4ohIBz1/JncPUcTv79PIyv6BISGKEQTyNtZ5h99HkRvoHHaEooh
 K7PavA/iRHiEe+SSIrcea1yqSB7GFnLQC45vyLHhfl3/aOrZ+QIDAyNMw
 qDVNvtpjmy416Fe/DM9zt7PwRJ4Gud9oa64tbdQZF4Z1mrNLpKah76QKB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330898283"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330898283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729290048"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729290048"
Received: from albuitra-desk.amr.corp.intel.com (HELO [10.209.172.145])
 ([10.209.172.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:43 -0800
Message-ID: <91a45f8e-11a6-f276-1ecf-eae2ce625c98@linux.intel.com>
Date: Fri, 3 Feb 2023 08:45:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: Overflow in calculating audio timestamp
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, alsa-devel@alsa-project.org
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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



On 2/2/23 07:55, Alan Young wrote:
> sound/core/pcm_lib.c:update_audio_tstamp() contains the following
> calculation:
> 
>         audio_nsecs = div_u64(audio_frames * 1000000000LL,
>                 runtime->rate);
> 
> This will result in a 64-bit overflow after 4.4 days at 48000 Hz, or 1.1
> days at 192000.
> 
> Are you interested in a patch to improve this?
> 
> The same calculation occurs in a couple of other places.

It's clearly unintentional, thanks for reporting this.

I added this in 2012 in

4eeaaeaea1ce ("ALSA: core: add hooks for audio timestamps")

and probably assumed the use of 64-bit was good enough. You just proved
me wrong!

