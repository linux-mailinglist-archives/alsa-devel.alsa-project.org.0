Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA06141D
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB6784C;
	Sun,  7 Jul 2019 07:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB6784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562477026;
	bh=FtME26vQaPThxLqf4JZ/+1ScFaNt4pfYf6Kmczexitc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrScZtDwQrd6T5LOUrGeMsfi+kc9z0DHyrA/wp/2ihMrdS9EjUtjTjk+bTJ0U2yDy
	 buw1kq5KB4u8MEihzTIFhOF+278Ge1/Pge1R5BxeQsHJX/EYUQ9LXUd67vL8URmaeb
	 UK6HONYYodM6peRgrhIESaK3LePA3u0qjz4OrPr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B03C6F80292;
	Sun,  7 Jul 2019 07:20:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1945DF80214; Sun,  7 Jul 2019 07:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B54FF801ED
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B54FF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qhM9Uh/u"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nXyK9g8Q"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 7212A1EC;
 Sun,  7 Jul 2019 01:20:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TQpqtMrPxDOjU
 4vvraiJ5y7S5TnNjx7PYjVTEsn1Vyg=; b=qhM9Uh/u6G/yxDSjsJYEucWBRwjZw
 yxIf5iH55aXOzSH28VMANQdSVaUIotGkZtVhMfSX1Meen+HuJcaeebOobbqf8+r3
 pL2z/cb6Rd3F5oiERpVc4p5sflD/COCXTTsC52yF5dnvrQd7G0IYjcwu6gN93H2t
 mukre6fHYWnMQO8zFwGFZC9jkZd1+BnY7eTGscd9SQ/MXX+wW6rUdPzwfI47FMBe
 j8scucZUryHarwrDT6k/2uX+vJw0OMaPsD5XZ5gGZWUHYP05Xdd9qbl1piIbZB7j
 51KnwW88e8nZDJi2hy1gqu1ZbDcWtyiyTRoEe87xhig2MhQSrJRXrYvdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TQpqtMrPxDOjU4vvraiJ5y7S5TnNjx7PYjVTEsn1Vyg=; b=nXyK9g8Q
 q6qIXH+l1Ceswtz7BK920EhklnwIZW8pO45DXhjFQdVifhFrG08cseWQBNo3p/0x
 FXSaQuP9Olz8JNCbgCxHFQaZ3oYzN2K+qAT5BpuFdrYSWb7C2mUPp8jJ857bFJMw
 zkE/FsXzwDkvdE5qpwCa+lbQEEKIoIXxAtf1s13hdAepJwl3bmQsGJCGjnGPP5L1
 9iZl/jhnLUdqX/KVc9sqpc9t+A94nRrabCvccn2krQe1PkUuI6YJGP//6oZcYEsB
 emgbA0RHJ1myhGO/7niSlmxjEUqATJTGe6T/B/Y5OZtrtRi1EJIBg4fRPR7Cb/Vj
 dH5Fgjl/tS+VKA==
X-ME-Sender: <xms:FoEhXTNXoKsauruxxYJqDbGJ9k1KN0R64PpSZqBVNUhr4vwsOeVtow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:FoEhXea5DdpVr1I7KoumR0ReqyYdjEdEbF8ZHQpMukyz93i4kBTczw>
 <xmx:FoEhXXsOo9Xa2ky7qi0O-jjZ6YNJDc5JeiTPDhyC3u65z61dCTs35w>
 <xmx:FoEhXVoDDI8RoMm5WQgVHRaAuUQ3IZjgRSEd-LZTWtWpuVAUBQqjtQ>
 <xmx:F4EhXSGvZAwKzulTjKTHNlY_bYtRErmT4YO-WQNspUvN_Neegr6giA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF7ED80061;
 Sun,  7 Jul 2019 01:20:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:09 +0900
Message-Id: <20190707052011.24687-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
References: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/6] ALSA: dice: fix wrong reference count for
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

ALSA dice driver allows applications of rawmidi interface to start
packet streaming for transmission of MIDI messages. However at error
path, the reference count of stream functionality is not operated
correctly. This can brings a bug that packet streaming is not stopped
when all referrers release the count.

This commit fixes the bug.

Fixes: 3cd2c2d780a2 ("ALSA: dice: reserve/release isochronous resources in pcm.hw_params/hw_free callbacks")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index 436f0c3c0fbb..30a0b8200160 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -22,6 +22,8 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err >= 0) {
 		++dice->substreams_counter;
 		err = snd_dice_stream_start_duplex(dice);
+		if (err < 0)
+			--dice->substreams_counter;
 	}
 
 	mutex_unlock(&dice->mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
