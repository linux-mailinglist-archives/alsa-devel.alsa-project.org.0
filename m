Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B124719E7
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 12:52:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 517FD1EE1;
	Sun, 12 Dec 2021 12:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 517FD1EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639309955;
	bh=sC7VsgMdvpbJMADn51kt37v6U3U/BBXjmz9LT1TTAa4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXM6F8jwuIvaScYDpz5VQ8RBm4uDusVavDs56M/pSARBrUB5gGOLE11wx4koVdEJ8
	 zhhcSL24FXTWg7T6goa7BZ0ydL5ryFuR30J1orAjrI2f4krjKwhydYRduRQK2Pk9du
	 Bcd29r5R7ITXwzfi94AaDyxh4YTkfrgGNeRahZ/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9A3F80161;
	Sun, 12 Dec 2021 12:51:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D88F80246; Sun, 12 Dec 2021 12:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9CABF80161
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 12:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CABF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mIJX827A"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YVl98n/u"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 788725C009F;
 Sun, 12 Dec 2021 06:51:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 12 Dec 2021 06:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EycX5ym0EnPa7yW4BE7A5SkjPPj
 OyXeH61CZajHpRBA=; b=mIJX827AGJY0zCvGGvi6eZM01R4F4DhvrQbyl7idkjK
 mLN9TGhvfebEwVZg5BZgJv7spE6FHba79Tu+ASe9GXA6etXtYIr0lIRIYy/fhKrC
 s/V0YOPxJcoLe1H5LPWv8FjHGps8IZhQMEucYty+a1JhhG9vkjlL2l87eBu66qE+
 lbeYfN6WuFYauEVqr4IetPH1B4Y8FNu1xz7s9YkEftU7J44K9aGkUu9owkK3fXXB
 C6VSGqux3S/LkiQacPvs16r6FdrdFb085w6AbGKDsxVeYcFnc7Rc1t0MiofS0XeI
 fLoMBwoOPjoR9TYaFpd3D4ZgshOBMeLaw7cSfksFtcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EycX5y
 m0EnPa7yW4BE7A5SkjPPjOyXeH61CZajHpRBA=; b=YVl98n/u3Cv2e7gbMRn7NE
 pn0J8rskhOtJSmnt8KoT8FMveQhBq9DroqBsvyrozojR+0UVjL/9BvXwDOQVG3Ll
 fGNus+mAfL69aQ7PiaGNyiKAcVAMJBHFlXHM2Wn1XYQKSfPwtJx8+yHhNOCSwIJ8
 vr8kox9a5l5Rsb3L0t0IAekSSW1EJgiGd9j/hoSoEFGd3R9LsdjLSbmA6CfG+IOr
 8Z+QeSbhyGIHxMCosiw0cR8/Ly4lHsFtw3esu73pzOCOKn+bgR2ZjW8CNL0UZCCE
 IZsjVoB0nmYe1mbmRHvVZo4L3Aw9Mrdf2bEhazdjSQIC9CnVgAzqrSfYYZHavasQ
 ==
X-ME-Sender: <xms:OeK1YXNLKRDqIosPJkAWQb_WcxpHXhXF7vkP-V8bX_yOodJV8B53oQ>
 <xme:OeK1YR-OWIuQniTLQcJxywObdySxiAzUTorO4kiAFSg_y88BM7c7OZQkjyxaHnJ9E
 w96Yy-Ufama0cw7Aeg>
X-ME-Received: <xmr:OeK1YWS1WMI7PvgsrpM-lpk5Oqg3SotHKbpGPzirNYmdzZM8oPPp-E0jgrsHT_grVaPNL34FczcboHfKtM6tsJu0bS0RnAJQFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeigdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepjeegieefueevueefieeggeejledvgfejgeffjefgvdek
 leehgfdtfeetjeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:OeK1Ybt_0KcK0GfaZOrC0RD0aiLnZp-9GNWmOiasiBLWsqzfo8AgWw>
 <xmx:OeK1YfcoMO0ZsRgtWPQR8wZwAjweAvFJaKlu6V63TF7pNrfB0sjq0w>
 <xmx:OeK1YX336bhY-gkX-eUCpc2jEX29e1BjaHQPfM1N-lbWjzZpEkDU7g>
 <xmx:OeK1Yfma2aGAF0pVn2XZiIs5REcGdUIy-O_Jdwe_dCn7vLAPGhsIFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Dec 2021 06:51:20 -0500 (EST)
Date: Sun, 12 Dec 2021 20:51:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Marios Sioutis <smarios@jaist.ac.jp>
Subject: Re: S24LE and S32LE format equivalency
Message-ID: <YbXiNdYIp99Df47Q@workstation>
Mail-Followup-To: Marios Sioutis <smarios@jaist.ac.jp>,
 alsa <alsa-devel@alsa-project.org>
References: <2a4907ee-96d2-9969-de47-80b77b7444d1@jaist.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a4907ee-96d2-9969-de47-80b77b7444d1@jaist.ac.jp>
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

Hi,

On Sun, Dec 12, 2021 at 08:16:57PM +0900, Marios Sioutis wrote:
> Hi all,
> 
> Quick question, I was troubleshooting a 24bit USB device and got down the
> rabbit hole of sample formats. The device advertises itself as S24LE (4byte
> payload) but it appears as S32LE under alsa, something that bothered me a
> lot initially. However, If the conversion between the two formats is to just
> << 8 i.e. put a zero byte as LSB, then the two formats are essentially
> equivalent.
> 
> Is this actually the case? If yes, who performs the conversion? Is it on the
> alsa side, or the device already adds a zero byte LSB?
> 
> Thank you in advance,
> 
> Marios
 
I think the format of sample is 'left-justified' or 'right-padding' 24
bit in 32 bit frame. For the case, in ALSA PCM interface, [S|U]32 sample format is
used with 'msbits' hardware parameter. The snd-ua101 USB driver might be
an good example for the case.

 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/usb/misc/ua101.c#n615

In detail, please refer to my previous patch:

 * https://lore.kernel.org/alsa-devel/20210529033353.21641-1-o-takashi@sakamocchi.jp/

Unfortunately, as long as I know, no userspace application evaluates the
msbits parameter with sample format, however in theory the conversion
should be done in userspace in advance of transmission of audio data
frame.


Regards

Takashi Sakamoto
