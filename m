Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB23F0FA1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 02:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55C8816A5;
	Thu, 19 Aug 2021 02:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55C8816A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629334419;
	bh=wNBg+WXcYkX6R7EYEd+hJbjQQKUkNmY3tMZ86U4pHXg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHG6f1Pf4s2XADsO+rXD9V1RnMTyuK9KExrOuI3A53DwXT6fXW6A/1XWefE6U0Xfh
	 QAJeDqBm027PoMNng42BoTYfuszkeWtcnII/5fQLO/SyUEBPZWYiOXYqhWBRZqPoFe
	 aZo4fECxXDzy7n73J4SYbUi6hVDSMpJZ23VjWgMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9593F80163;
	Thu, 19 Aug 2021 02:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E92A4F80249; Thu, 19 Aug 2021 02:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A00F800EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 02:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A00F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hvWt2yFz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="D01zv5sv"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 41C8F5C015A;
 Wed, 18 Aug 2021 20:52:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 18 Aug 2021 20:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=g
 53qzeh2t/fI6jOwwDO4xPsqRRTwnC/fk291231sJ6c=; b=hvWt2yFznHx0ZIq1N
 NH8bCPRl9ueba0vIphI/sQ+CohfuASzKDy5rHVHQKbPVzB9cFL8c0Yyo2LmiZHs7
 ttegEpwTEJE4CwXkOSFn7FmykDMN3Bqv+iA1x/0XP/XnlhfUry0HteXZipWiSfBU
 dLPMyzrgN8Wwcafqi3mGy3u7ifarjYw9yIYLhalE6ZjnimC8+jJ3Uw45hALrFAir
 t5+lMJpZZA0vTgXbBN2CuOjAB+gURFsw+MYz0RSUP4SiHWzoc/j8yd4OefTHI8gm
 L6B3WEP5Zxh/Y2wjrkDyGuMfhrQJSRqOvVcTujDdzJ7xGOd4JlJq08lFjv+f10AO
 a7Scw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=g53qzeh2t/fI6jOwwDO4xPsqRRTwnC/fk291231sJ
 6c=; b=D01zv5sv83Br84TfZx/DOXOx8FzIzda5ftnlOMH9TOjjVGIWJjaL3rzeo
 uim096+/SROHEHih4zBdd07LLuZF23+oRyUTr0Rh1EkE2nAguDe3SKEexmSoR36g
 aplfwpFVRUlcy9zBSFdFny66K5zMO+F6xuTPJ+BqLqaDFt09UsoMiTh/FFnQOntu
 d3ZzlRDnOPw4nFqPr8UUdlBiZzkVe+sedfLqN76BtbmAn3leFc//eqOgJn7v2a7d
 mKDLvJAPqiOGqM3+6SCpwDpY1qctypSosP03f/75zzyy6f3lQh+uccWM2hYYT9PV
 Yq5Rmw2Q1bK9i/xrYechsSa8JWVQw==
X-ME-Sender: <xms:OKsdYU_rew6VhLrRAOfh81AI_tNL5ptOIKNlQRrCBRpeVYfHUEsYTA>
 <xme:OKsdYctG9jaB73wAS4nuLbLgUz9tfIhhlKR2EKDX34FMworZXi08aAn0Dj3Uw06Gy
 qjQi_rG1oX2GXGaz5M>
X-ME-Received: <xmr:OKsdYaDe-u5JxFuyMQ9MB9rB0awoTUdvL4r-hXqTXPg6HJTcooDFi91z6vxI9ugKxJkF-mIvvxjvH5xQLpVTyA94RYspgVGvbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesthekre
 dttddtjeenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepueeiueejve
 ffgfevfeeuhfdvfeekuddvvddukeegteelheelffeiteeghfelgeeinecuffhomhgrihhn
 pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:OKsdYUf2N2WqP2QyQvKEZy1b8Qv1XgtMYX8qmUf8XnLtQiN5-jI8IQ>
 <xmx:OKsdYZNqzzfJ9CqoJlIeFYH9i0LvG4OVfE7OGuMiP33H6tsUx3W4cA>
 <xmx:OKsdYekOe1fUylWptlEVacLX3iJo88J_GP8J7uV6mu2xsM0QnUopyg>
 <xmx:OasdYbUvCVTOvDUh6Uk0EUGWCm_Rs5vrelU7hNAwyJVLI7k6Irmmfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 20:52:07 -0400 (EDT)
Date: Thu, 19 Aug 2021 09:52:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Philippe Bekaert <linux@panokkel.be>
Subject: Re: PCM channel names
Message-ID: <YR2rNBk7FgVAk5Ch@workstation>
Mail-Followup-To: Philippe Bekaert <linux@panokkel.be>,
 alsa-devel@alsa-project.org
References: <8FD26792-0CE4-4E46-B2A5-E3780FC3B15B@panokkel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8FD26792-0CE4-4E46-B2A5-E3780FC3B15B@panokkel.be>
Cc: alsa-devel@alsa-project.org
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

Hi,

I'm a maintainer of ALSA firewire stack, which supports drivers for
audio and music units in IEEE 1394 bus, including some recording
equipments such as RME Fireface series.

On Wed, Aug 18, 2021 at 05:16:24PM +0200, Philippe Bekaert wrote:
> Same context as my previous mail …
> 
> The RME HDSPe cards have a large number of input and outputs for which the
> standard ALSA channels names and mappings make little sense. 
> 
> Names depend on the card, e.g. Analog.L, Analog.R, AES.1/1 … AES.1/8,
> ADAT.1 … ADAT.8 etc…
> 
> Right now, the hdspm driver provides a ad-hoc virtual file in
> /proc/asound/card<n> containing these names. 
> 
> Isn’t there a more generic interface to communicate PCM channel names
> from driver to user space
> 
> Same questions as before:
> 
> Has anyone been facing similar issues? How have you been solving it? Is
> there any “common practice” or “habits” in this community concerning
> this topic? Would it make sense to define a kind of generic interface
> for PCM naming? Then, has anyone an idea or preference how it should
> look like?
> 
> Again looking forward to your feedback.
> 
> Best regards and thanks in advance,
> 
> Philippe.

I have the same issues, see:

Enhancement request: Add "pretty" port names · Issue #32
https://github.com/takaswie/snd-firewire-improve/issues/32

Actually, in regard of kernel/userspace interaction, we have 'channel map'
structure for Type-Length-Value (TLV) API in ALSA control character device
(see 'include/uapi/sound/asound.h' and 'include/uapi/sound/tlv.h'). The
structure consists of array with channel position and its role defined by
SNDRV_CHMAP_XXX macros.

The macros seem to be designed for standard surround channels such as
2.1 ch, 6 ch, 7.1 ch and so on. Some userspace applications handles the
data of structure for construction of surround channels.

However, in recording equipments, the design might not be suitable since
audio data for analog and digital inputs and outputs are
transferred in the same PCM substream. In the case, we can not find
standard surround channels on audio data frame in the substream.
Furthermore, as long as userspace applications expects standard surround
channels, it's not better to integrate the channel map structure simply
for our purpose.

I think it better to design another way as comprehensive solution, but I
have never found any good way.

The most realistic way is to deliver string literal such as
'analog-input-2' and 'adat-output-5', however it can confuse userspace
applications unless any standardization or conventions since any string
expressions can be delivered. Furthermore, it includes inefficiencies in
kernel memory consumption.


Regards

Takashi Sakamoto
