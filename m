Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EF1ECD2E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 12:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA5A166C;
	Wed,  3 Jun 2020 12:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA5A166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591178873;
	bh=4wqy7BF0TiKf5z1F2cgsAbdf+enUzDBhORTj+vKhdXk=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sPiP44Yr+wLbhrWKIJiqI0A3+k4VW43DDbW5BY2brcCC8QtTNeNwbEd3zLARDqFr7
	 sKoSvNl0A3rro9xjSwLGn6k5Dfg81aAhmysJQC/bimqqNHPNx51FejAUOYaObZqn1u
	 fkJAdGaZ51NIT4hkB8rbyPSg3ZdBJ6xNllAthJjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4D0F801EC;
	Wed,  3 Jun 2020 12:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD67F801ED; Wed,  3 Jun 2020 12:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91714F8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 12:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91714F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="RircBCGe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="t7yU29N0"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A3CF5C00EB;
 Wed,  3 Jun 2020 06:06:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 03 Jun 2020 06:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm1; bh=4wqy7BF0TiKf5z1F2cgsAbdf+enUzDBhORTj+vKhdXk=; b=RircB
 CGeV58I6QiaFphruThpv9qgfzOQ9pBtrqn/xnq7XQ9W0Zdx107GxBRHgm/0TgJQQ
 be+6wsimLvCf7b2zD++FLZjC4r22CHQTy2XSIhzasQDBFHGI4/2oi5shYWzzp6ZX
 KfUPKBO3JraWUOtXyGUM3HThXfckHdOxy7jhHkNMdM3bJUUmXcV/gB/dbnNC2Lvj
 brJWYj3FbwZPX0Dq4Y1UOIXoiFGXmWuKqf6Y2/7Ozeq9lJiQsn9Sv5wEJQ/88bYy
 9e73BG2GXOQknqeSUrcunpBi3YNK7pbGiOWKskGPpvljuVrd6WCBbSStR4Gm9p7O
 L59P3Mo0krAY8L+nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=4wqy7BF0TiKf5z1F2cgsAbdf+enUz
 DBhORTj+vKhdXk=; b=t7yU29N05OSCRj8Q9haqKamxtkOXjR2YDJN6jnd8B8UMl
 5mrkEHWJ1PqHiILNlicrBpqGpQpAawzKFyvBFqAT4Jcb2V/zt+kvqJya+sNcftsm
 vzI8Z+YnkTZdYBQQqgaVxn5f3r6XzZvJnZW8P5WNbwLe8QuOsSttLm3GiUOV1Bg8
 0w0Gr3nnb/Dd4D6m2N1bSyL7icca0WwE4Xt4HTrQAMqCWwhm6I1AlXg0wpIHZ3eI
 EcmvKt4lniK8Kw/0CVHYVpYRnVOrnMBEL9FA9dksP5ICiN9o7SNakRZ3QMBN/LQ3
 1dCLpzFNPhtBn9zigNJraDocn/OGhCg2dNK18cUEQ==
X-ME-Sender: <xms:B3bXXisSrTBbqwjLh2LnL1VE5NPXkXmVK2vBxSKT3Btt19_jeCRr9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefledgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgedvjedtkeejge
 ejudfhteeluedugeeujeeigfefvefhffehleffgffggfdvleevnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhdprghlshgrqdhprhhojhgvtghtrdhorhhgpdhlihhnuhigrghuug
 hiohdrohhrghenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjph
X-ME-Proxy: <xmx:B3bXXnd6nYlsrax4IHI5A_b5C2MiikR_vW8w7ZTwI3V5xwXw1FPq-Q>
 <xmx:B3bXXtxmKCNtrkRWLayxQQqYrwVMsVZ4vCT6GZxFEYNym6StoyQAow>
 <xmx:B3bXXtPfUCSvpNjAHDHJ62gcQoVREnT4S-VL38vjMcrKjRLrEfkePA>
 <xmx:CHbXXlJ3H6allFiN2Hh6zIRN7Gfcwl1CA5UaxlhVMong2rxzSXNxqA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 62D683280059;
 Wed,  3 Jun 2020 06:05:58 -0400 (EDT)
Date: Wed, 3 Jun 2020 19:05:56 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org
Subject: ALSA control service in user space
Message-ID: <20200603100556.GA198303@workstation>
Mail-Followup-To: alsa-devel@alsa-project.org, guy@guysherman.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: guy@guysherman.com
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

Today I released hinawa-rs[1], Rust bindings to libhinawa v2.0[2].

Aug 2018 I sent a message[3] about new releases of libhinawa/hinawa-utils.
In the releases, I used Python 3 to write tools for audio and music units
on IEEE 1394 bus, supported by ALSA firewire stack. The attempt is
successful to make my understandings further about vendor-dependent
protocols.

Earlier the message, Nov 2016 I had a presentation about ALSA device
control service in user space[4]. The idea requires server program to
perform some tasks below in user space:

 * register control element set into ALSA control core for existent card instance
 * dispatch control event from ALSA control applications
 * communicate with device to operate its functions such as volume control
 * dispatch any event from the device.

The registered control element set can be handled transparently by ALSA
control applications such as amixer. When the application operates the
added control element, events are delivered to the server program. Then
the server program communicates with the device for the operation.

Now instead of Python 3, I select Rust language to write the server
programs for audio and music units on IEEE 1394 bus. The hinawa-rs helps
the third and fourth of the above tasks.

For the first and second task, I wrote some libraries in alsa-gobject
project[5]. The demonstration by Python 3 is public[6]. I already write
alsa-gobject-rs which includes Rust bindings for the libraries. It's not
public yet since I make no official releases of alsa-gobject itself.

At the same time, I already write the prototype of server programs itself
and it works well in my local. The code base already reaches 28,000 lines
even if it supports the limited number of devices. I realized again that
it was a better decision not to implement them in kernel land.


As IEEE 1394 bus becomes legacy, the audio and music units is outdated.
One of my motivation to continue the development is the idea of control
service in use space itself since the idea is also available for USB Audio
as well.

When developers work for devices with vendor-dependent protocol, the idea
helps the developer because user space applications can communicate with
the device via USB character device. For example, I recently saw an attempt
by Guy Sherman for US-4x4 Utils[7]. As a quick glance to his repository[8],
vendor-dependent command is used to operate the device. For this kind of
work, the idea is available as well to produce transparent control element
set.


Anyway I'm going to make official release of alsa-gobject as a next step
toward the idea.

[1] https://github.com/takaswie/hinawa-rs
[2] https://github.com/takaswie/libhinawa
[3] https://www.alsa-project.org/pipermail/alsa-devel/2018-August/139448.html
[4] https://github.com/takaswie/presentations/blob/master/20161101/content.md
[5] https://github.com/alsa-project/alsa-gobject
[6] 'self.open(card_id)' should be 'self.open(card_id, 0)' now
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/159339.html
[7] https://lists.linuxaudio.org/archives/linux-audio-dev/2020-May/037774.html
[8] https://github.com/guysherman/tascam-util

Regards

Takashi Sakamoto
