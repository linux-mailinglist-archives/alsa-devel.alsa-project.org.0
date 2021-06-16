Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2953A951B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 10:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B82616A2;
	Wed, 16 Jun 2021 10:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B82616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623832319;
	bh=FTlOIWqEpD7NN1xkn8RVsYcTAztdq3GLhGTWk/kKnTQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LN/np/GCk44oamKVAeSGRRXwm+br99+pnkA8BudUXeQOd2BaOnU33qD+nCNkU+x4p
	 flFBpnhjv4BfR1MMXNokuSxRbrU6NCsWWaOGEOp+ninKE4XvBbqR6wbjHqNkcNyuux
	 OocsYyaIBIZKRkHAjqHF+v40dStQC8vyodQ/ojaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20568F804D2;
	Wed, 16 Jun 2021 10:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A68F80423; Wed, 16 Jun 2021 10:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF25F80148
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 10:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF25F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mP4bsnwy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qpQ0UVV/"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F3CD711F1;
 Wed, 16 Jun 2021 04:28:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 16 Jun 2021 04:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=AcaoFCHxTL/PpX5+JIgg+T+Af2
 mK7RQnFDDSXfUWEoU=; b=mP4bsnwykvaIA6UR73fLlkEz9jXPEURaZQ0qtUC9TW
 JLot+KjWNYBGsVF4KVFgqAfKbSPwNXoJtZ2zmxaTczzZAF5DPbM6pVNvhiIzI0Py
 gplw4OOHM40vBtAXQQHls6lpgyRzii/BE+8Am4+OhC8v3VCj8SQWlal29suOPr7u
 nmMq8ud5Ig/GBaqJTMmH+Aw+MPAYtSFpjwJtHagU6L8EhPCj1qU0Y+QLaRSyak3g
 Uyxy5CZnwhqtY3K97bAsisQeCAnUWv4NtidlLFi8R5YFyEQmvxXYH0U/ZfmCtyHf
 BBA4w1na+PZ+fGkyfuexRGHlX598nay4KM4KlJU/Kbnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AcaoFCHxTL/PpX5+J
 Igg+T+Af2mK7RQnFDDSXfUWEoU=; b=qpQ0UVV/vmlyMdwJeKWBfuLvpl2mP40An
 x662vbZxkOw5w0Ob0+xfKO1EPDRmU9gFa/7KIVKtfT3KVq54Z7cSwG1bDfs5n4tX
 2uErA5WjuPEgjNxFQSyMaZCeyHLz6r7Eu7GxoNLDXj0p4lc/kCsqrHqBkVWC3EPi
 P+i9TbNgMVEaZYmtgpJPY4jI5KclCjCJTeSFd9doD7pKcaWLTWUE8KcHCCM02zab
 1ZNhzD1bXUuNUlrUFukFkNo45IyyYLQai2CYwDrmycZWkZRztrF7ZRWq7UuiBvMN
 vragL/a6qL/DExeMJ01Kels5QLo6PF3oSUcxwivUO06z9j+65OWug==
X-ME-Sender: <xms:RLbJYKCsVb9-o6oicrNF6Z-LpHWLDWvFULVJghn6FgXRLr0CruMxxg>
 <xme:RLbJYEhcCJyDO8PLVbHuIQEdpOAAkLTb7bRhW7LI9yglvfUvcp67ARsPETGCcAnLQ
 8C7gXesnHZ57O4Helk>
X-ME-Received: <xmr:RLbJYNlSOGyNCCN9KnhywKJhgeakkfeKxqAZt4rfQVHqWhDzvJYJlmRF_PpXOLX-NV0xMYZsMqbLRSXK97dFgy_3YRtR4jWZo4j2lVVGTBX-jA9VhqOy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:RLbJYIyoWYEAzH4P1kLIIOcGv-DWOFk4PY7Ldy4OqXFrvNYHf1nkwQ>
 <xmx:RLbJYPRP7qVBYbxUe7Yr-zGlOGEF97fYgZ_kk_7HiLlXkq4pL3lIUw>
 <xmx:RLbJYDbfI5ALWWtXgXU_P4X76fCdz0iu4vhVww7Ouqn9WaqarVM_og>
 <xmx:RbbJYGK50MdlDy5V4TCYHZGNtXCZkpjudSlLOt-q9SbkJZBLSkAwVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 04:28:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/2] ALSA: firewire-motu: add support for MOTU 828 and 896
Date: Wed, 16 Jun 2021 17:28:45 +0900
Message-Id: <20210616082847.124688-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

This patchset is to add support for Mark of the unicorn (MOTU) 828 and
896, which were shipped two decades ago (2001) and already discontinued.
(yes, it's 2021).

It's reasonable to count them as first generation of MOTU FireWire
series since they are based on QuickLogic QuickRAM FPGA apart from
Altera or Xilinx FPGA in the latter generation. Unlike the latter
generation, they doesn't allow software to configure internal
multiplexer.

I note that the sequence replay for media clock recovery[1] allows to
support them. The device doesn't generate better sound with nominal (ideal)
sequence of packets, thus the patches should be applied to development
tree for v5.14 kernel.

[1] [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware devices
https://lore.kernel.org/alsa-devel/20210602013406.26442-1-o-takashi@sakamocchi.jp/

Takashi Sakamoto (2):
  ALSA: firewire-motu: add support for MOTU 828
  ALSA: firewire-motu: add support for MOTU 896

 sound/firewire/Kconfig                 |   2 +
 sound/firewire/motu/Makefile           |   3 +-
 sound/firewire/motu/motu-protocol-v1.c | 440 +++++++++++++++++++++++++
 sound/firewire/motu/motu.c             |   2 +
 sound/firewire/motu/motu.h             |  24 ++
 5 files changed, 470 insertions(+), 1 deletion(-)
 create mode 100644 sound/firewire/motu/motu-protocol-v1.c

-- 
2.30.2

