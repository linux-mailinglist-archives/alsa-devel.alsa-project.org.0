Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AB44D505
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 11:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E35561661;
	Thu, 11 Nov 2021 11:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E35561661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636626712;
	bh=6ryvcwuugkv1MteHQ1mlDIY8Bvepqzej5MAn2oD/yvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=otpPfHGpWtJrjYNhZY5KkA3KWitGOwWNOf1fScVdJwHInlm/2O1S9RwuJIKz5u80q
	 MZfVX5z1HrcuVR1ctbFKT2z1S3WHP+cbr+fsa1a75GJAk2tl0zDnTweiBSe7Do8GPj
	 qJWN0O52EvO8IhDMgiey3jGdt44Hrbg1e37tXDnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4523AF80086;
	Thu, 11 Nov 2021 11:30:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6EB9F802D2; Thu, 11 Nov 2021 11:30:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50F22F800C1
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 11:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50F22F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="m8LRApmD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RewpRZAC"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 94A8E3202135;
 Thu, 11 Nov 2021 05:30:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 11 Nov 2021 05:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=XNJWXfmHXQL4e9diX0tHCqZ+f1
 VOsLYB/zddVlEJ1u8=; b=m8LRApmDQ18x23EA5pytAxv0js8GW6AD5KtIEY+Yyn
 Rmq9hs4CAKldofWxPDqwbcs0eE+cVKrsIMXyNiwRB3n0JtyjWtLMsGIlUML6hwNz
 xq33wCP27GT/NxKrv5wOH9NQVWxe0vcLgVV2C5EOW8uFRzY4s9s7PZfXUAqMc+ES
 8b/85NlEaHzi/UJ+Ea408d3d4PUEKHgAGDWwZ+wB5P4cOyudsgN+qBqTbzNhDI8L
 Gv+aQVNAm0aAgaauoQdtPfxHj6K/kGwQEhd2Ry2FSh0XmrbOQLDymrQvWaB1l7RZ
 PkAScTG1kBmCYStQeIeTocIy13+XJhUAds7QCax394aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XNJWXfmHXQL4e9diX
 0tHCqZ+f1VOsLYB/zddVlEJ1u8=; b=RewpRZACE+1Q1cm8fFDND9XmmpIr496mv
 3m0jZ3o0v0H58aceFhJH5tXsaJ2Vxm6SyPwihnPsS0TYRD/ASmf5yN/7NlCyMCpd
 CT3cyJHTVkBpcgYx/qe8lEWXUbD2lc0rhYG6tK+o/7U4X5glRACIDu3TT5mQkUZb
 RRTJmPoe/eMEUFR64/XqMDvfpsRSeC7pcvh6agU8PoPwDB3ESF58KFSsqBsClN/2
 APpAJFLWweiEah8vZGAcSEZGAIDVgpaTs8iaBiWBzcAvYLQUoT8u5Em3rZfqV2st
 7QdemNrMtws4SoifaYu8ERDb5mFpzlzbx7OEh1Jy2bEhSYjF+0tcw==
X-ME-Sender: <xms:u_CMYc9q4m_HifOaj4upfrlIZMVaENXkvpXiqau_YRCvmbJFAf1PUw>
 <xme:u_CMYUuQJ1AEEsz3PeBx3kvEKZJ6ujNWOSGl143rxC8V1jg22Dkfn6DjHjKYyMkmF
 QBKkR1PtbeIdHm-OI4>
X-ME-Received: <xmr:u_CMYSAqALOD-sZbK1XIpwoudMkBHXmQZJU002wSvDPzgouFW8kfWth3Hst-34vq2UEergamt6gKoRPDQ3FFYUxXK_9ieOHEIYFHNCQ6fkT0ZQDS1dvj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:u_CMYccbTjdRrsdC8I3rSqvGWmEemRmZ0q0yk9neyx8qAq4UvGr9Kw>
 <xmx:u_CMYRNi7iKi3pj9mUj1dqA7gQHhwKB9XK4cnUrXbCstbA6hQxZR-w>
 <xmx:u_CMYWlwB3AwvkwSsMjAF6sMTnM0k7nueyk7ZU7s4CYXaJXfM-VNUQ>
 <xmx:vPCMYf04bFyhI5jz_WDM3fr3zwL7gBwo5MTnp5GyC19iCr4jbmfx9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Nov 2021 05:30:18 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: fireworks: add support for Loud Onyx 1200f quirk
