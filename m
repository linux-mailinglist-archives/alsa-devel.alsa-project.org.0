Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0116141E
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8790A1663;
	Sun,  7 Jul 2019 07:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8790A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562477063;
	bh=3l2hsjIyTq42jzravrsvCIqEnuR1sYWAZSiqOsH3TDw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKUv8UVMuvPxUuwXR8WhnbioJLsb8oJvKKV4VzdV7rgzJgjmSnKHA3vytU15L4BqE
	 2dF8LqyBi36l8B3iHOg9Uu1gDuL11dNngIOtaA9laWCjVWwSCLjbb1x8zEnu7mwtfR
	 KXoI6iKf8a87p0oHXJgRyEW28ANwWItbfKlgwg6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 535AFF802BC;
	Sun,  7 Jul 2019 07:20:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91380F80213; Sun,  7 Jul 2019 07:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6424BF80227
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6424BF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mAWyMi53"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lEIweD0H"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 9EC0343D;
 Sun,  7 Jul 2019 01:20:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1GS8KEvFfjaOF
 /81BwbYx/Ql+TzEGMFag7nkBMH1cWk=; b=mAWyMi53zhJQpiml4BBnGq3HA6zw0
 NdIp5OnKUROiUEgfA1S1fwLTKeyU6N/sDskts/bGlaD/gjQ8QE5HuwKvnDVOj6KO
 Q744j9e5dI5IYIPtpyDdKiHAyeyHmRtX9+Q41HChHOeq2OmmKUlVT35/BHc/KGuB
 2LFQS6qlMu1mbRHiieZTC+R40bEY1Le5bKLLSvZe+W4RAQCOGxQa5mc7F/L9Tu3e
 0WKBXGRpIBZ+2MELupA+kBIPvA+idaPHgAlMqFskjo8Bd+ERtCt5C8x/okctWQWB
 uMJA/fAijGNk9enegReC4kkJl/YfhALukB53B9ineLGArLCiUOPKhj8AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1GS8KEvFfjaOF/81BwbYx/Ql+TzEGMFag7nkBMH1cWk=; b=lEIweD0H
 ds5yzlmqZxnSU474A/EkKO/iaVoovc0gK/CSL3rEfVkWeI6MnrHbFq0mEs7W27Bd
 bLhGxFSmrP5B7ISEBCVus3S1ym41ez9IPQUiuZKdyzrp0KpWw/aRktDvCt/AKWBj
 DJAGF7N0h4QxKFJ9IwHjXJuhQiWJz80fdIE30trt+v+mygLUOhqpWarFt2vXxF4P
 IfvYCDmW3xTxuwk1/EpSYE4/ykASuedy/n+JU5uIokeRgOHN1tTxfqmJNOvWtStv
 eH7RWGGlQPByC7g6EsBHnaVGe7AV25TtkoqeXe0GRvnxwAGHjUE7jXhCXlyyoHJA
 4Xo/1jU11AgIgg==
X-ME-Sender: <xms:GoEhXd5iB3CNd9N6wDmeNbDj4ODZnQ0Gn4iWLXGMoI8rZUmvGgyelA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:GoEhXYXSelH6vEEcpsT3EiQOFNSlViJ-5wmy4WKtyxTOJ3ETBdiP6A>
 <xmx:GoEhXUbcW5Ep-m5wnZW0O1jK56BvYawOGdtG7tWvrHOLI-w4naGx8Q>
 <xmx:GoEhXXxG0Jo37lY6h_RoZ1pRS7LMEKfgqAg1tPzTUEFoEUa4QbO86A>
 <xmx:GoEhXQs29mL_u_S9yID3rqPSDA2KKj3ID4O_tMGlldkJMtydQ742og>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id C902A8005B;
 Sun,  7 Jul 2019 01:20:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:11 +0900
Message-Id: <20190707052011.24687-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
References: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/6] firewire-motu: fix wrong reference count
	for stream functionality at error path of rawmidi interface
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

ALSA firewire-motu driver allows applications of rawmidi interface to
start packet streaming for transmission of MIDI messages. However at
error path, the reference count of stream functionality is not operated
correctly. This can brings a bug that packet streaming is not stopped
when all referrers release the count.

This commit fixes the bug.

Fixes: 8edc56ec8f14 ("ALSA: firewire-motu: reserve/release isochronous resources in pcm.hw_params/hw_free callbacks")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index 4520c0060b83..5c77e417c627 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -22,6 +22,8 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err >= 0) {
 		++motu->substreams_counter;
 		err = snd_motu_stream_start_duplex(motu);
+		if (err < 0)
+			--motu->substreams_counter;
 	}
 
 	mutex_unlock(&motu->mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
