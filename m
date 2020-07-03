Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6E2136C0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20CAC16D0;
	Fri,  3 Jul 2020 10:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20CAC16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593766527;
	bh=HhL0o4STHt8OHBXAvCEAT7WrW9EvheOrrHoDkqwVVck=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJzXef0AGGuQnX03n/YjxCjHXtVSG3evJkVzselIz7cC56btRXm6TwnqcJu3muMZ0
	 pVOuMc7dbqWETrI+DiQACrlYaf8SAczbQwsIJFHxPSw7c5MNm1O+9v2M0awlx3mOKb
	 Bm0AGaH0MCFhxFDaoVu4rIsjoWmSwXZbDGlKxVKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33E49F800ED;
	Fri,  3 Jul 2020 10:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B678F80217; Fri,  3 Jul 2020 10:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FBD5F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FBD5F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jn1Mx3/k"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LHT5900W"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CBE155C00ED;
 Fri,  3 Jul 2020 04:53:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 03 Jul 2020 04:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uHgd0mDoSpHi0pAzw4hCQfrvxmy
 EwnmIvy/IMccId7g=; b=jn1Mx3/kuRVCXTJhdjEZTD2OyyLs9gLk0aXTudWUgYY
 HFY/+CpeN1bA9h0W1sFmDYYnWTVnKd6X/fFKY8fxf6eQtKw2Zeui5u6As/wXdCbb
 jA8LmgImB9yKwHnPJo1I2iz2e9NMmmKoM2mn5VniPpC4WOpb/rlcpLlaTsDRg6KM
 FFSHh/DS5m8BMQbttixWrD2MQTpiiA0Q8rBajQ7L8gQordPIZRCyashG0aTPGpTU
 D+VdcHx3Bx3ZawxtsNxr2/97lZcaLFcTKr5e/VtTR9le/w0VIdGobecyvcHyfKWN
 +n2LcfdJqwU61eP4oO/zfMII3oi7xIZg74c63BsKDKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uHgd0m
 DoSpHi0pAzw4hCQfrvxmyEwnmIvy/IMccId7g=; b=LHT5900WooklzabXIP+IKU
 4AXweqD9cm+LSw5NAFuLwC3DTlcMusyo4GBYqjWxS/pLpbpPfL8+OERblbd9vxD/
 WsfdIoZuvsHE2Ugbmlk8CyWwkWUbQPQTyZzp/QjZBeLqezZxbqWDmFXbWhwrZOAr
 oH5kDoJJTiacyN6+P7J1qlIgdHhk5yHsfaiup4uei3R+ndPI0VMFc6mRo1W8VcmI
 sQmUAej37ekJ41ZzRGQss8GKLiJdf0/Rh+3SepBSipMW6a76ZKpREyuIYMBcn+8r
 XCMsCowLeQAOEVFqdMmm5Tx/2ZLQFhFoqXl1bc6eVeln9tBro5KtXXhKmtKuPRrw
 ==
X-ME-Sender: <xms:EfL-Xu6Tyh0MfhNHm9_tAJEDb6wHS09p_ivs27dZvmAs7E6JbSFFUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepleefleeikeeiieevtdfffeeiheefhfdufeeiieffhfet
 ffefheefvdevuddugfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 ektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:EfL-Xn7shrsMc0SxK8fKgdbQDHwuFmZM8MGArlZ0CObK9eBG3HTOxg>
 <xmx:EfL-Xtc9dFAyJ9lkKhTd8PZDJMqqvEcUl1pIwOCAgTTKdS8i3JDp4w>
 <xmx:EfL-XrLqJGowRgiDg3SIWvd5duO7Mw53d40h8oSaMbvJmuPLl0dqxw>
 <xmx:EfL-XnVOtGji-DqOrAngQ6bKk9gT_8NMh_YOeGUysCV5KCBLc6XYhQ>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70FE83060057;
 Fri,  3 Jul 2020 04:53:36 -0400 (EDT)
Date: Fri, 3 Jul 2020 17:53:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Tanjeff Moos <tanjeff@cccmz.de>
Subject: Re: How to identify Alsa eLements?
Message-ID: <20200703085334.GA9425@workstation>
Mail-Followup-To: Tanjeff Moos <tanjeff@cccmz.de>, alsa-devel@alsa-project.org
References: <3e46d988-d2f7-b06d-76e8-c8def2e870d1@cccmz.de>
 <20200703003420.GA349540@workstation>
 <00efd9d1-8eef-fb06-d9bf-867ca37e2e74@cccmz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00efd9d1-8eef-fb06-d9bf-867ca37e2e74@cccmz.de>
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

On Fri, Jul 03, 2020 at 08:16:26AM +0200, Tanjeff Moos wrote:
> > Anyway, when using alsa-lib application for the purpose, you should pay
> > enough attention to which API is used since alsa-lib includes several
> > abstractions of API for control element set in each level:
> > 
> >   * Lower abstraction (snd_ctl_xxx)
> >   * Higher abstraction (snd_hctl_xxx)
> >   * Setup control interface (snd_sctl_xxx)
> >   * Mixer interface (snd_mixer_xxx)
> >     * Simple Mixer interface (snd_mixer_selem_xxx)
>
> I find this quite confusing. If I could change a volume control using any of
> those interfaces, then I don't understand when to use which interface. I'm
> sure that there is good reasoning for each of them, but unfortunatly the
> documentation has very little information about these concepts.
 
So do I. I can imagine that the toughness of work to design good
abstraction for the control feature...

> Anyway, I will stick to the lower abstraction which serves my needs. In the
> worst case I will do more work than necessary ;-)
> 
> > The configuration space of alsa-lib affects Setup control interface
> > and Mixer interface. On the other hand, it doesn't affect the
> > lower/higher abstraction. The amixer is a kind of application to use
> > 'snd_hctl_xxx', 'snd_mixer_xxx', and 'snd_mixer_selem_xxx'.
> 
> So the controls offered by CTL/HCTL are determined by the driver? And SCTL,
> MIXER and MIXER_SELEM are influenced by user space config files?
 
Yes, as long as I know.

HCTL abstraction nearly equals to 'CTL + cache mechanism for control elements +
event notification callback'. However in some cases of addition/removal control
element set from user space[1], it hits assert and aborts programs with
panic.

SCTL/MIXER/MIXER_SELEM features includes extra filter logic for control
elements with the configuration. They're specialized to usual channel of
audio; e.g. stereo, surround sounds. It's functional as long as using usual
sound devices such as stereo speakers. On the other hand, they can handle
just a part of the channels when handling control elements for exceptional
multi-channel of audio for recording equipments. I guess that your case
is the latter.

> > When you'd like to communicate to kernel land implementation without any
> > effects of alsa-lib's configuration space. it's better to use the lower/higher
> > abstractions. As long as I've used, 'qashctl' in QasTools[4] is good GUI
> > application for this purpose. It's written with Qt5 and seems to be helpful
> > for your work in both of GUI programming and control elements handling.
> qashctl is indeed very helpful, thank you! As being said, I'll stick to CTL.
> 
> Thank you very much for your advice!

Quashctl is pretty good tool for the purpose as long as I know. I wish for
someone to develop similar functional tool with CUI or TUI...


[1] for example, below test program can abort pulseaudio when removing
added control element set:
https://github.com/alsa-project/alsa-lib/blob/master/test/user-ctl-element-set.c


Regards

Takashi Sakamoto
