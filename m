Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1168FF25
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 05:33:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FB282E;
	Thu,  9 Feb 2023 05:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FB282E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675917206;
	bh=mKVbFamuAokHLoTjNqfsX3VRM/4xCLBBeSun8CM+vAE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cT0WTBECNC8rg/DTsYbwnA90lojG6nZFAqRNmLzb+H+mgScGVpj57AS/Z+J+uwniL
	 C18QJW1QoPQVSXG8iK2EjnXp/ZBlGwtZma1k+yhv63UWtu7grDYmvlHH/fPEixOwfN
	 bsiPVummcM7CI43GcrRQO4AQlX32tN6rpcpGtu1A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CAF3F800B8;
	Thu,  9 Feb 2023 05:32:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ACA6F800E4; Thu,  9 Feb 2023 05:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F198F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 05:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F198F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=gnwNomY+;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=FiA9jDWf
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 66E2B5C03C3;
	Wed,  8 Feb 2023 23:32:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 08 Feb 2023 23:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1675917138; x=1676003538; bh=pH
	EOBykndc/vrJKqNh3tRgFN7XgZlFVvvdIjTnYXf3o=; b=gnwNomY+5sqmDXAc/E
	buL3KpGYeeVkGaia5tHcu7XkOaB+ejQJOiglbzuE/OzR1VBKgnzxxKXPojE2T/rj
	gmTNlpjZhv1c+sGnrEEy5km623nU8xb7nQnnP1IH/iyOTLSSBAhPg6+pM7DMKbXo
	ci+5zn6uU3sPdlPnedP/jr5/sgCSam9zy3MD4dlkRdI5nzFOZ5CqmT1sqH9/d6Mh
	Y3t061QFV4oU6O8JnWDVALfhwFJtQC3CSlnGcCujZWeQU2Bj/j8/bDySJr8fuoyZ
	7M9o4y/Xk6/6EFzescJhWCK8BtdBRpa7Ye6PM/7HJuvUDuu75xAq4ejhxO7/siLx
	8dhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675917138; x=1676003538; bh=pHEOBykndc/vrJKqNh3tRgFN7XgZ
	lFVvvdIjTnYXf3o=; b=FiA9jDWfQfwSY6QQtwzmnMqf1+q/wTB2h7yJip5GlBCZ
	GBDZLz0PQTVizmOhp8zS2HIaAJ5hSHtudUXjmS6KH1HPHPTcNTSKEPJoB7xTzJEk
	YMipGj3kR5+HQ+eRdBenS8Iho5C1bNdjIZSCP7ZlUYKmMOA2gh6OBhJgEG6fDxzV
	tLQzDD24kkUgGme7TABgIEFSTFKs8lZ1Yg++Qh09CJfk6rTcqsEFvxAKOW/O5g7O
	wDKx3crNqxkcNxB48L4xtUXdjQFrCmN8G8p+ua0zOW+6MZe8+7QtHYl2QHkNS3wk
	DJbN4I9+XRLQxqNL5WiUgF4aj3azdXic1Hy9MEtgNw==
X-ME-Sender: <xms:UXfkY1Hs2xy4Ii9xj4DG2Hbs0gncdPmylt7kxy9lX3aKxIOjjEN5dQ>
    <xme:UXfkY6WAlkDCOQ_zK332Uf_Vzxo6jjWV0a6f9WdQ5RF1mE84eVflO_Quc-XMlI7Yv
    dESQ2vuTtQrHZK7B10>
X-ME-Received: 
 <xmr:UXfkY3JcJV1z6cX-YRMtUnfGPooiTB3tJGfrK7rxhVs0OhvfZrncjnqo1IACaJmVHP_eOnpmzQUQC1DESJexXp_13IlLH-p2QUwN>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudehvddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepveetgeefteeukedtveeghfeftdeltdejjefggfeh
    feffgfeiuefhhfdugedtvdejnecuffhomhgrihhnpehtrhgrnhhsfhgvrhhnohifrdhnvg
    htnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdq
    thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:UXfkY7E08pNpb7a_tGlaNakgi_vd_Rzq3PCwXyu_zESLgcYPZFgwiA>
    <xmx:UXfkY7U55-Y5A9JymZBhbocB-gqXaUtF4lrOTXK_FtTceOmy6plMzQ>
    <xmx:UXfkY2PMDrgSLL1ilUu-TUHJ8VulAAnONXPFQoJ-8GpGJSq8v8Kclw>
    <xmx:UnfkY8fVAokyfQaLfTcWM17fcFMMD_KpPPl3hpTqqaUVbM3KtwuHZA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 23:32:17 -0500 (EST)
