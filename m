Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F047FA552
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0889E8D;
	Mon, 27 Nov 2023 16:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0889E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701100459;
	bh=/rDG1X8eXE15iViqJa13RqxXZgw3uPER3SBZJO41w4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bNwUqhw8BwK+/us90++r+yGxacIf869nrxqxVO0GY7dbEVCqBbYihnLA3M0OOdtpp
	 ry7+pLXWvHfij19agUX8i/YqvNJzALRSTv6Ny6610dtVJ3jKauXMbXfJ0OZDswP0gB
	 jMpHwAvOzw1GQ9Aq8ciZqRxRbeCtV8Y0pn78ryL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40EBCF8057C; Mon, 27 Nov 2023 16:54:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED422F800F5;
	Mon, 27 Nov 2023 16:54:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B47F801D5; Mon, 27 Nov 2023 16:54:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B4BCF800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B4BCF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm1 header.b=KhEEuz8v;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KYCziQKj
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E23C55C028B;
	Mon, 27 Nov 2023 10:53:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 27 Nov 2023 10:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701100436; x=1701186836; bh=RV
	PtMXqwnKRTq3/SvOKl47wsrx36gr/hOLiwd56gh60=; b=KhEEuz8vhFWoA0MJJu
	dAS3GZuTJ+ESGv49306E5ktsWGTK9IBiNfnzhcXLCjbZI+UtMqXSvppI+BLaPHU1
	1rkpoXx7kw+ghKbljjytUC/+LOB2RQPoxi+ivGMQRCeIXDOrOmzRvv7cHjx7iBAq
	7VHyMK7Vaf1cumhfQ48+pXCXr+tYSLFmI7NOl74DJrI2B8dCo5bLdB6akxiPqFZ7
	F8dKukpeGLCL4qs5CX9vybeE2ZC1Wngsc1P0t+zplcxcigkT7INrPpAI+7PH9hI8
	OayP1a+8YKF+EJ6DYEMQ9Gb8IMso9/d0CoefIgMK5l1SwRglSoK35edrtsAD8WL+
	6a4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701100436; x=1701186836; bh=RVPtMXqwnKRTq
	3/SvOKl47wsrx36gr/hOLiwd56gh60=; b=KYCziQKjew1WHTQXoN5Dw1l47XC6K
	RJA4fVgWLdTLw9Ax0ekWpIDYPvsUKNo6DpwBtJsX1Lj19mR1/FIcNeiNxMZal0Ow
	5a+HaPJsG15/2RsQ9Z3UXOW9QhrHyJE17Eg677/+yL5kRS8Jxa7AWdQ8Kbbd8gv0
	dcjz3vdAxuW4T4OVMe/nNpeayz0uKxwHeZ5sheNXkUsfIH6uQO7p4zdxTU7msOFg
	0yPa3iFnp00ILvfKxavllf8bWRUBjaZPab7U5X9+bTfNXKtjBkhXP9KvUvCX+KEE
	eIXC/sNx/JJ6r4Wy00gSM6RGVXow4UI5kyltrKidcW15AWv6AaT/m53HA==
X-ME-Sender: <xms:lLtkZTxds9KCaErDq52aGewAXPSSkarwlHN4mkYj1Vz8pa-ZP8Yuug>
    <xme:lLtkZbS2aB9N9stzT7b-kr7-FUU2LanNb48JnYej_jqbt8-zYpZMhq0SZ6Pq97lBV
    d9VNERH_tg85A>
X-ME-Received: 
 <xmr:lLtkZdXaC_F1R47aPUY33k10NLTJDt4GfxjgQQCh_tq6m6dr3pV_32sNN9AcjmEbOOmRKAJ8yypShaZgcRhHYkboHLm74WK-9xq0N3Obc8I9y0_MFm5Pmzk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:lLtkZdj25v_LkDMMFpqpAKM_mmF9bLJc61a0wLtLKrnajN7J_3dVow>
    <xmx:lLtkZVDugJLsohqrUIybYkDBpdq-V2i1ticf1kaf0LQb-TqqI3Ku8Q>
    <xmx:lLtkZWL0p8mEvHyuwFYxHMs6tbVtOGFQ0Ri-yuxu4cD4_7m7j1QyEA>
    <xmx:lLtkZd5b_xdTP4l7dS0pHxJjR1AmT0H0CwJGJDE9GhwX58qPneU7rQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 10:53:55 -0500 (EST)
Date: Mon, 27 Nov 2023 15:53:54 +0000
From: Greg KH <greg@kroah.com>
To: Malcolm Hart <malcolm@5harts.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Message-ID: <2023112720-foam-epileptic-1f30@gregkh>
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
 <87leajgqz1.fsf@5harts.com>
 <08590a87-e10c-4d05-9c4f-39d170a17832@amd.com>
 <87h6l72o8f.fsf@5harts.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6l72o8f.fsf@5harts.com>
Message-ID-Hash: DQ362RN3PJSIPBIHWI32YZQS72HM5X6J
X-Message-ID-Hash: DQ362RN3PJSIPBIHWI32YZQS72HM5X6J
X-MailFrom: greg@kroah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQ362RN3PJSIPBIHWI32YZQS72HM5X6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Nov 27, 2023 at 03:44:37PM +0000, Malcolm Hart wrote:
> 
> 
> >From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00 2001
> From: foolishhart <62256078+foolishhart@users.noreply.github.com>
> Date: Mon, 27 Nov 2023 11:51:04 +0000
> Subject: [PATCH] Update acp6x-mach.c
> 
> Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to enable microphone array on ASUS Vivobook GO 15.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
