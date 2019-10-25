Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7241E4EC6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2664617F9;
	Fri, 25 Oct 2019 16:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2664617F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572013215;
	bh=ZlNd0vQQlDWisa/4yGnxjpUIYibhy85ZVYgqsPoDjpo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GndpGWT/VzhAcLIxDS46nfvxEz+JIYeqPhSxeuZj+bz6C8qrcYYO4xh/ojky1mzqd
	 yjy9yWn9OYliuc7n5NSlhu/c3J2rAgy5HeCHLKPJNX4wXZ3gQJ36fbUBoNtN+oE2Vx
	 4EXmx88vYdWgPeYnAMZSUAx1hlNvcgfpDWxhFue4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00DBF803A6;
	Fri, 25 Oct 2019 16:18:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5CFF8036F; Fri, 25 Oct 2019 16:18:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28AFFF802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:18:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1570BA0040;
 Fri, 25 Oct 2019 16:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1570BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572013105; bh=Dpgb5uajyyUyA+Fch4g+XJfQJXUPILXyUzjxxUDk/3c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ep0VSwma7kUPZxkIu4kSsp34/iW5NjNvFF6aW7ckNZXionh0mIexYmsMEQxwTpLWF
 04k3Z+56r6s+yzzAhE/OWr43xsphUPsmhIZR2igWOmp0EqC6JfHx1UY+TK8zV0C0w4
 1hjzfp25iNPWXVzpz2+DqRaianEArQFaYzaOkx+M=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 16:18:20 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191025123038.19728-1-perex@perex.cz>
 <s5hk18tuhio.wl-tiwai@suse.de>
 <bce57a56-99d0-62d7-1d53-099a75349341@perex.cz>
 <s5h36fgvs0m.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9403a6a7-9b7e-c2a4-5acf-50d6cbaea7c7@perex.cz>
Date: Fri, 25 Oct 2019 16:18:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5h36fgvs0m.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 25. 10. 19 v 16:06 Takashi Iwai napsal(a):
> On Fri, 25 Oct 2019 15:57:50 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 25. 10. 19 v 14:38 Takashi Iwai napsal(a):
>>> On Fri, 25 Oct 2019 14:30:38 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> There is an inconsistency in the names for the HDMI/DP Jack control
>>>> names between some ASoC drivers and the HDA HDMI driver which
>>>> introduced this naming in 2011.
>>>>
>>>> There might be an impact for the user space (UCM). I will fix
>>>> the UCM configurations when this patch is applied.
>>>>
>>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>>> Cc: Mark Brown <broonie@kernel.org>
>>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>
>>> Yes, that's a known problem, and I left them so far just for keeping
>>> the already existing stuff working.
>>>
>>> Won't this break the current Chromebooks user-space?
>>
>> I would really expect to upgrade UCM configs for the recent kernels in
>> this case. I believe, those sort of issues are better to fix early
>> than lately. I know, the transition might cause a little issues, but
>> usually "do upgrade answer" will help. I don't think that we speak
>> about a large group of users here.
> 
> Well, that's obviously against our dont-breaking-user-space rule.
> The UCM profiles have been widely used on Chromebooks, and they can't
> upgrade easily.
> 
> So, I believe this is a case where we have to live with messes.

If we speak about Google's kernels, they can apply a revert (depends on their 
upgrade/maintenance policy). If users use the standard Linux distributions, 
then we are fine, don't we?

I would make an exception for the dont-breaking-user-space policy in this 
case. I am sure that the UCM configs will stabilize quickly. And this bad jack 
name is against our control name policy. It's just a bug.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
