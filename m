Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61837440C9C
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Oct 2021 04:22:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6576169D;
	Sun, 31 Oct 2021 04:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6576169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635650542;
	bh=aWnnIeACiUFcDnjqKuAyWL8NnsPlp3gi1TGmG/IlI2Y=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DVs/tV1b+xBXAh/RR7KbnaoWe5S2z9Vq0XJQiF0owCCmC3XHRv3uI/9x9iErnSEPl
	 Kq3j1Z8HRLVMP5tVvsesqxxWfjhmfeoF7YkaPHGvsXdUu6bbCDQRIyZOrkwr0iQ+jH
	 HRgKGENgpWQWJVWB4z2ySBztlcxRWq5mQmllNhS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1285FF8025D;
	Sun, 31 Oct 2021 04:21:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4F1F80229; Sun, 31 Oct 2021 04:21:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEED0F800F8
 for <alsa-devel@alsa-project.org>; Sun, 31 Oct 2021 04:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEED0F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ioyuR009"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hcGhuoAh"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E390F3200A16;
 Sat, 30 Oct 2021 23:20:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 30 Oct 2021 23:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm3; bh=yk5st+WdKR/R36NFA6mC70oIQ31voQc5iqQDZ8NnuSg=; b=ioyuR
 009O8Hf2cjprxFUacz7UdeC947vVUqJrzYHjn1dTt2Ver+3nwqDQD/ef2pV0VjGE
 FInLt1TbWjiR7tb0wyaebWVOACKwR7ln66v8vPEeJjM2dRIU2u4AyWG6gllOniAE
 B2t+78uxBnEfadX0MIRTRwr9uo1sjUruwk/Fqg9SEO7e7HxbIbXylS1l6fLXKts/
 1M0KMDpw96ZZiVISkSUyVICqkM+LgIxBFk2MPhoCptpTs2iEf4mFqxRzNZab2Cpb
 AN6JcaMrtucynWqf57VM/Ypk/HpjdLWqoTtk8TgK+ueRYd0xtlVlEsNQZRd4bMr7
 7HrEdQnqMJRurKtyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=yk5st+WdKR/R36NFA6mC70oIQ31vo
 Qc5iqQDZ8NnuSg=; b=hcGhuoAhrtNgw/4Rm8/7rsUiQXQLzolyWomKWPIu9GllV
 62ywMGxwEM8rTjWMr1JkndTemjr1Ue197KbVfgVCK8SFcK9Qrlz/fBH91QtGDv+H
 2BbQfYHgwJtmZSKm15gDGVZcYmXg8NXvpf93LWzB00x8HGQL9QqF3EVRYaVds4sK
 /58hfmvGJ6TNRH6VrlNOzLbQCM9rI/34tkPLDL/QorR1HckC9cNzNMie+OY+dyqP
 YKjZA3M3A6Ebpn2/XnM7Fo0Y6g3qwnGPmOVtFvdmqrfev08BlnPoqzyXVv61RsrG
 1rwTHgit4MBqY6VKxk5JfG3bs5BBR8NCNcF4Xj/5Q==
X-ME-Sender: <xms:iwt-YSpAlGViYDSDZqcJUxMuDSeBvxGTFiB8VsFTQX1G_PyjJ8wcmw>
 <xme:iwt-YQoqc0x80CtGonyh_du75Gzf4p-Pc0bpHwGJwoWiB0TpWjBylLKVdsCTpnc_o
 cgk8oUIVcFzXnkVBsA>
X-ME-Received: <xmr:iwt-YXM6ZmlC_4IWEElnigjMZ2bYW5ki3zk2GNH--z2BdmNmPxGM-cd2LFwkd4euibPhcpWExh964gZab_GPEDZGCaWYfmLKOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegkedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepleevveetffffhf
 ehvdevkedugfeikeevgedtleffuefgleejvdevuddtuddvudelnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhdprghrtg
 hhihhvvgdrohhrghdpfhhfrgguohdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhp
X-ME-Proxy: <xmx:iwt-YR6h8ZnZ_sFmWYWgEOxZ0U_BaRGeIRN40SC36SvmalrHaQYcXA>
 <xmx:iwt-YR5SjmrEb_TQAFnXEfJPgI5cVik6ezP56MgnH545qsVydYsGnQ>
 <xmx:iwt-YRiH7nS1z5gtGql5vTB-qBbg6OqKLlWsw7Oe3wv1ukhmnJFxSg>
 <xmx:jAt-YTRy5PG0GN17rhtWgMBqIYQ6VJc69cXJrd3jToCN1TxAv7JDJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Oct 2021 23:20:41 -0400 (EDT)
Date: Sun, 31 Oct 2021 12:20:39 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux-audio-dev@lists.linuxaudio.org, ffado-devel@lists.sourceforge.net
Subject: RFT: implementation for MOTU FireWire series including CueMix DSP
 and CueMix FX
Message-ID: <YX4Lh3JQMAqpDjKh@workstation>
Mail-Followup-To: linux-audio-dev@lists.linuxaudio.org,
 ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

RFT: implementation of MOTU FireWire series CueMix DSP and CueMix FX

Hi all,

After investigation for protocols of MOTU FireWire series including
features of CueMix DSP and CueMix FX, I've written implementation
corresponding to the features in snd-firewire-ctl-services project[1].
If you are enough interested in it, would you please test the
implementation?

The first aim of this test request is to check whether the protocol
implementation works as well out of my development environment.


# Disclaimer

 * The aim of the work is to reveal relevant protocols so adequately and
   write the implementation. It is out of my scope to produce user-friendly
   applications such as GUI with cool user-delighted look and feel. (This
   is also the reason that the message is so long for general users.)


# Acknowledgment

