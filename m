Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1113E990C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 10:17:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5641C2334;
	Wed, 30 Oct 2019 10:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5641C2334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572427079;
	bh=qVGGmKgYIun+D3ZsbtJjHAs/jLxESzQ+qXRk+flqtH0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuTQk72YelOKkLP7YDs13j1t6w0c26MhenleeK9S3Sq8eKjrVRPEyU1MwphQhUtif
	 WKtE3YVu3wbUY47UZvLizX8Fd7e/nDl62T9yiTrrOuaCEmJlSaramuwIkcme3MOVYT
	 Z/v2DYHRlf9+SJOHl0a71fBvDaYgII14ZjQCHTzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5304CF80600;
	Wed, 30 Oct 2019 10:15:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA60F805FE; Wed, 30 Oct 2019 10:15:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_18,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB8EBF805FC
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 10:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8EBF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="IrEclKBx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EMLLUTuo"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EEFA521B7C;
 Wed, 30 Oct 2019 05:15:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 05:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eaDArEuFrjWCnsC8l2AijgAajRm
 ikt3s+7F8fYWy1g4=; b=IrEclKBx6aQq2oF88yA8H6PEWQSwqyfex3SPGIxKSYc
 zRt3eGjAukarjiCR8Hj3YJTIe2vjaYE9LoPyZz/gl7OGOYmK37IFU/T/ImjJZv+l
 eqOncrtQB5yjv91ZsueRunVMa3hVUCMRn9ajt9dLRIetAcgoya3PNIJZA13pej4I
 tZ5a0SBAMDkj3kA1Euz5NQgnB81AIidAHcK0jpIfxcfj2DqKPPP3B2vwmmgQOkWl
 LJKmC4dK1Ld1kjE8uuPuD5Nyg39ULWY1cYQCJwHwG2mj1fxs5G2FL0NQ+AEG6JGR
 n1Jhkb+s2uQHIJTDGDa7TG/ljKx1oms96oaOtIirmuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eaDArE
 uFrjWCnsC8l2AijgAajRmikt3s+7F8fYWy1g4=; b=EMLLUTuoscur7endalZsLC
 t4tmj1D0GCocUxPmLsUXnw+/+vcPR12SCCnYYmTpuO44JuoeKnXphDybc2NeYwkz
 8Vj2k2VLE1aDHdk7eoMXejQSSlGACWnBGeZJoTrIMku2O1xhnh18i0shGL+WBo36
 vl2OWAjrsQubz1hY1+z1LXrzbKRsTPzxYCLFNZOCo9e89LNk+qbZrytJ3ByvcdKE
 HuUi9eHLfaUEaZ+1G5KOZlWGTSIpUjYuIUMA9Y3VBa8uFLUUSB40xfKcISjc6QMc
 3xfLDxC52Rr3zmUW7yBs+l7/6ne+7GaC+ngLXPFvlE50BhGA+NtxlE4/wL6EfEXA
 ==
X-ME-Sender: <xms:wFS5XT8g3WYm3ikfJGbhoSegMl5qHR-Qr-KmAUBJyU1pk9HGhaw3Gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudegrdefrdejhedr
 udekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:wFS5XWwhxVTLG61g40hrej28TjlB8IAJHc29zhK9o0pyNipUmLsMrg>
 <xmx:wFS5XZCLu_qz8AeCcnIYSI3h_ITsDUTddDZ-n9C54OCHKfmsfmqvlw>
 <xmx:wFS5XRLZXUqxO-OR-YNDKfi3mVlzhvSx4s6fuAc0aH0lNkg_M_lTxA>
 <xmx:wFS5XY2n2ZL_bdfXmt8jaNK55fthYym9NiMpa5WeMS8E04bnwzrH9A>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4BFD306005B;
 Wed, 30 Oct 2019 05:15:43 -0400 (EDT)
Date: Wed, 30 Oct 2019 18:15:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jean-Paul Argudo <jpa@argudo.org>
Message-ID: <20191030091540.GA1856@workstation>
Mail-Followup-To: Jean-Paul Argudo <jpa@argudo.org>,
 alsa-devel@alsa-project.org
