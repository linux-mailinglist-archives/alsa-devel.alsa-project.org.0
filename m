Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67129CEEC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B83116B0;
	Wed, 28 Oct 2020 09:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B83116B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872989;
	bh=TKvqJLlkLbq3Kj5f1V4maIueIwHzwDwk5+8EMQJmvPA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0dbDSjf14CXQJvkrpb77KcHgbiYsySUo1lX6W1IDYEb3BXY3U3V75bAxsObBiEcQ
	 WQwAHXUqZ1FVhme7rj+ynqoEi7NaOGrZ02dROp03BV1CzqgRylO0uvd06eNA55RZxI
	 8TyK+9AOhnSCx4QYhTBxtcMAAx/V/+TI43etQYho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 096B4F80571;
	Wed, 28 Oct 2020 09:07:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF90F80212; Wed, 28 Oct 2020 04:26:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by alsa1.perex.cz (Postfix) with ESMTP id 2FD04F800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 04:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD04F800FF
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id A654929A58;
 Tue, 27 Oct 2020 23:26:19 -0400 (EDT)
Date: Wed, 28 Oct 2020 14:26:12 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Tom Rix <trix@redhat.com>
Subject: Re: [RFC] clang tooling cleanups
In-Reply-To: <20201027164255.1573301-1-trix@redhat.com>
Message-ID: <alpine.LNX.2.23.453.2010281344120.31@nippy.intranet>
References: <20201027164255.1573301-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:30 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org
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


On Tue, 27 Oct 2020, trix@redhat.com wrote:

> This rfc will describe
> An upcoming treewide cleanup.
> How clang tooling was used to programatically do the clean up.
> Solicit opinions on how to generally use clang tooling.
> 

This tooling is very impressive. It makes possible an idea that I had a 
while ago, to help make code review more efficient. It works like this. 

Suppose a patch, p, is the difference between the new tree, n, and the old 
tree, o. That is, p = n - o.

Now let clang-tidy be the transformation 't'. This gets you a much more 
readable patch submission, P = t(n) - t(o).

The only difficulty is that, if I submit P intead of p then 'git am' will 
probably reject it. This is solved by a little tooling around git, such 
that, should a patch P fail to apply, the relevant files are automatically 
reformatted with the officially endorsed transformation t, to generate a 
minimal cleanup patch, such that P can be automatically applied on top.

If the patch submission process required* that every patch submission was 
generated like P and not like p, it would immediately eliminate all 
clean-up patches from the workload of all reviewers, and also make the 
reviewers' job easier because all submissions are now formatted correctly, 
and also avoid time lost to round-trips, such as, "you can have a 
reviewed-by if you respin to fix some minor style issues".

* Enforcing this, e.g. with checkpatch, is slightly more complicated, but 
it works the same way: generate a minimal cleanup patch for the relevant 
files, apply the patch-to-be-submitted, and finally confirm that the 
modified files are unchanged under t.
