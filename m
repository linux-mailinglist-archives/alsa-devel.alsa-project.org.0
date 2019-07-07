Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F566614DF
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAC5832;
	Sun,  7 Jul 2019 14:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAC5832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501446;
	bh=ysA+MKb8e1E+6HEdows+Dfpjn4JBPcxPeS4kmgYM9KA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BPF35x8JwTwOcQeQOTyC2WUigYdWoHZN6xz5GhZ44bO9u5p9SRCLon+zy+OC+OujM
	 D50EwFXHdCdfXmOlWxnQRKUe/3nTvp0qtsNc71xji3iwj3h6h7BNEkab/dNkOvMoPr
	 oPAMflYiapQTIJXVP1J70M0xxEOubFFjY2+hchw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF8F1F80269;
	Sun,  7 Jul 2019 14:08:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F160F801ED; Sun,  7 Jul 2019 14:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E7C2F800E6
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E7C2F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="j5fsQMoq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tp22/tPS"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4624D42C;
 Sun,  7 Jul 2019 08:08:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=UY4mR/F5KGOuKOnS+TrtfDLWnI
 kitHauuIoO6Rf9iug=; b=j5fsQMoqduCtzw9HyNJYor5g8ljqHJOSNdm/v5Ddlm
 Zi6iyzW5Fslec8/DoAJZoVHTKkISMaWThxn7PDkpdE4otBbNjv2XEsrQbCNTu/Y7
 GU1e9XmsDb7/f9cPT219djsaxF6O7zFNEPDNJ5hLD8W8d1DfOEDmewMoSUhXfq6e
 ly1V1atNz2D5fIX05iTXWaYgKt82vetEtj6YzIcdRWzx9ly24+dR0pX4VBG3osHs
 j1RXyxZ6R5qzDbQmNKmkHMFw3tEb0UCKzGBG2O76pt+4qZ5LAlsKmAmh6z59xk3t
 1+YG8dZKhyaV03yNCko/jc5t+r18TbQRQZgnaBj86mgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UY4mR/F5KGOuKOnS+
 TrtfDLWnIkitHauuIoO6Rf9iug=; b=tp22/tPS+j5uceUlvd1Iax5OgsaR6P9g7
 LcGf6i9lhGRJr0EnPALL3B0wpEk141P+wF2wlwOVtLW8hpqw5v0/6iQKd+ZV4hTD
 FWHMpDDo6HOV1TzJSkkcAl5/MXQLCJ3PyzTKQVSWFCIwPOVcx5rAq6JUTbsmON4L
 DOkpyGwGBwQeoRVnJ6WuL/iJ39xU5iMbdr7DRj7PtLc9/myszphtK1tt7dbAv9Qv
 fcy6N3JsJ1X72THSDAUVRH6AJLN+hSlWsnCs8gmmxvii/6ouAxMvCPfY24MmDZSx
 4F7UFzvB2iobfd/DhGzbjp4T9au2y0qlHzx12HpDtCt7XTHJ3qpdw==
X-ME-Sender: <xms:o-AhXThG73lmxaRaLNFG9chgPK85T1Vy7K3x2j1V0a6-rHlNQ2N4gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:o-AhXb51VHgvxolzIZR8O7qiIHt6ncZwwGtCadb3nid76_x2UZsiwQ>
 <xmx:o-AhXb7mwt5MbttC-G0LJa130LHGZKnv5UnxqOmQb4fZUXrAmpkNEg>
 <xmx:o-AhXZFFOz5RYcybx30y8KzYCylzLPERE2kRrAl8rVNmsbnD-6fM4w>
 <xmx:pOAhXcNjEpDe3UiBIHZNb0P55kjLE7CEhJaKgUmIrIn2xMcEngoP0w>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0A0780059;
 Sun,  7 Jul 2019 08:08:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:52 +0900
Message-Id: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/7] ALSA: firewire-lib: some fixes for
	tracepoints events
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

This kernel module, firewire-lib, adds 'amdtp_packet' tracepoints events
to Linux system. After heavy code refactoring for v5.3, some event
parameters include invalid values. This patchset is to fix them, and
the last part of my refactoring work in this development period.

Takashi Sakamoto (7):
  ALSA: firewire-lib: fix invalid length of tx packet payload for
    tracepoint events
  ALSA: firewire-lib/ficeface: fix initial value of data block counter
    for IR context with CIP_NO_HEADER
  ALSA: firewire-lib: fix initial value of data block count for IR
    context without CIP_DBC_IS_END_EVENT
  ALSA: firewire-lib: fix different data block counter between probed
    event and transferred isochronous packet
  ALSA: firewire-lib: code refactoring for error path of parser for CIP
    header
  ALSA: firewire-lib: code refactoring for post operation to data block
    counter
  ALSA: firewire-lib: code refactoring for local variables

 sound/firewire/amdtp-stream.c | 59 ++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 28 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
