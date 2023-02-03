Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B19688BE5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 01:35:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04826C0;
	Fri,  3 Feb 2023 01:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04826C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675384548;
	bh=rd2jpbHSBQLXiM0eHy0iWR4fPsO4zdF/vUUs7PxdqBA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OrNhalsRBWuiy4n+7bSMw6RX77TICnUAJx9koEFpIEkk1r5ExZUVoF7AdnJ9wI/sB
	 JRREsufq7Kh9+bYhvA8H+uvlYatUAV1zyb3YfjB2eb2gfiaRPmkKT9whY/aSvb5hUl
	 CRMqTrt2wJg6o5Ua6yndVC8dUZlYZpVp1TO3lk+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B47EBF804DF;
	Fri,  3 Feb 2023 01:34:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B90F804C2; Fri,  3 Feb 2023 01:34:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC063F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 01:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC063F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=qbxz0Jif; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=o+LSMLSE
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D37A5C00A0;
 Thu,  2 Feb 2023 19:34:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 02 Feb 2023 19:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1675384475; x=
 1675470875; bh=ls3QJBMTEbPHVfAcVhN6P9TipGx254UEU47tQcG7ILY=; b=q
 bxz0JifNTE+8ml5CINNSRdTnihPDow5RxeUjVz3EvsyhkWJz2sPSFwq/8xegVHnu
 dkmuSSWRPO+MKC+K9DLS3X2wMcS2v5/4C8ojPYm3i4WQ9Ul9MGo7zdmRFLpiDKU9
 /rJHw8anVVR0BQNsaPFOOLpcN/TA6+bEimbOsd+TWlkiG+dIQ5rwe4vLusPNgd5p
 2lAKLQKDgp90GJcHnZ7AoVZq8JHtz30eCEeTQkJ/34Ap1KC7WavakfPdtbbyD3Fm
 N8/JMrvfiIsy3VETl3GzNmM/EFr972U+EzuFhUgqPESY0bePDC/YsgyggrowH1nW
 ZBMG52AIRR2FPTfCxQzqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675384475; x=
 1675470875; bh=ls3QJBMTEbPHVfAcVhN6P9TipGx254UEU47tQcG7ILY=; b=o
 +LSMLSEm5oY0UoUxgr/C6KypVgQfvHhK76V63kIvJI+EhS+3s2FcM0a9PflCWGjN
 1j9a7K5VujeDYPpCIN3r0qh6RbbUsy7iF6aXvmM1AVyIksh4YxLZVkzqEx37isoI
 HZUL4c8x1m28+N1yHoDZb4bre/PL3OC2YYZPjn3VjuYUcyKmrrtx0VNeTAl2FzbS
 BY75a1o4MGLeGBFbG3MXMedFLJfTskiWGeSYkW3yJsRjfqCFXhiyVkmMSegRrjSd
 mJbf70EToDJC27NbqVCqOaFzFsjkGAPn8/shUTYoLRuNGo+Pd4o5w7lFTZC2/6EK
 PGMzuzs3uqZEk/cpUOW5g==
X-ME-Sender: <xms:mlbcYyl6TSwFsTYrmC9TrOqNe-s1NOLHcg3N9rCh84_32Lq9Qj-Jew>
 <xme:mlbcY531f-xfV7EQYeoTD4svM268_iYcLv9qPcTXfV-ZrCRwbyUmzzFMUkhfRxgEK
 hWlsbbiMMqrIeK_x6E>
X-ME-Received: <xmr:mlbcYwr6QjMEBtvIQJttIjYVqwDxywe_yPFEkttAH6eGJI6SqockZD6bTI5X8l05ih46lGlsQNo5n8Jeew3a6uTMhx1DKHTlqr8G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesth
 ekredttddtudenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepuddthf
 ejhfefkeetkefhudefgfetueetgfdvffejtdehtefhuddufeeghffgtddtnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhih
 esshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:mlbcY2neRHJI6lbX0UR6jsx8wl43aJ2X9zdmMTn9LfigBCdKpsjKBg>
 <xmx:mlbcYw3NNNpJcb_C6qtxlrlAm-9MYfys3pCpxLtY_GcoAYcItsa2jg>
 <xmx:mlbcY9uYlyc3zlgOoG-LfHfHRMJBgvzXJJ9x1By7a4LKCk-oyz_91Q>
 <xmx:m1bcY1-OrbZJv0ELZThgx1f7MuOHgxFIUabpPeEVcagY3EMFWlD9yw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 19:34:33 -0500 (EST)
Date: Fri, 3 Feb 2023 09:34:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Alan Young <consult.awy@gmail.com>
Subject: Re: Overflow in calculating audio timestamp
Message-ID: <Y9xWlbhPg3PteH5G@workstation>
Mail-Followup-To: Alan Young <consult.awy@gmail.com>,
 alsa-devel@alsa-project.org
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

Thank you for the report.

On Thu, Feb 02, 2023 at 01:55:24PM +0000, Alan Young wrote:
> sound/core/pcm_lib.c:update_audio_tstamp() contains the following
> calculation:
> 
>         audio_nsecs = div_u64(audio_frames * 1000000000LL,
>                 runtime->rate);
> 
> This will result in a 64-bit overflow after 4.4 days at 48000 Hz, or 1.1
> days at 192000.
> 
> Are you interested in a patch to improve this?
> 
> The same calculation occurs in a couple of other places.

I'm interested in your patch. Would you please post it C.C.ed to the
list and me?  As you noted, we can see the issue in ALSA PCM core and
Intel HDA stuffs at least.

 * sound/core/pcm_lib.c
 * sound/pci/hda/hda_controller.c
 * sound/soc/intel/skylake/skl-pcm.c

I note that 'NSEC_PER_SEC' macro is available once including
'linux/time.h'. It is better to use instead of the literal.
The macro is defined in 'include/vdso/time64.h'.


As another issue, the value of 'audio_frames' comes from the value of
'struct snd_pcm_runtime.hw_ptr_wrap'. In ALSA PCM core, the value is
increased by the size of PCM buffer every time hw_ptr cross the boundary
of PCM buffer, thus multiples of the size is expected. Nevertheless,
there is no check for overflow within 64 bit storage. In my opinion, the
committer had less care of it since user does not practically playback or
capture PCM substream so long. But the additional check is preferable as
long as it does not break the fallback implementation of audio time stamp.


Regards

Takashi Sakamoto