When I made investigation plan for the protocols and evaluated the result
of investigation, documents included in ffado source code[13] is helpful.
The documentation includes a part of the result, while some parts are
newly revealed in this time. I appreciate for document writers.


# Current status

 * Below models are supported and I tested
  * 828
  * 896
  * 828mk2
  * 896hd
  * 8 pre
  * Ultralite
  * 4 pre
  * Audio Express
  * 828mk3 (FireWire only/Hybrid)
  * Ultralite mk3 (FireWire only/Hybrid)
 * The most of control functions are available via ALSA control interface
 * Hardware metering support
 * Interaction support between on-board control component such as knob,
   utilizing notification mechanism of ALSA control interface


# Requirements

For the test, you need to solve long list of requirements since the
protocol implementation is new and lays down user space as well as kernel
space. I'm sorry for testers to discourage your motivation, but they are
required...

 * Linux kernel v5.13 or later
  * a commit 66c6d1ef86ff ('ALSA: control: Add memory consumption limit to
    user controls')[2] is required since many user-defined control element
    sets are used.
 * Installation of backport codes for ALSA firewire stack
  * They comes from Linux kernel v5.16 prepatch (not released yet).
  * Please follow to instructions in my remote repository[3]
 * Installation of alsa-gobject v0.2.1 or later.
  * alsa-gobject project[4] provides libraries which perform as glue for
    several kind of language bindings to use UAPI of Linux sound subsystem.
    For detail, please refer to release announcement[5].
 * Installation of libhinawa topic branch
  * libhinawa project[6] also provides library as glue for UAPI of ALSA
    firewire stack.
  * The topic branch (topic/motu-mixer-ioctl)[7] includes new APIs to use
    functions added in the kernel v5.16 prepatch.
 * Rust v1.51 or later
  * I use Rust programming language for the protocol implementation in user
    space side.
 * Build topic branch of snd-firewire-ctl-services
  * snd-firewire-ctl-services project[8] includes the series of
    implementation for protocols specific to ASICs/Vendors/Models.
    Additionally, as reference of service programs, it includes runtime
    implementation based on ALSA control interface and ALSA Sequencer
    interface.
  * The topic branch ('topic/motu-mixer-ioctl') includes implementation
    for the test.


# Test procedure

When the above requirements are satisfied, the service program can be build
by below command line. It takes a bit long than compiling with C language
since Rust compiler does more work than C (mainly due to type inference and
lifetime check for safe runtime).

 $ cargo build -p snd-firewire-ctl-services

The service program for MOTU FireWire series runs by below command line:

 $ cargo run --bin snd-firewire-motu-ctl-service CARD_ID

The CARD_ID is the numeric ID of sound card corresponding to your device.
You need to load ALSA firewire-motu driver in advance:

 $ sudo modprobe snd-firewire-motu
 $ cat /proc/asound/cards
   ...
     2 [UltraLiteMk3   ]: FW-MOTU - UltraLiteMk3
                          MOTU UltraLiteMk3 (version:100800), GUID ...

In the above example, CARD_ID should be 2.

When the service program runs, you can see control elements via ALSA
control interface. You can operate them by usual tools of ALSA control
application, but I prefer 'qashctl' in 'qastools' project[11].

Due to specification of protocols defined by MOTU, notifications from the
device for some controls are firstly available when isochronous packets
are transmitted by the device. Please run any of ALSA PCM applications
when testing.

The aim of the request is whether the service program can be built and run
out of my development environment. So I don't expect you so much. However,
If you are interested, please check the other parts about which I concern:

 * The range of value for each control is valid or not.
 * Inverse evaluation of each control with boolean value.
 * The lack of control which should be produced by the service program.


# Filing issues

 * Please use issue service in github.com[10].
 * Preferable issues
  * The service program aborts when I operate control A.
  * The service program doesn't interact with on-board operation B.
  * The service program looks to be frozen when I operate C.
  * The behaviour of control element D is odd.
 * Unexpected issues
  * Why device A is not supported
    * It's preferable for you to take your time to cooperate with me if you
      wish. It might take a long time since the implementation lays down
      user space and kernel space.
    * If so, please file the issue to my remote repository for kernel
      prepatch[12].
  * Why we have no GUI with cool look and feel
    * It's your work. The GUI application might be an ALSA control
      application which interacts with the service program.
  * I can not get which control value corresponds to actual ports
    * It is restriction under current design of ALSA control interface.
      We need to work for any extension to the design.
  * The name of control B is not user-friendly.
    * The name of controls are not fixed yet since we have few name
      convention for controls in studio-use equipments. It might
      corresponds to discussion in ALSA upstream. In my opinion,
      Linux audio developers have been enough lazy to the issue for
      recent decade.


[1] https://github.com/alsa-project/snd-firewire-ctl-services/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=66c6d1ef86ff
[3] https://github.com/takaswie/snd-firewire-improve
[4] https://github.com/alsa-project/alsa-gobject/
[5] https://lore.kernel.org/alsa-devel/20200623093239.GA68404@workstation/
[6[ https://github.com/alsa-project/libhinawa
[7] https://github.com/alsa-project/libhinawa/tree/topic/motu-mixer-ioctl
[8] https://github.com/alsa-project/snd-firewire-ctl-services/
[9] https://github.com/alsa-project/snd-firewire-ctl-services/tree/topic/motu-mixer-ioctl
[10] https://github.com/alsa-project/snd-firewire-ctl-services/issues
[11] https://gitlab.com/sebholt/qastools
[12] https://github.com/takaswie/snd-firewire-improve/issues
[13] https://web.archive.org/web/20110704073441/http://subversion.ffado.org/browser/trunk/libffado/doc


Cheers

Takashi Sakamoto
