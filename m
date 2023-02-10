Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8AA691701
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 04:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEB2846;
	Fri, 10 Feb 2023 04:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEB2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675998159;
	bh=3kSSHS3rTf8f911liVlR1RdsREcGi30GaFaP1/KZvCY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=co4MrGcLkAAm8ygAk6KyOs5gsqifZiB5w80H/0hEyfw1p7XvuuXugq9IA0zG0OzwV
	 X4/99StTHXqacN1EwEKIu9me6Sa18MhD9taOSpto/M5ZiCNBBzL7fNqfVlrmiElnjO
	 lvODeOn5L2ChVvzNAcLrjnrAtMHK8Hq1rwmS3Fbs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4C0BF800B8;
	Fri, 10 Feb 2023 04:01:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2066EF800E4; Fri, 10 Feb 2023 04:01:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F09AAF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 04:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09AAF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=MzId62Z9;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=saE4QLew
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C0255C0052;
	Thu,  9 Feb 2023 22:01:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 09 Feb 2023 22:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1675998065; x=1676084465; bh=3k
	SSHS3rTf8f911liVlR1RdsREcGi30GaFaP1/KZvCY=; b=MzId62Z9IJE4WMzh25
	RH6Sb6KPQwOwvX44V1DaU1KxIHJ/lbwUnTMp7Rk1g8xfU+IG1JjUucNWH678/vhK
	UDT9opEBHaIm6SYrxvujvIbOaGNDMxxrHhYumO2dWGWXGr27x8X5sHA5YUfH9uYE
	gYk2HZxiC3gY8Pf1bsF3NJ61OoVlE59esXCZlMJzq5dCSf9eAuHPsh64sBfauVFp
	d3A/d1VSFU3VMoYiUsgXWM67pfq/XCFjikWWL9ZqDAVGF2kjYMNOZWlXqlSuWjrM
	LQx4lOLMLKEXzd8GIUST+A8IVRkx83kNwe14TF4dZygJl5oTtjgaiftqCq4DUqnS
	vv+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675998065; x=1676084465; bh=3kSSHS3rTf8f911liVlR1RdsREcG
	i30GaFaP1/KZvCY=; b=saE4QLewN5ZcQzuezLPzI1TT1gH3QMw/++ZLnlp+9v9n
	gvx/khKBUo+YClhYUrW629bUKunvZtwriLLkrLvE4VYVK/0nxNgCOBsPX1JBGodk
	X3r3dk0IXj8BlVJmpOb8kuv50Lce40k51SoqQGE0zo3K5in0RDVn9hAxGgwGwpVI
	6SvabPFDQHBQ4R6O0ylpe2SFzTjF8rwhN+E9ZIvjSJL1O5HBTEr69cT2xjaKbr2l
	0Sr05BR/+/WCPYeou8k6eWKhiCSS7Vsf2TSiLwzhyasfW6tntkP3BHvoswGcTulY
	N/tlrngLjN314luJPzNWDc/DufnGwTawmfApZglA8g==
X-ME-Sender: <xms:cbPlY5NPQMt-LeN1PrtkNARXJFyP1guChoisemmcvwnlHeYcQvRFaA>
    <xme:cbPlY78PWm8Ho7_Apj4dWUPY_twoEMeBrKNjIMmEXH_2beUOtoXUUBNsPumbSNnW1
    DddXdrTqapkbE48Fz4>
X-ME-Received: 
 <xmr:cbPlY4Sm8nDi3sUFwgGdq7JSeO3pMBkHpODNO0ZIwsNqnTHjiuKASH0ovIO6qA1qUGdSMKEfD5sN7YUZxMw1YKaztn0rfePdq8-u>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudehgedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:cbPlY1vqflfWjTgIzXaNB7sIMlGalwFpMqsLIAFnBf5xIGOMNGflBA>
    <xmx:cbPlYxdPv3lLV-IlXljT7SZuvBqCWTDK1ud6m967RODZdLjCgy7ssQ>
    <xmx:cbPlYx3znRN-3JT5yJYGMol6NHqy98hs3Htaao3wQoYYihydsul75A>
    <xmx:cbPlYxmQFHru56YXDT8CBJQp7icM-uMh9av9PlpDN3x_8MBqsoYdTA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 22:01:04 -0500 (EST)
Date: Fri, 10 Feb 2023 12:01:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "M. Armsby" <m.armsby@gmx.de>
Subject: Re: Motu 896Mk3Hybrid dump
Message-ID: <Y+WzbnsmcpKvAtsg@workstation>
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
 <Y+R3Trgr8gM7A1KC@workstation>
 <dthyo67qd7oj-30ctll-vrg1evnr7efht4ec6d-vumue675livm-arck14-npbh32-o2k9duez9ilsuaqtqxlx8623-kq6ura-pddtnlaydil563o5b0waa3tw-27ybk4y6e3x5-nxupxe-wmtcs3-6w8h10.1675945189061@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <dthyo67qd7oj-30ctll-vrg1evnr7efht4ec6d-vumue675livm-arck14-npbh32-o2k9duez9ilsuaqtqxlx8623-kq6ura-pddtnlaydil563o5b0waa3tw-27ybk4y6e3x5-nxupxe-wmtcs3-6w8h10.1675945189061@email.android.com>
Message-ID-Hash: G74YAOOVXWVSVGJMIZME3YWZTBIZPOAD
X-Message-ID-Hash: G74YAOOVXWVSVGJMIZME3YWZTBIZPOAD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G74YAOOVXWVSVGJMIZME3YWZTBIZPOAD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Thu, Feb 09, 2023 at 01:19:49PM +0100, M. Armsby wrote:
> Ok, sorry for pictures.
> I will try the instructions you gave me in the coming days.
> The Arch system (manjaro) I'm using is the only one I know that uses a
> current Kernels and now runs very well with ALSA Firewire.
> Should I use a better Distro?

ALSA firewire-motu driver has no changes since v5.19 kernel. In theory,
you are free to select which version of kernel as long as using the later
version. Therefore, when selecting Linux distribution, you should take
care of the other items, at least:

 * Preferred version of software is provided; e.g. Ardour
 * Easy access to information about development environment

When building linux-firewire-utils, you need to install GNU Compiler
Collection and GNU Autotools. I think they are available by package
manager even if using Arch Linux or derivative distributions, however
I have never used them. If you find information about them in Arch Wiki
or somewhere, you try to continue using it.

> Indeed, it is inconvenient in the view of user. But let us focus on how
> to support MOTU 896 mk3 hybrid at present, since the issue includes many
> technical topics; each application, drivers in kernel, libraries, and
> interface between them.
>
>> See Pictures taken from Reaper in Windows 10
>
> Would I ask you to avoid attaching pictures to open mailing list?
> The message with many files is easily judged as spam message.

Additionally, HTML message is not favourable, since it is used for the
typical spam message.


Regards

Takashi Sakamoto
