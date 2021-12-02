Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A24B466268
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 12:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B0A2580;
	Thu,  2 Dec 2021 12:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B0A2580
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638445021;
	bh=7FHLAtYKCz7fj7tTnXgrqZ0cdp7sTBU0ENzh40KyxgU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cisUujaySDw6ybxPEf2bSa64veTBjvMKNUNsIqjoYmC+HxTz2srD7eF8BV48mg252
	 XBgHxsnwp+hAUcQbEn/3XqoiUMazV8R9YLvYRU+quA/jqsLiDSwbbUw0ZKZ+MTP5K3
	 CvzxhokQ9mngOQxkd6rU4RJHLPyPd84r1GHetyN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F4CF804E2;
	Thu,  2 Dec 2021 12:35:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C8ABF800BE; Thu,  2 Dec 2021 12:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA273F800BE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 12:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA273F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LNyw9nr3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iwyrb1qC"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3F5463201EE7;
 Thu,  2 Dec 2021 06:35:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 02 Dec 2021 06:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=MWDOJiV7eBjWcPXOnu0j5XNbpz
 BsWzhlK6tNHfjT1Kg=; b=LNyw9nr36KA0eyni69wBg2vuM1wXOUh5BTEIGrVX56
 nuznzaKvnEAPwWi5G9HzoNDeZS/RKrmqsQYj3/adcnlufbJB2tK8FvGFhr1pCKUB
 DcJok7uqPdEE8dG923rhisDT+3bkEQUW/xh1iZSv3OXfVNzrNYtegvOk+4SRP9X2
 gIKFcckcVwmCUgdSeA6rMfXBfobD023Do2nAkDMopsuavD5lnFto+kJCJJKGaRTv
 v3DBE4un1xRHNhiWhsxx/BmVb6M/gQm2BylQsQoBCcaYDs2vO7nsAy97ZX2cwUie
 ArPqB2pZ50UjaMuZ04OpSD3Ud/1n8zUZ8QXnDA90b1UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MWDOJiV7eBjWcPXOn
 u0j5XNbpzBsWzhlK6tNHfjT1Kg=; b=iwyrb1qC0yZh25MM/6bB9X72K/6jokl0i
 /bl98rWGP6KH6n5kZ5xK00oZxvRwYopuBnPuGVhUKXiOK2tM7oT5iyppkl+Fo9vY
 Qbk6YQFiUVMIzPbkJcW+sb6EYSKGxEk9BPkgEl/H2PNhYGFA0A83wqV2LZ68/6B8
 N3TK4iMBjKe7S8xP4lQqOG1qTN4f7It/GD0qQT79WFYDk46DJwDNsWtyJPZxG/Mz
 oBB7HNgNvapW8tojTel0KnwteFOT5bKhcvpSTth/qnmuilZKwUyJC1qSryPYLEjG
 mU4D/TaRmub5EQBAYDueyWCJHKtCHj0o/bQ2AxAqIHzxeuKvDJS3g==
X-ME-Sender: <xms:Zq-oYX7ZkaV_lTw5dPGjow9LRTNRA3YPkJMTg0NwLnKBdhF9zIaROw>
 <xme:Zq-oYc7qnpSRUeCgPjx7Hrrt62N0-CW6nSwfy4zp3kMZaRhQZMFRluPW6DodPi3iV
 F1lyxttaoQ_ivMDIM8>
X-ME-Received: <xmr:Zq-oYedl5x_hKzGL_FqW7naI2B5UjMwzvno5DuY33PBrh3Jjhsc-T8o_vXxXOuG3Tr29aHof5nlhiYncnvQAei3jMUnBGwO5XxvDObQPwxRUrH-PcDwv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetieeuhfejkeekfe
 ehteeikedvgeefhffggfdvieehhefhheeivdfhgfejjeduudenucffohhmrghinhepkhgv
 rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Zq-oYYJZ6wLcEDDuWCnfhCc9AIlWwJelJFGN9Zu-CwWU-TM5U4AyrQ>
 <xmx:Zq-oYbKsuyzHtogCRs2MvQriOJHqbhh93t_Pv5q4vj7f5Gl6BMW7YA>
 <xmx:Zq-oYRwQD7ovEoEP-gXySfSJ0ltxLcHAzg9inZN5SrqRyGF9FgQIRg>
 <xmx:Zq-oYYGgoMhV3_OC8HewPGIFDBZp4dwxD0rMc6YRW0P5PGsiKmk8Ag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Dec 2021 06:35:00 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de
Subject: [PATCH 0/3] firewire: assist unit driver to compute packet timestamp
Date: Thu,  2 Dec 2021 20:34:54 +0900
Message-Id: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org, marcan@marcan.st
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

In 1394 OHCI specification, each descriptor of IR/IT/AR/AT DMA context
has timeStamp field. The value of timeStamp field express the time in
which the controller accept packet. The resolution of value is isochronous
cycle count (8,000 Hz) with second up to 7.

I have a plan to use the value of timeStamp field for ALSA firewire stack
so that userspace ALSA PCM/Rawmidi applications can get converted timestamp
(ktime) for PCM frame/MIDI message. The timestamp can ideally express
finer granularity than the time to invoke IRQ handler (and co).

Current implementation of Linux FireWire subsystem delivers the value of
timeStamp field to unit driver for IR/IT/AT DMA context, but not for AR
DMA context. Additionally, the way to refer to Isochronous Cycle Timer
Register in MMIO region of 1394 OHCI controller is transaction to local
node. It includes overhead of transaction and it's preferable to add
less-overhead way available in any type of IRQ context.

This patchset adds two functions exposed in kernel space:

 * fw_card_read_cycle_time()
    * allow unit driver to access to CYCLE_TIME register in MMIO region
      without initiate transaction
 * fw_request_get_timestamp()
    * allow unit driver to get timestamp of request packet inner request
      handler

I note that Hector Martin found kernel null pointer dereference during
process to remove PCI card and has posted a patch:

 * https://lore.kernel.org/lkml/20211027113130.8802-1-marcan@marcan.st/

His patch is included in the series with my comment for relevant commit
20802224298c ("firewire: core: add forgotten dummy driver methods, remove
unused ones"). The patch is required since unit driver can refer to dummy
driver between removal callback of PCI subsystem and removal callback of
FireWire subsystem.

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
2.32.0

