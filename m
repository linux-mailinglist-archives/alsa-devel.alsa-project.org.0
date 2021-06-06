Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B746539CE5E
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 11:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C60216C7;
	Sun,  6 Jun 2021 11:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C60216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622971224;
	bh=xUYnjhYD1oQFDHLXvygnV4GWFw9M7rYvzsc0vtxrw2I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hLo3nMaLMDRYjiiDMoHzYNPzjdcKNuiouCQ5ATqf0Wfp2ReczBp+7ihHLgn+Px2DZ
	 nV4T0T9tJWQHdE8/AuOxRPY7thTnf02d/RqDGAjJAZwaLaGCw8C4b8MOqXCCCOjHoj
	 UAxdtn1vQAyXTnzZR9HohMpFcNJd4LZWfYyurnkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89CFCF800C8;
	Sun,  6 Jun 2021 11:18:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6107AF804AB; Sun,  6 Jun 2021 11:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688B1F800D0
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 11:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688B1F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="NLPJevJc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jfebQ8qm"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 059785C01A7;
 Sun,  6 Jun 2021 05:18:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 06 Jun 2021 05:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=RMd1oZNq6fiIZGgBKg3wKVmZDN
 k3vPP3BGUAHCu8dAY=; b=NLPJevJcQPgDmQoxlWmdGKcXd1tO4nPt7Hh0FblslE
 q4sVS2i3AhjEajFcnNM0mG0oMxyFr+QwvtGVjjLAGnOC6vfq2pOt+0axASLgk88U
 1JqwtpRUWOosqF79yHB6IkFZcdp5RUVgE8abUSRcayX8OSpLht7lzjaaE1geoVIb
 NMKAgd9TVcCpHtOWULCiqlQh4g1FVN09x/CbCnsLxm7HbRA0rT/lrTGClJ/+KlPq
 EMfN4ew/IMu9UipekDB8otgSA33kKyY551bpRjvfhxz6BIVJoOykw7qeGpCKa8ji
 +p8MkfbYUufpsdhLPpu/XJCam9C0DVvmZ7xIYuzRwlJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RMd1oZNq6fiIZGgBK
 g3wKVmZDNk3vPP3BGUAHCu8dAY=; b=jfebQ8qmM0h3G+P7ungNHONq5t2zSyqqV
 RiZcMUioq8sc9M1iRw/BCOYo98VCt+H+ZPePhi1BkUTfJUHrJQQDxUT4KO5jPBLA
 VSsnu1qWrksXEdDTJLZjYgmrNmsLDZJENtKrABO+VDoGe4KYYLiBJ3DFQqX4kwlV
 RZuAEEc5XiL3jwS6QazYZxkBWg4CoIN42VpVR7fg7FyEu1r+EUh/cfGdBDZCVnoz
 5jTzmo+OtN92iVlpYq0oAxTw9dqRhc0RSx4itLUeQBEZb9LI9VrO3HVcfAkwjECf
 tsMh1RY7GPCGSoXrI5OpRa2ytYjzchxXLPP5QrbXosGoTnubLLhhg==
X-ME-Sender: <xms:8pK8YMb-e9ZycMGHZ0wdZMLzcNwRCCNwLoP_cKr2fVdJiCfC9KbMWA>
 <xme:8pK8YHZ6L5Q3ZPLkcJqoeDi_yDo3_o-Zxp7CcOkPikq6qoDrtQal2FbPjKVdaDiJI
 YCAEfYGXKBwtZkx2BA>
X-ME-Received: <xmr:8pK8YG-AZfBeENvGclOoKyfSyPjGZxkGU8hZwDHpm0lldQG0Sq1EcpdKhNcbFDwy5zUJo_lUbFe59AH9zPa1iQ-dYgEvloELy_DTd6Vw8k5par2439-y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedthedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8pK8YGrV0nkddHPSYoqaMlfHzHMB6ku-eHSDQqFsQvNDOt_5nHSsLQ>
 <xmx:8pK8YHrefTAI7Q14YBkpEC7aPeS2v-5x_09NxVa-GcyDG2wjT4gA_A>
 <xmx:8pK8YETy1yBrqWJSr1u945A7Rf4cShU2MVmeQssUDfjWSRa8CVL6kQ>
 <xmx:9ZK8YABkY3CtW0rmTffEochrnPqJCVoBmD9lHVN1T2NTDVPAaLRPgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 05:18:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [RFC][PATCH 0/3] ALSA: pcm/firewire: allow to queue period elapse
 event in process context
Date: Sun,  6 Jun 2021 18:18:35 +0900
Message-Id: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
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

All of drivers in ALSA firewire stack processes two chances to process
isochronous packets in any isochronous context; in software IRQ context
for 1394 OHCI, and in process context of ALSA PCM application.

In the process context, callbacks of .pointer and .ack are utilized. The
callbacks are done by ALSA PCM core under acquiring lock of PCM substream,

In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
drivers to awaken user processes from waiting for available frames. The
function voluntarily acquires lock of PCM substream, therefore it is not
called in the process context since it causes dead lock. As a workaround
to avoid the dead lock, all of drivers in ALSA firewire stack uses
workqueue to delegate the call.

This patchset is my attempt for the issue. A variant of 
'snd_pcm_period_elapsed()' without lock acquisition is going to be added,
named 'snd_pcm_period_elapsed_without_lock()'. This is used in callbacks
of .pointer and .ack of snd_pcm_ops structure.

The patchset is still under my test, but it looks to work well in my
easy and rough test. Before posting for merge, I'd like to get your
comment to the idea. When evaluating, please merge below two histories:
 * 64584f329352 (for-next)
 * 9981b20a5e36 (for-linus)

Takashi Sakamoto (3):
  ALSA: pcm: add snd_pcm_period_elapsed() variant without acquiring lock
    of PCM substream
  ALSA: firewire-lib: queue event of period elapse in process context
  ALSA: firewire-lib: obsolete workqueue for period update

 include/sound/pcm.h           | 53 ++++++++++++++++++++++++++++++++++-
 sound/core/pcm_lib.c          | 25 +++--------------
 sound/firewire/amdtp-stream.c | 46 +++++++++---------------------
 sound/firewire/amdtp-stream.h |  1 -
 4 files changed, 70 insertions(+), 55 deletions(-)

-- 
2.27.0

