Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47D55A64D
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 05:10:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4921768;
	Sat, 25 Jun 2022 05:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4921768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656126606;
	bh=fQBkLEr1zUEAWouwpgvXvix8iSwgho+X5zmbnNEubtI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=reuhWi515mDb4Ru+AQ0jg9Nl2dmtjH5/+q1cX1DuP5C5mQvpzI313yAaXHyCApT/L
	 my1pSrIJQmYceRFIqcay0kpNH57xqUU1eeNd+8kQl0YPbq+V5qH1loEVoCP+MkQ9wq
	 o7R9pKSpjArVRrn3sW4/lWGpllbh2Jo+R6M9P/+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A54F80109;
	Sat, 25 Jun 2022 05:09:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFA7F80162; Sat, 25 Jun 2022 05:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 236FEF8010B
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 05:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 236FEF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rOwq9b9r"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UblqUJs9"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FF125C0103;
 Fri, 24 Jun 2022 23:08:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 24 Jun 2022 23:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1656126533; x=1656212933; bh=X3
 gKSST+leqmPej4U5EYXsPWwNGiBN6jo8fPf6xJsJw=; b=rOwq9b9rvxU5YGefjq
 ha6OliJfBT/AnvI4ZZ2YAaTY6enapY8K+DHEixcKFS+aMcX0SCQb7m7gAyKmjBsa
 XBfq9aN3brEL+9WBwzJ0GsdfIBsvgMrCDLKyN04IVkRVBqq/XBgLu+HJYXFt1yV5
 1BOJmzUDUm5caw2ezw90k25mH1WZpDUspyg51Hludf+Pidf4x6e/iFHWjHcRy/J4
 dILDySfSEWn0l9X81ZhuV4TZlLExF8P1/470oAjeFUIWesj2n1uc16cDKOZDSPdn
 DmwS3OOThoW3k+KiuguxB36rxzb06tpm+y6S8rt+6MuYxaVmznMKYwCT0Df2AmT0
 SJgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656126533; x=1656212933; bh=X3gKSST+leqmPej4U5EYXsPWwNGi
 BN6jo8fPf6xJsJw=; b=UblqUJs9xFiUsQ2NMdVOxW35QXEkO3R6SRrLHRCsDjj3
 9D0TIpHuUCxa5IPKRRHovFFUpMsmvBH6fDv8OzB9Lo8bdmGU4dJh76teopTwzK0c
 pycBj0m3z27y8C6arERXABmJkEyIKpD+1+hhhMT+UWqSP0u+uR+if7G2o7hjjFP7
 0/bo6c3j+Dv09Ooind6iSkErDD4ZwewXHaki6wgNfrqpMruPA7688ayqHxs/YFFU
 h1woulRto5b68b3Yx8dbmVXaybBrurYqMi6pDqf645JLeIzddEBJUZ2mfLQSp9rb
 TSlVdC9wpMpNq0tXdLW0/1Se4j0Jygt5DIlkAcp7LA==
X-ME-Sender: <xms:Q3y2YsqQK9fWpnpHZx4kcJZ_EbnuGXAl7oIGmPC5vn3JKr_Lqsfkhw>
 <xme:Q3y2Yio-0K90oAIRUZKr8bpFzumf08na_bhzlAPJc2PrbPmXeCEc0qt799Wag29XE
 XgSgw58fRfq8tLVpkk>
X-ME-Received: <xmr:Q3y2YhOMnKWSe_lZH1SB-b4ObWEzBDwzFFXdF0kix8BJJzLsVfEHez2IO3hnhuCKNfixJDFZ4PGlvRO122m5x-iHBwFbgAjc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
 ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Q3y2Yj4i6AnqIX6oYB5icM8UkpZNtToOXovNhN2uEt_h2cYFEcE2dA>
 <xmx:Q3y2Yr4MBli_KfZ3cbdxcVjlhDDOPngUBD5zrSWAH_wt3792OymwkA>
 <xmx:Q3y2Yji9FO7EkHHr0SXf_TBfEHabEeC2x3K6M8dTs3aFcSz0NQRW-Q>
 <xmx:RXy2YtmR8phc_Gzj2_jwncCAnb4nRseBWi8x2Cq9syq7L7rYd-z2hg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 23:08:50 -0400 (EDT)
