Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7279D471A6F
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 14:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95A31947;
	Sun, 12 Dec 2021 14:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95A31947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639316518;
	bh=jIhD7I3a4PINlLRCV74qW9t0guiElzNIGac1VliGnMY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCXW1U7Ojko0+IJARY9jQAHvJoYKXgzRfaEHth9pOO12mmTTnjg1yjf/evgxX7YvC
	 WwLZqMHbksgCmUhYR3v7mfdBbO3F2qsouQanq7wPcC507A+DIyaSK0rdK9uvai5Y5T
	 1Lp3QtO/8qhtm3e7Glx+eBxmnyJ6vqWcocz/m/Wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC42F80249;
	Sun, 12 Dec 2021 14:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CA9F80246; Sun, 12 Dec 2021 14:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 833BFF80161
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 14:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 833BFF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cVLUAM69"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ETFBbngK"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5487A5C013A;
 Sun, 12 Dec 2021 08:40:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 12 Dec 2021 08:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=sCXB+ZwtwUnbkWWv2m+irTKAvGm
 NImex8UOoDjOcu28=; b=cVLUAM69yvng1NMvVCgY0fV3EXPU2IIp1W3f9/5ly0L
 Asgk57O9A/ujvIse++jGud8we9J6AabzAvV0tbUfGftfpiVwP96rkQGBcAHVfdDP
 2fFnB+AZMmPbgR5O+XMm4wA3GCJZmo1/bb0jP0dq9sJRdF27jRdX9JEZu2vGpbEl
 Mvf8UKxoanRVs2JgLJ5tblwdEcA3SAG7u5EkA5ykgSQCwu80QXfzkBL6Vec2L9hQ
 S2/vzHmtNZN1/wM8C04zBKaWCp6NhMD0g0t0CRTuvjMdi6MKNhZ9MZUesNapioU9
 TV5gxBNFAIkZICy26djhi9LciWT7tTIvXFvXvntMI7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sCXB+Z
 wtwUnbkWWv2m+irTKAvGmNImex8UOoDjOcu28=; b=ETFBbngKerlqwltUbuxFf0
 I1VjwfzBp7pbjRAD8ySknicr6bZDgeMBSW1IglGZo5BBbPsBS2zHyGLMqMk7G1pT
 1HE8IVdwGNzuQygDxdHyCtpNEqnvuhBbHai9PhNAW7764tkcZaf1bFi5ygFxZDIl
 lZocFGMMb6NiLRiIhhjYoHZQhkKgPh4M92lGWd9qIeeAfZEXVhJstVVME3zUXGFK
 +lR0fBHeiCc9ZNXwrT2VLXnfq6QsmHkljQkyZsds7x1zm0X19GejTCIzgdN8g9R4
 N2RePV+9xAH8AJWPTbAP1247sQh6WjNXyvp8V8zUBlVYJQop4/Ny7ZWhb5TkDkhg
 ==
X-ME-Sender: <xms:0_u1Yb_Umn0uux_rFe6GtLx_r7m7gXa2Dy9AWrVIv9j0EoQnS0LYQA>
 <xme:0_u1YXtLGqDvLHx-lwjPOZAejKBW9nB3gwPL_gyckxsOOE2HhKr81rE0Cep1rW3_d
 NbCUd_GGDo1oaEv8-0>
X-ME-Received: <xmr:0_u1YZD9xgFYmoHTrbBd_eq8Lykds-i0af4LSSdkURRyYIDRPupsmgcJjchSB80C-Yv7iXerpgX_Fm1mwHcSL6CmzIeelsA7dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeigdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepjeegieefueevueefieeggeejledvgfejgeffjefgvdek
 leehgfdtfeetjeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:0_u1YXfCLG8hBtLpPeELhyGEyPRXWYaMAUonpy4TzDlHjmmj5EM1fA>
 <xmx:0_u1YQN7vUB5reBLaaer0SfkWWunNwlh_VV2-W-kSf1YW7y8M9RGBw>
 <xmx:0_u1YZmu3E6F7uxK2VK_SDjScFBEVEv1J0t4vZ-XJvrQUlmEzl-abA>
 <xmx:1Pu1YaU8QBA01qIbP2LubVrk_8j0sZM06n9t7G5U4F426mg1p39v1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Dec 2021 08:40:34 -0500 (EST)
