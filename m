Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6023A1757
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 16:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7D716C7;
	Wed,  9 Jun 2021 16:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7D716C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623249267;
	bh=xbHhpOhlWPxQ7u/YZMYE8cIOO9159MmkjqSIU3CwUBk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ak8MYVsmuamhDulpgzDT8/KgRNl9Dp8lFrSc2O8JE81vsaUAnkQ+qimMb4SybIGiH
	 NNmRz7vXYwJDjMNr5ThurOwFbWhmNe8Df1g+ldIPIBM44+fKZ4iKtvyngCMdZEaVFM
	 bwf81I10RGG/6RWn51MEbCq8ZMzHyOGnnHIloyv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C74F804CA;
	Wed,  9 Jun 2021 16:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEE3BF80276; Wed,  9 Jun 2021 16:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A02BF80116
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A02BF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="V/LtFhiQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aW7REBg2"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4188194A;
 Wed,  9 Jun 2021 10:31:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 09 Jun 2021 10:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=1NixpsIiDX881NGqytV1jxTJ0K
 bdB7KUVen2AN7jDmE=; b=V/LtFhiQ6d7cfRDo6LVu31ltSnzmgKQTTlqcmZRKkT
 et8SivspVjVSFPoSwRt7tRyWCFj8KCypAcsLNbALNcGHbdmuk4tdTrSohsz36spY
 DG1grLEcg44xesJc1RC+thcYrAGJqoLzX8T7pEGZ5SzPcLCvqXxfJT59QpUKD3p0
 Fj66OsyNTsL/NfpAwRODUCbvcYBwI/ofOju7S/YiZnLuV8N34CGcTQT0HzI/uCSB
 ckkxp/NBhUK9e1oyZdIIH7bOUlca3ZZwBbAruvrxLM5PU9CQkYu9Ce7vbecZFH6K
 SGlTyupfv9JjXlpg3UA/4V8IIOlbyqiz+zgG1GrPJ1YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1NixpsIiDX881NGqy
 tV1jxTJ0KbdB7KUVen2AN7jDmE=; b=aW7REBg2y1fhePYnaAcJJ4vFDHO0zVdV1
 rh1aePkhAOvWkPWFCUGuT4PslDH1DVcSbYlRww35+MXbfOXWJbzn/y2TsmPrDuRx
 3obmEssC0cawqlDbhQQ3lXslxUSKMM4XyCt2zjk10bHi4D4DJJ+KASV0OAjAIa9g
 MAFSxl6l4wVvtkigSZJWAMrBF+C3iuHICijjfyuF4aJ6tolUiLnGQbevMI81j3+P
 tCq9DGK3KOiGN+C3hxizWfec2T8klMY1NFlXJTIiiX8qEh/It6v2YQoKB92hUR+o
 RwY1bR+ObXjnrkIJ17sneBnRFgUfNyMyudqKADpZTrRuIT/uzkgTw==
X-ME-Sender: <xms:1dDAYMADhy8xnKjRZXVdmkqGs1wFEcApAVJmr1x-RwJhg1-RmLaWxQ>
 <xme:1dDAYOg00cYG100SvTmyOENXdOJE-WJ31tiUw1PdjGJs7wt0l5hwdFJxMSVbl9NVu
 FAdXuCjSx1rCPK4p30>
X-ME-Received: <xmr:1dDAYPlO3Il1vx55UZJnL6ulMHmuqBdz6JF2fN_kowAg_L1bNiABpe0xs7S_USbvZCBl1zf1m-7ejWsTRsoC-SRE6kONHeHkgoyJdmAsdMoK6spg70KA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:1dDAYCzCMKJ2oYxZDkHykc0CiJRePMF98NX8pSMQ8KeSYLDA-wDxZQ>
 <xmx:1dDAYBT5CULW13YWIZeaKripuZwvHfq40XJUx9WzoHQ5C7bWt0CP1A>
 <xmx:1dDAYNahXYuTddVcIFbW3N1Dy-w6BnBUGhngJvoiNmLw4z2yAgDung>
 <xmx:1tDAYAJnlbARKC3r2iM-ZxdYNsfSxRZKNjutnDW1_swWPlRpsg_gJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 10:31:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 0/3] ALSA: pcm:firewire: allow to operate for period elapse
 event in process context
Date: Wed,  9 Jun 2021 23:31:42 +0900
Message-Id: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
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
 * https://lore.kernel.org/alsa-devel/20210609012244.24296-1-o-takashi@sakamocchi.jp/

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

Changes from v1:
 * fix context section of kernel API documentation

Takashi Sakamoto (3):
  ALSA: pcm: add snd_pcm_period_elapsed() variant without acquiring lock
    of PCM substream
  ALSA: firewire-lib: operate for period elapse event in process context
  ALSA: firewire-lib: obsolete workqueue for period update

 include/sound/pcm.h           |  1 +
 sound/core/pcm_lib.c          | 71 +++++++++++++++++++++++++++--------
 sound/firewire/amdtp-stream.c | 46 +++++++----------------
 sound/firewire/amdtp-stream.h |  1 -
 4 files changed, 71 insertions(+), 48 deletions(-)

-- 
2.27.0

