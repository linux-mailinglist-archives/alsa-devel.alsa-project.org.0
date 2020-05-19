Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF31D9518
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E08211713;
	Tue, 19 May 2020 13:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E08211713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887123;
	bh=8oTGgv1hDQW2C0dYCjhhhPuWjgeNbAgvb1uW2fI668Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=opwftSSs5pLO+o/mMPs5Yr/a1IINNVki9Tu046Z7qP7E+QKs0J5imQib7aXRfQ9IN
	 dBWI624kRXopKplNaULpADsvCord2QhsT1iiGY4fhf9PdbvnRgHsel5jevl2WtPHT1
	 uHxSYLYOzuP//TXwVJtiyq2i3bWzZGhQIJdRhRb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B37F80291;
	Tue, 19 May 2020 13:17:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3A0FF8025E; Tue, 19 May 2020 13:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F21CF80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F21CF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ov++DuWd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="r1wv5MPg"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B0965C00FC;
 Tue, 19 May 2020 07:16:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=pJhCfD1Ug2ySmc5JWrmaps9Qlz
 f4K6BEuthxHBTuzCs=; b=ov++DuWdQoiMPgqFs1HuhS3SmcIPIGtl9fnXLi+7/m
 pv9y5criDbt/xFsMJtgFY115tJhfh+MEdUG2M+5Vk6bDs+H7W2uiCZeehickJUUr
 26UpfuH7/93u2V3ro7pzM5zlwuFAbMMV+kCIk5ueg0UXFX1vlzaw352QakaN/D0x
 5h7/hM7kBG130Xd3i0YoYqiY1/YUUvgxuL9qQ8o1kkVxPymKYqBU1tDV5J3v7sNd
 Ciah3o6oLVBmEwq8zcMCuQzXCAy9AINmMxtpXe3BXS9noEE4/mEL8TMEm2P2Y5NP
 iHKzAxHRSbh96FJB3Gcuh3d7BZX7kfARa5bS6GQYjRmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pJhCfD1Ug2ySmc5JW
 rmaps9Qlzf4K6BEuthxHBTuzCs=; b=r1wv5MPg1wfdSkOw01Hqk9xPDHI7dXw6o
 rd1WuMeu0op0iVeHv6+YXbano7LekmJFKoQagE8LGVc40nrcLQKsa6hcuWDWg2Ol
 ZKz96+y+fhsrolYkrYVMMWPuIeLR9POBsdKsfieYwWqdLkHYLIwAeJvIZbpZmMkd
 PfcARAlWcmV/fqwnz3J+rjsEQbwj9bzU8PCI/HPfZu18RqL217lM2/Lyp8+hn+z3
 QNKJdGhcBEjIMXcWLwR8LpdfGS/4vUYd2nK1ek3297eT+A7xTpUMmdnSFwzj/KEg
 EHChiTnpIHoqO+ZJaHJfokBmBvVnXcEMHikUqNfXBYS3Qe0ICJSPg==
X-ME-Sender: <xms:HsDDXktk-4OJtl6lMUgXR07Qm4NMZbCiTKzHwpOj4zYhzvt9h3enJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedukedtrddv
 feehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:HsDDXhcyP9X9v7KYqL7rEcS7Sok_5VRyCM1mkWhlnvgCNndX_d_SPA>
 <xmx:HsDDXvxVfanEVexKBbF2Mwq4nJ_Lx-uES0vixccnAvqQlI_vXqmRBA>
 <xmx:HsDDXnNw0dZegYXsYmWGnxruim2KQYZe3MizZwuUPivbAoGDiBsFiw>
 <xmx:H8DDXtLwWLOlQS6_AqfgRI-kCtj_XX7Fs--7cZyQP293pDKquCYIHg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E1A73280060;
 Tue, 19 May 2020 07:16:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 00/14] ALSA: firewire-motu: code refactoring to obsolete
 protocol structure
Date: Tue, 19 May 2020 20:16:27 +0900
Message-Id: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

ALSA firewire-motu driver becomes to support more models since its first
commit 2017. As a result, the original structure for generation-dependent
protocol is not suitable for differences between models in some cases.

This patchset is for refactoring the driver to obsolete the protocol
structure. Some helper functions are added with condition statement for
protocol version so that the function calls protocol-dependent function.
Instead of the protocol structure, specification structure is used to
represent model information and to choose model-dependent operation so
that it's easy to handle model-dependent quirks.

Additionally, this patchset changes the way to calculate the number of
chunks in data block. Current implementation calculates by the fixed
number of analog input/output ports and flags in the specification
structure. Although the flags can represent any physical input/output
of the model, it's difficult to debug for supported model and to add
support new models, especially for model-dependent quirks. This
patchset adds each table for the fixed number of chunks of each model.
The calculation is just done for differed part of chunks.

Takashi Sakamoto (14):
  ALSA: firewire-motu: move spec data to v2 protocol file
  ALSA: firewire-motu: move spec data to v3 protocol file
  ALSA: firewire-motu: localize protocol data
  ALSA: firewire-motu: add wrapper functions for protocol-dependent
    operations
  ALSA: firewire-motu: drop protocol structure
  ALSA: firewire-motu: add model-specific table of chunk count
  ALSA: firewire-motu: add alternative functions to detect packet format
    for protocol v2
  ALSA: firewire-motu: add alternative functions to detect packet format
    for protocol v3
  ALSA: firewire-motu: use table-based calculation of packet formats for
    proc
  ALSA: firewire-motu: use table-based calculation of packet formats for
    stream management
  ALSA: firewire-motu: remove obsoleted codes
  ALSA: firewire-motu: refactoring protocol v2 for clock source getter
  ALSA: firewire-motu: refactoring protocol v3 for clock source getter
  ALSA: firewire-motu: refactoring protocol v2 for fetching mode switch

 sound/firewire/motu/amdtp-motu.c       |  19 +-
 sound/firewire/motu/motu-pcm.c         |  14 +-
 sound/firewire/motu/motu-proc.c        |  20 +-
 sound/firewire/motu/motu-protocol-v2.c | 314 +++++++++++++++----------
 sound/firewire/motu/motu-protocol-v3.c | 303 ++++++++++++------------
 sound/firewire/motu/motu-stream.c      |  16 +-
 sound/firewire/motu/motu.c             | 113 +--------
 sound/firewire/motu/motu.h             | 124 +++++++---
 8 files changed, 463 insertions(+), 460 deletions(-)

-- 
2.25.1

