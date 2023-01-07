Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5F660BF7
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 03:33:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4DD54F31;
	Sat,  7 Jan 2023 03:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4DD54F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673058810;
	bh=baMWX7Ra11kIUpdqSsQTmQDxwSr5+oalYorS9hL1xB4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=uDfEmVCuXufI1edUJuLvEz1a8hCjgcarZ53i/y92alvVRbVLvJnrWD44uOOZxjK1c
	 UHcgoMsDGSBGNctf38RoP/HYWwPxaP+4E+kVL/t2ysNHz8r06WY2uh5ONbz07OnlRl
	 BUbaokBuC1sZJ6ut4IeqpT8muwiVHBiuSnb46yD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3729FF8024D;
	Sat,  7 Jan 2023 03:32:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B886F8024E; Sat,  7 Jan 2023 03:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3CC4F80217
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 03:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3CC4F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=TQhYIYT+; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bkPWbfXq
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 229033200657;
 Fri,  6 Jan 2023 21:32:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 06 Jan 2023 21:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1673058739; x=1673145139; bh=3THfYLHyjZ
 vI+FOrje600ocCUiDwxCXkVEdAyH8CAiQ=; b=TQhYIYT+cBMPFWHivAzkS63WPn
 wzmSh0FpPDXTquKpzcgK54Ag1TxLg4t4S8eCvijBQXnESONs5IIbPPoa+V9zN9+i
 B/02oLPoPbf6zs48HGSzop2n1nB/oDEIKYSqukk2UwcTJQBCacrOO8IhHt5STMuG
 +Z+70lBAgc8nWh8Zjx9iq5uofVkrpTyX9O9+9Pz4RUMiwwhUIG5N0VgvAgYELDcb
 iM8FNTvKdzZuFly44X3KWqpzrsghERdjOcyZpXrWtE8enK3JTiLgy7RvI0wXNOOu
 bNfFMeNjrtbP9TXdrPmHHRznYrkovCKea3+jGphL32i+b3vJk1LGN8e4zJGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1673058739; x=1673145139; bh=3THfYLHyjZvI+FOrje600ocCUiDwxCXkVEd
 AyH8CAiQ=; b=bkPWbfXqEkx2PSALgFXuomF9Tv9EFRLXV3Be+rjlNumTHLMxbg/
 fLAkUd49MzXcar33sLFSWgrrE+gxNOK8oozF0CrGxTXtqk1HpiUprTCBiRcZTTCX
 ZMiUFVS0dB/iKbURdrW/C94+wKo7XG3anAlwrAufueC2gZzwvXmXkofc/nuWPzze
 PGxGqllPzMRuTnQZwpuzSoBlgzGPTYFO+QoF4zB1mAr81N8iXyluQWt7Ad4uGGwk
 AYETLImH6nMrO8aHLPr9WefpCC/O6f+ayZeUPDwZx01lmNyIXhzHI/H3leY9fBLm
 EDrZbzw3z6WkpDVrQqnaykY5kCmbzzeDhLQ==
X-ME-Sender: <xms:s9m4Y3KnJCUUFE2GccSC17BOVLXMx7r4gYwW5_lgFZmll-UaRSN9dg>
 <xme:s9m4Y7LTGUBVG7JV4JBCTgagkBrJ957q6ryouGMMFu-LZgz4DFbbjiw6ED6OGfYtm
 2cJtmIG8Ay2aF-n36k>
X-ME-Received: <xmr:s9m4Y_tmqfqHG2A80KFQiFxth21xNP3Ryvckhyf19whUX5HC7-5iHNmJvSNiXlPvGMt78cm6degDMpVlTmpwkTbBRa4W_ScJJ6ZXVrvJurmgA89yfY3XwJI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
 duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:s9m4YwbH7crhfcGjNhCUtUYsRGrIVl-_8nNAkflciba4pKtLwvjfDg>
 <xmx:s9m4Y-bl2PEMTRa9wubUZErSBFcN_9zNrOMdDZvvU5UqhJZhLxE1Zg>
 <xmx:s9m4Y0Aj1byXZMsYS882lm0gVUCbovkrWDjBCmMsSJxf_TtqV67Hpw>
 <xmx:s9m4YxxteHAXTFugP_K8Gz7bR3zlVq2OC59RR7OmL9uEptnzCynRkg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 21:32:18 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/4] ALSA: firewire-lib: code refactoring for position of
 entry in queue
Date: Sat,  7 Jan 2023 11:32:10 +0900
Message-Id: <20230107023214.29132-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This patchset is to refactor current implementation for position of
entry in queue as preparation for future work.

Takashi Sakamoto (4):
  ALSA: firewire-lib: code refactoring for helper functions to pool
    sequence in rx packets
  ALSA: firewire-lib: code refactoring for pool position in rx packets
  ALSA: firewire-lib: code refactoring for cache position in tx packets
  ALSA: firewire-lib: code refactoring for cache position in sequence
    replay

 sound/firewire/amdtp-stream.c | 132 ++++++++++++++++------------------
 sound/firewire/amdtp-stream.h |   7 +-
 2 files changed, 66 insertions(+), 73 deletions(-)

-- 
2.37.2

