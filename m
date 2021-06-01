Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE128396EBA
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 10:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47DBD1691;
	Tue,  1 Jun 2021 10:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47DBD1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622535580;
	bh=Tv6YqgrkkCJylglhdVn35QoE9y7svqlcMkXuv23U7RQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ptF3Aw+5twU2FgrIEa3LRHjYzFpCXPMr3XladE3YklopgqRM+wwCPz3TwGTgRAOVP
	 ES/3zwNIrL+d9C9spQArq04s0jNUwSwmvE97X5rgNDNCKd9YROLr9OBMyhXeuGwqXg
	 1ulodbgme4aLrOm+bOqsHAqat1qpwyeR2gOZK7+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5307F802E7;
	Tue,  1 Jun 2021 10:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 987B6F802E7; Tue,  1 Jun 2021 10:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94837F80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 10:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94837F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="1ghKo5DE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jQywiB4/"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8D9E010CE;
 Tue,  1 Jun 2021 04:17:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 01 Jun 2021 04:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=M6qfCBC9dJcZBakMDV2mL8KynN
 EROTMRrUQrr5NCUL0=; b=1ghKo5DEaskikOE4srHDF0Sk0gSIhcViwWNV4cq7rz
 lmZn6CipfWaEEG+sLDeSFZubkALXmv9+Q3aq4oeqrxH15QC1t6fJwNt2cHl6s0u4
 ztHbx7zC+EEDUbl/VOhjogZc/wxb1t6PTR1k5r1ruSZrejMa5EgM1aVuYNqSfuRa
 binfV+Eu9Z8WNK3cElqeRm+EWBbO/vUDFZnRVwILPofdXEZU/nbAEURjX2c+GMX9
 8hVH0EK2+x+5V++YVWQXg1Si9YwhAA3t6POK6YTMymcFctLxcZBnE12KfjsTmWjg
 epUcynrhTJKAAtkFIXYtNmCr7upIokYuOc3B2OuAgzZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=M6qfCBC9dJcZBakMD
 V2mL8KynNEROTMRrUQrr5NCUL0=; b=jQywiB4/zew6cbrhTpCPUjqXJNWBd5bzm
 qFRC6Xwo8UsB0KynxATBwvbF64fEqEUALvViSpjzAYVJPTBcds8cs2vGYeYUjhQj
 qFZN5BuMM/7fDF7jQb/cFUAK6Y9ecJMFcXOJALueLRDUMh7CePwJbGH20rpPtKlI
 Vxn2KNaZRtRS3hp0dTnezrBf8MQfJbnBWbRJff7BpdqmHOklJ4Cq0x2fImCqoqEL
 fkexElBCmM1J/wTGY5UtIexNWlkp7zIbFZXr5I2n1Tui1Z0hdrOSxTjkOIfb8CsD
 l+Z70Yu7T+Zs84V13u0I2n/BF0jDCwTmE96rQUOZvNy+VkOsAGhtg==
X-ME-Sender: <xms:Ne21YKr0twLyo0gANrVuUDf17hvI0PvF8e5Vy43ALUW7rhXViR-4Mw>
 <xme:Ne21YIoE0q5Orxu31VnLd9ZxcQRoC03YwfcBJP4Lv4AGoz2Tu1LjUiw9jMK7LAzSZ
 uVpOwEjREg03zYbSp4>
X-ME-Received: <xmr:Ne21YPNCGPJh2RKUmt8WjM6WCpf3hq9g3AJE3JWLoC8J_M_vaPq1MLhmEFxQO77s50ogPA0cnrwPsIHknKp9XYS8EVseMX0aIaXyb8pi3VcDvQsKY9tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Ne21YJ4_Ypd9iW9BNsvLiJQG6_bSE5GHkTQpmhUSn1kZtE_qJoeTjA>
 <xmx:Ne21YJ7O6J81zYMJJHjAgONy-xIsynd-tH2UUGERi4o-JnXDJ8Qg5g>
 <xmx:Ne21YJiJUD785Dxva0pV3_Wf-NesGCZmWSNg8j_7opEczZsDDK7lew>
 <xmx:N-21YLRgWviUY5WhVtwq1R9FfPqiJfzYkCB22nHpy96SxgOEO95cbg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 04:17:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: firewire: media clock recovery for syt-aware devices
Date: Tue,  1 Jun 2021 17:17:50 +0900
Message-Id: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
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

In a commit f9e5ecdfc2c2 ("ALSA: firewire-lib: add replay target to cache
sequence of packet"), I categorize devices supported by drivers in ALSA
firewire stack in terms of the way to deliver effective sampling
transfer frequency. This patchset is for the devices in group 2.

The devices are known to have problems when ALSA dice/bebob drivers
handle. Many of them sometimes transfer packets with discontinued counter,
corrupt at break of CMP connection, generates bus-reset voluntarily.

The devices interpret presentation time to decide playback timing. The
drivers process presentation time expressed in syt field of CIP header for
outgoing packets. Current implementation of the drivers processes the
sequence of outgoing packet by computation according to nominal sampling
transfer frequency, assisted by ALSA IEC 61883-1/6 packet streaming engine.
However, the ideal sequence is not adequate to the devices, actually.

With this patchset, the drivers are going to replay the sequence of
incoming packets for media clock recovery. For the detail of sequence
replay, please refer to a commit 39c2649c71d8 ("ALSA: firewire-lib: replay
sequence of incoming packets for outgoing packets").

Takashi Sakamoto (3):
  ALSA: dice: wait just for NOTIFY_CLOCK_ACCEPTED after
    GLOBAL_CLOCK_SELECT operation
  ALSA: dice: perform sequence replay for media clock recovery
  ALSA: bebob: perform sequence replay for media clock recovery

 sound/firewire/bebob/bebob_stream.c    | 13 +++++++---
 sound/firewire/dice/dice-stream.c      | 35 +++++++++-----------------
 sound/firewire/dice/dice-transaction.c |  2 +-
 3 files changed, 22 insertions(+), 28 deletions(-)

-- 
2.27.0

