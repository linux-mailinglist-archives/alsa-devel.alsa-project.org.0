Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC661421
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE8D166A;
	Sun,  7 Jul 2019 07:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE8D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562477142;
	bh=8J3bOb0M10tqC+3jVzgQ/9EbqNW+Dhxgnf8AchMiI3Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nU1wzAw0h1kHlrqEMOZwaiXr//j+VdyjEVe8Kc9EmZfendh1Nlh7jhmFEc9boo0RG
	 M4jB+FfcwkwZSW7TLXXYFIcZLgJdGpny3reG+SYmEPIk48SzwmwyOrYfaE0llF5F2n
	 kbgt14FUY5fL4RofQ2R3PZZ4SLxYNgcyKVrQE9bE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E93DF80307;
	Sun,  7 Jul 2019 07:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B6EF80271; Sun,  7 Jul 2019 07:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B3AF80212
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B3AF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="r+DfAAuQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="zNsfN/bL"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2BBBF449;
 Sun,  7 Jul 2019 01:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Dg0W0bz49Axhu
 JaR5b7gKQWfczCrSqS9pn3IAvNOQHA=; b=r+DfAAuQvmOdIgJkmc/ohq5eewK3J
 /Sw4Usag8+7z251+cOnAWPOLNI6bjleXpkRRbLLyLF/iVlLfkxy2zCrS7p1lPAfz
 gz4bsSG6SJeaOy6doGtCcchEUAe7tKVuKREn8wUAti8Z8i9W0zZaV/cgUfgw+Vha
 3m7K3EZfobDu3UuUrYJHbvBWpnYF6X9cy2+bFydwCfESWs/OLyP1tHRK7lybG+su
 ITlNMhhWBk/Skt8//MFP3UnGCdkjl2THHUwplKGQJjyALYJUJe/lwxczFpdR9M2L
 t8arDz65JoZaNg6Hai4wp117u/Ss6yfhdfMBv6lGznBPhBFtEPIHXObmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Dg0W0bz49AxhuJaR5b7gKQWfczCrSqS9pn3IAvNOQHA=; b=zNsfN/bL
 UNFRUbgc0XlUwxqunDA+ffKcAPq+KjmFsI+UuznWYSv31rxtaXxVfVgXNTCfpoad
 amdYTa5dKhc8oz4IAPecggYdigarhKsliGDGV2hz462IgQNhUsbewSCVgWEDG0VZ
 xeoCYsB8OT+JxkSIdK+nDuh3VkFX8jmesRnsce4rE8sJ5vkWn4bDZGaEhHvlWF9e
 WYtX/xgLmpmu4Ou8NrDXiuyzPu3IypruZ2Bqyq5YP2ouEUbBZnbkcbchaSoKdPbt
 2smbo4BIYU9izXlEDpWUTgjQkzb9pG52fTSMjbbey2YQ7WJiduFQe26y2VnFtwlY
 1i79Ctmao2Wyeg==
X-ME-Sender: <xms:FYEhXTmodjSSv0h1Z5Hp9BOTG9u-UwuJCrj0ldQdEv8Ha4xreRNMHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:FYEhXbHLWRVYKV9haylUiXSnFqG0QkQyXE3HJxF_O3OWrTQbvpH_Ag>
 <xmx:FYEhXUqtE8vN2NYIuAnnBXjeBPcg76un-qTJuhV3j96XBBP5LQEbJQ>
 <xmx:FYEhXf5NSCBVak3S04yvlL4Y2DSqkl71yBILHuF0KkLEAgYWPgdmDA>
 <xmx:FYEhXX5xD19LHpoLxoOyJqUx4AUQ7jdiqCXdsgOGo5XTj9gPYel52g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B15180062;
 Sun,  7 Jul 2019 01:20:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:08 +0900
Message-Id: <20190707052011.24687-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
References: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/6] ALSA: oxfw: fix wrong reference count for
	stream functionality at error path of rawmidi interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In IEC 61883-6, several types of sampling data can be multiplexed into
payload of common isochronous packet (CIP). For typical audio and music
units, PCM samples and MIDI messages are multiplexed into one packet
streaming.

ALSA oxfw driver allows applications of rawmidi interface to start
packet streaming for transmission of MIDI messages. However at error
path, the reference count of stream functionality is not operated
correctly. This can brings a bug that packet streaming is not stopped
when all referrers release the count.

This commit fixes the bug.

Fixes: 4f380d007052 ("ALSA: oxfw: configure packet format in pcm.hw_params callback")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index 9ba62778add2..92538ab06932 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -23,6 +23,8 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 	if (err >= 0) {
 		++oxfw->substreams_count;
 		err = snd_oxfw_stream_start_duplex(oxfw);
+		if (err < 0)
+			--oxfw->substreams_count;
 	}
 
 	mutex_unlock(&oxfw->mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
