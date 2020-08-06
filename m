Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B967D23DB5E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 17:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB9D836;
	Thu,  6 Aug 2020 17:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB9D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596727957;
	bh=dxBQJ4pOuqxA4+vJMOmmU3pL1qI4BWhKRGSKxh2KjsA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcM0aFsKtBDVYTeppDHwR6eI7GNaTb9gKEGGmVTGaucGVJxrOdbWM09P7Llp9ppeX
	 JrvtVk2WdcLiCSAwMdT44K0In/EoM+ULaGq1UcLWsXNXlkUyky4VqweRzaQ/pvpYZe
	 SNiejvT/9Hz2ZZhxgIHYSEMbWnVM3cfp2ekT/Z3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D71F80124;
	Thu,  6 Aug 2020 17:30:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A340F80159; Thu,  6 Aug 2020 17:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E038EF800B7;
 Thu,  6 Aug 2020 17:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E038EF800B7
IronPort-SDR: gWRtDKqlvgGwIWfn2ViCC1ESaGRwOKihTaPPNQC9pwkQ/LvRIkb/FOSxLBS/VWSbrF4QGEoM6m
 S1WOMPFEFU5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="152790224"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="152790224"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 08:30:38 -0700
IronPort-SDR: 1Qs10kIeUT9fjMaG5kGvNUEOW104xKKx88EsiCs6bwgChKy7t2j2Ugywi+2YNq9ioL9BDgLmho
 whibYUOgkiQg==
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="289304714"
Received: from sankarvi-mobl1.amr.corp.intel.com (HELO [10.212.101.9])
 ([10.212.101.9])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 08:30:37 -0700
Subject: Re: [pulseaudio-discuss] Why doesn't mixer control (values) have some
 kind of locking mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <61bf48f0-e63e-c762-c083-27a0bf371483@linux.intel.com>
Date: Thu, 6 Aug 2020 10:30:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806020601.GA6286@laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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




> ALSA control core allows applications to lock/unlock a control element
> so that any write opreation to the control element fails for processes
> except for owner process.
> 
> When a process requests `SNDRV_CTL_IOCTL_ELEM_LOCK`[1] against a
> control element. After operating the request, the control element is
> under 'owned by the process' state. In this state, any request of
> `SNDRV_CTL_IOCTL_ELEM_WRITE` from the other processes fails with
> `-EPERM`[2]. The write operation from the owner process is successful
> only. When the owner process is going to finish, the state is
> released[3].
> 
> ALSA userspace library, a.k.a alsa-lib, has a pair of
> `snd_ctl_elem_lock()` and `snd_ctl_elem_unlock()` as its exported
> API[4].

Thank you Sakamoto-san for this explanation, I wasn't even aware this 
existed.

What I was trying to describe in my earlier answer is a different need 
to have an atomic update of *multiple* controls.

If e.g. a DSP or hardware engine exposes two separate filters for left 
and right channels, and the coefficients for those filters are modified 
with separate controls, it would be really nice to have the capability 
of writing these controls separately, but have a 'commit' mechanism so 
that these updated coefficients are used at the same time by the left 
and right filters.
