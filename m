Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23341F89
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14ED61714;
	Wed, 12 Jun 2019 10:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14ED61714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329182;
	bh=QMhYS9PbMVFoi+bPG8Zr6zSLFS7JMpabphtYb5pHe5Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lz/bTUupiWrq510MT5i4Gx8Iy697/aYYuZD9mfrMIUvbSVo92oif8LVNuX7Yh64Rc
	 EvtWPy7D5iBkfLrsqTqJiquA8SjK0BSXmJYX+JZ1mH2urV+HebN1ZGeFpe+CKTt/w5
	 doCWRNak/voty8fPEg3h+6FJtK7Y6EgcEwhWoyTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83D45F89728;
	Wed, 12 Jun 2019 10:44:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BB1F896EA; Wed, 12 Jun 2019 10:44:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40D8FF806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D8FF806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XDnFtSv5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="p1LjE/8o"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 09D8446C;
 Wed, 12 Jun 2019 04:44:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=uXhL/3Q1lFrwX07rw9Dp2p/lia
 WwCxYkfcaqr2L1tsQ=; b=XDnFtSv5x8iD9wUvrratOHOko39tufe6vyTcy6EP+N
 ZDI2/ZVQQA7ehnpTXxpUznYznz7l7jM2bpv101i0rRYFWNVVf6HSPv82W8aLBugY
 ysNmNJyW7vUC10l+2NF1e4067FnOAqFkg+w/dl7uTu4DWlvYHyC9ThkJFvgWCmNQ
 u1AhSAdNRMfUt+VWIrFdpcsvlstMwL25A5/G2ki5KTq/9Q3ysM/4cND9EnHATlFN
 zTNJfuFyVQSY+BunkRcPcdo7BN5u/j7cvpOhQ41LGG9Pxve9q+Uc9V1yjuo9w6bo
 dz5yEdm0xlV3gYfymjzSF+SR1ZRAMiGU654HXlY8ofKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uXhL/3Q1lFrwX07rw
 9Dp2p/liaWwCxYkfcaqr2L1tsQ=; b=p1LjE/8oZmC9Pj1MIsyB7tGKcdDFTYS2f
 gy49zoBfOYbwHsioX3pTNUElYtXAJpnqfVqVo9U/KhPiDkoS8g5QloxrDFZWSP1N
 FSl07iZjQfGjjVJR+mfZPfBUDQDKfG53Zm0jJBU+zEo8UgikERTkUoBtRYg5AS7G
 2uPMfOZqOFCkOj0vRXGjPmernmgrUWk5f+JjoCa77EG+jSqj9bYI88g3oW+4+rg3
 nOC2Fh5nyPJQA2oEjXAMttiH81p1PeswEWEVOhWMOagxEQUGTRjzl1BhKxsC3wRT
 T8Hybek7Cuw+e9k5ChXsTyrt7OlUJHxDFo6mCbmsudR94Ig5FAC7g==
X-ME-Sender: <xms:arsAXf3APDqABGh0Pb-gUWXZSyAs6bFpdYK_DzCNByMnVsUgD7xsjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehrrgifmhhiughirdhoph
 gvnhdprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedugedrfedrjeehrddukedu
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttg
 hhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:arsAXSVvolHHqix1Pzo19l25umc2piqzt36da0k8pavH7OsYDEJayg>
 <xmx:arsAXa59y_-GFQZoPMKm-UxCf1Sghf_eorQ1p3b0FkbMI8ofAko_yQ>
 <xmx:arsAXZLg9YvrjKdwFTAayEZIB9KOdNgfwrOQhY4frLJC21ZsRdW0bw>
 <xmx:a7sAXXKPte0tONNVPZ58u1yaQmXWwrvAwaJVqzvCZR3YF5MkX2TiMQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 66941380089;
 Wed, 12 Jun 2019 04:44:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:03 +0900
Message-Id: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/19] ALSA: bebob/fireworks/oxfw: code
	refactoring toward rework for reservation of isochronous resources
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

This patchset is a part of patches to reserve/release isochronous
resources in pcm.hw_params/hw_free callbacks, like posted patchsets
below:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150118.html
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150863.html

However, in this patchset, I focus on code refactoring, due to kernel
API implementation in firewire-lib.

The target devices supported by ALSA bebob, fireworks and oxfw drivers
implements Connection Management Procedure (CMP) in IEC 61883-1. For
CMP, the drivers use kernel API in firewire-lib. This API has private
data including the data for isochronous resources, and its
implementation is tightly-coupled to maintenance of isochronous
resources.

This patchset is a preparation for future work to change the CMP
implementation.

Takashi Sakamoto (19):
  ALSA: bebob: configure sampling transfer frequency in pcm.hw_params
    callback
  ALSA: bebob: don't set XRUN in stop streaming
  ALSA: bebob: obsolete useless member of private structure
  ALSA: bebob: code refactoring to initialize/destroy stream data
  ALSA: fireworks: unify substream counter
  ALSA: fireworks: code refactoring for rawmidi.open/close
  ALSA: fireworks: code refactoring for pcm.hw_params/hw_free
  ALSA: fireworks: configure sampling transfer frequency in
    pcm.hw_params callback
  ALSA: fireworks: configure stream parameters in pcm.hw_params callback
  ALSA: fireworks: don't set XRUN in stop streaming
  ALSA: oxfw: code refactoring for stop condition of packet streaming
  ALSA: oxfw: set packet parameter according to current configuration
  ALSA: oxfw: start duplex streams if supported
  ALSA: oxfw: break packet streaming at bus-reset handler
  ALSA: oxfw: expand stop procedure for packet streaming
  ALSA: oxfw: rename helper functions for duplex streams
  ALSA: oxfw: unify substreams counter
  ALSA: oxfw: configure packet format in pcm.hw_params callback
  ALSA: oxfw: configure stream parameter in pcm.hw_params callback

 sound/firewire/bebob/bebob.h                |   5 +-
 sound/firewire/bebob/bebob_midi.c           |  22 +-
 sound/firewire/bebob/bebob_pcm.c            |  22 +-
 sound/firewire/bebob/bebob_stream.c         | 339 ++++++++++----------
 sound/firewire/fireworks/fireworks.h        |   6 +-
 sound/firewire/fireworks/fireworks_midi.c   |  54 +---
 sound/firewire/fireworks/fireworks_pcm.c    |  59 +---
 sound/firewire/fireworks/fireworks_stream.c | 159 +++++----
 sound/firewire/oxfw/oxfw-midi.c             |  22 +-
 sound/firewire/oxfw/oxfw-pcm.c              |  34 +-
 sound/firewire/oxfw/oxfw-stream.c           | 335 ++++++++++---------
 sound/firewire/oxfw/oxfw.c                  |  17 +-
 sound/firewire/oxfw/oxfw.h                  |  22 +-
 13 files changed, 553 insertions(+), 543 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
