Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A8224B5D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 11:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DDAA1673;
	Tue, 21 May 2019 11:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DDAA1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558430526;
	bh=UYUWPylSJUIRoYHnXLKXkPKQrJH55QBSMHNSUHUfuIs=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H6KnJB7CE9dnW/tJYsFPKQg/1iMFPMmpjlzvhmdF99La8nOuzLVQnqFEDgD3mkbwK
	 4awc+P7va1wWezR5jwiJq+DuI95ZHOL2ioPUc0C4j6ALwINAP7XC3Z+LoqYW1sxAxK
	 U7wzj68fPrPEAu4Gz7g79VWDiqIGQd2Cd4t4T8Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F35DFF89707;
	Tue, 21 May 2019 11:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A4CF89674; Tue, 21 May 2019 11:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_14,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A05FF806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 11:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A05FF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KdVJEspJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pWa5jL+9"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 24166250C3
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 05:19:43 -0400 (EDT)
Received: from imap5 ([10.202.2.55])
 by compute1.internal (MEProxy); Tue, 21 May 2019 05:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=9nUVRdiJgH+BiuSmGXr3wWn8GLp/h4r
 6Bd8wjtp5DK8=; b=KdVJEspJIJ4fn9T/z/TJihuISr9gkhStWq376LC4vCLu52i
 rWCcgkQurhmck3yWBZHk3xuU+jPTEunlKNfXLVeQeT3LaD1Pod+M6501j1GaCqXs
 C8/oTJZv4dzL++rQ58xZU6gIveYcjTvjxqUYBz5VWjfxooE6E8UjKR2IOVPFlK5h
 Nri5+bmkD70blUcaqj9zsXy1rslmWV83pI0ZjU/4Ab83vr6tpbpcavsomRmH5xQH
 xED/w0GrdwfFlMnObhpNTcj675IMNmC3ws1YjM98iHHX83MB5SfPzr9anPNXzXMk
 Phr3xNQDQ1eufLKRtV1SsPYobYCG2DS0GFHoKZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9nUVRd
 iJgH+BiuSmGXr3wWn8GLp/h4r6Bd8wjtp5DK8=; b=pWa5jL+9lR4Uy2vh8PRKxO
 RX4Hg3lz/D3E/AqpRXkxuwlR7+2CGxuz90F5LEQv7SPLKwVFg5G3bOnysmwtuW33
 EGVYzXiLQ/CDR4Y/FvON0iFkXA0nDXZrNmsQ4gOaI/uWmpwCiTPfejH9Cl3Ac7Xt
 Xxk4W1+TNRsFHVbZVn+hE7SNU+Mzcnm+O+ViAk0JNYIsMaXBxVQz1Y6327Nj0KQg
 2nHc4vk+JUHvpG0u51OMsZ5MQmv20X+ygS524xVsq4cn4sC9pMSvmvI99tZpxFNy
 YUSQrqkmqgf5dwKba4Lr9UUomfu9ArZUNeAHpRbu1zFAelBKSdUzQjeKwRRW8beg
 ==
X-ME-Sender: <xms:rsLjXI4JaOiVx6PTeMRd5qLXaGIdEGn5Ib-7403HY-kJ_ukuSvVl5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderreejnecuhfhrohhmpedfvfgrkhgrshhhihcuufgrkhgrmhhothhofdcuoehoqdht
 rghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:rsLjXMd2N__VWLVvfXKCdu27Ca6KF8fzz-3YmqrSZJAakHeoJWe0wA>
 <xmx:rsLjXIZbroD9Zhiaqjl6Q4SVvR9E3kDQR6W0i9xKkc8yYEvyTnnCnQ>
 <xmx:rsLjXCJ64Yymg1_WJRaQ52_Pf6iZpjIZL9K3TfRRK5Y6tKfSq-37jQ>
 <xmx:r8LjXGu4LO2F1_U9i4ROUadegtkWuei6nu95oQpfA7HgOGTTeFXW5w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 83BBB30DDE; Tue, 21 May 2019 05:19:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-550-g29afa21-fmstable-20190520v1
Mime-Version: 1.0
Message-Id: <c818a451-6bea-481f-8c58-c6746aef203f@www.fastmail.com>
In-Reply-To: <s5hr28s5gxz.wl-tiwai@suse.de>
References: <1558370831-15960-1-git-send-email-adam.miartus@gmail.com>
 <1558370831-15960-4-git-send-email-adam.miartus@gmail.com>
 <B174E9FCEE9A8C46B11E4DF2E329936277F234@HI2EXCH01.adit-jv.com>
 <s5hwoik5i7d.wl-tiwai@suse.de>
 <B174E9FCEE9A8C46B11E4DF2E329936277F364@HI2EXCH01.adit-jv.com>
 <s5hr28s5gxz.wl-tiwai@suse.de>
Date: Tue, 21 May 2019 18:19:42 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel]
 =?utf-8?q?=5BALSA_patch=5D_=5BPATCH_-_alsa-lib_4/4?=
 =?utf-8?q?=5D_pcm=5Ffile=3A_add=09infile_read_support_for_mmap_mode?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Tue, May 21, 2019, at 17:52, Takashi Iwai wrote:
> On Tue, 21 May 2019 10:37:43 +0200,
> Miartus, Adam (Arion Recruitment; ADITG/ESM) wrote:
> > 
> > > On Mon, 20 May 2019 18:51:06 +0200,
> > > Miartus, Adam (Arion Recruitment; ADITG/ESM) wrote:
> > > >
> > > > From: Adam Miartus <amiartus@de.adit-jv.com>
> > > >
> > > > mmap_begin callback is used to copy data from input file to mmaped
> > > > buffer
> > > >
> > > > guard for corner use of api (multiple mmap_begin calls by user) is
> > > > introduced to check if next continuous buffer was already overwritten
> > > >
> > > > buffer is overwritten with input file data only in case of stream
> > > > capture
> > > >
> > > > Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> > > > Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
> > > 
> > > Can't we copy the data in snd_pcm_file_mmap_commit() just like the
> > > playback case?
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> > 
> > My understanding is that in case of reading data in mmap mode user
> > would call mmap_begin, read the buffer and then call mmap_commit.
> > 
> > In this case overwriting the buffer in mmap_commit with data from
> > Input file would be too late. 
> 
> Hm, OK.  I basically hate to add a new ops, but this might be the only
> way if we have to implement that.

I'm interested in this patch, however the patch is not blasted by list server.
Would you please re-post your patchset so that the list server delivers them
to subscribers and I can see the contents?

> OTOH, is this mmap support mandatory?  IOW, is wrapping with the plug
> and mmap_emul performance-wise so bad?


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
