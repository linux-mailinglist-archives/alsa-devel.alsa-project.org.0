Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE286F800
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:39:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B7FB1723;
	Mon, 22 Jul 2019 05:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B7FB1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766750;
	bh=MYq9P+WFPC2mqyYuo0SZ1iV6nJXdK/73m+qG6bz5gU4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qz7I9xvaEGX2ovnm0Bp6lx+UeyHqSCTnHsCqYGuaS5JFXtZojT86eGqzRRRwCnVH8
	 HJJRmhe7ZvfxiJ9gjOQMr7Pwezs9Ju9dw/mESyUJX/yCX4zOIl8YcwrkhqabV6i420
	 O+FfaSoPRsrUEF+MmFTMtF1p9ogRaESAAJytHWw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 640C0F80482;
	Mon, 22 Jul 2019 05:37:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AEC5F8015B; Mon, 22 Jul 2019 05:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5E28F803D1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E28F803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ftNZ4mii"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R7RlyTYs"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id ECD2621F14;
 Sun, 21 Jul 2019 23:37:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=8r04a7CIwBaTewBPfglQkIJ3ly
 BJ73Z0ozdSf3OBtDo=; b=ftNZ4miiBAwuhhUJP5RK4D6uz2LBmrjgwMR2te+Tun
 8n8nRVI1gXKkhhh9/nUHaJ27uy0yDKIXQ2UwUp4N3j/2LjEcQdkuY+wbG5ktXGZD
 fuJIta/85drylToji+bGcRvmgFnQU+8clDLz8EagTJDAKuI4bIfoKOZ0fSsLTbY5
 EpQtkYUEY4YmSThmtDy3JBEOH/dQW3AwsCLnDlFWLBkNC3Ocf13FtaposH+d6Ahz
 J1UMC138SdCd9S4wUW64GDcP86ZismN6EWa7fUX5p+m02gSM0ZEw77UnAtOuWdOH
 1jaiMb81B31Io6mcQ34W+OO8AdyzClyPoLJg/oES41nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8r04a7CIwBaTewBPf
 glQkIJ3lyBJ73Z0ozdSf3OBtDo=; b=R7RlyTYsUK8jurCoKR1/gyh/nS90w6zDj
 xcSCNC3rWygHY+827fpuepTuDlCNu1k23hhoNwcLeCHdHX+P5VM8T/thN7zmMPQW
 CThw8IT0cRaOZyhGfFnMARYqT4qrd9frH6MciPIc9RL/Vu3+u8EcAfW8f9AL2Qk/
 5gLgYSjjAhaf5N0gtIxL6sq53xmaeJE2T4ihyM9GYu1Sh0TGE86bq7HCHDoUP2RH
 QBYcFPx5lrVPer+CklmUcwMhQWZ2HfeirsjnvRRbhDRxHT4hj6O4TFLcZ3Q90zgJ
 XkSNr6jCFpi2h6+it5dDMkfbIWlIHCpkN2+CridUO4obwK/nXCWzQ==
X-ME-Sender: <xms:ay81XVzPIHjxCoe3ZaW1l7Q5iJUKMwPfUEX3zCLkTRGGFEQJEpumiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
 grlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepudegrdefrdejhedrudekudenucfr
 rghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ay81XScnxWRxDZ_uLDJM5VV9nbM6VY0mttOjkPZ05jO89c9YYQvLZA>
 <xmx:ay81XX4DFoiKbkuRHIdMwf96e5G_zDz1DWmRX3tTUFJA9gnyDVIHTw>
 <xmx:ay81XXJO5u5EbNha1by67blUBr8_plQKIFN02g9-zwUN-sYrroPGcQ>
 <xmx:bC81XRyG8tgGhfe-BZKS9pE7i2G0HZ3FJMieGDlkGVcu7Xb7hy4Prg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77A5F80059;
 Sun, 21 Jul 2019 23:37:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:50 +0900
Message-Id: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/20] ALSA: firewire-lib: use packet
	descriptor to represent sequence of packet
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

This patchset is for Linux kernel v5.4.

In current implementation of ALSA IEC 61883-1/6 packet streaming
engine, one callback of isochronous context consists three steps
to process an isochronous packet:

Callback of isochronous context
 - For each of packets
  1.parse context header and decide the amount of PCM frames
  2.process data blocks (in each unit driver)
  3.queue packet

