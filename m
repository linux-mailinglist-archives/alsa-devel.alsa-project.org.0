Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA377767F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 13:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E813E7;
	Thu, 10 Aug 2023 13:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E813E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691665635;
	bh=D4mVOPOS8xEc08lW6I5HXqayyQ5F4nk//X2gkQxxhg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p7bGP2olj3JcIsfdnAfirY8+/hNVdh1ofelUKA5SUlKB9WfgWL96xYIUm88gmr5Xf
	 2smPJnqdkaSToRxTxITjMIBTNBAU+7O7sLtP6x9/EGXeN3O7A0rnWsYKwQBo6EbBnk
	 oHn2BM0amPN706coVMUumjec/fbtB9LLYdSA56pU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B589F80508; Thu, 10 Aug 2023 13:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB31F80166;
	Thu, 10 Aug 2023 13:06:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54A50F8016E; Thu, 10 Aug 2023 13:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE0AEF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 13:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE0AEF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=HwVJgO6X;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=RsQC05JY
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 1B50C320093D;
	Thu, 10 Aug 2023 07:06:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 10 Aug 2023 07:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1691665569; x=
	1691751969; bh=tCleR81XNlW8AVAdDmZ94bN/8OYpW3sjlWfMvwx5ZOk=; b=H
	wVJgO6XkIWbka4CbSr1Y2v5fg9DCentFiWUAN9dja39gwxzgFxnRSTnImuaXe/ez
	Z60EkjQAWgI+x5iSV/LQqZf33nei4mg0zooqjBEwNJ2QJ7nLMpZW/Tm2kchJujaH
	5zMkT7+q/gXJLgAKPn8Q5rx0NhMvz81/PpGRt4Ov0Is1JB8vet0LQsqS9U4+O7/H
	Y6THaThlps0le6008T8YQXkU/7TqgM/o3e1MPBCyU42BIgCtfr58VbFZjfh1oULn
	5lUkg3Bczr9tBcrlANilNYP2tt2iC/+ulkA5KA6KcPa/yc9Bwcud5gOtsHhDj/QL
	09sTL+hR24eYkMnMdSl5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691665569; x=1691751969; bh=tCleR81XNlW8A
	VAdDmZ94bN/8OYpW3sjlWfMvwx5ZOk=; b=RsQC05JYSmij3aqWSEid1jvU/Alqa
	eRtpuw2bCVrb/nwWNhCglNiYvOB84fGysWknSdS6MLvKA2Q4upgNrYU3FR+WPXvT
	I6bi6NIH9m8iZa3Uat1aG6Ate3VGxT3lCqDHqjiCmPwd6KbSR33jdjkA7yRA/dWA
	rgA76fEzo1uqHjUXrHBce+aDMGU/V8Nbl7R/TiD0+pUj3bt4MnGDiOk3tFGt2JfS
	e/Tuz7+HVoJaOTQsB48DGMuj97IRs8IsMDynCoJ/dscwP1ICa8eUIvq70VaouFX0
	w6+d9iokQlUENn//t9Yvw8f0kl2+MKsUg+j+TdHwkxGVga3ksa/wqZyfw==
X-ME-Sender: <xms:ocTUZKAd_CPWntEQZ1957YprmQuPmW1gG-oEsE_uaUOs_w0YXjtQrQ>
    <xme:ocTUZEh5bCxYY8hpL9S5w4xTcC5Wx1vGandgXQ575pEmLwZSax_coAzOT_j1DlTM6
    yToigdzTLg-E-657bU>
X-ME-Received: 
 <xmr:ocTUZNmr5pTsFU5or5QLw3S6cIVzgUgmntVYdvt2x9zdwjOwgX0RIT-nkngrIywp0460LMv6L2dYbJ302YsyRvqQN-XNU1nIkpE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrleeigdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ocTUZIyNi4Pac-b8sjg98WgJVU5GETnXQL6w-sAZ9GU87MVTi0uLuQ>
    <xmx:ocTUZPTQ6oQ52i39QACSVdDzWDgeYQqdcRnL57YgFuTTwGYN0EvkYw>
    <xmx:ocTUZDbMjEmAPq66i5B4kdJByCMlszvookXrdO2-w0TME662gq_5hg>
    <xmx:ocTUZKeIG3bnAgAdCzNJY22rSuU8GNY0_w9hSmuNDLI3qL0Sknv9Sw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 07:06:07 -0400 (EDT)
Date: Thu, 10 Aug 2023 20:06:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Message-ID: <20230810110604.GA1090780@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
References: <20230809002631.750120-1-o-takashi@sakamocchi.jp>
 <87msz0e2jv.wl-tiwai@suse.de>
 <20230809141854.GA892647@workstation.local>
 <87bkfge0uc.wl-tiwai@suse.de>
 <20230809225722.GA895382@workstation.local>
 <87jzu3cskb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzu3cskb.wl-tiwai@suse.de>
Message-ID-Hash: SVWKP27ZAQPHC5FCNDGOKVSPMB35UQOQ
X-Message-ID-Hash: SVWKP27ZAQPHC5FCNDGOKVSPMB35UQOQ
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVWKP27ZAQPHC5FCNDGOKVSPMB35UQOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 10, 2023 at 08:36:20AM +0200, Takashi Iwai wrote:
> On Thu, 10 Aug 2023 00:57:22 +0200,
> Takashi Sakamoto wrote:
> > 
> > On Wed, Aug 09, 2023 at 04:39:55PM +0200, Takashi Iwai wrote:
> > > On Wed, 09 Aug 2023 16:18:54 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > On Wed, Aug 09, 2023 at 04:03:00PM +0200, Takashi Iwai wrote:
> > > > > On Wed, 09 Aug 2023 02:26:31 +0200,
> > > > > Takashi Sakamoto wrote:
> > > > > > 
> > > > > > This patch is for kernel prepatch v6.5.
> > > > > 
> > > > > Why it must be included in 6.5?  This sounds more like a new
> > > > > implementation, rather than an urgent but fix that is needed for rc.
> > > > 
> > > > Thanks for your notice to the patch. Indeed, it is neither urgent nor
> > > > bug fix. It is a kind of 'adding support for new device with slight
> > > > change', like adding new entries in mod device table. The overall change
> > > > and new lines are quite typical in ALSA dice driver, like TC Electronic
> > > > devices in 'sound/firewire/dice/dice-tcelectronic.c'. Things are
> > > > prepared and not brand-new.
> > > > 
> > > > Precisely, current ALSA dice driver supports the Weiss models already,
> > > > while the functionality is limited that the part of sampling transfer
> > > > frequencies are available as the initial author said (e.g. when 44.1/48.0
> > > > kHz are available, 88.2/96.0 kHz are not, vise versa). The patch extends
> > > > the functionality by hard-coding stream formats following to the design
> > > > of ALSA dice driver.
> > > > 
> > > > Of cource, I don't mind postponing the patch to v6.6 kernel, but in my
> > > > point of view, it is worth to v6.5 since users got benefits from the
> > > > code which is not so novel.
> > > 
> > > OK, then I'd rather put it to 6.6.
> > > If it were for rc2, I could take it.  But it's already in a second
> > > half turn, and I'd rather like to limit the changes for later rcs.
> > 
> > It sounds reasonable. So should I post the patch on your for-next branch?
> 
> No need for that, the patch itself is applicable cleanly.
> I just need to drop the commit log line indicating 6.5-rc.

Okay, thank you for your application to for-next branch.

(I see no log in public sound.git tree yet, while I guess that it is in
your local tree. It is the reason to ask you in the previous message.)


Thanks

Takashi Sakamoto
