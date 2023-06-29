Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72868742C93
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 21:01:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B55F1F1;
	Thu, 29 Jun 2023 21:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B55F1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688065315;
	bh=emEAbCvAXgJ+o/OTdZ1cOd+sczR9KbvkxOBH3FWm8FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NrcjX2eiJjSAqxwC3iFAXCQR9JoZ5jOitWbI7v5R6Zl7ev94NM7wqY60sw84h7ZJ1
	 y5thn+c9sg/zAINkyw2GonM4RkICVDv6Vu3ZqHOUAyQoNWSwPJlU0gjtWZnubvwH0H
	 qsU0TbAvqBZYKXRRQ7BQs2/hVM4CV98LmSNI4xw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E1CEF80534; Thu, 29 Jun 2023 21:01:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14D25F80212;
	Thu, 29 Jun 2023 21:01:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6534F80246; Thu, 29 Jun 2023 21:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C597F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 21:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C597F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=i2bOVJJa;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bku9wo46
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id DDF1D32009BB;
	Thu, 29 Jun 2023 15:00:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 29 Jun 2023 15:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688065242; x=1688151642; bh=bp
	7/jbgKluLBqcOde9/5kTokHhE3IOxuA/FlerD3+9Q=; b=i2bOVJJamStYbA3zgv
	YU+tzEwjLLEXriTCJYN0Hj/d5N8xMer+YwSGpVxKyXg9oRC5edjxci2DiTu3XZvc
	YhV9F9gSo2vb/M9WrAS3GmZoldmdysGri28JhWJ5k4Y7wJPFIAq3L7zTsPEwIecV
	KHf6F2ETgsSdI/6+b0uCuasrWwbesrqCcEdW2iDU8n8tQGgjYcrshlo0gP84Acru
	W1/BlgbjlPqBmplCNDTkb+Sv2mp5Q38N/JUNphllqbtYzVTvSl9+ITLsbMf6znK1
	132VWYTkrf8Vq6gdcg7tEIN745I6ZEXnNneTSGMK1q0O6Sc3iYwUTYL+4GQN2nkq
	DB7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688065242; x=1688151642; bh=bp7/jbgKluLBq
	cOde9/5kTokHhE3IOxuA/FlerD3+9Q=; b=bku9wo46OJ5u7zQmcZi3bXLF1vMpa
	/MVERS59KH6yH6rCfeyxyFeZzNq+NlDFxMG9iZ9ttGyuw7aaYH7NvAhMJ0r96/Dj
	wA1BLDI/wU2bXWGiQUmYoA5MXzRuEg7h8Zuy/F3AaIk58iWHzrFyFBs1a/dHX48v
	O1+5KUuFcZdNqcR63ux2+rVLWDsSwYUaEN8mBZZWquZCqF3FkabVHo7We3Ir34fI
	CR3m05RYvLwzskqbXnd+J6nU3Q3wEejWOCN3vgTO5GrT4iJXCuu88qvxuGFPbQg0
	j3DsHWKQo4Lc+issk9ZkZfaVXgwxS8M3h2phqh0i+cpAZz6vkQxYLYqsw==
X-ME-Sender: <xms:2dSdZGM6rTSO8Oz3KSf_9aXMJEzwwEkYyAP7FwAfy_rHuuUjQthBxA>
    <xme:2dSdZE_qcAXaWG9joktAgd2JMITcLE8iWXaOgZtBLm7ux2q_sPjt25d1SavmHoj6W
    WS8yvtO_GEPkQ>
X-ME-Received: 
 <xmr:2dSdZNQVyz119j9CjN2PAyPXxWndvdUlWdWRUxS1-XYdpPHxNCeZ9Qs08ZyJmH_0GM7j3KZfsiSkoparEMELA1PiSq_rAj6MwHbIYQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdeggddufeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:2dSdZGsvaAE4dhZ9mY-JB1zoOByb794d6ubbdyVFhCUBz5KFLOwjgQ>
    <xmx:2dSdZOcW3vC36RTsC1QNcEMGPzibflfPWXwgfMDWtKrKyLfO0aW4dA>
    <xmx:2dSdZK3m_QbySTKxRfuhOwCOutG1H96bf3uLioIU4nzHsQxfeO4emw>
    <xmx:2tSdZCNCdsuJCZpJEtEz32l1W_aDZwuM3su0uQPEBZuyAEN4OXwB8A>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jun 2023 15:00:40 -0400 (EDT)
Date: Thu, 29 Jun 2023 20:48:42 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <2023062905-tiring-bauble-84ef@gregkh>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
 <2023062940-snore-brick-419b@gregkh>
 <9699a960-74b0-4064-b264-6cde06cd16fc@sirena.org.uk>
 <2023062958-thumping-ambulance-7a2f@gregkh>
 <1c1dd19e-cbc4-41fe-9e97-a07cfebdaa4b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c1dd19e-cbc4-41fe-9e97-a07cfebdaa4b@sirena.org.uk>
Message-ID-Hash: Z4IJCDYZWL2RTZGBFMKCB2GKRIGL5E2M
X-Message-ID-Hash: Z4IJCDYZWL2RTZGBFMKCB2GKRIGL5E2M
X-MailFrom: greg@kroah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4IJCDYZWL2RTZGBFMKCB2GKRIGL5E2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 29, 2023 at 06:38:38PM +0100, Mark Brown wrote:
> On Thu, Jun 29, 2023 at 07:22:51PM +0200, Greg KH wrote:
> 
> > It shouldn't matter for stable or not, if the change is acceptable in
> > Linus's tree, with the userspace visable change, then it should be
> > acceptable in any active stable branch as well.  There is no difference
> > here for userspace api/abi rules.
> 
> As discussed before your tolerance for risk in stable is *far* higher
> than mine, if there's any value in doing this at all it's probably
> within what would get taken but that doesn't mean that it's something
> that it's sensible to highlight as an important fix like tagging for
> stable does.  It's extremely unclear that it fits the severity criteria
> that are supposed to be being applied to stable, though obviously the
> documentation doesn't fit the actual practice these days.

It's not a matter of "tolerance for risk", it's a "if this change is
good enough for future releases, why isn't it good enough for older
releases as well?"

As you know, we don't break user interfaces, so either this is a break
or it isn't, stable trees have nothing to do with it as a normal user
would "hit" this when updating to run Linus's tree, just as easily as
they would "hit" it updating their stable kernel version.

thanks,

greg k-h
