Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DE24F24A9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 09:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D36172B;
	Tue,  5 Apr 2022 09:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D36172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649143459;
	bh=whN6KUlmJ+HI+gsnRw2UCOiHOfTfrGaZxVZztkjyQJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DENS/c7Aqk/EhxR6tRT5Bh+DRjNKzdiJChkAXAy978A40IHRbIC6K+atH1RUjVmZH
	 ZDKb3B7iu7m/XpJ0iHIMwsB06ZqlHsMBYzFaNAW/OM2TQPGZzj1RBZjzhnwIllMIPm
	 xOjWv+JUf7IloWMQvg6Ha/4HmTXd+lemLQHBMRoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C40F8016A;
	Tue,  5 Apr 2022 09:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43FB2F8051C; Tue,  5 Apr 2022 09:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9BA6F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 09:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9BA6F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UyCaFsUX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fGK3SWDN"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 337113201FDA;
 Tue,  5 Apr 2022 03:22:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Apr 2022 03:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=o7GPWHgucS1rZvbmWg0v1GuoxnSdg+/jvnAYJw
 h1Uuk=; b=UyCaFsUXPcdY85dXWfVx2cl0u2KIgQ7EoaMMmrun/7KpM3bc/LvQJG
 8ioK+LrTl+/82rDVkNKVGazRPtUJnc3G+nGUbXbqRkEEur7ZFN8oKoA+Gno0d2yZ
 HXfd8H4bFMLH1JYN9H+OA1yBp4elOnzFV7Ot5DG/H45ccMTZ6Lqd5ZO0UDe15YRk
 4fKqBzdSxx+/GUQc4mDMvICZuiMwWEvL9tJ7tpFHiR+4x6HeBIWwqJ0qpJSb4pzz
 U4/+sF5WqWP4esU/jJTgZB5nDjrCYSustUiK2l/4noV0Qlnzn4P1xMDgWMrdeHj8
 6kqrMEVxTx1S7sAObJuBiAVlBCUvA8Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=o7GPWHgucS1rZvbmWg0v1GuoxnSdg
 +/jvnAYJwh1Uuk=; b=fGK3SWDNx38GTdzKEuWdFnPfaxbkwW49Ch0k+CwgZ+ECi
 JeQB1kLooqUCURcPs6uH1+6PGMlgU0XP/yfi10TwAThqnvjnySjZC4r4np3wKQW8
 Cfj/3kuKZG3bLI3hoNdATlQoT6qhjlGgBcxQibOTxEIrFGCa35LSGcZA0YMtt0/p
 EpvDQPKVFb5931N3GRiZMPOLsK1lYTpZ0uBZ7c1tBcVI6TbL7Hi5m7G/WPPtOjIE
 FYhWhMeLyQ0hdDi6TyNc/xZ33qWrxa6HITDC7R0dsEDU8BvJFUdJYKoavEjwbHfB
 vJ9c6V8jdG7TdZkEWSMEMFqJkfmwstOCcKa0pWg+A==
X-ME-Sender: <xms:Ne5LYt2m5ozFJh9f54RzG_cxKqEc6zQHlGKz726HQ6jrYfHANy3eqQ>
 <xme:Ne5LYkG20fmVCv38GdgkPtoqUkh9TvUt8kTd4MzSeaDRII8ySZESXtI4GXR6O90c0
 oWONeaEcZ3aCt4a1UM>
X-ME-Received: <xmr:Ne5LYt5XVSFlNi5gnbxfklR0e6N4eAq1SwtipOqA-p2dfKl-hVWrVSvZ1nU5E6EaDJWm2nnlADvKhJ3uFQxHgpJWIGZwnPjsOq1j_7J6e8IeRv99S3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetieeuhfejke
 ekfeehteeikedvgeefhffggfdvieehhefhheeivdfhgfejjeduudenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Nu5LYq1J06ck6LTUjAF9OxiSoNcRNBGg2PIbky-gSte8zmOJ_aR8QA>
 <xmx:Nu5LYgGR53ZpnXK-ux0LmpHjhDw5ZRuo0o6VctQJWMjLj1ABh-julQ>
 <xmx:Nu5LYr8_srj-pT-iEhGejKYlS6D9wDvJB4NZ0VLml_L5VNO_Xex7bQ>
 <xmx:Nu5LYqP9VhEETggYWYhcSUkZPkqW4ay-ZqLxTWjlgFzTxRqVXyOeMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 03:22:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 0/3] firewire: assist unit driver to compute packet time
 stamp
Date: Tue,  5 Apr 2022 16:22:18 +0900
Message-Id: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
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

Current implementation of Linux FireWire subsystem doesn't allow unit
driver to operate content of packet in IR context according to
time stamp. Additionally it doesn't allow unit driver to read current value
of CYCLE_TIME register in OHCI 1394 controller. It brings disadvantages to
drivers in Linux sound subsystem in regards of handling time for sampled
data such as PCM frames and MIDI messages.

This rerolled patchset is first step to improve the situation.

Changes in v3:
 * Rebase v2 patchset to v5.18-rc1
Changes in v2:
 * Rebase v1 patchset to v5.16 release
 * https://lore.kernel.org/lkml/20220212022131.199855-1-o-takashi@sakamocchi.jp/
V1:
 * https://lore.kernel.org/lkml/20211202113457.24011-1-o-takashi@sakamocchi.jp/

Hector Martin (1):
  firewire: Add dummy read_csr/write_csr functions

Takashi Sakamoto (2):
  firewire: add kernel API to access CYCLE_TIME register
  firewire: add kernel API to access packet structure in request
    structure for AR context

 drivers/firewire/core-card.c        | 39 +++++++++++++++++++++++++++++
 drivers/firewire/core-cdev.c        |  6 +++--
 drivers/firewire/core-transaction.c | 18 +++++++++++++
 include/linux/firewire.h            |  3 +++
 4 files changed, 64 insertions(+), 2 deletions(-)

-- 
2.34.1

