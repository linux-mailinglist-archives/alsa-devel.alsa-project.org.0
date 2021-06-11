Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC673A3A8A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 05:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5DED1872;
	Fri, 11 Jun 2021 05:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5DED1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623383554;
	bh=1TiEjcQAS8eMaT9oJZxa03w+JwQF0fpL4G2fQK5M70k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vN7at/xxuW4qmd3eRByaOwu3qLjX0otnk37ocnoAQdq+WwDt4sIhPvCZAcI45om6/
	 +0yUW/CbvNJjiyQqhDYhssLwgAqUjCtw2pp2cdkyhMJCF0SsZjPJopYPfk4xz3HmXW
	 nTwEOe7zYcVYbOOmNXgBnbZaVdnNG/5+gmjMNYL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9537CF804CC;
	Fri, 11 Jun 2021 05:50:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68B7AF804C3; Fri, 11 Jun 2021 05:50:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4F61F800FB
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 05:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F61F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="W0zk6GWe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NSaHPKiC"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F0EE1189A;
 Thu, 10 Jun 2021 23:50:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 10 Jun 2021 23:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=e70dA7f1BpDDSfJwTIrxTwLGpr
 /hpTNJQNQqz+sT6ak=; b=W0zk6GWepdQ9z5Z7DrwlT+t5jCpSI/9qpoA116bO7Z
 c6uom42Yp+WcKLnOGqNdVtHaNYX+GnpSoSc/Ecxpof9OAuF779dC45w/VyO+RMJB
 LO3WdyoNATPabU5Gmpy7HLIpGFKYJgYPUtWQrcsID/CT8sgCteYfQZ1Fo3zdtD4/
 QCCS8VVoqUDbdc9vH/P7aq8Up+lCoApeaqKg/TWSFVvEyxrcyG2bDQE/GyNB5r2A
 RQXlOTpolVo+iFTlzMGzc+Joe0Xb811keHh2lDx9+RE9Y55/Pnk2NvZG5KB0H06z
 OHDZBZGKVCSczTGiASVeYp9sseutsCF0BoRmDSLmvacw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=e70dA7f1BpDDSfJwT
 IrxTwLGpr/hpTNJQNQqz+sT6ak=; b=NSaHPKiC1StOOQ1SQ7pyzhXO4bDZciDXS
 LGEviyQgq7togSA7X5nzZszmt8IC0AjpjUjWUdfwwsv9mB77/QrNC3YQEQ4lDQY1
 0XnIJtTq4n9tMn7rN+WbrFcD06dNOrT9s6pLZ4lf0qbVIRtsgeT8xtTIBoOc6Sfz
 r9tvuSwSuclEVcwWqTPxuFMgPUZydQBS7IIN2NybCZfDUOPnccOdpt9pKcAFRua7
 iv8O8FZimT/YyjmMMlroaVQGs2O+5kw3BSGNcf1pGYhq5wUnuRQWfKM7htuuViM8
 wcrsgHxCwW+bwfUtrZZ8PUSCg9o3GYn/dymMV+hO+N0njMQItfuXg==
X-ME-Sender: <xms:b93CYD8GvuD1mRO5xaCnD91z891KJO2Kp-8-lvChD6Oi_vk_PvnorA>
 <xme:b93CYPtejxap1cZ59DJRQM0hI0oLYGY8jHBvDBqtGVbYxJWWhcpJXGktbZGvLX2yd
 FWOsMzvYTR9wC68Jnw>
X-ME-Received: <xmr:b93CYBBLJZvuo86rMkXbdYz4C4COBFiY7SC5RXCzBmsTd3-bl-R24yEcJu0SCtF5TstPx7vcypnvF5slPyPGGZx4mx-xCube1Pa8vZoyoadT-Ygunz3O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:b93CYPfB9OcI804UN0nbS4JfU4a-BOLNAB-9Hvcotc-9MqoGunBOzA>
 <xmx:b93CYINEcufgMk4FrAUB3Vl3J_uINsKr1D1M2LCwuMFS5fMgfn-3ag>
 <xmx:b93CYBl633hPocddKUaWxFmNdKQFvrdSAuCSq7W8IcaHkbObqDoMDA>
 <xmx:cN3CYC11D3j_5VBXnu43jHikHuKGCziFwLsb6_BtczJefBnfYSwo2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 23:50:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: bebob: remove workarounds for suppressed quirks
Date: Fri, 11 Jun 2021 12:50:00 +0900
Message-Id: <20210611035003.26852-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
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

As a result to apply the commit 1bd1b3be8655 ("ALSA: bebob: perform
sequence replay for media clock recovery"), some quirks seem to be
suppressed.

This patchset removes workarounds for the suppressed quirks and includes
code cleanup.

Takashi Sakamoto (3):
  ALSA: bebob: dismiss sleep after breaking connections
  ALSA: bebob: delete workaround for protocol version 3
  ALSA: bebob: code refactoring for model-dependent quirks

 sound/firewire/bebob/bebob.c        | 41 ++++++++++++++++++++---------
 sound/firewire/bebob/bebob.h        | 10 ++++---
 sound/firewire/bebob/bebob_stream.c | 32 ++++++----------------
 3 files changed, 42 insertions(+), 41 deletions(-)

-- 
2.27.0

