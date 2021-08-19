Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 463883F103A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 04:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA2A116AD;
	Thu, 19 Aug 2021 04:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA2A116AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629339118;
	bh=GdUyDUszkplpMByL9zVtD6QfzFyB5jq2+mbfxGh4Zks=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYBxUMr0lo+FG0raBq2xX9P8ERjvMgUWBadKEHYXCC0mAZVkRX/D8Mbos6aAO0GcI
	 jsTNUawGsagUCrpZicErk8yLFfGZ2TJFnV0kbSwHreXpt7nUruYysmInt+lRoFiUEV
	 N7qG3oJpzFUYmElPwS5oLMFUJka9HPAb3axmwZro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FB8F800CC;
	Thu, 19 Aug 2021 04:10:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5695DF800CC; Thu, 19 Aug 2021 04:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBFFCF800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 04:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFFCF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="YEykr3pz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="p9l69nrc"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DCF105C00A4;
 Wed, 18 Aug 2021 22:10:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 18 Aug 2021 22:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=K
 Hcknu+BM39OOuLiEO7d/UUrFyBeSM1pWaMnHC8DNC0=; b=YEykr3pzVK95fpQ/C
 1S7OFCgHIOh08d10uAxamGCGZNPYsrKpJWGCg4duXRiHphJ44uZ0tc2MlO5mcaaT
 ogJwY6FWduTg8NUuh2SZF8o0hhEYMFCycVbtTiBRvqVpNCFYPRWekKFTlzxLlvGW
 iVDa9NkcGsrsdWtSJGak3QEo/r6q/JkXi+B7hBHy+OqseYZRzQIyqMMOfxytkK80
 eKJ22KJMbUFvegHRKdtN5NQ56tFjGTQV2dmxh2I3Jb8UxOlznW9eQhSbeJEie5hj
 P8ckvjr42vQCWLZBn3M5/6u0aEbSbFUnrZ9u4WkO4eUA1TTCt+vTqgMZqIhhrLgf
 MTXcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=KHcknu+BM39OOuLiEO7d/UUrFyBeSM1pWaMnHC8DN
 C0=; b=p9l69nrcg8ncoqDIvgSKgBMJCiymP1oDYNSg94ekD8SDjR2U+dRYzuBrF
 UW9j5e/GTh+KaCP/ky9A/Bt2yLBe0zqJW/0WFf6XSfwFt59zo2eVY/ubFYmRn6s0
 lnFBbe5gwQKHWHZOXFf8WLPQZPhsLGK3rf9kS6tb61dKbuBvM+GtywZsVYhazPMo
 +/kbExReettsJ4f7tVv48J0T2//3KKUNYxgQ+KWbn3+V4WATwYxyr4corlWyDstL
 I9HjyZtbOaNgK/DmOqZXpricvjJPDo9whMa+nShKtv1Jsl/+bEm5mjqanitcIawv
 P2t6E5fGrUPKQgrVqdZbtzXrB1QSQ==
X-ME-Sender: <xms:jr0dYenwavPZHheqK9B-bv_QqoutgkDFcXWJwSU8SVZyVBmO6VeXXg>
 <xme:jr0dYV0FvCXw_ViRQmwNCGifg9GR7ZW69o8BbZaiuzBIUB33C_sO5oBrHvOjYmRAq
 mFFGC2-5py9Fxh0zXs>
X-ME-Received: <xmr:jr0dYcou_IwEVKzHf4RzEKnPqe3DRhvJP88BAq6XgjrtIcdFQV7pLH1oCmPvg93O7pQIH8iBbahMd69KL8vt1ujoqyE3M4ytsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesthekre
 dttddtjeenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepieehffefte
 ehgfffkedvvedujeetledvheekgeekudetgeffhfelfeehvedvhfelnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jr0dYSnUhCwjCyrp3UWlTUqGAxUllbIp1FhcGgIslXQ6nLiZ2AZnBw>
 <xmx:jr0dYc3vOqsEVsXrutDPQwmU7-2WCS7vB9IJHR3WT6wYF_5lSHOCuQ>
 <xmx:jr0dYZvkbDPotxpMJNA5M0jdg7hKjEXS8z9ja281hHo-aZCUc_zkDA>
 <xmx:j70dYR-bEC9rYFuMXpEMZl-2L4W_FO_MG_7jVBl6aVjbkcQEd6_cIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 22:10:21 -0400 (EDT)
