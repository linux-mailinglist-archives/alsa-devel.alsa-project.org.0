Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE923A20AD
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 01:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0819616EE;
	Thu, 10 Jun 2021 01:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0819616EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623281052;
	bh=dKkauYZ11aH5MNg1/8EDrrvhq99F/T//A1gguE2d+S4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YGDetNQjA1Da+Q7MEy4JPZSSGwN5oZBuQ6/Mg37LdwZT6DRQvcY+HHJVzaG4iZRoM
	 0zdVYRRIRvlew2xBeAztTxcMjwFlWWnoxrEQ0WfNYqocJhF3vUQuWVI204Kd8AGps+
	 QLuWDktOWyhX6E3sWD0MRJzOdS1SAeacHT4c3IuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A51F800F4;
	Thu, 10 Jun 2021 01:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A06C8F8026C; Thu, 10 Jun 2021 01:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C19EF800F4
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 01:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C19EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Bpxhg8qT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="f2BLgrwD"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 236665C011C;
 Wed,  9 Jun 2021 19:22:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 09 Jun 2021 19:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=cvSZLmkO6A3ujaBQvErecP5PeH
 exxUfhtONxM2n9GQA=; b=Bpxhg8qTb1fnz31lgSTYRrHh1W6gvN4uHkyEQhXwWx
 kIViz+F0qFw6HvZ6a6m0RpNVyW6EVK1PmFtvn7xCrcfxdx8lnVv9sq+Zqd7hnRbl
 5HUCmc7J+rWBNWMDVI0kIzwMg+QeIxE2r7G0bEuVrZJ1Wh1gZ8o3MltedSltb57a
 kgMYk7hERiD+ue8D6FAYV5JeUS7lAKRI6zIyZ82m82+3wnvIaoJM5shBD7OyJ3PK
 oTzWkTiriTept1rObqkY8ukygovKV85IwMv1gD1VuC0i4nifajeFV7jgzSsw1jt9
 f2pkIMb7SQfsbkcvLt/0Qq5d9kZbLF0HmrMt82tccL4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cvSZLmkO6A3ujaBQv
 ErecP5PeHexxUfhtONxM2n9GQA=; b=f2BLgrwDmNz1/MhaLA5/AmXY2Y/4nUNmO
 H9eCi3yQEg1OSAVNK9pSRN6bHm+yoKdtJEhpxO0VFc2xNuBmzDTtscQ2Kml7T2wa
 +y3keBT+kMj29qo4VHtUyfT3voyPtZpwywahE7LOUu2wWJbYgksUtgFO4nlm3oUc
 Mu2cwj/jPKK/K2NOX+/r74vZ6eF4riGkenaVh5lmroOh6IlLNTqjWnp+vaDMLHo8
 FXYiJQ/06PySzrVr69gyBMKCv53Wxsh2eqnoRUOhjKA8tZfy947l+Ycaq+zv3dMV
 boKg/BakaRZzBcMRLxsNHpKpJRpjXTBEFYyBYKHAyQcaEP7FiMgsg==
X-ME-Sender: <xms:O03BYBlN17yGY0iW7gg4IgaBieQD1wQvnaMpwmhyC4DoyAaR27BB9Q>
 <xme:O03BYM1l8t9GUOZk_QNdLgOCcstMbhbM7z77086dPcQr3WrYkhzIpo8OE6rNkA4Pp
 V24teTKn709ZweAWhk>
X-ME-Received: <xmr:O03BYHreB7jdA41NKZGjX6iVbYAFrwYiFvsMS4SleBPvjVUKuBGvIqB780NJF2duvydEJ4VM5kN6tbcPAZhSAUJtY7Htnfi_GDfwdjDw6MGDBFpqwZh2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:O03BYBnClpaHHqYQdje4qUhxlOlf4WLvJmXpMVvAwnwnyIjbSI8f4w>
 <xmx:O03BYP3e4mkXKBw7pGzBrMSq96YYb5k_I8wgZqQ2_-61MzP3sbEnAg>
 <xmx:O03BYAvcEmKfn0ItLAiZyA_3CQgFwbtreSahbVZmqjyqDePI93z7ng>
 <xmx:PE3BYI-X8LsxnxmmBgXczriMOcrICKR87rhPfcPCqEcM4lL4a0pJPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 19:22:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 0/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream 
Date: Thu, 10 Jun 2021 08:22:27 +0900
Message-Id: <20210609232230.5963-1-o-takashi@sakamocchi.jp>
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

This patchset is revised version of my previous one:
 * https://lore.kernel.org/alsa-devel/20210609143145.146680-1-o-takashi@sakamocchi.jp/

All of drivers in ALSA firewire stack have two chances to process
isochronous packets of any isochronous context; in software IRQ context
for 1394 OHCI, and in process context of ALSA PCM application.

In the process context, callbacks of .pointer and .ack are utilized. The
callbacks are done by ALSA PCM core under acquiring lock of PCM substream,

In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
drivers to awaken user processes from waiting for available frames. The
function voluntarily acquires lock of PCM substream, therefore it is not
called in the process context since it causes dead lock. As a workaround
to avoid the dead lock, all of drivers in ALSA firewire stack use workqueue
to delegate the call.

This patchset is my attempt for the issue. A variant of 
'snd_pcm_period_elapsed()' without lock acquisition is going to be added,
named 'snd_pcm_period_elapsed_under_stream_lock()'. The call is available
in callbacks of .pointer and .ack of snd_pcm_ops structure.

Changes from v2:
 * delete context section from kernel API documentation

Takashi Sakamoto (3):
  ALSA: pcm: add snd_pcm_period_elapsed() variant without acquiring lock
    of PCM substream
  ALSA: firewire-lib: operate for period elapse event in process context
  ALSA: firewire-lib: obsolete workqueue for period update

 include/sound/pcm.h           |  1 +
 sound/core/pcm_lib.c          | 64 +++++++++++++++++++++++++++--------
 sound/firewire/amdtp-stream.c | 46 ++++++++-----------------
 sound/firewire/amdtp-stream.h |  1 -
 4 files changed, 64 insertions(+), 48 deletions(-)

-- 
2.27.0

