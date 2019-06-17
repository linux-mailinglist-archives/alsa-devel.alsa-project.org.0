Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31647BF7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9382169D;
	Mon, 17 Jun 2019 10:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9382169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759471;
	bh=jXP5PIG8JxTUNBQo3kgFefmx4UhpBTO9BZcLaxDukiI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fzsUQ81iBG2rNcUtkt45BKc2OFEV8vz7WXLZpFrQAnCsPJE6j98Ji1dX1FIHxCrQX
	 yoz/lMUbmBDfsjchJgOyloiCuzGH+5xTUWoOso/YWNLGADqL949tO5bF/E7iD0uzqW
	 Jn86SvsyaNbArWLXRmoJHFv32YPZbOIlZy57Lccg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC44F89729;
	Mon, 17 Jun 2019 10:15:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4E03F80764; Mon, 17 Jun 2019 10:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73194F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73194F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="id0Ck0WD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EmwPgR39"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C59AE726;
 Mon, 17 Jun 2019 04:15:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=vJPccN25+Y6Hx43jMaaLKaCJM4
 Tcu4WocHDep//DTS4=; b=id0Ck0WDcCTlxze2fRm/PjVfWj6zAE7FRFHNwbISUw
 QHb6sHZlbauj987/aZWEHfkJfBttNjj7NDaEYgPfgKMQAqNHsxPj4Die9ChDYsww
 03KWbyN0bKX8b0kvIiiVsR26y92HxvCtdkjP7Nxcg6GPkDzcWOsSlOMpjtyzWzqV
 LqiVmoLVECghOIvY24fAN7RwC8mo8jRHbih2MKQXgtnkZhIPb3boDqZ4fSiu0HOx
 54FwNWRoy2DObuMnTMSIN15xhen59uo6/ExUHBDzLCgSBgu3N1qhKm9RfjMjI1jx
 WXYb6w4706ZlD/KlzhPriDIr24nejJ6O7PazB7wpeQ1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vJPccN25+Y6Hx43jM
 aaLKaCJM4Tcu4WocHDep//DTS4=; b=EmwPgR39OOP/iRP28ALmei2Dn3Mp4AYV6
 /qc10qKqaSpsnuaheIi1Bubeg7D1bxkCCeS4Yndi0NeBTCDPcMaYSvyL+jPHvRJ+
 hEs3W9xjPD1iU4h2r/MyC4uCnLe/9Ma6HylylHMWMXMeUSkVM/jN8fSQ4YFmwFjU
 QJ3RfyVjc4ObjGZSrHDBdbsMCSeQps3RbPd43+ZCA1cebre+Xky1BtbGPdXl3w9u
 ehqTJflY7XALks/HYjjHVRWEAYpIqH3r+uapBt6bGs79I51MLC748O99HiyVG8LA
 7IEzrgU3j8CP+3aew99n3e/RfQAtdAqUwIf+aYh2cNEeEhVbGcdhQ==
X-ME-Sender: <xms:E0wHXTPQJcePMSP_CpXD455La0r5iCFS5_LOrGpl2b9mDcW2GcIQfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvg
 gtthdrohhrghenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:E0wHXQvEdRUmuY4OU1I22VStiM45ASnMsJJwoYpo2n4EgOCkpisu6Q>
 <xmx:E0wHXfL1xsjWuWzUY0WrPtRRhyaz4edtxQPHvzaCuvKyIpcZwF_00Q>
 <xmx:E0wHXfPUxNFypCnWiZaEYMakk32BKPop8VYABMakTCFUqivZAZdchg>
 <xmx:FEwHXeuYr53DjFqGM7JLx8HXumtewtEEtOWJ2zxK7fuqtCvjr1YpJw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13A1E8005C;
 Mon, 17 Jun 2019 04:15:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:00 +0900
Message-Id: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/10] ALSA: firewire-motu: reserve/release
	isochronous resources in pcm.hw_params/hw_free callbacks
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

This patchset is the last part of patches for all of drivers in ALSA
firewire stack to reserve/release isochronous resources in
pcm.hw_params/hw_free callbacks, like the other patchsets:

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150118.html
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150863.html

In current implementation, the resources are reserved at the same time
to start packet streaming, and released at the same time to stop packet
streaming. However, once allocated, the resources are available
independent of lifetime of each of packet streaming.

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

Takashi Sakamoto (10):
  ALSA: firewire-motu: unify the count of subscriber for packet
    streaming
  ALSA: firewire-motu: unify midi callback function
  ALSA: firewire-motu: add helper function to keep isochronous resources
  ALSA: firewire-motu: code refactoring for condition to stop streaming
  ALSA: firewire-motu: rename helper functions to begin/finish streaming
    session
  ALSA: firewire-motu: minor code refactoring to stop isochronous
    context
  ALSA: firewire-motu: code refactoring to finish streaming session
  ALSA: firewire-motu: reserve/release isochronous resources in
    pcm.hw_params/hw_free callbacks
  ALSA: firewire-motu: update isochronous resources when starting packet
    streaming after bus-reset
  ALSA: firewire-motu: code refactoring for pcm.hw_params/hw_free
    callbacks

 sound/firewire/motu/motu-midi.c   |  59 ++-------
 sound/firewire/motu/motu-pcm.c    |  62 +++------
 sound/firewire/motu/motu-stream.c | 203 +++++++++++++++---------------
 sound/firewire/motu/motu.h        |   7 +-
 4 files changed, 135 insertions(+), 196 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
