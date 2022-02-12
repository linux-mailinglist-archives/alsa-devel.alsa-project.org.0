Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D04B32A3
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 03:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BCEF1816;
	Sat, 12 Feb 2022 03:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BCEF1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644632575;
	bh=1aM/AolbwfB8Dwa/GKVVhM3AjloUYTKqezDPBTfpsrs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QDEQJ4KkEnp4uZlcjTARAmNoH6RAVC5J3djuzceTb3HYqpdGIK68GI5yjji2d560P
	 UQk6UTLto11/t9AFJGMs5XEcIHYXSopK1h++6W8n81z6vOOv2usz1BetjadGxId6Uk
	 /OnHHRz/0amC09jMpPJOU4uY7WUEqKUEoCSsIsZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A38F804B1;
	Sat, 12 Feb 2022 03:21:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0052CF804B0; Sat, 12 Feb 2022 03:21:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A360F800BF
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 03:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A360F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pBtajA1I"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KTfgNKpH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 96AB93201D2D;
 Fri, 11 Feb 2022 21:21:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 21:21:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=cRHm2GhJlaNLqABTQI1t1w+2bCz5SKGqO3g6bK
 8UMd4=; b=pBtajA1I6pgzKR1auvViNuflvfBpKlGJA+6ZOMnvWsFSojrf9yTndH
 Rs+dggcqIrPR8MR/wFbhVI76wgH+erlYODcQRTStY02J/BWsIgjf8o2CEpUv7OrO
 sfoT+aK4Cgf3/m+Ux60+okacv16itS37WDhd1Ln62ppLnEmqnDBHjxIH2vUnY8Gf
 QuK0x0+4/nlsXhw5T/VUWG2IK0MvcnCRBYvEHwB+ciFeYhvSJl6+TgbNfmqyI2La
 xr30/ONmnd6Cq+it3tr0EovXyRU7rLlgXDcWKDu0jqIQf1VIPSmmMksguuM6TC2S
 4pvu5Tybauka/YKn7S5T9tNPgJKIFivw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=cRHm2GhJlaNLqABTQI1t1w+2bCz5S
 KGqO3g6bK8UMd4=; b=KTfgNKpHZkoGuLnUmQGBMpY7UkQIQYNwznMvIeJHpTpkL
 IgiPW/NHb99aG1u+TQ8Avv7pbYzlkWr/p13JdrYgvndD2ycI4Xlld3CE3mV9AgGH
 QIfhN3WG/lmAsQKMkJl0WEev8cU8UN0xoe9LfcZN9KPoSwNhMBx99pQ0DokOXR3i
 tK/RcZgWZS6rYRc+Qg9P9oDODGLFXiT7F2RUcmvcZfOdV9fEs3FXm6ZLeKgO+maY
 YxUV9Vjqm6OlNmAFFFz1RkOeTLV5vX0XxqzhBqHIEpGYz/5KCYKgLVK4onVyrysJ
 fLlk2nYX4V5GKgmcafyk3dxdfqjchDgRhXoTrESDA==
X-ME-Sender: <xms:sBkHYqcK7qMNW5nbufNxoz4YgG4E3MwBqISt-gWDzMHF3xeQspdgKQ>
 <xme:sBkHYkOv1pVt7sp9_SuAl_yXYUqxlsTekI4do0Pam0N-ufKH6z8NTh8ir2QdsVz2i
 OXa6ilPffY6yUJvshc>
X-ME-Received: <xmr:sBkHYrgpA1Gy5YcgvZl2OT21B1JvP_0TKYo9JsfrU0ycfsV1VprjA8_PkQoMPUA8iFn0qOfsdtGoY-qmBpFSAQO2IXo5YCHKJjpQsJKAWS6FrThZlFCz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieeggdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetieeuhfejkeekfe
 ehteeikedvgeefhffggfdvieehhefhheeivdfhgfejjeduudenucffohhmrghinhepkhgv
 rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:sBkHYn9_V6CgeO3i4WDnsRF2Gve6FOfGKHpUIGNyuHTjQoxgSZE0FA>
 <xmx:sBkHYmsnJcngHTFp3qAOQe5obyH7Kyqj2i7QUXKrTUwnYGZhB9h5ZQ>
 <xmx:sBkHYuGGxqfR9EMbg0JMIGF8AtY0VA4APGJBsqDaYTXjm46UKOgv7g>
 <xmx:shkHYqKHihHg8ePsurbu1UjYVnN7weHcc0TrNzIURrz_xVLjHAW3lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 21:21:35 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 0/3] firewire: assist unit driver to compute packet time
 stamp
Date: Sat, 12 Feb 2022 11:21:28 +0900
Message-Id: <20220212022131.199855-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org
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

Changes in v2:
 * Rebase v1 patchset to v5.16 release

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
2.32.0