Date: Sun, 12 Dec 2021 22:40:32 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Marios Sioutis <smarios@jaist.ac.jp>
Subject: Re: S24LE and S32LE format equivalency
Message-ID: <YbX70Lsvi2wby5eR@workstation>
Mail-Followup-To: Marios Sioutis <smarios@jaist.ac.jp>,
 alsa <alsa-devel@alsa-project.org>
References: <2a4907ee-96d2-9969-de47-80b77b7444d1@jaist.ac.jp>
 <YbXiNdYIp99Df47Q@workstation>
 <2b54cb06-0c26-86d5-6249-180700e212c2@jaist.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b54cb06-0c26-86d5-6249-180700e212c2@jaist.ac.jp>
Cc: alsa <alsa-devel@alsa-project.org>
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

On Sun, Dec 12, 2021 at 10:03:32PM +0900, Marios Sioutis wrote:
> Takashi,
> 
> Thanks for taking the time to answer.
> 
> On 12/12/21 20:51, Takashi Sakamoto wrote:
> > Hi,
> > 
> > On Sun, Dec 12, 2021 at 08:16:57PM +0900, Marios Sioutis wrote:
> > > Hi all,
> > > 
> > > Quick question, I was troubleshooting a 24bit USB device and got down the
> > > rabbit hole of sample formats. The device advertises itself as S24LE (4byte
> > > payload) but it appears as S32LE under alsa, something that bothered me a
> > > lot initially. However, If the conversion between the two formats is to just
> > > << 8 i.e. put a zero byte as LSB, then the two formats are essentially
> > > equivalent.
> > > 
> > > Is this actually the case? If yes, who performs the conversion? Is it on the
> > > alsa side, or the device already adds a zero byte LSB?
> > > 
> > > Thank you in advance,
> > > 
> > > Marios
> > I think the format of sample is 'left-justified' or 'right-padding' 24
> > bit in 32 bit frame. For the case, in ALSA PCM interface, [S|U]32 sample format is
> > used with 'msbits' hardware parameter. The snd-ua101 USB driver might be
> > an good example for the case.
> > 
> >   * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/usb/misc/ua101.c#n615
> > 
> > In detail, please refer to my previous patch:
> > 
> >   * https://lore.kernel.org/alsa-devel/20210529033353.21641-1-o-takashi@sakamocchi.jp/
> 
> A left-justified format, with USB being a LSB first protocol would mean that
> an S24LE device would send a sample as:
> 
> (LSB) oooooooo oooooooo oooooooo xxxxxxxx(MSB)
> 
> x = zeroes, garbage, who knows! (trailing bits)
> 
> o = actual payload.
> 
> I was wondering how these trailing x bits are treated and I looked up the
> USB specification for the Audio Data Formats. Section 2.2.2. states:
> 
> "AudioStreaming endpoints must be constructed in such a way that a valid
> transfer can take place as long
> as the reported audio subframe size (bSubframeSize) is respected during
> transmission. If the reported bits
> per sample (bBitResolution) do not correspond with the number of significant
> bits actually used during
> transfer, the device will either discard trailing significant bits
> ([actual_bits_per_sample] >
> bBitResolution) or interpret trailing zeros as significant bits
> ([actual_bits_per_sample] <
> bBitResolution)."
> 
> That is, in our case the trailing x bits should be discarded. I had a
> problem that could be explained if these trailing x bits *weren't*
> discarded, but I'm sure alsa is doing the correct thing here, or else pretty
> much every 24bit device in existence would be broken.
> 
> This is good enough for me. Unless there's a serious mistake in anything
> said above, consider my question answered.
> 
> Thank you for your time!

In your case, the format of sample is correctly [S|U]24 since it's LSB
first protocol. (The explanation in my previous message is aligned to host
endian.)

In regard of 'snd-usb-audio' implementation, the audio data frame
from/to URB for device is just copied to/from memory area shared with
userspace application. (see retire_capture_urb() and prepare_playback_urb()
in sound/usb/pcm.c.) So userspace application is responsible for the
invalidation of bits in MSB of audio sample.

But in ALSA usb audio stack, there are some drivers. So you may find a
driver to invalidate the bits voluntarily, perhaps.


Regards

Takashi Sakamoto
