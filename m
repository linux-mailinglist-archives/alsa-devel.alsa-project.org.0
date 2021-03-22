Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927423437F0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 05:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C63015E0;
	Mon, 22 Mar 2021 05:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C63015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616388172;
	bh=t54/A0Zx6JezutGpue64L75V/44MSkp6u/Ju87kCXyU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q81fsdVojKxcUbNvgxrhUyx6tffBB01wHQheCl0Uq46lIjo6YLR8dJSzSAJp3xbbj
	 xy0VPRM/wqtlR9RlxJg+Rxgu1KfcsAZL4wUlRNpFERKemc+IUZRySGmBiLAgr4OTXT
	 jOSTeFom94w7xncRCdsMAjXuYvFpjk1nkV/+r2Ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F83CF801D5;
	Mon, 22 Mar 2021 05:41:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3946F8016B; Mon, 22 Mar 2021 05:41:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6F5F8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6F5F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="I533Uujv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RJUISfH7"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C06B6EC6;
 Mon, 22 Mar 2021 00:41:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 00:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5i2Cy25tkpfEomgGAqIb6XD3Ocf
 BvbwjvK0cwXYabpU=; b=I533UujvpFVelAqGh18Wzg/SlPZ0Oba+kj/UmBNrT4X
 2iIw8KFs0Qh2WWH6rmmmqonnjh7IUGvdIfyqqQcMT1kJ8cvKkp2wt6/P9vY+dVOw
 HyPuBDhFdwPlnXFbUe394yVHVUPb5pToi+xCoLauyQ8EMrD1FDqAi/QLZ7ya+24O
 uvCXCp+EOyYxsxk6mdAyeNQTYAGTgcN1QPqmZIWp81uzAuZtnM32PACUSNsU/1tL
 2fD6UYkaNqy4+9qVn4R/yQd7vDDDnzYIGxSpvQ2onuypPDyZVoI6f3NAxZkvxOv0
 M+lr4lN43cQIVGXAEEYemB/31anzkeF8snwN3JfZsRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5i2Cy2
 5tkpfEomgGAqIb6XD3OcfBvbwjvK0cwXYabpU=; b=RJUISfH76ii3ELsGNK8O0t
 rrMHt6c4LKL8dGGd01Ifwar09QoTUjqZnl4Khpppb1Uq6xg6Gbe7ze2Ozkq+q5yi
 PwBi/8sk2/3VRRNyXE1r5Yvth1LOKSKcmqqpjdvDdswwRpS1AD28ClYQ301nGQ3J
 yqQ70l89DrAW8G7gwdclpbTSvQknnHamQHg8HXZMPRyPuvEa9KehHXBrkT7965Nw
 olajyTcQ1qGI9kZvkUgp2/GelbnB0/+OxXHfWfkuH07ypqX1XFjd4Q0MX31LdhlD
 dsnkaKMIw9Utfj6Z7c+veD6UEnLX1n8ly37WZPs1tso+MNSavJr2Q2/lTer7KOJQ
 ==
X-ME-Sender: <xms:5R9YYOn_vVroLhzdkeLtXaWyRQEXcGIaDQYCYad379goox5QNrNeSA>
 <xme:5R9YYF1ok5c9iFlGnMC4bmw1NcQTtSEXOrc9kR7VZV3d7U9vsSFRn2658FolH9Eua
 7xrLkjl2RBqwIb_7BQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdevgfevud
 fhledukeefteelleeghfffkeeludehtedugedvtddttefhtdegleegnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghdprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppeduge
 drfedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:5h9YYMpVo8xYRESZBvZoIGvmU2RPiJF7SxyXskffNo2JwPGsW-1UHA>
 <xmx:5h9YYClvumfWyI0zKI3vpe1SBQYH2zahE2pLji2KGrrPZm0vIphMjA>
 <xmx:5h9YYM3uT-6-sjHkgFMGdVzkRqFrsavsVzkTscbRxLeu8jiwHgC9Zw>
 <xmx:5x9YYJ_WVs3FxKm-UVVdb-Kqf4oYz4UrHUPHdzIPr-_LLX_Ef0zkdQ>
