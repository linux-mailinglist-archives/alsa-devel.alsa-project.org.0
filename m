Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C955B6141B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE41166C;
	Sun,  7 Jul 2019 07:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE41166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562476940;
	bh=d9dw/qWrK3iwsCgJ/xvSi9w8KKFM0sVs4PwxjEoUOIM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5CuPirjL6RalD4gnS1qC33wSPtAZZIp4E8TdxLv0swyW27nQEaPpTwZ3MsNcK0X+
	 XddlmEFZJ6Za5VXtgrJbJxe9uM3He59CepgPzxl/9R93pu9PRQHC5t/STMI495DxzN
	 JGCiezZKibTTwq/CmEad4AlK6xrSvRr8FNIQ8v2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08961F80213;
	Sun,  7 Jul 2019 07:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A20F80268; Sun,  7 Jul 2019 07:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 979F7F80213
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979F7F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="id6JucHP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="f3dfIWzk"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2A3E2447;
 Sun,  7 Jul 2019 01:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=DElPb+Qwm8r5D
 x7+d9vk8I/zQFFq5HFC8qjpggrmIfM=; b=id6JucHP3mZmPv/ssuRL8Jo4mRFRC
 sO672n0f7t+MKX72CwrxyIGhd68kJRW1zdFmIOCqbb+oz/0wWarlRx+up0/89DSC
 2tiPM8GyGFYi/xmNNflyp0h3bLrs5phRJnK+8XYzqmL0rn35fjkz35E+3W92xVIz
 XYwXfhhWh1LjVTMwaZAtXFdmtHBCVn+jaV8z27QmwAVo30LBkat9Fcp/JX/QK8wo
 Gb9VbiGFArizZnUfO3Ustb8qzcZOFdbOXIeJRGRhpzl1iKzXB81vDPgcJkScX/RY
 oTPAsAV37FJ9UdHdfGwvCEmqWlzJuADjvH1/kx33CHsFxxw/PJls+qung==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DElPb+Qwm8r5Dx7+d9vk8I/zQFFq5HFC8qjpggrmIfM=; b=f3dfIWzk
 mXG2qHNqj+HmIRMLMnzu0UrGWRZvOAaGnbmounASzytkvIyiIf0buauMBBdfsga+
 eJF52N+XLrElJF2qjkhjlEytlxCAZ4Ra7hllvAm+Pn/qY/D0xoz5oXjMtJtFZYwQ
 V11lnoFa0K8jWPKqmcNw70uhVLJxaaXbZHfVneCoH02DUKvlM5AGBynQRY4vnIhx
 j9RmHOezjyzyuGeGMDublBk3cKDLLbqw1HUvV5sLEWNiIa3tagRrU6p0W3AZ8Is2
 +9mbCu0Zi/2TvQzRfGRpATnPkcfobVEVJP4M9uKob7rJq0Pel6RA3ZVi/jXdgcPe
 BqKRvg5HmJCFUQ==
X-ME-Sender: <xms:EYEhXYtFWyEpVWxRIfhPNnIrNBdkwOdhhsARF701PuXyTbMPSzaDOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EYEhXZtzoHs6faMYB3DfRHYJj-kNSgh23vNkAvPGRWth0TvP4bQfSw>
 <xmx:EYEhXexnvYke1Vku0mk6pfS7tQfwdxszvsN38f-td5hW7rmFVfxY6Q>
 <xmx:EYEhXfhQklV-A4o4Qhs4hDAJNhXXs42zV6eQ6Cxr2-BEfGfQZUs5ww>
 <xmx:FYEhXahsRwukE2GDP7gwzMDRraiBR3MCKeZeLZqHnIw_pRCWUUeq8A>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DA5880060;
 Sun,  7 Jul 2019 01:20:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:06 +0900
Message-Id: <20190707052011.24687-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
References: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/6] ALSA: bebob: fix wrong reference count for
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

ALSA bebob driver allows applications of rawmidi interface to start
packet streaming for transmission of MIDI messages. However at error
path, the reference count of stream functionality is not operated
correctly. This can brings a bug that packet streaming is not stopped
when all referrers release the count.

This commit fixes the bug.

Fixes: ac2888b958f2 ("ALSA: bebob: configure sampling transfer frequency in pcm.hw_params callback")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index f7db1f7bce86..f903271e93d0 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -22,6 +22,8 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err >= 0) {
 		++bebob->substreams_counter;
 		err = snd_bebob_stream_start_duplex(bebob);
+		if (err < 0)
+			--bebob->substreams_counter;
 	}
 	mutex_unlock(&bebob->mutex);
 	if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
