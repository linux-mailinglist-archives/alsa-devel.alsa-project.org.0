Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831DF472211
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 09:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D411877;
	Mon, 13 Dec 2021 09:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D411877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639382654;
	bh=ZbJY2QOlnkFlS1BA72NPt0LI3PhTtdfKyTfiKhnEeEM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvMKaPcH8vO0ex3eILH59h8SejbYmiaDnoJs3ipnFtHutoomoD7XYPXI3Oh97lVtf
	 NqZuD9JVQpvUoKkhVy5U9KSkJLbMU++9AdqA1bUGeH6aKG2Ng0dQL/l4UNTjP1S7cI
	 U8bjb+1DNtnU5OXV049Ekrh1vDeOxtIm/HVZgN+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 747B6F80229;
	Mon, 13 Dec 2021 09:03:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C32F3F8025D; Mon, 13 Dec 2021 09:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12319F8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 09:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12319F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n3bjueb6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dIpcjc9x"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C95D5C0097;
 Mon, 13 Dec 2021 03:02:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 03:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EjOLxFwGF6+ifGf067MKY65VYk4
 c0zD4p7sDrYP38CM=; b=n3bjueb6R04LK2EbpTvGo/Ih7YAw9NFtNVVJHUSRaS5
 ZwdfHIXGmvte1eoyS7y+Cu30evpJG6pXezyP3VOEga2Lcb4v5rqvIlCXq7pl0ffe
 fT9ajNk3lA3rpfYoDbUJfr9Drf0+scGuWCFVon7qEO7CuSzovWHCYF3Qmce8Fgcm
 v0bQgApwDGnsasvIrVLjrVuZ406H8IDSdPwcq/LjnvxjkhlitH9tEt7Ek1YAAb12
 IUVLmoVApV0hpkxuMWKVT6SIGBkcTOkLL7HtvstlUGtVGI4FcmEd0SXiC/Rlsxox
 OrcOfwetzLT0yhNN/BcigTKzPWrH8SwpHYGznKzAh4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EjOLxF
 wGF6+ifGf067MKY65VYk4c0zD4p7sDrYP38CM=; b=dIpcjc9xDt3QyGeZiCtoif
 hDCmQt+wvHaw5mALw3XsWjoDt6noLezRbGi06WGzCl5qf1Od0edm/oOtGpaAeHpb
 fY6boemoJSceVXdZteaX1CjKUSv6vdSik/c8VENTefC82xXyOzexayGBNc9bsVr4
 GnjYCub3F4UpRhiyKQ6gLaJskL/05Pk6/laGHfQ7ZRnNBcDxY1xRheRVeJiE2Gy/
 7D+DbzFwQtPhP1lnJcCXLYG1gAW8Lf6r39w/bsrDMVYy6GIs9uk4qtd+Vg2wD0z5
 kddOXss2+CHeRGdaHl0dvKlRGDTRsgfCNZXUk5JB6w5rAvdHEBaOjlp8IQbExf9A
 ==
X-ME-Sender: <xms:Kv62YavvRESxXu8qDW7DmD8OFklHMEunIQ4xC5-U2XUYE3ghJ9uUqg>
 <xme:Kv62YffJR4Qp4yNCbhu1sxBAFEqWgRfBvLCAF8GlJGg8LiTtV6bMm-NJPNFsptSPz
 nmBTlCv0NsrGjby_fM>
X-ME-Received: <xmr:Kv62YVxAGSvGwvPw6riQbBkkdBexPQbWpHdyMrA0JCG9HMNQnpj5uDw7gH8AoCpkOcKtr0oac9vABRHNb2SkD9J03dQOQmnKLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeejgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Kv62YVN7RmuQPwduG1qUlZ3ZDxELkDzRuAUS2c9-muaQcnYba6OEkQ>
 <xmx:Kv62Ya_YluY_zvjIGfVK3nzRqY4KENB6EsAqHFNE7GHhYt_LgovuXw>
 <xmx:Kv62YdUYIrkkFJUQ7G4LABzmRYfGUYi_fkmoXYNvb1RzPT0hc-_pxw>
 <xmx:K_62YfGM09ZiZW7eYV09e6fcZVIdiEcGUqpEmg25vAIXRrTtxzbtQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 03:02:49 -0500 (EST)
