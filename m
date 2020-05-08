Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391641CA25C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E10391839;
	Fri,  8 May 2020 06:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E10391839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912963;
	bh=MbRlY5GwIrZ1jGso6H+LWS31icLDJsdyQfmqQg5X27Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cXvYk1YVqzsxhvzGNUw+E36wb3040i4S20JT8e2y+5I9JDOmL/wCYYmgMTjcDvoL1
	 wT4IqRdwmUDy2LIW5eZwV2CeiovfQifVbin1SVYBrwUXhknJNa+hDT1UrCHAG139Xu
	 UFSbCucP9DNdlzclEy/QjPmMpwxLR7gCq6bGv/V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FE5F802E2;
	Fri,  8 May 2020 06:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B80F802A2; Fri,  8 May 2020 06:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5AC6F800E7
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AC6F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="z0Ct10FL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="g9cwiAJa"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id C7787ACC;
 Fri,  8 May 2020 00:36:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=DtA2gpTxRLjF9J5mCLsDviUbnk
 pDPgT919YwbFtV6ws=; b=z0Ct10FLaL77FqodD2sf9m0aXPXI1EaxZ6AJ7s4pfB
 Vd12lCSuOk3OR/uALD0PjRCpMUAwoxLV5fwfIKqdsedk4bfg7RjyhW9DJuClQAQJ
 LilizuwDaAnxC+Gh3dKy5GfqWcDDFh2xiRquGWrRnsnRLAKrUUdrord+j6lOGU4q
 fpAM4b84eq11EIoZRaJDOdQH1B/C4oZUR56SMfhE69Uyr6mfa163yGqord9aODqI
 NPjuP6uTZQ7RG7tqTR/p1Yr/P/mD8k+qsYWo8mjJbs2u/JXNNSVV55XOT+Fre5sM
 niJsmfrI1r+rngGq8uQpqVQom7RwuUrgmXGIBoNKjnmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DtA2gpTxRLjF9J5mC
 LsDviUbnkpDPgT919YwbFtV6ws=; b=g9cwiAJaKBXDB7lj4tZaGoAWFS9lICpDn
 uM6aV8Mn7Bh8Rm6Zr98UmqxF6wuBPoe2uThg4hTBvuTrYhH9/AtVRydxRyAFEoLM
 Grs9jFhJbp1BSL/rG7x5GnVbZp/kFZwGVCYRl8T6O2/7zyOiWDGZORGiU2y1jt0d
 oxeI/JpdU5QvFOIPsD2xE9vUjniccd9ALYp9ctOrkRk5HOtg7gulVWmzmIEIlbJ7
 Sk1i6gTU0dUrkE4PmyQ2l9ePpCr6bdyACBr+ho1KSob6ucb00U2zC5TaQUz94UsW
 i3FFEWTFszI1/4dhBGKNeN/QPVwC19JLgASwsI0jdUOoltDLi324A==
X-ME-Sender: <xms:1uG0XnZJEPN68xnh14SunPWtBV9E1imzf8C7K4TRiIgT5BFkAHbgsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudektddrvdef
 hedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1uG0XppTNWEni0sLk-dnXLn-3CAWhpOi5kRBrskHG7snPogJKUeKCg>
 <xmx:1uG0XjZ4k9OqgXHHu6Jovj2Gf5DLyUp0EaznbMU4Vu5Pc424tQfl0g>
 <xmx:1uG0XpQu9KOZNyOwg8qRMI3yrm5soUxy8DISzPRa2tezkpFo3trHzQ>
 <xmx:1-G0Xj0-Z3EzmUpsTPaImMpOVB0IUuiYSElXrUJkDuX1TP69TEBftA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 884D9328005E;
 Fri,  8 May 2020 00:36:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 00/10] ALSA: firewire-lib: pool sequence of syt offset and
 data blocks in AMDTP domain structure
Date: Fri,  8 May 2020 13:36:25 +0900
Message-Id: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
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

In current implementation, the packets for outgoing AMDTP streams are
processed by per-stream calculation of syt offset and the number of data
blocks per packet.

This patchset is a preparation for future extension that the packets for
outgoing AMDTP streams are processed according to the result of 'sampling
clock recovery' in IEC 61883-6:2005 from selected incoming AMDTP stream.
The preparation is to process packets for outgoing AMDTP streams by pool
in AMDTP domain structure for the sequence of syt offset and the number
of data blocks. The way to generate sequence is still the same as the
current implementation, which generates by ideal sampling transmission
frequency against IEEE 1394 bus clock.

Takashi Sakamoto (10):
  ALSA: firewire-lib: fix invalid assignment to union data for
    directional parameter
  ALSA: firewire-lib: use macro for maximum value of second in 1394 OHCI
    isoc descriptor
  ALSA: firewire-lib: add reference to domain structure from stream
    structure
  ALSA: firewire-lib: code refactoring for parameters of packet queue
    and IRQ timing
  ALSA: firewire-lib: code refactoring for syt computation
  ALSA: firewire-lib: code refactoring for syt offset calculation
  ALSA: firewire-lib: code refactoring for data block calculation
  ALSA: firewire-lib: add cache for packet sequence to AMDTP domain
    structure
  ALSA: firewire-lib: pool ideal sequence of syt offset and data block
  ALSA: firewire-lib: use sequence of syt offset and data block on pool
    in AMDTP domain

 sound/firewire/amdtp-am824.c  |   3 +-
 sound/firewire/amdtp-stream.c | 326 ++++++++++++++++++++--------------
 sound/firewire/amdtp-stream.h |  20 ++-
 3 files changed, 209 insertions(+), 140 deletions(-)

-- 
2.25.1