Date: Thu, 11 Nov 2021 19:30:15 +0900
Message-Id: <20211111103015.7498-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
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

Loud Technologies shipped Onyx 1200f 2008 in its Mackie brand and
already discontinued. The model uses component of Fireworks board
module as its communication and DSP function.

The latest firmware (v4.6.0) has a quirk that tx packet includes wrong
value (0x1f) in its dbs field at middle and higher sampling transfer
frequency. It brings ALSA fireworks driver discontinuity of data block
counter.

This commit fixes it by assuming it as a quirk of firmware version
4.6.0.

$ cd linux-firewire-tools/src
$ python crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  0404b9ef  bus_info_length 4, crc_length 4, crc 47599
404  31333934  bus_name "1394"
408  e064a212  irmc 1, cmc 1, isc 1, bmc 0, pmc 0, cyc_clk_acc 100,
               max_rec 10 (2048), max_rom 2, gen 1, spd 2 (S400)
40c  000ff209  company_id 000ff2     |
410  62550ce0  device_id 0962550ce0  | EUI-64 000ff20962550ce0

               root directory
               -----------------------------------------------------------------
414  0008088e  directory_length 8, crc 2190
418  03000ff2  vendor
41c  8100000f  --> descriptor leaf at 458
420  1701200f  model
424  81000018  --> descriptor leaf at 484
428  0c008380  node capabilities
42c  8d000003  --> eui-64 leaf at 438
430  d1000005  --> unit directory at 444
434  08000ff2  (immediate value)

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  000281ae  leaf_length 2, crc 33198
43c  000ff209  company_id 000ff2     |
440  62550ce0  device_id 0962550ce0  | EUI-64 000ff20962550ce0

               unit directory at 444
               -----------------------------------------------------------------
444  00045d94  directory_length 4, crc 23956
448  1200a02d  specifier id: 1394 TA
44c  13010000  version
450  1701200f  model
454  8100000c  --> descriptor leaf at 484

               descriptor leaf at 458
               -----------------------------------------------------------------
458  000a199d  leaf_length 10, crc 6557
45c  00000000  textual descriptor
460  00000000  minimal ASCII
464  4d61636b  "Mack"
468  69650000  "ie"
46c  00000000
470  00000000
474  00000000
478  00000000
47c  00000000
480  00000000

               descriptor leaf at 484
               -----------------------------------------------------------------
484  000a0964  leaf_length 10, crc 2404
488  00000000  textual descriptor
48c  00000000  minimal ASCII
490  4f6e7978  "Onyx"
494  20313230  " 120"
498  30460000  "0F"
49c  00000000
4a0  00000000
4a4  00000000
4a8  00000000
4ac  00000000

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index ac66f08acd6b..53dbd4d4b0d0 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -50,8 +50,9 @@ static int init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 		     efw->firmware_version == 0x5070300 ||
 		     efw->firmware_version == 0x5080000))
 			efw->tx_stream.flags |= CIP_UNALIGHED_DBC;
-		// AudioFire9 always reports wrong dbs.
-		if (efw->is_af9)
+		// AudioFire9 always reports wrong dbs. Onyx 1200F with the latest firmware (v4.6.0)
+		// also report wrong dbs at 88.2 kHz or greater.
+		if (efw->is_af9 || efw->firmware_version == 0x4060000)
 			efw->tx_stream.flags |= CIP_WRONG_DBS;
 		// Firmware version 5.5 reports fixed interval for dbc.
 		if (efw->firmware_version == 0x5050000)
-- 
2.32.0