Date: Thu, 9 Feb 2023 13:32:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "M. Armsby" <m.armsby@gmx.de>
Subject: Re: Motu 896Mk3Hybrid dump
Message-ID: <Y+R3Trgr8gM7A1KC@workstation>
Mail-Followup-To: "M. Armsby" <m.armsby@gmx.de>,
	ALSA mail List <alsa-devel@alsa-project.org>
References: 
 <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
 <Y9fD0Nzg+bwKsDEZ@workstation>
 <63DF98FE.2060604@gmx.de>
 <Y+BXPeHLp+qoKJcv@workstation>
 <rbih9oyihq4crt3olr-o19zohmq8w36-ipfswlyypvjp5a8src-wcww6tahyaki-q7v6tx-j5yh81-vzf7pq-qn78wo-tww8q3-2h35ww-sk0mu3-7fsog578xr2k-jfqgg5-rvg5aw-mhtapx-pch8v9t7epgq.1675704644475@email.android.com>
 <Y+JDwWHZAI8BRgu9@workstation>
 <-9ql34ax08baa-u8njs4ojzl8k9qj8kusba8u-119dm2-3md8uqbmil7lckunia-ijl9m4n5xuto-76roex-ucqm5h-1c3kdf-5ahx5l1oy29o-no4drk-5wjqfzqre34j-p7he4b9rr95u-3lcrfi-9o14b8.1675872031471@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <-9ql34ax08baa-u8njs4ojzl8k9qj8kusba8u-119dm2-3md8uqbmil7lckunia-ijl9m4n5xuto-76roex-ucqm5h-1c3kdf-5ahx5l1oy29o-no4drk-5wjqfzqre34j-p7he4b9rr95u-3lcrfi-9o14b8.1675872031471@email.android.com>
Message-ID-Hash: YUCEFMHQ6UOIIUYHCD4L64A5YCISBLPC
X-Message-ID-Hash: YUCEFMHQ6UOIIUYHCD4L64A5YCISBLPC
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA mail List <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUCEFMHQ6UOIIUYHCD4L64A5YCISBLPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Feb 08, 2023 at 05:00:31PM +0100, M. Armsby wrote:
> > I made a short video demonstrating this.
> >
> > https://www.transfernow.net/dl/20230206jG0fet84/OFRBRajr
> Thanks for your taking and uploading the video.
> The below figure illustrates your cases:
>
> ++======================++    +-------+    ++===============++
> ||       Traveler       ||    | frame |    ||  Application  ||
> ||                      ||    |       |    ||               ||
> || headphone output 1/2 || <- |  0/1  | <- ||  Output 1/2   ||
> || analog output 1/2    || <- |  2/3  | <- ||  Output 3/4   ||
> || analog output 3/4    || <- |  4/5  | <- ||  Output 5/6   ||
> || analog output 5/6    || <- |  6/7  | <- ||  Output 7/8   ||
> || analog output 7/8    || <- |  8/9  | <- ||  Output 9/10  ||
> || AES/EBU (XLR) 1/2    || <- | 10/11 | <- ||  Output 11/12 ||
> || S/PDIF (opt) 1/2     || <- | 12/13 | <- ||  Output 13/14 ||
> ++======================++    +-------+    ++===============++
>
> I note that the effective source of headphone output is selectable
> between the above 7 pairs. Additionally, when enabling ADAT optical
> output, 8 channels are newly added to the frame thus 22 channels are
> available in a view of application.
> Well, inconveniently to you, the above mapping is expected. ALSA
> firewire-motu driver passes no information to the application about
> what the channel of frame is assigned to, due to technical reason of
> ALSA interface to user space application. As a result, the
> application just enumerates audio sample in its order.
>
> ________
>
> I can understand your description but disagree that just because
> it's Linux, all Motu users must deal with false output allocation.
> The first pair should be 1+2 not headphones.
>
> Is it not possible to find a remedy instead.
>
> The Windows driver shows headphones much later in the output
> numbering.

Indeed, it is inconvenient in the view of user. But let us focus on how
to support MOTU 896 mk3 hybrid at present, since the issue includes many
technical topics; each application, drivers in kernel, libraries, and
interface between them.

> See Pictures taken from Reaper in Windows 10

Would I ask you to avoid attaching pictures to open mailing list? The
message with many files is easily judged as spam message.


Regards

Takashi Sakamoto
