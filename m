Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A33CCD6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056321720;
	Tue, 11 Jun 2019 15:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056321720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259439;
	bh=dO5cRjxVVotX8PZhkbgIDUVx8afvRJm/BmmpH5T0ckg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XJLruHUbEK160wEaz7qCXK9Ysg8lPwWyqwTGSr344eOh4mxGmYxGu2gxks3nfNVPz
	 hCy+i9lTuabDw0Z+F5LS/BpMCazPAKNXLtCVt/AkOqaIWkX2EwkEyVW4gFadJAuQtE
	 hjckZcZynrsCuHPIBRsqdXBmkzfwRDS1ix6QjP2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BBFF8972F;
	Tue, 11 Jun 2019 15:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57B37F89711; Tue, 11 Jun 2019 15:21:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2441F806F5
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2441F806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DlCafO3E"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fNe+MSmf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D82E220AF;
 Tue, 11 Jun 2019 09:21:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=P35Uw2r1RlKJecJ4PFyIhmxO2F
 6xCbNUSo96/UMdQ2k=; b=DlCafO3EpUkQBKzdyX3cWg/NiRaU4RAclMTOhxu2Xs
 OdPWSAVYs3mgXdEXl9xYlOJrUBqurvJOcGXy62vwWI2bDBmJG4MDAJhSGamK1HzJ
 dR6XAYiKZ1C4/AQrT/bP+TYBbAaH0o6HFlz6x9oUnpeLpMBHngvJUn6woZIcALU3
 vxCHXLn4TfV1s+EVYOADFDWyr5yZgHrYRPz5OwaQ/B7q3MuUH8wKL/A0xn243zQi
 SRm2zk4fLjk6PeyRtCuW+n9SZ+/wEk9aqV+Rih2D6GJqq3CKmLSt4UcffxbA6g+H
 AllLMbmOdOV40wQbmcvkQkpG1ZHhEDR6Ncs2BPbxxXYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=P35Uw2r1RlKJecJ4P
 FyIhmxO2F6xCbNUSo96/UMdQ2k=; b=fNe+MSmfiSCuwpG30KQFgHPD3KsoD4BfO
 ovyI60cWS/FD8BfXkUqZs7PAcU/oSc4c6sHVTU2otPv6ATrq9CAq5f+K+NmfbRNh
 i2uNS7PmSq3lykdjbvTo40XJkbeR8mhjfMIdIypvkx2SkSBvxAcVv62zKolHUb6N
 RKaXcbpawOLbdou5nph0e1fL56JvYcHc3eRTAcixKiFg4W1ycu7A5PbxSnkyEOCu
 FgjTIux9iIqtWTzcvdTNgOoiEBOiSGOipwF7EbZIqK2cxm9N+ENHX0uXpPFyLfc2
 VKKXk/OJ6f3eXzucDnFZXNAJiVWvpXjPr2YNars5vRkASjNxZfp7A==
X-ME-Sender: <xms:06r_XOS6IzQgh5CHhyFhAqn2M1x9D57N0r8XHHR_0p4Nd24_WF5dOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:06r_XMDFsyLbZVURkfZuYhKd6xRyyCsgK4d-_Dic7lDbFc-yjtfraA>
 <xmx:06r_XJoVoJ6gP0fnSvd6Qq2_IQkOxsW4PDs-rWb9uwUaIJNYWsREAw>
 <xmx:06r_XO_SYigamNCLz93my3vnZX4-4OZc9mC4EfnXAFgyOqBCni2Oig>
 <xmx:1Kr_XKz9smM_th6T7Qxb7JN-z3nJe0IN1UPRDroEk2Rs2NRi5DQh_Q>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id C72BA38008A;
 Tue, 11 Jun 2019 09:21:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:06 +0900
Message-Id: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/12] ALSA: firewire-digi00x/dice:
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

Takashi Sakamoto (12):
  ALSA: firewire-digi00x: refactoring to move timing of registration for
    isochronous channel
  ALSA: firewire-digi00x: code refactoring to finish streaming session
  ALSA: firewire-digi00x: simplify error path to begin streaming session
  ALSA: firewire-digi00x: code refactoring to keep isochronous resources
  ALSA: firewire-digi00x: reserve/release isochronous resources in
    pcm.hw_params/hw_free callbacks
  ALSA: firewire-digi00x: update isochronous resources when starting
    packet streaming after bus-reset
  ALSA: firewire-digi00x: code refactoring for pcm.hw_params/hw_free
    callbacks
  ALSA: dice: code refactoring to stop packet streaming
  ALSA: dice: code refactoring to keep isochronous resources
  ALSA: dice: reserve/release isochronous resources in
    pcm.hw_params/hw_free callbacks
  ALSA: dice: update isochronous resources when starting packet
    streaming after bus-reset
  ALSA: dice: code refactoring for pcm.hw_params/hw_free callbacks

 sound/firewire/dice/dice-midi.c         |  10 +-
 sound/firewire/dice/dice-pcm.c          |  62 ++---
 sound/firewire/dice/dice-stream.c       | 350 +++++++++++++-----------
 sound/firewire/dice/dice.h              |   4 +-
 sound/firewire/digi00x/digi00x-midi.c   |  10 +-
 sound/firewire/digi00x/digi00x-pcm.c    |  65 ++---
 sound/firewire/digi00x/digi00x-stream.c | 189 ++++++-------
 sound/firewire/digi00x/digi00x.h        |   4 +-
 8 files changed, 342 insertions(+), 352 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
