Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 603485FFE13
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 10:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C2E697A;
	Sun, 16 Oct 2022 10:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C2E697A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665908262;
	bh=8jT9yLi+86aIbOmzALZPt/s2O3U3xs8ayIqYBZv0JWs=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PGddLs2GZP7n9N4MuOgFUcO1l9lpVR8zwUe/2WJX6JJT9jzF1yjXRrx2ZiGXD5s5f
	 z2blCTupjyw08yKGg31e2dvmSMHNuNWAUxPIraOInsZaPYErJxSAa1RF4zF0Kzixy8
	 XW3tHMlxPyxEbv8m59m93SYqlbLl+m83n0RbJUoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36863F8027C;
	Sun, 16 Oct 2022 10:16:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C09F4F800F8; Sun, 16 Oct 2022 10:16:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6317BF80149
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 10:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6317BF80149
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ojyp6-00069P-Ie; Sun, 16 Oct 2022 10:16:40 +0200
Message-ID: <93cdf7fd-29d3-8306-5b0b-25b0eb1ea52d@leemhuis.info>
Date: Sun, 16 Oct 2022 10:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: Takashi Iwai <tiwai@suse.de>, Jan Henke <Jan.Henke@taujhe.de>
References: <53ac9cce-51bf-100a-fa61-0dff6acd3a2d@taujhe.de>
 <877d102q3c.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Regression in Linux Kernel v5.15.71 / external headset microphone
 stops working
In-Reply-To: <877d102q3c.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1665908202;
 fce0b2e8; 
X-HE-SMSGID: 1ojyp6-00069P-Ie
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

On 16.10.22 09:19, Takashi Iwai wrote:
> On Sat, 15 Oct 2022 16:56:26 +0200,
> Jan Henke wrote:
>>
>> a recent patch to the stable 5.15 linux branch unfortunately introduced a
>> regression. From 5.15.71 onward (also in 5.19.15) plugging in an external
>> headset into the audio jack no longer results in a working microphone.
>> Symptoms are that there is no choice to set the connected device to microphone
>> only (I am using GNOME, so once you plugin a device you get a dialogue to
>> choose it's type, normally there are 3 choices, Headphone, Headset and
>> Microphone, with the bug the last one is missing), and the connected
>> microphone no longer records any audio. Note that you can still choose the
>> headset microphone as audio input, it just does not record anything.
>>
>> Doing a git bisect I was able to identify the commit introducing this
>> regression:
>>
>> a963fe6d0eb6ef0a15b3aade7c186cd5bb7bd01f is the first bad commit
>> commit a963fe6d0eb6ef0a15b3aade7c186cd5bb7bd01f
>> Author: Callum Osmotherly <callum.osmotherly@gmail.com>
>> Date:   Thu Sep 15 22:36:08 2022 +0930
> [...]
>> Please revert this commit to restore the previous working condition on all
>> affected branches, since an external headset is a very common use case with
>> these kinds of laptops. There were similar commits for different laptop
>> models, but I do not have any of these models, so I cannot say if they cause a
>> similar regression.
> 
> It's been already reverted in the upstream, commit 417b9c51f597.

And FWIW, the backport for that patch is already in the queue for the
next 5.15.y release:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/queue-5.15

Ciao, Thorsten
