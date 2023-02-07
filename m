Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D668D6B3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 13:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD5C20C;
	Tue,  7 Feb 2023 13:28:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD5C20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675772951;
	bh=pBfQGjbVge1SgQyFYrAhg5cuvIDoSPGHcZRCJ07FlCc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X419oKdUF2xbVF7XHwjRoy8deI08DL6Me39lp0GyCBen4MPhXsfnM5tYLEqlX1dVT
	 HGg9FARYaLzI9n1tv2m+IXupZhDe3a9A7aloRK8sntfEmnQ/z6fVcZWB89YqqsrtOw
	 4a0KhO5zolP8jDCryOaRaBcnCemQpF7Bs7DVCTZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80F41F8014E;
	Tue,  7 Feb 2023 13:28:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EFCF8045D; Tue,  7 Feb 2023 13:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A60F800E3
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 13:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A60F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=bRp/IPFY; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=V4/Rw8X6
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4E02932003C0;
 Tue,  7 Feb 2023 07:27:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 Feb 2023 07:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1675772869; x=1675859269; bh=kq
 ljyEYgfGDzvSsb9snqt65CBohX1IP73D/5I5IuQPo=; b=bRp/IPFYqjx4YDumSB
 puEGB3ypUPpR0pGOYulUEFrm8q7wwtM/XgjVDlSNkO16UefpdvwfxXzQFiBsUZTc
 U8Ybz8WnjSFIyetQGvPlWBDSu6EPV6ZNI73B3KlEKius7jLO0XEnnsInZE3Oa8YY
 6mmMIug9lzQZzr2filmaE5GVwExRt9MnFExBeTY/KDxjV98/0TvjHtS8maXfVbu+
 YJm88+aVJDRlkZMWlwqQTkFxQ2J9f3QsKTN4tbOactXM9uiscWZXyIK4nEe7tYtZ
 AJG5ycYqQGu97ZPY7UfWti4xHiOL3u9846X9R+hGHyySPlNh/gsU0GnJFQDkoz+j
 CJYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675772869; x=1675859269; bh=kqljyEYgfGDzvSsb9snqt65CBohX
 1IP73D/5I5IuQPo=; b=V4/Rw8X6RbPcX14MvO8ku6oygmHLNH6OSdMX+yKypKsg
 +HvJlv1B/IIogWDJElQtdozVfjYxCqIyF07zgfghRcp12aLEkZV8hFbnjN0MItCf
 5Av0S762QWbQ8g9t0aHWjXhv4EP1arsjpuN8sSs8sWc0sl3Pm1kPlMafUILu+0+i
 5fTkqRBPiqOPvkekprtHfbnTmgPvkbvr1SmKzOd2OZ1c3veisvSkleRnNYjB51Zl
 1bzKALzkCnbOrxXPrfiN8gW49jDc8NpCxRTH9ELC8PXWDHtn7ThCYZifVYtsynpq
 J4fAhV1AaF4nSlgADM4JzSN/dIenbtZ4cjw9ssfouA==
X-ME-Sender: <xms:xUPiYy7HcrQF44zbbWdNbzXz108tqQvKDAp2yY0jCMgvYbMP0L-ADQ>
 <xme:xUPiY74-ML6u3_uWr9pebqwYhi7fhO1gnGlIYV24gwFLpKrcbW8H_ZIezWkNGwrMx
 2D2EacpE8Vh8ePJjns>
X-ME-Received: <xmr:xUPiYxfDceWfffSJINVdAi3u3S_W4vd4821QMigkPbmJGtCrcEZbGfXcmRPMdBEl8yuT6eiWEPpfq03bTEtrV3vDbYv7fszMr5lV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepveeigeevvdelkefhteejueeigeeitdejffejffdu
 veelvdfhgeehvdduveeifeffnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpthhrrg
 hnshhfvghrnhhofidrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:xUPiY_ImzvbFPSX4CzB5Yo4zhTZqNQfqeKjwP97Z-Bh920Ypak-c-g>
 <xmx:xUPiY2LFH0yBIvT64gAWcQWCOAQwj2_vNwPsKzoM8ydZYKjIE5VTzQ>
 <xmx:xUPiYwyzG2iq_lf-xEaTAz2V8v4xXwCpPVa9Iw1qasg99yvt_Bijjw>
 <xmx:xUPiYwyMdd_9mhsWXCtDmhC3pf32j2JDiqQ9byyLRmHhl4adMjOIEQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 07:27:48 -0500 (EST)
