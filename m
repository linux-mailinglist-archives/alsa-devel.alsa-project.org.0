Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157E42EB24
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4B36169C;
	Fri, 15 Oct 2021 10:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4B36169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285403;
	bh=Jvc+22ZY0TA1VGqWSMzc9BsbvhYxppSN2rWi61+uWtc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wlp8do1FiFxwtZTpR3TkfiCSOVeIJBKyRHnfx3+byh/gpWaXX8L/VNeY7qiSzwlZC
	 09kJO6GUsZmnt1kxxVG/Sll7oJw4tBQ8DoaFM0n9f/mIajDP+o6hHhPC2jvbE7QMbG
	 77ZXe9AMuVTyN0G5eyricBRViDpoX7PPDLDKx1G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45B3DF804AC;
	Fri, 15 Oct 2021 10:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0718F80167; Fri, 15 Oct 2021 10:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BBD3F80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BBD3F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="fhYAwwfl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AqJG1ga7"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AE30D320187F;
 Fri, 15 Oct 2021 04:08:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 15 Oct 2021 04:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=s3enFpKZMQOIaI3WImuLtitYVE
 QLgGSHOnh2hAoqY/E=; b=fhYAwwflUwIG9TiibfXpEWZ66e95olrRpij99Vjxtf
 EiaNkXyN7jNVEh6SMqbVnk5hOueOxfvh0cHj6eTcEmhqB2lOKQ1i7I8siN9lx/Fn
 a73m3BU7JE0MYBrRblfi9IHQAsy+mUGSn3gg+p0WzdkIAlNkIHb8fax1poSzB04/
 C3KLPmpSFCC9Nhk4NUKBw/5SDc86/tWMpMabCTy7ZbyC2EldoPd5O6JLaR1bMTjv
 oTp+PBqcOfuDElFLLV0BPRsN+Bz8q4ZuP+QCzbOzUxeq+WKm63ZKtWwzvUDAP+hS
 HyIWrdUw4zw7CAnYyuYoN0ycC74/TomaDASIVslS/2Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s3enFpKZMQOIaI3WI
 muLtitYVEQLgGSHOnh2hAoqY/E=; b=AqJG1ga75t6fZRvZcFkhfzaVKhKxWydPA
 Ywk+KJhTqPhbKebRZgZSq0OFDiOFguUSdBHajG53R2dxeEX/PwSZQZL367+7nHby
 h6j7Lp9KOeoXy9ynFkfXkAYjoPzxoAnP+Ab5toTjy5gSl39BB5c1WmZbw1wH9jeK
 jgFAFNRJgP1/xmAY9guCHHXGOSwqtjT5Ekoniz+My1bFAW9oRN6HXClcECQyA+eL
 gVjlW5vViLjemwTgGH7Rg58y3wkH/av2FJ1dy08bkXcNqHOnqcgNOVB0RylhbkTI
 aQ7S0/cYsQZiYrdMJ1/y5GsMd8BdCOkKzA+0i1LA+SUtfps0ost2g==
X-ME-Sender: <xms:_zZpYWQTEtljWLydYhg5Mwd3LIrLslz_msys_vTT8zhfFUZhDQPHGA>
 <xme:_zZpYbw1RIp1_4VUL3_RLsDcHNW6_F1l3F0q2BqKTLRujtYp7wv2cDbII0AuyHuXc
 LVzQ44Rl2SDL4F8FAo>
X-ME-Received: <xmr:_zZpYT0hArCz2dlH-QPItVKK5iuH5K3r9KeQ3jzcdzkU-Qy9gqZnqZKxRHoz5it3UjGOdjx68PZA_45-hIfghEi14umsH7Ny5YxmW0ktdx8MRx59wZOD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtne
 cuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtkefgtd
 euieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmoh
 gttghhihdrjhhp
