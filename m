Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D3675034
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 10:07:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446EB2F6A;
	Fri, 20 Jan 2023 10:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446EB2F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674205649;
	bh=w79DVaXrHnyraGFT5ZBwAtxG+cPulvZJxuU7EmcVMbw=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C+QiReWexfRyWHfibQyli5hflr/WdmBOZDx2XYZ2TpAbOvM2XA2bbCA2+QHrZUDlb
	 yCMdGj+2TMXAvwE7zPH9UJmejtvYEfvCCtXzcX9lpEwZuitUjn6t+B7N0+WWM/8x0U
	 XR2l1np3ih0uGkODN6oc2Rc7L+2nH3relxa5qaEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C747CF804A9;
	Fri, 20 Jan 2023 10:06:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 749CCF800F0; Fri, 20 Jan 2023 10:06:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECBBCF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 10:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECBBCF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de
 header.a=rsa-sha256 header.s=fm2 header.b=ZlhYy8M9; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Mr/ryk1k
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D50965C00CA;
 Fri, 20 Jan 2023 04:06:29 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 20 Jan 2023 04:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1674205589; x=1674291989; bh=tWpnQxdaIe
 bR2vFTYRJDrsRnibO6QCYzydQzBInxGiY=; b=ZlhYy8M9iRVinsdEPBu3dK4cYM
 lsH48zEfMvo/b8iZ0yFGJW6cH0n96N7woZsxAI9lqvsi8pe1lX6oI11vLbEKCeFn
 Io0/yI2YrgQD0uZzDxbEfB48yl43H5l6+Ag/kkyjuz1U636nZcT9vDOG3l+TbXo8
 Pdq2U60OVmxO4YBm/Icjww0tMKWqSfd/zeGXShU+sHuWOEcsVdWu15jB3WxgXwQz
 u5ZVTN5RMZZevxkkweHTsWTgmUZh2RTawvAd9Z2GYXvSvxijoB0fcBxa7+emZuny
 T53I9Tw5RQ/SpA/32Jgfs2gLytOjeWsVoAqbO4QMjzXKnMbrX7kaHsX+iNrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674205589; x=1674291989; bh=tWpnQxdaIebR2vFTYRJDrsRnibO6
 QCYzydQzBInxGiY=; b=Mr/ryk1ktCsXUeJMJo5VUad5iBAIkJkm3w7+my0oMYlM
 qi7VSwH9m7FMsNV1ETwSFt55OwzEe9axQH8fJDD/tHNfhrnnrIsjWsE3ebfFLUwy
 gbn7yKXv6bRDgK8pmTksshwbvj5Sns5nezmyW5iHUOMUQdwMo2KTqE0eWZFwXXec
 QRQUzIRlohMaMH5v2DgTuH/EDShQPdIgmq4EX7xdoYcHqXUOBY1xcgzQRwLi56zj
 Fxdy/m0JJJ08UrOeXABWALUbFQHC0fr1nushNxDIY6/hat+mQ6o1ZJXVNfERi7pN
 H9yl+E8+CDUEmrBFBH+T83tssAl3kn7q21LG4SsP4A==
X-ME-Sender: <xms:lVnKY9mn4XMOKeLMLqdsNLT2HLfZa5kr2HU9xARgwlEaunuQgucd7w>
 <xme:lVnKY42J40UbF22QfjPz0fEqc9PLc9_g6_c5jEtJw-XmB3JQ-sVCz2vSGWD-7kzse
 HOn75xDzUSbGEn06SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddgudeftdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lVnKYzqX0jokflOnT4bvbeWh5Hfw5Jn4jQwzfb76oY4k8WiduGeh9A>
 <xmx:lVnKY9nr4zlVnsnJYXWJvNJbZS9QwG-LoENZBVXbEwTeqWSUUyn81Q>
 <xmx:lVnKY70lQEJ_8W0--wa79jubU5IbLOiIyY7FhXvKYW_8Bb_vdbvVXg>
 <xmx:lVnKY0uhn9xLi7xQvQ2ma-5mgaTApvhnCJeUxFkjTv-qUdn-AjDfeA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 939BCB60086; Fri, 20 Jan 2023 04:06:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <99519eb0-399d-4972-ae09-955a34830b55@app.fastmail.com>
In-Reply-To: <Y8l21Kb42l2ZcIC+@sirena.org.uk>
References: <20230118161110.521504-1-arnd@kernel.org>
 <Y8l21Kb42l2ZcIC+@sirena.org.uk>
Date: Fri, 20 Jan 2023 10:05:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: samsung: remove DMA filter function and data
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 19, 2023, at 17:59, Mark Brown wrote:
> On Wed, Jan 18, 2023 at 05:10:45PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> This data is no longer passed by the platform code, so
>> there is no point passing it down at all.
>
> This breaks an x86 allmodconfig build:

I see, this patch still depends on the s3c24xx removal, which
is in soc/for-next and I used for testing. I see a similar
problem with the MMP platform in patch 2/5. The series here
is mostly older patches I did a while ago and rebased on top
of the boardfile removal, but it breaks when it gets applied
first.

Unless there is anything in here that you really want to apply
for 6.3, lets drop all five for now, and I'll resend it
after the dust has settled on the boardfile removal.

     Arnd