Date: Tue, 7 Feb 2023 21:27:45 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "M. Armsby" <m.armsby@gmx.de>
Subject: Re: Motu 896Mk3Hybrid dump
Message-ID: <Y+JDwWHZAI8BRgu9@workstation>
Mail-Followup-To: "M. Armsby" <m.armsby@gmx.de>,
 ALSA mail List <alsa-devel@alsa-project.org>
References: <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
 <Y9fD0Nzg+bwKsDEZ@workstation> <63DF98FE.2060604@gmx.de>
 <Y+BXPeHLp+qoKJcv@workstation>
 <rbih9oyihq4crt3olr-o19zohmq8w36-ipfswlyypvjp5a8src-wcww6tahyaki-q7v6tx-j5yh81-vzf7pq-qn78wo-tww8q3-2h35ww-sk0mu3-7fsog578xr2k-jfqgg5-rvg5aw-mhtapx-pch8v9t7epgq.1675704644475@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rbih9oyihq4crt3olr-o19zohmq8w36-ipfswlyypvjp5a8src-wcww6tahyaki-q7v6tx-j5yh81-vzf7pq-qn78wo-tww8q3-2h35ww-sk0mu3-7fsog578xr2k-jfqgg5-rvg5aw-mhtapx-pch8v9t7epgq.1675704644475@email.android.com>
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
Cc: ALSA mail List <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Mon, Feb 06, 2023 at 06:30:44PM +0100, M. Armsby wrote:
> Hi there Takashi,
> 
> please send me your instructions.
> 
> I will do everything to get these MOTU devices working properly.
 
Okay. As a first step, would I ask you to build `linux-firewire-utils`?

 * https://github.com/cladisch/linux-firewire-utils

In the top level of directory, execute below commands:

$ autoreconf -i
$ ./configure
$ make

When building successfully, you can find `firewire-request` in `src`
directory. It is useful to read the status of device and required for
our investigation.

Before building, I think you need to install some package required for
the work (e.g. compiler), but I'm not Manjaro user so contact to Manjaro
user to ask it...

> The problem with device allocation is this:
> 
> Ardour and Reaper see the ALSA driver and automatically choose 1+2
> for main stereo out.
> 
> But - there is no connection.
> 
> If I choose 3+4 then Motu hardware actually gets sound output on 1+2
> 
> That means all Motu outs are shifted by 2 in the Linux protocol.
> 
> This is true for Traveler MK1 and MK3 so I assume it is an error in
> all snd_motu_spec
> 
> I made a short video demonstrating this.
> 
> https://www.transfernow.net/dl/20230206jG0fet84/OFRBRajr

Thanks for your taking and uploading the video.

The below figure illustrates your cases:

 ++======================++    +-------+    ++===============++
 ||       Traveler       ||    | frame |    ||  Application  ||
 ||                      ||    |       |    ||               ||
 || headphone output 1/2 || <- |  0/1  | <- ||  Output 1/2   ||
 || analog output 1/2    || <- |  2/3  | <- ||  Output 3/4   ||
 || analog output 3/4    || <- |  4/5  | <- ||  Output 5/6   ||
 || analog output 5/6    || <- |  6/7  | <- ||  Output 7/8   ||
 || analog output 7/8    || <- |  8/9  | <- ||  Output 9/10  ||
 || AES/EBU (XLR) 1/2    || <- | 10/11 | <- ||  Output 11/12 ||
 || S/PDIF (opt) 1/2     || <- | 12/13 | <- ||  Output 13/14 ||
 ++======================++    +-------+    ++===============++

I note that the effective source of headphone output is selectable
between the above 7 pairs. Additionally, when enabling ADAT optical
output, 8 channels are newly added to the frame thus 22 channels are
available in a view of application.

Well, inconveniently to you, the above mapping is expected. ALSA
firewire-motu driver passes no information to the application about
what the channel of frame is assigned to, due to technical reason of
ALSA interface to user space application. As a result, the application
just enumerates audio sample in its order.


Regards

Takashi Sakamoto