The result of step 1 affects the rest, thus the above steps can be
changed for below process:

Callback of isochronous context
 1.parse context header and decide the amount of PCM frames
  - For each of packets
 2.process data blocks (in each unit driver)
  - For each of packets
 3.queue packet
  - For each of packets

Especially it's convenient to decide the amount of PCM frames
multiplexed into each packet as batch calculation before processing
payloads of these packets.  Additionally it allows each unit driver
to process data blocks for these packet by one call.

This patchset uses list of 'struct pkt_desc' as an intermediate
representation of packet parameters between these three steps.


Here, I note my future plan for ALSA firewire stack for your motivation
to review this patchset:

 * v5.4
  * Handle several IT/IR context in one callback of IT context. This
    idea will introduce AMDTP domain structure with relationship of IRQ
    master/slave between the IT/IR contexts.
  * As a result, both of playback/capture PCM substreams run on the
    same hardware interrupt. Thus the drivers just support batch PCM
    operation and irq-based programming model[1].
 * v5.5
  * Some (p.s. not all) supported devices don't follow packet sequences
    transferred by the drivers. They require clock recovery in driver
    side to reduce playback noise.  Enhance the AMDTP domain structure
    to have clock recovery target and fill list of 'struct pkt_desc'
    according to the result of clock recovery.

My work for libhinoko[2] allows me to sniff actual packet transmission
between devices and drivers in Windows/Mac OS for long period (e.g. 1
hour). Then I can classify some cases and some devices for the
requirement of clock recovery.

(I note that no specification describes this mechanism as long as I know.
In the specification, clock recovery is one-way from transmitter to
receivers, thus recovered clock is not necessarily used for transmission
from the receiver to the transmitter.)

[1] https://git.alsa-project.org/?p=alsa-utils.git;a=blob;f=axfer/axfer-transfer.1;hb=HEAD#l675
[2] https://github.com/takaswie/libhinoko

Takashi Sakamoto (20):
  ALSA: firewire-lib: obsolete ctx_data.tx.first_dbc with
    CIP_UNALIGHED_DBC flag
  ALSA: firewire-lib: pass data block count as an argument to
    tracepoints event
  ALSA: firewire-lib: pass data block counter to data block processing
    layer
  ALSA: firewire-lib: operate data block counter in top level of
    processing for IT context
  ALSA: firewire-lib: operate data block counter in top level of
    processing for IR context
  ALSA: firewire-lib: add syt_override member for some protocols
  ALSA: firewire-lib: pass no syt information to data block processing
    layer
  ALSA: firewire-lib: add list of packet descriptor
  ALSA: firewire-lib: use packet descriptor for IT context
  ALSA: firewire-lib: use packet descriptor for IR context
  ALSA: firewire-lib: code refactoring to process PCM substream
  ALSA: firewire-lib: code refactoring to process context payloads
  ALSA: firewire-lib: pass packet descriptor to data block processing
    layer
  ALSA: firewire-lib: code refactoring for AM824 data block processing
    layer
  ALSA: firewire-digi00x: code refactoring for DOT data block processing
    layer
  ALSA: firewire-tascam: code refactoring for TASCAM data block
    processing layer
  ALSA: firewire-motu: code refactoring for MOTU data block processing
    layer
  ALSA: fireface: code refactoring for FF data block processing layer
  ALSA: firewire-lib: process payload of isoc context according to
    packet descriptors
  ALSA: firewire-motu: more code refactoring for MOTU data block
    processing layer

 sound/firewire/amdtp-am824.c                | 134 ++++++----
 sound/firewire/amdtp-stream-trace.h         |   6 +-
 sound/firewire/amdtp-stream.c               | 264 ++++++++++++--------
 sound/firewire/amdtp-stream.h               |  27 +-
 sound/firewire/digi00x/amdtp-dot.c          | 112 +++++----
 sound/firewire/fireface/amdtp-ff.c          | 105 ++++----
 sound/firewire/fireworks/fireworks_stream.c |   2 +-
 sound/firewire/motu/amdtp-motu.c            | 155 ++++++++----
 sound/firewire/tascam/amdtp-tascam.c        | 115 +++++----
 9 files changed, 570 insertions(+), 350 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
