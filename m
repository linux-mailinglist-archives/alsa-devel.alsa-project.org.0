Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F371C84BE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 10:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3109F17FB;
	Thu,  7 May 2020 10:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3109F17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588839942;
	bh=lO99hYKc327tJIds5lglufIkKhv7kNMeB7LuejbJZ3o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNZ7/T+VJ4ECu7aP7bfhCWYP4MdkuAXo9z5FvnWZKanDNBCTd3fF5Uk9ppheQyEv9
	 OiLrB5VnO/Aw7UM6uQDE4oWqrk8LIk+rbF+p2AiPE7rrJ31IwePtWOqYlqb5Sia0y8
	 9Hx0NZt4kOSLganFd4M1tI6njkpZ8XMKXCKZSuB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C46B4F80229;
	Thu,  7 May 2020 10:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 351E0F801D9; Thu,  7 May 2020 10:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E62F7F8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 10:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E62F7F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EDeTWn3l"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 009E92073A;
 Thu,  7 May 2020 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588839818;
 bh=lO99hYKc327tJIds5lglufIkKhv7kNMeB7LuejbJZ3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDeTWn3l2J1cfzbkF+ah1A84Sx22VmW7ca5mL79RHkM+xbNdaur8OeBhRdwcVVnRx
 rTt2f4Ng+/Y5wzdve7MG6TZnr7inIu9KD/7M9gvuEKF8onAVODdLLyqOZE62mgRJ3r
 YQHyqd7qYiV4yp2rtUlwRm7x+sMMMjFSZ4s1tFHI=
Date: Thu, 7 May 2020 10:23:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: Re: KASAN: use-after-free Write in snd_rawmidi_kernel_write1
Message-ID: <20200507082336.GG1024567@kroah.com>
References: <CAFcO6XMWpUVK_yzzCpp8_XP7+=oUpQvuBeCbMffEDkpe8jWrfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFcO6XMWpUVK_yzzCpp8_XP7+=oUpQvuBeCbMffEDkpe8jWrfg@mail.gmail.com>
Cc: security@kernel.org, syzkaller <syzkaller@googlegroups.com>, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, May 07, 2020 at 03:54:34PM +0800, butt3rflyh4ck wrote:
> I report a bug (in linux-5.7-rc1) found by syzkaller.
> 
> kernel config:
> https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.7.0-rc1.config
> reproducer:
> https://github.com/butterflyhack/syzkaller-fuzz/blob/master/repro.cprog
> 
> I test the reproducer in linux-5.7-rc4 and crash too.

Same as the other email, patches are best, thansk!

greg k-h