Received: from laptop (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7EFA2108005F;
 Mon, 22 Mar 2021 00:41:08 -0400 (EDT)
Date: Mon, 22 Mar 2021 13:41:03 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [alsa-lib][PATCH 0/6] add API of equality and comparison for a
 pair of control element IDs
Message-ID: <20210322044103.GA3554@laptop>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 tanjeff@cccmz.de, alsa-devel@alsa-project.org
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
 <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
 <20210318163715.GA273829@workstation>
 <fa976b85-2d27-6e5f-9811-21e5031e39c2@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa976b85-2d27-6e5f-9811-21e5031e39c2@perex.cz>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

Hi Jaroslav,

Sorry to be my late reply but I have some private troubles (to search my
domestic cat back to the street several days ago.).

On Thu, Mar 18, 2021 at 06:04:36PM +0100, Jaroslav Kysela wrote:
> Dne 18. 03. 21 v 17:37 Takashi Sakamoto napsal(a):
> > On Thu, Mar 18, 2021 at 12:42:30PM +0100, Jaroslav Kysela wrote:
> >> Dne 18. 03. 21 v 11:30 Takashi Sakamoto napsal(a):
> >>> Hi,
> >>>
> >>> This patchset is a fix for bug issued in the message thread[1].
> >>>
> >>> In this development period, alsa-lib got new API as implementation for
> >>> one of comparison algorithms to a pair of control element IDs. However,
> >>> it has several issues.
> >>>
> >>> At first, the name, 'snd_ctl_elem_id_compare()', is inappropriate since it
> >>> implements one of comparison algorithms. The name itself implies the
> >>> algorithm is single and unique for control element ID. However, the
> >>> target structure, 'struct snd_ctl_elem_id', is hybrid and compound one.
> >>> We can not find such single and unique comparison algorithm for it.
> >>>
> >>> Secondary, it subtracts a pair of values in fields of 'unsigned int' type
> >>> in storage size of the type. It brings integer overflow.
> >>
> >> I don't think that this extra handling is really required. The unsigned /
> >> signed conversions are well known and the overflow results with a negative
> >> signed value. Why add more branches to the instruction chain?
> >  
> > For this kind of question, it's preferable to write actual test:
> > 
> > ```
> > int main()
> > {
> >   snd_ctl_elem_id_t *l, *r;
> > 
> >   snd_ctl_elem_id_alloca(&l);
> >   snd_ctl_elem_id_alloca(&r);
> > 
> >   snd_ctl_elem_id_set_device(l, 0);
> >   snd_ctl_elem_id_set_device(r, UINT_MAX);
> > 
> >   assert(snd_ctl_elem_id_compare(l, r) < 0);
> > 
> >   return 0;
> > }
> > ```
> > 
> > The assertion hits. For conversion detail:
> > 
> > ```
> > $ cat test1.c
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <limits.h>
> > 
> > int main()
> > {
> > 	unsigned int a, b;
> > 	int diff;
> > 
> > 	a = 0;
> > 	b = 10;
> > 	diff = a - b;
> > 	printf("%08x\n", diff);
> > 
> > 	a = 0;
> > 	b = UINT_MAX;
> > 	diff = a - b;
> > 	printf("%08x\n", diff);
> > 
> > 	return EXIT_SUCCESS;
> > }
> > ```
> > 
> > The above test results in 0x00000001 for -UINT_MAX case under x386/x86_64,
> > like:
> > 
> > ```
> > $ gcc -m32 -o ./test1 ./test1.c ; ./test1
> > fffffff6
> > 00000001
> > $ gcc -m64 -o ./test1 ./test1.c ; ./test1
> > fffffff6
> > 00000001
> > ```
> > 
> > We can see integer overflow in both machine architectures due to
> > calculation under 32 bit storage.
> > 
> > Well, let us prepare 64 bit storage for both of minuend and subtrahend
> > to get negative value in 64 bit storage. In the case, narrower conversion
> > to 32 bit integer is unavoidable since it's assigned to integer value
> > returned from the function in your implementation. In the case, converted
> > value is _not_ negative according to assignment rule in C language
> > specification.
> > 
> > ```
> > $ cat test2.c
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <limits.h>
> > 
> > int main()
> > {
> > 	unsigned int a, b;
> > 	long long diff;
> > 	int ret;
> > 
> > 	a = 0;
> > 	b = UINT_MAX;
> > 
> > 	// Calculate under 64 bit storage, then assign to 64 bit storage.
> > 	diff = (long long)a - (long long)b;
> > 	printf("%016llx\n", diff);
> > 
> > 	// Narrower conversion occurs now.
> > 	ret = (int)diff;
> > 	printf("%08x\n", ret);
> > 
> > 	return EXIT_SUCCESS;
> > }
> > $ gcc -m32 -o ./test2 ./test2.c ; ./test2
> > ffffffff00000001
> > 00000001
> > $ gcc -m64 -o ./test2 ./test2.c ; ./test2
> > ffffffff00000001
> > 00000001
> > ```
> > 
> > We can see easy example in the clause of 'Assignment operators' in the
> > specification. This is the reason to use condition branches in the patchset.
> 
> The point is that none of the compared unsigned fields is really above the
> 31-bit range, so you're trying to resolve an academical problem instead to add
> the debug checks (asserts) if the input values are in the acceptable range.
> Only the numid functions require this.

Hm. I think you have the assumption to 'device' and 'subdevice' fields.

If the value of these fields directly derived from any fields
systematically which Linux kernel or middleware of ALSA kernel stuffs
maintains with 'int' type, it would be valid. However, the decision to
assign specific value to these fields is left to driver developer, by
declaring 'struct snd_kcontrol_new'[1] in driver code. We wouldn't see such
code that the developer construct 'pseudo' device and subdevice to deliver
specific information to userspace, it could be.

(once I've investigated to use this design to ALSA firewire stack.)

Additionally, alsa-lib has plug-in framework to have several backend which
works beyond the most of API calls[2]. The 'hw' plugin is one of them,
which directly communicate to ALSA control core via system calls.
Developers and users have some opportunities to implement and use the
other backend, then they are free from your assumption. In this point,
any assumption to 'index' field is not better as well.

Of course, you can insist the above topics are not practical, something
belongs to domains of academical or logical. However, I put safety in the
first place, to avoid bugs which expectedly appears in future. I'd like
you to take enough care of downstream user's demands.

Well, if code revising is not acceptable to you, it's better to add
any assertion to check range of value as you mentioned as well as good
documentation. In this case, your function is not generic one and should
be renamed that it works conditionally. 'snd_ctl_elem_id_compare()' is not
acceptable.


[1] include/sound/control.h
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/include/sound/control.h?h=for-next#n41
[2] External Control Plugin SDK
https://www.alsa-project.org/alsa-doc/alsa-lib/ctl_external_plugins.html


Regards

Takashi Sakamoto
