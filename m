Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5BE97A6
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:10:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7709922C0;
	Wed, 30 Oct 2019 09:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7709922C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572423043;
	bh=VSQv22yhXrgndULvuQg2GwNcaD47GYrhU2+uzY2lNAI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9HGngnm8rbJBcdnROpBHQCZSAHQunkjRudQbwRmHqmXAYoZjqzQxObxx0k63QSNC
	 JAVYIOiaGONUujgWrqtBDdur1ImggrH1HxvnNc3/P4HrLArz3xzR0IcvPj3ITZOUAF
	 bo9cOPNhE3EUPZLUV4khwFPc8W7XfeZDewl+WZd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FBB7F80636;
	Wed, 30 Oct 2019 09:07:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C27F805FB; Wed, 30 Oct 2019 09:06:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CF3F803D6
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CF3F803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VteVYoN6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Wsx13Yjg"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2940421EA7;
 Wed, 30 Oct 2019 04:06:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 04:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SHNibI4qN7Chw
 fUHFuomulByrRHZJ9Azs8yTi+eX3Pc=; b=VteVYoN6vcRh8UdfBDPzviMMp/G35
 Jkd9sA4bOplOnZgoOb5B+7Xmov6ebpfspQSrgu/W0z8dZmnLa3rvGM2zVb66skHE
 8JpcKBpTksOGtKmvaNEYg1+IZ40V4RD3fYMUQOUB6gg8fFeI4/GurPDY6GfxraJD
 yfk5DNxNboD4eyet60SKRLaoZnhPeg4ndOmrvLJAxYYVHxAW/1Ss/Lnt2WrXUeGU
 h+IxoDYvS8sYspwxxrhQd/+5S7aUtCXBE+Kihv7x3A24smd0bqgyxbG8BE9lHOjE
 hfi+hF7PH9ik0vqz1Sknbg+WDVJU0azobZAJsnYbLYp9YQiSQPEifjnIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SHNibI4qN7ChwfUHFuomulByrRHZJ9Azs8yTi+eX3Pc=; b=Wsx13Yjg
 o1l4ByOmBF2HX37sVbD7CZfgLUw0raUDP3br2DGDqM13FM0IIqEV1uxjVxoMe8wn
 u8IlW/tdLsnaRsDoHB++tkFuTfpui6QdyizQSw/hjS70bTgdOzf0LapcYYNOGkF3
 NqYtEqzEuUZIGpKi/ZW5SdcPIjb+P2/hinbA1lEOB1COgpztI7tpJgU7xp9rgc+W
 n0PBJyxjt8twhCWyFNg137/9rJqLIVfzfptDWOxQoJmILIRq4C9v55dOw/8G9mXR
 PokYSwn+v6zZ9T/IWgrr99OOZvgWZXRZujU68NguFHeMHOFcDBXZKF9Pwou3eLnU
 wVN0Hi/LG5HJVg==
X-ME-Sender: <xms:nES5XSKoBsNdbpZMCLs6o9j3244_2erpIJ5cui-dsWvpUXMyqFMoeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:nUS5XQss4pW6ZU-fhn7fwnD8Ah3h4fFCgrrSqCvP5YPa6Ntm_AGaLA>
 <xmx:nUS5XUYA5j0-NZ0kP4QnRF6XhjCfwCWQWX0t4hRt_uvBnnkFILG5ew>
 <xmx:nUS5XQ1UpKWJQI0Cz01cZ8ynrF1BSb8au9jHMDA_zAcd8XPsvg1efg>
 <xmx:nUS5Xe7TEK9DzGJQm7IZrCm9E4ja4uUc15BkhvWX55Rjy2QVnovUAw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC3AC306005C;
 Wed, 30 Oct 2019 04:06:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 30 Oct 2019 17:06:41 +0900
Message-Id: <20191030080644.1704-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
References: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/6] ALSA: firewire-motu: detect SPH source of
	sampling clock
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

In MOTU FireWire series, devices have a mode to generate sampling clock
from a sequence of source packet header (SPH) included in each data block
of received packet. This mode is used for several purposes such as mode
for SMPTE time code, sync to the other sound cards and so on.

This commit adds support for the SPH mode.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-pcm.c         | 3 ++-
 sound/firewire/motu/motu-proc.c        | 1 +
 sound/firewire/motu/motu-protocol-v2.c | 3 +++
 sound/firewire/motu/motu-protocol-v3.c | 2 ++
 sound/firewire/motu/motu.h             | 1 +
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 55d3d6661731..490408b49157 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -159,7 +159,8 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	// When source of clock is not internal or any stream is reserved for
 	// transmission of PCM frames, the available sampling rate is limited
 	// at current one.
-	if (src != SND_MOTU_CLOCK_SOURCE_INTERNAL ||
+	if ((src != SND_MOTU_CLOCK_SOURCE_INTERNAL &&
+	     src != SND_MOTU_CLOCK_SOURCE_SPH) ||
 	    (motu->substreams_counter > 0 && d->events_per_period > 0)) {
 		unsigned int frames_per_period = d->events_per_period;
 		unsigned int frames_per_buffer = d->events_per_buffer;
diff --git a/sound/firewire/motu/motu-proc.c b/sound/firewire/motu/motu-proc.c
index 4e5767c0c8d7..b47ba818343f 100644
--- a/sound/firewire/motu/motu-proc.c
+++ b/sound/firewire/motu/motu-proc.c
@@ -19,6 +19,7 @@ static const char *const clock_names[] = {
 	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX] = "S/PCIF on coaxial interface",
 	[SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR] = "AESEBU on XLR interface",
 	[SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC] = "Word clock on BNC interface",
+	[SND_MOTU_CLOCK_SOURCE_SPH] = "Source packet header",
 	[SND_MOTU_CLOCK_SOURCE_UNKNOWN] = "Unknown",
 };
 
diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index a42f77fc3858..2757e5b42b9b 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -114,6 +114,9 @@ static int v2_get_clock_source(struct snd_motu *motu,
 	case 2:
 		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 		break;
+	case 3:
+		*src = SND_MOTU_CLOCK_SOURCE_SPH;
+		break;
 	case 4:
 		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
 		break;
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index ba5794c724be..d1545e2b5caa 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -104,6 +104,8 @@ static int v3_get_clock_source(struct snd_motu *motu,
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
 	} else if (val == 0x01) {
 		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
+	} else if (val == 0x02) {
+		*src = SND_MOTU_CLOCK_SOURCE_SPH;
 	} else if (val == 0x10) {
 		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 	} else if (val == 0x18 || val == 0x19) {
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 08e3d568221d..bd782ee4e763 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -104,6 +104,7 @@ enum snd_motu_clock_source {
 	SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX,
 	SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR,
 	SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC,
+	SND_MOTU_CLOCK_SOURCE_SPH,
 	SND_MOTU_CLOCK_SOURCE_UNKNOWN,
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