X-ME-Proxy: <xmx:_zZpYSBh5KkwH1IZZLCf5Zy5nPnoP-5Ej4k_z4KNoH0Q6SAs-4uu1Q>
 <xmx:_zZpYfjeQwuJOoYV--z20zs8ntCEitxVqyc9UduGgaWhTqLI2np8xw>
 <xmx:_zZpYepbv-Ny5E2lrfzP-9Y37KdH1bZIjONyDheT4seGzljLbBvOHQ>
 <xmx:ADdpYSvT3pkFHPnIXNVvBV8FqyZELAAfOCT-gCQab5paYPbFmgn3EA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:30 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 00/11] ALSA: firewire-motu: add ioctl commands to retrieve
 information in messages delivered by isoc packet
Date: Fri, 15 Oct 2021 17:08:15 +0900
Message-Id: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The purpose of this patchset is to add message parser to ALSA
firewire-motu driver so that userspace applications can read information
in message delivered by isochronous packet as well as PCM frames.
The message includes information about hardware meter and user action
over hardware component such as knob, and MIDI message bytes.

Models in MOTU FireWire series can be categorized to 4 groups in regard
of message mechanism:

Group 1. 828 and 896
 * quadlet message to registered destination address
Group 2. 828mk2, 896hd, Traveler, 8 pre, Ultralite, 4 pre, and Audio Express
 * quadlet message to registered destination address
 * message delivered by isochronous packet
Group 3. 828mk3, 896mk3, Ultralite mk3, Traveler mk3, and Track 16
 * quadlet message to registered destination address
 * message delivered by isochronous packet
 * block message to registered destination address, including command
Group 4. V3HD/V4HD
 * quadlet message to registered destination address
 * block message to registered destination address

The patchset is for message delivered by isochronous packet in group 2
and 3. In Group 2, the message includes information of hardware meter,
information of user action over hardware component. The model in Group
2 is called as 'register DSP' in the patchset since parameters of DSP
can be configured by asynchronous transaction for register access. In
Group 3, the message includes information of hardware meter only. The
model in Group 3 is called as 'command DSP' since software and device
communicate with commands transferred by asynchronous transaction in
regard of DSP parameters. Two types of message parser is going to be
added so that the driver caches images for the information. The cache
is available for userspace application by ioctl commands newly introduced.

I note that no control element is added for the hardware meters and user
actions. It's expected for userspace application to retrieve and parse the
information of image then operate for user-defined control element set.

Takashi Sakamoto (11):
  ALSA: firewire-motu: add message parser to gather meter information in
    register DSP model
  ALSA: firewire-motu: add message parser for meter information in
    command DSP model
  ALSA: firewire-motu: add ioctl command to read cached hardware meter
  ALSA: firewire-motu: parse messages for mixer source parameters in
    register-DSP model
  ALSA: firewire-motu: parse messages for mixer output parameters in
    register DSP model
  ALSA: firewire-motu: parse messages for output parameters in register
    DSP model
  ALSA: firewire-motu: parse messages for line input parameters in
    register DSP model
  ALSA: firewire-motu: parse messages for input parameters in register
    DSP model
  ALSA: firewire-motu: add ioctl command to read cached DSP parameters
  ALSA: firewire-motu: queue event for parameter change in register DSP
    model
  ALSA: firewire-motu: notify event for parameter change in register DSP
    model

 include/uapi/sound/firewire.h                 | 141 ++++++
 sound/firewire/motu/Makefile                  |   3 +-
 sound/firewire/motu/amdtp-motu.c              |   9 +
 .../motu/motu-command-dsp-message-parser.c    | 178 ++++++++
 sound/firewire/motu/motu-hwdep.c              | 113 ++++-
 sound/firewire/motu/motu-protocol-v2.c        |  14 +-
 sound/firewire/motu/motu-protocol-v3.c        |  14 +-
 .../motu/motu-register-dsp-message-parser.c   | 416 ++++++++++++++++++
 sound/firewire/motu/motu-stream.c             |  10 +
 sound/firewire/motu/motu.c                    |  10 +
 sound/firewire/motu/motu.h                    |  23 +
 11 files changed, 911 insertions(+), 20 deletions(-)
 create mode 100644 sound/firewire/motu/motu-command-dsp-message-parser.c
 create mode 100644 sound/firewire/motu/motu-register-dsp-message-parser.c

-- 
2.30.2