References: <769b9f5dae864cf1eb433ab84eed385a161931c8.camel@argudo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <769b9f5dae864cf1eb433ab84eed385a161931c8.camel@argudo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] snd-bebob : from kernel 4.13 to 5.3.19 and .20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, Oct 30, 2019 at 09:10:38AM +0100, Jean-Paul Argudo wrote:
> Hi there,
> 
> I wrote 1st this here: 
> https://github.com/takaswie/snd-firewire-improve/issues/25
> 
> But I think it was the bad place, sorry for that.
> 
> I think this ML is better?
> 
> My problem in one line:
> 
> I upgraded my Ubuntu Disco (kernel 4.13) to Ubuntu Eoan (kernel 5.3.19)
> and I can report my SaffireLE / Firewire doesnt work anymore, snd-bebob reports "discontinuity of CIP" on dmesg...
> 
> 
> At startup it lights green ok, but no sound is playable, then the
> lights turn orange (like it is when it's not working), I hear a "relay
> sound" (a electric clic of a relay), then, the Saffire LE disapears from the sound menu in Ubuntu sound menu.
> 
> I can see this in dmesg:
> 
> [   19.083583] snd-bebob fw1.0: Detect discontinuity of CIP: 10 50
> [   19.746665] snd-bebob fw1.0: Detect discontinuity of CIP: A0 A8
> [   19.846775] snd-bebob fw1.0: Detect discontinuity of CIP: 70 B0
> [   20.335861] snd-bebob fw1.0: Detect discontinuity of CIP: 90 D0
> [   20.856301] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
> [   21.312770] snd-bebob fw1.0: Detect discontinuity of CIP: 30 70
> [   21.796716] snd-bebob fw1.0: Detect discontinuity of CIP: 00 40
> [   22.347664] snd-bebob fw1.0: Detect discontinuity of CIP: 00 40
> [   22.818247] snd-bebob fw1.0: Detect discontinuity of CIP: A8 E8
> [   23.306079] snd-bebob fw1.0: Detect discontinuity of CIP: 98 D8
> [   29.544652] snd-bebob fw1.0: Detect discontinuity of CIP: 10 50
> [   30.272090] snd-bebob fw1.0: Detect discontinuity of CIP: A8 E8
> [   30.776168] snd-bebob fw1.0: Detect discontinuity of CIP: 00 40
> [   31.268123] snd-bebob fw1.0: Detect discontinuity of CIP: E0 20
> [   31.766085] snd-bebob fw1.0: Detect discontinuity of CIP: E0 20
> [   32.267903] snd-bebob fw1.0: Detect discontinuity of CIP: 88 C8
> [   32.767989] snd-bebob fw1.0: Detect discontinuity of CIP: F8 38
> [   33.263808] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
> [   33.757156] snd-bebob fw1.0: Detect discontinuity of CIP: 08 48
> [   34.258860] snd-bebob fw1.0: Detect discontinuity of CIP: 80 C0
> [   34.755571] snd-bebob fw1.0: Detect discontinuity of CIP: 40 80
> [   35.261252] snd-bebob fw1.0: Detect discontinuity of CIP: 60 A0
> [   35.753980] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
> [   36.253547] snd-bebob fw1.0: Detect discontinuity of CIP: C0 00
> [   36.752500] snd-bebob fw1.0: Detect discontinuity of CIP: 08 48
> [   37.255203] snd-bebob fw1.0: Detect discontinuity of CIP: B0 F0
> [  277.760550] snd-bebob fw1.0: Detect discontinuity of CIP: 40 80
> [  278.488972] snd-bebob fw1.0: Detect discontinuity of CIP: C0 00
> [  278.986290] snd-bebob fw1.0: Detect discontinuity of CIP: E0 20
> [  279.485998] snd-bebob fw1.0: Detect discontinuity of CIP: 18 58
> [  279.983838] snd-bebob fw1.0: Detect discontinuity of CIP: D0 10
> [  280.486776] snd-bebob fw1.0: Detect discontinuity of CIP: C0 00
> [  280.979487] snd-bebob fw1.0: Detect discontinuity of CIP: 30 70
> [  281.480952] snd-bebob fw1.0: Detect discontinuity of CIP: 78 B8
> [  281.975413] snd-bebob fw1.0: Detect discontinuity of CIP: 38 78
> [  282.475487] snd-bebob fw1.0: Detect discontinuity of CIP: 60 A0
> [  282.979446] snd-bebob fw1.0: Detect discontinuity of CIP: 88 C8
> [  283.472403] snd-bebob fw1.0: Detect discontinuity of CIP: 88 C8
> [  283.968484] snd-bebob fw1.0: Detect discontinuity of CIP: 68 A8
> [  284.471585] snd-bebob fw1.0: Detect discontinuity of CIP: 30 70
> [  284.562886] usb 3-4.1: reset high-speed USB device number 5 using
> xhci_hcd
> [  284.965508] snd-bebob fw1.0: Detect discontinuity of CIP: D0 10
> [  285.469348] snd-bebob fw1.0: Detect discontinuity of CIP: 68 A8
> [  285.965174] snd-bebob fw1.0: Detect discontinuity of CIP: 20 60
> [  285.981618] firewire_core 0000:05:01.0: phy config: new root=ffc1,
> gap_count=5
> [  290.103982] firewire_core 0000:05:01.0: phy config: new root=ffc1,
> gap_count=5
> I tried update the kernel with eoan-proposed I know run 5.3.20 and I
> have the same problem (the trace above is made with 5.3.20.
> 
> First, I hope I report this the best way, really not sure here.
 
This list is for this purpose. Thanks for your report and I apologize your inconvenience.

> If not, please tell me what to bring (files? logs?) and where (on this
> list? elsewhere?).
> 
> I have spare time to investigate anything that could help here.

The messages in syslog means that your Focusrite Saffire LE
transfers isochronous packet to your system with discontinued
sequence number.

But subtraction of the counter (e.g. 0x20 and 0x60 in the
last line) always results 0x40. The former(=0x20) is expected
but the isochronous packet includes the latter(=0x60). I think
it's any possible bug of ALSA IEC 61883-1/6 packet streaming
engine and check it. I'll install Eoan kernel and test my devices.
(but I don't have Saffire and Saffire LE...) I'd like you to wait
for my test report.


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
