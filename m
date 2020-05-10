Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F61CCA2B
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 12:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DAA950;
	Sun, 10 May 2020 12:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DAA950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589105975;
	bh=VQkqh4nFf489/AqQV+MlhOXkod+xQMxHTn52b840AqU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vcmz52UUh6a/v+oKEjUdg7kYgQOj0Daq5a16KF5bOgXTRt2LBoJneEirTgGySC/PP
	 syxIpEtdv163vYaByflDuj+UkVlRoNVZeYRrsOX5ih4MOYPhnkiC07M9PWfmxFZWL8
	 hc+iunQ6m8WlR+3iBaTQ4WXYjPjx+zvS0ny7CGFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7568F8015A;
	Sun, 10 May 2020 12:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 094ADF80158; Sun, 10 May 2020 12:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E35D7F800BF
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 12:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E35D7F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QQSdq/+p"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XOz4TEcn"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C2A115C00C2;
 Sun, 10 May 2020 06:17:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 06:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Bdy3udu1YdcA8+lNfFPcNW05CKa
 ALoKuSn1TjsRWxJE=; b=QQSdq/+pJaW/Fh0KugYCWIIFklg8t6+RoYjgmzvM0Hk
 z8l8sFw1hbTk/uy9DKNLcRcwCVzzeKiokmREAIeZgPElUIrerxWPTe4UI0mSJpxx
 gLebja6R69V3n90HfhNmFgFvdKA51SexVarnRys5ml1onL3ITbsp3iU2pNDrTSml
 Y0FqL/HA6B6I0wN6T4LjWHzmgIrjNbKhNMoe2Fv6INOqPJOLmd1Q0D9uTyfdqzkF
 R4L/Xz0iXMfEnJ7W4j/B2VuHDqHlF1H036cPw7EVJ+tILevB+kpk0kdPv+nM8gY1
 p3xUtHgVvHSaTCGQXwWoDhymDUQiGP3JFnzk19bQblA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Bdy3ud
 u1YdcA8+lNfFPcNW05CKaALoKuSn1TjsRWxJE=; b=XOz4TEcnPiQ5IlR3bPnB2w
 4GXTxLFDLfBtC+9nCrKeK01mObV2c068XMMxP+xPdVBF4DMEjH3vy5uMrLDv9mBJ
 e+BufMXVx8oPUUt2K13xfwHM4yY2WRdgfblybu3aeLSUx/Tr2bphUinyOVZezruX
 xlcPlLXbK0tDRPYFLz2j3GQxx4rG5xsSKdUb9Mj25hYyuyag13A5MX5Pv6eZL2iz
 L3EYVs+LKG+TLAJVwqKxJnHkXdBgVaFcDFvMJVeAsjG1cP8v8EAV0txnjrC7pjZ6
 kZd226xgXPpoQPkkUg0ju1/KKgpU/UybJiyzYFN/ptqPYvXVLMqJFJMK2Y6NV9Ag
 ==
X-ME-Sender: <xms:ydS3XsWElsWX1l3XDNHZGsf8nDTJuzCZvyt8mWoTvVX4mq35HQNzuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeekgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ydS3XjuIH2sVFnI2XoJb4-TiuF_RW4-tYQg54HP4ek-F5OEsBcBwnQ>
 <xmx:ydS3Xt2UdtVd7ehu8bY5V77-mSYBdV6TbXOS2lNg3dvjoiJgbZSF1Q>
 <xmx:ydS3Xv5uGl50MBBsEHa77v9wWFCMzP1Va0TmDPZ-aYcIPQiMVnx1QA>
 <xmx:ydS3XpiyVwPJq-5nbJ4qYDEKbHapwDNcCBggzC3TclwFA2-2Ei6mcw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id E848E3066260;
 Sun, 10 May 2020 06:17:43 -0400 (EDT)
Date: Sun, 10 May 2020 19:17:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/6] ALSA: fireface: add support for Fireface 802 and UFX
Message-ID: <20200510101741.GA118827@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
References: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
 <s5ho8qwyuih.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ho8qwyuih.wl-tiwai@suse.de>
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

On Sun, May 10, 2020 at 12:05:58PM +0200, Takashi Iwai wrote:
> On Sun, 10 May 2020 09:42:55 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > Fireface 802 was shipped by RME GmbH in 2014. This model is one of latter
> > models of Fireface series and support both of IEEE 1394 bus and USB.
> > Furthermore, it supports two types of remote control unit (Basic
> > Remote and Advanced Remote Control) with by 9pin mini-din connector.
> > 
> > This patchset adds support for this model as a part of devices available
> > by ALSA firewire stack (therefore it's not a device of USB). Userspace
> > applications can transfer PCM frames and MIDI messages via ALSA PCM
> > and Rawmidi interfaces.
> > 
> > Fireface UFX is also supported since its internal design is almost the
> > same as Fireface 802 in a point of packet communication. The support is
> > untested and the status is 'request for test'.
> > 
> > As well as the other models of RME Fireface series, audio output
> > includes periodical hissing noise. This is not solved yet.
> > 
> > Furthermore, capture of MIDI messages requires assist of userspace
> > application. For the detail, please read comment in
> > 'sound/firewire/fireface/ff-protocol-latter.c'.
> > 
> > Regards
> > 
> > Takashi Sakamoto (6):
> >   ALSA: fireface: fix configuration error for nominal sampling transfer
> >     frequency
> >   ALSA: fireface: start IR context immediately
> >   ALSA: fireface: code refactoring to add enumeration constants for
> >     model identification
> >   ALSA: fireface: code refactoring for name of sound card
> >   ALSA: fireface: add support for RME FireFace 802
> >   ALSA: fireface: add support for Fireface UFX (untested)
> 
> Would you like me merging the patches although at least one of them is
> marked untested?  The code changes look reasonable, so I have no
> problem to applying patches themselves to 5.8 branch.

I'd like you to apply them.

For development I have a theory that untested code should not be merged
(yep, as much as possible). However, in the case, I judged that the
untested code might work or slightly work since there seems to be few
differences between 802 and UFX in a view of vendor-dependent protocol
relevant to packet streaming.

(I guess that the only difference is the return value of LATTER_SYNC_STATUS
register; bit-swap case or not.) 

Even if it doesn't work well, it's convenient to me to leave a chance to
get any feedback from the users.


Thanks

Takashi Sakamoto