Date: Mon, 13 Dec 2021 17:02:46 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: comment about relation between msbits hw
 parameter and [S|U32] formats
Message-ID: <Ybb+Jo73x4ZDRNNY@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210529033353.21641-1-o-takashi@sakamocchi.jp>
 <s5heedo3cdu.wl-tiwai@suse.de>
 <30685ab6-3347-43ee-b20d-6e11994242b4@www.fastmail.com>
 <s5h1r2hezsp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1r2hezsp.wl-tiwai@suse.de>
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

On Mon, Dec 13, 2021 at 08:20:38AM +0100, Takashi Iwai wrote:
> On Sun, 12 Dec 2021 12:30:30 +0100,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Sun, May 30, 2021, at 16:32, Takashi Iwai wrote:
> > > On Sat, 29 May 2021 05:33:53 +0200,
> > > Takashi Sakamoto wrote:
> > >> 
> > >> Regarding to handling [U|S][32|24] PCM formats, many userspace
> > >> application developers and driver developers have confusion, since they
> > >> require them to understand justification or padding. It easily
> > >> loses consistency and soundness to operate with many type of devices. In
> > >> this commit, I attempt to solve the situation by adding comment about
> > >> relation between [S|U]32 formats and 'msbits' hardware parameter.
> > >> 
> > >> The formats are used for 'left-justified' sample format, and the available
> > >> bit count in most significant bit is delivered to userspace in msbits
> > >> hardware parameter (struct snd_pcm_hw_params.msbits), which is decided by
> > >> msbits constraint added by pcm drivers (snd_pcm_hw_constraint_msbits()).
> > >> 
> > >> In driver side, the msbits constraint includes two elements; the physical
> > >> width of format and the available width of the format in most significant
> > >> bit. The former is used to match SAMPLE_BITS of format. (For my
> > >> convenience, I ignore wildcard in the usage of the constraint.)
> > >> 
> > >> As a result of interaction between ALSA pcm core and ALSA pcm application,
> > >> when the format in which SAMPLE_BITS equals to physical width of the
> > >> msbits constaint, the msbits parameter is set by referring to the
> > >> available width of the constraint. When the msbits parameter is not
> > >> changed in the above process, ALSA pcm core set it alternatively with
> > >> SAMPLE_BIT of chosen format.
> > >> 
> > >> In userspace application side, the msbits is only available after calling
> > >> ioctl(2) with SNDRV_PCM_IOCTL_HW_PARAMS request. Even if the hardware
> > >> parameter structure includes somewhat value of SAMPLE_BITS interval
> > >> parameter as width of format, all of the width is not always available
> > >> since msbits can be less than the width.
> > >> 
> > >> I note that [S|U24] formats are used for 'right-justified' 24 bit sample
> > >> formats within 32 bit frame. The first byte in most significant bit
> > >> should be invalidated. Although the msbits exposed to userspace should be
> > >> zero as invalid value, actually it is 32 from physical width of format.
> > >> 
> > >> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > >
> > > Thanks, applied.
> > >
> > >
> > > Takashi
> > 
> > I can not find the patch in your tree. Would I ask you to review again?
> 
> Hrm, it seems that the commit was lost by some reason.  Sorry!
> 
> > If it should be going to be applied, I'd like you to fix my typo in the subject line;
> > 
> >  * "[S|U32]" -> "[S|U]32"
> 
> There was another similar typo in the patch description and I
> corrected both.  Now applied to for-next, commit
> fb6723daf89083a0d2290f3a0abc777e40766c84.

Thank you, and I overlooked that the patch still includes C99 style
comment in the part for UAPI header...  I'm preparing to fix it.


Regards

Takashi Sakamoto