Date: Thu, 19 Aug 2021 11:10:18 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Philippe Bekaert <linux@panokkel.be>
Subject: Re: huge mixers
Message-ID: <YR29ikkXfhMeZ2F3@workstation>
Mail-Followup-To: Philippe Bekaert <linux@panokkel.be>,
 alsa-devel@alsa-project.org
References: <D2E8FFA2-BF84-4C64-BC5A-2DCEC1C18BE8@panokkel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D2E8FFA2-BF84-4C64-BC5A-2DCEC1C18BE8@panokkel.be>
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

On Wed, Aug 18, 2021 at 04:59:50PM +0200, Philippe Bekaert wrote:
> Dear all,
> 
> I am working on a new driver for the RME HDSPe cards, which eventually
> could replace the hdspm driver. 
> 
> These cards have a hardware mixer / matrox router, freely mixing tens
> of hardware inputs and software playbacks into tens of outputs (8192
> mixer controls on the HDSPe MADI).
> 
> Right now, mixer state (cached by the driver) can be read efficiently
> in one ad-hoc ioctl call, and individual channels modified through a
> HWDEP ALSA control element with 3 parameters (input/playback index,
> output index, gain value).
> 
> I understand there is a desire to get rid of ad hoc ioctls and am
> therefore looking for a more generic way to read and write huge mixer
> state. 
> 
> Has anyone been facing similar issues? How have you been solving it?
> Is there any “common practice” or “habits” in this community concerning
> this topic? Would it make sense to define a kind of generic huge mixer
> interface? Then, has anyone an idea or preference how it should look
> like?
> 
> Looking forward to your feedback.
> 
> Best regards and thanks in advance,
> 
> Philippe.

I think the total number, 8192, comes from 64 physical inputs, 64 system
inputs and 64 physical outputs ((64 + 64) * 64 = 8192). Were I you, I'd
use control element set to code the control elements.

In design of ALSA control interface, several control elements can be
aggregated into one instance of 'struct snd_kcontrol'. I call it as
'control element set'. Inner the set, each element can be indicated by
numeric index value of 'struct snd_ctl_elem_id' from userspace
applications. As of release candidate of Linux kernel v5.14, the maximum
number of elements per set is limited by 1028 ('MAX_CONTROL_COUNT' macro
in 'sound/core/control.c').

One control element have limitation about the size of array for values
depending on the type of value. In your case, I assume to use
'SNDRV_CTL_ELEM_TYPE_INTEGER'. In the case, one control element can
handle 128 integer values.

When expressing the 8192 mixer coefficients, I would do:
 - Adding 1 element set including 64 elements so that each element
   corresponds to each physical output.
 - Each element handles 128 values so that each value corresponds to
   gain of 64 physical inputs and 64 system inputs per each.

Or when splitting physical inputs and system inputs:
 - Adding two element sets including 64 elements per each. The elements
   in first set are 'from physical inputs to physical outputs' and the
   elements in second set are 'from system inputs to physical outputs'.
 - Each element handles 64 values so that each value corresponds to
   gain of 64 physical inputs or 64 system inputs per each.

In a point of kernel memory consumption, the first way is less than the
second way. In any cases, ALSA control application can access total 8192
values in 128 control elements.


For the usage of ALSA HwDep interface, an advanced topic stands in my
opinion; how to handle packet from 'RME Advanced Remote Control USB
(ARC USB)'. Depending on scenario, the ioctl implementation might not be
worse since it allows userspace application to control hardware directly.
But it's advanced topic, so let me avoid discussion about it unless
you are interested in it.


Regards

Takashi Sakamoto
