Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9493372FF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 13:48:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2847417F5;
	Thu, 11 Mar 2021 13:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2847417F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615466899;
	bh=dT5TaAFLo5TirK9wt+BFuRn8B9fiBCw/vT0UM4LRf3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKbF0xKRYEuhhqG4kTy+Q+C91WWpPf4Y61mY/iCIQ275kMAP/gFHvdrSAjoK82k6k
	 aC+nOodYNLbM2672K/vWIae67S5JOLMCz9LPFonEc4xf55+X+jHwWq50Clipf0R4UE
	 14jiOwg+iJBxMH04N3dbgm3tUVDrKujoe4FqeIos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76062F800BF;
	Thu, 11 Mar 2021 13:46:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCB5AF80227; Thu, 11 Mar 2021 13:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85410F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 13:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85410F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="yGVFMB/9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IZNwGOPf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 980185C00CC;
 Thu, 11 Mar 2021 07:46:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 11 Mar 2021 07:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xePTnJHmwj3N5X5A+67zRGIDCZ1
 v7geJw6JYKkoYtjo=; b=yGVFMB/9nM6fZL4QjWB8kH9bro1X4sBjbnDbDFFvHU2
 9Qla8gu4KPTlR4VDClhPsqdvg+Jeg/9DCIa9FOj9jFyCXzTh/C58V4vtaJa21PWI
 kgK7RTdqu9pHuVMiOwnIFUWNVLyi+l/f6EmTHuSzqARcDu1LdpOmMlsrx4db/yWS
 jtpExB3ahiSnsiKhAVpquLsh6x5L7fxmLELzMb7adY5miZbNIaqprR60SnBdoykn
 4VRGLzI0YgU7Mwi0XBX4diDwSFs5e6DnySS8g3bZfacYtHmPrfNyjFf7irI0jaNV
 WaqOCCZ+mt5Qqt5fLpdfPJfl5RPY4z1kxL0ZOZb/8GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xePTnJ
 Hmwj3N5X5A+67zRGIDCZ1v7geJw6JYKkoYtjo=; b=IZNwGOPfJIomprGEUgvPX+
 onX+ztYDTveFdeLv6mA7RSQv0zuJ6MR9knRZ+Tw5tg00vlGv5B2DOXdXUvY3arNe
 JxOfvNPMUHb/VOVcoa3uzR0ilp72/zfWoWmqS4FxyaHGdqVzqsY8aUfm+iOtlYcn
 Qd2ULIo94Q4NoF/1jjZaU8tVTbJ03VHiDlCyCf2LRZ089Fp0zegphRansXC/x0mC
 LanfcsnVDu/mmXwDnYQuELeQ+V+V99SQyduNZEfSXjLY5DF/sgrfCuWrGAozZS9W
 7LWXvln0hViDrhPt4NbGNI1KJ3AwC2dGEgIJrE19OjqfwzxOtxP243pS0Ia/taNA
 ==
X-ME-Sender: <xms:KBFKYAf2E_2_5jYPPVEIZT_vs9WNkeKzyJ13KmEXrDxfnE_Dd4_Z6Q>
 <xme:KBFKYPXHE8YeOI3hzcmbHBX-BgRR3R6s6GwZNvbQnygn6KpZrDKuw9szSRIIx1h_t
 sGrp6BoYU6G5I2UR1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepheeuueeihf
 evfeehhedukeefffeuveehleeuudeihfffjeeiffeiudffjeeiveffnecuffhomhgrihhn
 pegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepudegrdefrdeihedrudejheenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:KBFKYAib6uvY5bUjJib3NH7UAsrCbkTo10nPybEf2G5b9xe0eIv_4Q>
 <xmx:KBFKYG96xmsYd8RH5o3aDxVRlseQRg9cTdJWoDbuvTDbEOmyER2Xeg>
 <xmx:KBFKYKYcR01UeRh4mIlafOgw0AL9zA4tWmEsQNoOTl9uS-uulVt-Sw>
 <xmx:KBFKYEvFvyMKq8whr_09wMRnAQzTCZs_J3eBy464nEJTzWmj5XvHow>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55C03108005F;
 Thu, 11 Mar 2021 07:46:31 -0500 (EST)
Date: Thu, 11 Mar 2021 21:46:28 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
Message-ID: <20210311124628.GA407735@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
 <20210309003803.GA215306@workstation>
 <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
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

Sorry to be late for reply but I have a bit busy for patchset to test
programs of axfer in alsa-utils[1].

On Tue, Mar 09, 2021 at 01:37:26PM +0100, Jaroslav Kysela wrote:
> Dne 09. 03. 21 v 1:38 Takashi Sakamoto napsal(a):
> > On Mon, Mar 08, 2021 at 03:33:46PM +0100, Jaroslav Kysela wrote:
> >> Dne 08. 03. 21 v 13:58 Takashi Sakamoto napsal(a):
> >>> My concerns are:
> >>>
> >>> 1. evaluation of numid field is not covered.
> >>>
> >>> This is not preferable since ALSA control core implementation covers two
> >>> types of comparison; numid only, and the combination iface, device,
> >>> subdevice, name, and index fields. If the API is produced for general use
> >>> cases, it should correctly handle the numid-only case, in my opinion.
> >>
> >> My motivation was to allow to use this function for qsort() for example. The
> >> numid and full-field comparisons are two very different things.
> >  
> > Yep. I easily associated sort implementation in hcontrol API or simple
> > mixer API from your implementation
> > 
> > However, the new API is a part of control API and it just achieves things without
> > any supplemental information given from userspace implementation.
> 
> It's not required, if documented. Nobody forces to use this function in the
> app code.
>
> > For the above comparison API, as I described, it's not appropriate. ID
> > structure for control element is not comparable, thus it should be dropped
> > or replaced with equality function such as 'snd_ctl_elem_id_equal()'.
> 
> I don't require the numid match at this point. The numid is not known or may
> change for the id entered by the user. So I need to forcefully ignore it.
> 
> If we need a function which follow numid + full id comparison, then we can
> introduce it. I agree that it should return only a boolean return value in
> this case.
> 
> > When you need any sorting algorithms, it should be implemented in
> > application side or alsa-lib API in the other layer such as hcontrol and
> > simple mixer since control API should follow to specification of ALSA
> > control written in kernel land.
> 
> I don't follow your arguments here. The numid and full field comparisons are
> two different things. The caller must know things behind the scene.
> The snd_ctl_elem_id_compare() function may be used as a quick backend for the
> full field comparisons with the optimized execution (reduce app -> library calls).
> 
> The enums conversion to integers: I think that we're safe here. The interface
> enum numbers cannot change and we know the range (and the order), so it's safe.
> 
> Lastly, the qsort() with snd_ctl_id_compare() as an argument will produce a
> consistent, understandable result, right?

Hm. I believe that you agree with the fact that we can make various
algorithms to compare a pair of IDs for control elements. When focusing
on fields except for numid, we can make the other algorithms against your
implementation, since the ID structure is compound one. Each of the
algorithms can return different result.

Here, I'd like to shift the discussion to the name of new API. Although it
has the most common name, 'snd_ctl_id_compare', it just has one of
comparison algorithms. I have a concern that the name can gives wrong idea
to users that the ID structure for control element had design to be able to
be compared by itself and it would just be a single comparison algorithm.

I suggest to rename the new API to express that it implements one of
comparison algorithm. In a case of numid comparison, it would be
'snd_ctl_id_compare_by_numid()'. For your case,
'snd_ctl_id_compare_by_name_arithmetic' or something suitable.


Thanks

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/181947.html

Takashi Sakamoto
