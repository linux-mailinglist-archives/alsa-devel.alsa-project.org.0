Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793833225C
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662C41682;
	Sun,  2 Jun 2019 09:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662C41682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459700;
	bh=uj61RTtSUgLUC2hWVpkObIgO+NLXJKWviFksATWjwg4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IbMMSGzEyUx8z+uYf9b0G1GlfoN4LtBt7dvmci2rkvuF6ySBt7vXGcV7XeplSqxha
	 QLEXqW3J+pV+FEX6lxmVTWmZhY+k2jl0DyqOD+WEw5088Rcs8yG2f9z/WekbTKVQeY
	 O8EQ4scl/uEdrLCSclahxdcUHmyeyOBJUzM3MmVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BF9F89703;
	Sun,  2 Jun 2019 09:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2659CF896F8; Sun,  2 Jun 2019 09:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B28EF80C06
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B28EF80C06
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hgComBLx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DoRRba7i"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A79A221947;
 Sun,  2 Jun 2019 03:13:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=ciCY3rtjZyI5FQGaulKX69TZth
 mQhGDiiB3mq7cyc3Q=; b=hgComBLxtLtqrcfZqI5JiXF1L4Sjsl9i6/hZy2jHnk
 ZF7pKCYs6RUPF1Oc9C6aPnjNWCtrivMt8TBFCZWxntwQYuDXXuMIcbL9us1OgO0s
 zo9+YxkLQl+4WS7QBajZ8mD/xd2Adv1Kpkl2/p5EmNEFqZ3Z0yD3AfUaO/Cnzlnq
 UAEfE7eSJFvtJaW+PdULIdpuv3df05URoXPuQGG7miycKRfEcT1gBC0gZfgL21iR
 Rx4ZKL3erisK6FYJobmupIOVVbwfauerB1OczfvPxQcMn8vwW39kFzM75QGA2qwN
 ChTq4OFXzO79aDLe4mnYFh2tRg/S1h+I/HkoX7fK15DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ciCY3rtjZyI5FQGau
 lKX69TZthmQhGDiiB3mq7cyc3Q=; b=DoRRba7ixlc9dj2I05sEwe2HlhEwVz20F
 AxTZGb+bjUBTK73Sjap+SxSoZJjng5OWCL0rLqSdGdBv6ta8VTDzP5OvbVGj9t+h
 +O8sLwBPRVcxp1eKIYseeB2qnhlo97PFeqUPzIHwrBqRviCTip2ILH7E7Br3jJeQ
 o2OEba4tBFtFXHaAhuYxC7MFp2zffHOVxFDVrsI4Jkx5FCH2WpnYBAAAM01wAjRf
 uJG8avB9kKTZ7kciiPx/j97RFvZwPfFbswDT17kkwj+ic0BXxhfcdbBLIUj2bC1x
 NCaTPdeTMTOZ/raqSv1AOoAwi4TllT8QH0k7n/hq0zvWToJ+tgKEA==
X-ME-Sender: <xms:AHfzXBUToIWtdvdQjZH0TzyaXvsU8PpWlsOoQiBqcAbuQC_kIuRM1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AHfzXNgT1vyOULMBMjbcCp8QaG4E9z6fG7tV494oKqNKw2IX9tAkow>
 <xmx:AHfzXAegqzUt3y2G80zZ2EMEA3nU_3i0P0S6YBCAVmPJ_eS8nt9Q8A>
 <xmx:AHfzXPscHdQgKQAnVf2PWcGjnWGH0IRkXHOY9R4Rjgu_umdA_UGfEg>
 <xmx:AXfzXL7Zh_3_UPa_YaugSzNjnExqPxOqhk2F37YX92UnkrUJ-Hjpvg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BC288005A;
 Sun,  2 Jun 2019 03:13:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:44 +0900
Message-Id: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/15] ALSA: firewire-tascam/fireface:
	reserve/release isochronous resources in
	pcm.hw_params/hw_free callbacks
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

This patchset is a part of series of patches for all of drivers in
ALSA firewire stack to reserve/release isochronous resources in
pcm.hw_params/hw_free callbacks.

In current implementation, the resources are reserved at the same time
to start packet streaming, and released at the same time to stop packet
streaming. However, once allocated, the resources are available
independent of lifetime of packet streaming.

The isochronous resources are the resources of IEEE 1394 bus. On the
other side of view, it's a kind of resources of hardware to maintain
the bus (isochronous resource manager). For this kind of reservation and
release, hw_params and hw_free operations are suitable in ALSA PCM
interface.

Ideally, the operation to reserve/release isochronous resource should
be separated from the operation to start/stop packet streaming. However,
IEEE 1394 bus has reset event. Once reset occurs, isochronous resource
manager releases allocated resources. The resources should be
reallocated by requesters themselves. For this reason, in this patchset,
bus generation is checked before starting packet streaming. If
generation is updated, reallocation is requested to isochronous
resource manager, then packet streaming starts.

Takashi Sakamoto (15):
  ALSA: firewire-tascam: code refactoring for registration of
    isochronous channels
  ALSA: firewire-tascam: code refactoring for reservation of isochronous
    resources
  ALSA: firewire-tascam: code refactoring for release of isochronous
    resources
  ALSA: firewire-tascam: reserve/release isochronous resources in
    pcm.hw_params/hw_free callbacks
  ALSA: firewire-tascam: update isochronous resources when starting
    packet streaming after bus reset
  ALSA: firewire-tascam: minor code refactoring to finish streaming
    session
  ALSA: firewire-tascam: code refactoring for pcm.hw_params/hw_free
    callbacks
  ALSA: fireface: add protocol-specific operation to allocate
    isochronous resources
  ALSA: fireface: support allocate_resources operation in ff800 protocol
  ALSA: fireface: support allocate_resources operation in ff400 protocol
  ALSA: fireface: support allocate_resources operation in latter
    protocol
  ALSA: fireface: reserve/release isochronous resources in
    pcm.hw_params/hw_free callbacks
  ALSA: fireface: update isochronous resources when starting packet
    streaming after bus-reset
  ALSA: fireface: minor code refactoring to finish streaming session
  ALSA: fireface: code refactoring for pcm.hw_params/hw_free callbacks

 sound/firewire/fireface/ff-pcm.c             |  57 ++---
 sound/firewire/fireface/ff-protocol-former.c | 112 +++++-----
 sound/firewire/fireface/ff-protocol-latter.c | 114 +++++-----
 sound/firewire/fireface/ff-stream.c          |  85 ++++----
 sound/firewire/fireface/ff.h                 |   3 +
 sound/firewire/tascam/tascam-pcm.c           |  59 ++----
 sound/firewire/tascam/tascam-stream.c        | 209 ++++++++++---------
 sound/firewire/tascam/tascam.h               |   2 +
 8 files changed, 306 insertions(+), 335 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
