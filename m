Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161128BB50
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 16:49:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B931690;
	Mon, 12 Oct 2020 16:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B931690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602514140;
	bh=vvc9OHCREkQSqNm1feM6/yeYfDisE+FAfhXTuBxvntI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RvDCXJ74KJjWMjj1vpxuXHlgx1FsQyX51qAo2MoJCP7hn/ztTwVFqcZF3nqXc0G/d
	 6i5eFzWW660UbkIOgb42HGxlpwzXRQ1IHhDdxtqR8WdnYzzbLDiF0ldm45TzExcz+B
	 5GHWHjlQ8zQF7z1H3bGK76rGKl3RULb/Paz0by8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB199F8021D;
	Mon, 12 Oct 2020 16:47:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A2B5F80217; Mon, 12 Oct 2020 16:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E16BF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 16:47:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 876BAA003F;
 Mon, 12 Oct 2020 16:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 876BAA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602514029; bh=eN+xWFxHaM5XxFYwmMtzsphG84qR19qSOiZPtrl78IQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=APlWGXTR+6iB97joa5UBiWgr0RIQjOEvmlRXHa+McuYy0d+T9QNAuRyFvQVpfQIYR
 UUw57vVlHPpSTNxh/XOyZjS8ZLLbKLQlUxVXnOyBtIvmibeDKCuTWJtmQ7pkKoo2ov
 qaZzqIx9i1RWmNJh42qinlP7fV4JXpjKbWlkBJfY=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 12 Oct 2020 16:46:56 +0200 (CEST)
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
To: Takashi Iwai <tiwai@suse.de>
References: <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
 <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com> <s5hr1q7sa9f.wl-tiwai@suse.de>
 <831bbfcf-9720-9100-8633-65932b415cab@perex.cz>
 <s5ha6wusb2l.wl-tiwai@suse.de> <20201012052525.GH2968@vkoul-mobl>
 <s5hk0vwq65o.wl-tiwai@suse.de> <20201012122423.GJ2968@vkoul-mobl>
 <5b26cdd5-8a15-fa26-86af-13bfbfad5341@perex.cz>
 <20201012135540.GK2968@vkoul-mobl>
 <777e0046-1e3a-e702-c070-cac4c0525ccd@perex.cz>
 <s5hh7qzplsb.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <0afa7a39-84d5-0b9b-5453-8e7848a30bb6@perex.cz>
Date: Mon, 12 Oct 2020 16:46:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <s5hh7qzplsb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 kimty@samsung.com, s47.kang@samsung.com, tiwai@suse.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, hmseo@samsung.com,
 Gyeongtaek Lee <gt82.lee@samsung.com>, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

Dne 12. 10. 20 v 16:21 Takashi Iwai napsal(a):

> But, I doubt whether we really need to care about that; as mentioned
> earlier, there is little to change from the user-space side.  It just
> pause or resume.  The only difference is the resume target, and
> honestly speaking, there is no interest in it from user-space side.
> And, the rest is about the kernel internal, and this can be really
> done in the way of the original patch.  The flow is quite simple and
> understandable...

The core compress code already uses the state mechanism (although internally).

Also, it's really unclear if all drivers were checked, if the pause triggers
can be called from the drain state (I know it's another point, but the drivers
should probably offer a flag that they support this). And why to call the
pause release callback when there's no pause (drain + release ioctl instead
drain + pause + release ioctl)? It's a clear midlevel code fault. This
protection should be there not in the hw drivers.

I refer the original patch:
  https://lore.kernel.org/alsa-devel/000c01d69585$228db6b0$67a92410$@samsung.com/

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