Date: Sat, 25 Jun 2022 12:08:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Quirks for MacroSilicon MS2100/MS2106
Message-ID: <YrZ8QDN5jobAq7jk@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.de>,
 John Veness <john-linux@pelago.org.uk>, alsa-devel@alsa-project.org,
 Hector Martin <marcan@marcan.st>
References: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
 <878rpnncov.wl-tiwai@suse.de>
 <fac65634-a702-84c4-da8d-60e01d309c7c@perex.cz>
 <298967f1-841b-4b39-9a6e-8bf22c49181d@www.fastmail.com>
 <3b6cef6b-674d-339a-7221-c72d54805bca@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b6cef6b-674d-339a-7221-c72d54805bca@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Hector Martin <marcan@marcan.st>, John Veness <john-linux@pelago.org.uk>
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

On Thu, Jun 23, 2022 at 10:51:18AM +0200, Jaroslav Kysela wrote:
> On 23. 06. 22 10:24, Takashi Sakamoto wrote:
> > Hi,
> > 
> > On Thu, Jun 23, 2022, at 16:18, Jaroslav Kysela wrote:
> > > On 23. 06. 22 7:58, Takashi Iwai wrote:
> > > 
> > > > > Even with this patch, there is a remaining problem, which is not present
> > > > > in the MS2109. The sound sample values range from 0x0000 to 0x7fff, with
> > > > > silence around 0x4000, i.e. 15-bit-ish audio. This actually sounds OK to
> > > > > the ear (although half as loud as it should be), but looks odd when
> > > > > looking at the waveform, and makes volume meters always think the sound
> > > > > is very loud.
> > > > > 
> > > > > To convert to s16le, I can bitshift one bit left, and subtract 32768.
> > > > > I'm told that this isn't something that can or should be done in the
> > > > > kernel, but should be in userspace. Any more advice on how to fix this
> > > > > remaining quirk would be very welcome.
> > > > 
> > > > Ouch, this is painful.  We haven't had any devices that require a
> > > > 15 bit unsigned format, and maybe we don't want to add it to the
> > > > common standard format just for one funky device, either.  Such data
> > > > processing could be done in alsa-lib, but for the proper interaction
> > > > with the user-space, the kernel should provide some information so
> > > > that user-space can process the data accordingly.  However, we have no
> > > > proper way defined for it generically, so far.
> > > > 
> > > > Maybe an easy way would be to create an alsa-lib external plugin, and
> > > > apply it per device.  Jaroslav, could it be done via UCM?
> > > 
> > > I agree that we may start with a special plugin for this format. The UCM can
> > > use any alsa-lib configuration now. So PA/PW should work with this very
> > > specific hardware when properly configured.
> > > 
> > > Note that we have SNDRV_PCM_FORMAT_SPECIAL for such cases. It will imply that
> > > the applications will fail when the special conversion plugin is not used. The
> > > minor issue may be with the silence routines (which is already with the
> > > improper format).
> > 
> > I think the combination of format/subformat is available in the case.
> > 
> > Actually the odd frame format is within 16 bit slot, so SNDRV_PCM_FORMAT_U16
> > or so is available. Then we can define new subformat to notify userspace; e.g.
> > SNDRV_PCM_SUBFORMAT_MODEL_SPECIFIC.
> > 
> > The cons is that we need to add new subformat, thus update asound.h. On the
> > other hand, the pros is that existent userspace stuffs still handle the odd format
> > and user can hear playback sound at least even if the loudness is not expected.
> 
> It's a question if the cutted half-wave samples should be sent to D/A in
> this case. Also, if the high-bit (U16) is set, the resulting sample value
> for D/A is completely incorrect. It's not only about loudness.

Indeed. I overlooked in the report... Even if receiving 16 bit sample from
userspace, the device seems not to generate better sound. The conversion is
required for listening anyway.

> My opinion is to not use the U16 sample format for this and handle this
> hw as special one until the format is more common (which I do not expect)
> to extend the format list.

If it's left-justified or right-padding case, msbits parameter shall be
available, but the case is not. If avoiding new entry for format
definitions (the rest is 12 entries in kernel API), it seems to be
inevitable to use SPECIAL format since hardware parameter doesn't deliver
explicit information about effective bits (=width) inner sample slot
(=physical width) for left-padding case.


Regards

Takashi Sakamoto
