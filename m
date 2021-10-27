Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB843CA38
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 14:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2452316B0;
	Wed, 27 Oct 2021 14:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2452316B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635339497;
	bh=O3i0khfu7utppplQhx9V1l67JX8HqlTjx0fQePr8Oqo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dis16Z4suiWHScAld1Irl8nE8Iuqn+zmdqkUwjhKUPSwRSsQO35Hht2jO5VSYZXPR
	 s+uhnEKpblDeTGNDbqs4rXsc8C262RMd3gn1+zYpu4VTdEhraQoeKTkcsEwKdhFQf/
	 AghdEGctfCatfdDyXoOqdd1pRO8KOnzowZ6wMNEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780C3F80271;
	Wed, 27 Oct 2021 14:56:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A974DF8025E; Wed, 27 Oct 2021 14:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47E9CF8016C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E9CF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="M8iQQXd+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VNy58LXd"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E2DF65C01B5;
 Wed, 27 Oct 2021 08:55:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 08:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1bv6/YM+Satgn
 2IldKGW76/6iBaFtk08y5ZDUCZZQUw=; b=M8iQQXd+tFJFPu3iX7fGTWAKgYU3U
 1ttMxHIOkW6B/Cr4qQXldyDAMjTiaC3aapm/deytweQSNsenSMpOWfprCEnOnUyx
 IaN10ykBGj8iT/RqsOuwaut7vFEy87nIXzrbS0TZeGu9YSv88y7n/CTH5DHr2nti
 PGYGFkf130uhbg0V1E1a/ttH0oT7H75H+PFFZ2spKCM5DdAHKU9ytnVViaqFbRKa
 a2H+joUBx9JGf3WgtfE7c41trqL4LUZSXWKkh7L1Pro5tLAM+hr0qkbUn/UpwHzr
 IaRqb6zWXkO3EvTtDeX5CR1Q+J/mD3eQ3OSvBTV33SMUTzkASVV8EFuqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1bv6/YM+Satgn2IldKGW76/6iBaFtk08y5ZDUCZZQUw=; b=VNy58LXd
 wupsSfS0HdWHxTc5cbAhEp+9lSXTWY/2so9NyzrwNalDz1/OQCAUm6jPKASiTQFy
 b/6q0XFnNEUIyaSNh5z0uWbLaGc7+YElLexnrxiViQLJGM32KaUDsFMZ4Yy1ja7m
 HRgHacd8otxzo6BmKDb+Kx8OLMjbw8XqCZedxacjQGfHnkUdwEASfzRJ0slK8YRn
 wD5IbcJV5OosEB3ZaIX7MYdWX4DhRJJ1Zyf0Mqpkam74IrxilH4LW15ddFNaiNeT
 Q5H+jl4gONfcwg/RfF8ziYCjqI72h4lzcMaQu3PX4yMkm9zr+d8j9qAc/f2uDKzO
 tdzJeFRyDfD6Qg==
X-ME-Sender: <xms:TEx5Ydw6O6v5fPWXsIBEcdsb-OOeh0E4xNsuHNt9SN18UevGSuLlMg>
 <xme:TEx5YdTT33GgHVBuSKOxgVZ_kziud5W3WicAsZoiTyHhMwVJXj3NjYLBvuXXIY_Go
 rgBzpwbz7hvVv5c288>
X-ME-Received: <xmr:TEx5YXUBbqvKwHSjc-ulLycgZrVA0Eu-sDLAEBHw85_6SAGP2h-Mora_yKGd6v6Qe4_KxwpTZ2o5w9LjAtOEiXTxjDo1jv9rfB4IHAjBkzB-e3VincG_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:TEx5Yfgo5eWyKFTeiWeTXnCY8Vd3uvVABI7PLsNS-oUZy91C0efQTA>
 <xmx:TEx5YfAFRdauJ1sXVDlLOe8ply5ZaUXiWa8_9Ixh6ppnl-Y0iOKFPg>
 <xmx:TEx5YYLD31hUvvoKj-TRBLlKm585_rxAc6gJjjKKEtrzPtt7ln9PUw>
 <xmx:TEx5YSPhECY8KNVFqhGYMA5WEVJ2Mr2IlX_nUaV1f46-Vgchuj0eDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 08:55:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: firewire-motu: refine parser for meter information
 in register DSP models
Date: Wed, 27 Oct 2021 21:55:28 +0900
Message-Id: <20211027125529.54295-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027125529.54295-1-o-takashi@sakamocchi.jp>
References: <20211027125529.54295-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

After further investigation, I realize that the total number of elements
in array is not enough to store all of related messages from device.
This commit refines meter array and message parser.

In terms of channel identifier, register DSP models are classified to
two categories:

1. the target of output is selectable

828mk2, 896hd, and Traveler are in the category. They transfer messages
with channel identifier between 0x00 and 0x13 for input meters,
therefore 20 elements are needed to store.

On the other hand, they transfer messages with channel identifier for one
pair of output meters. The selection is done by asynchronous write
transaction to offset 0x'ffff'f000'0b2c. The table for relationship
between written value and available identifiers is below:

=============  ===============
written value  identifier pair
=============  ===============
0x00000b00     0x80/0x81
0x00000b01     0x82/0x83
...            ...
0x00000b0b     0x96/0x97
...            ...
0x00000b10     0xa0/0xa1
...            ...
0x00000b3f     0xfe/0xff
...            ...
greater        0xfe/0xff
=============  ===============

Actually in the above three models, 0x96/0x97 pair is the maximum. Thus
the number of available output meter is 24.

2. all of output is available

8 pre, Ultralite, Audio Express, and 4 pre are in the category. They
transfer messages for output meters without any selection. The table for
available identifier for each direction is below:

==============  =========  ==========
model           input      output
==============  =========  ==========
8 pre           0x00-0x0f  0x82-0x8d
Ultralite       0x00-0x09  0x82-0x8f
Audio Express   0x00-0x09  0x80-0x8d
4 pre           0x00-0x09  0x80-0x8d
==============  =========  ==========

Some of available identifiers might not be used for actual output meters.

Anyway, 24 plus 24 elements accommodate the input/output meters.

I note that isochronous packet from V3HD/V4HD deliver no message.
Notification by asynchronous transaction to registered address seems to be
used for the purpose as well as for change of mixer parameter.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                      |  5 ++++-
 .../motu/motu-register-dsp-message-parser.c        | 14 +++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index e52a97b3ceaa..68eb0e43c052 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -141,7 +141,10 @@ struct snd_firewire_tascam_state {
  * up to 12.
  */
 
-#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT	40
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_INPUT_COUNT	24
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_OUTPUT_COUNT	24
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT \
+	(SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_INPUT_COUNT + SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_OUTPUT_COUNT)
 
 /**
  * struct snd_firewire_motu_register_dsp_meter - the container for meter information in DSP
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index cbc06b3b70f6..0c587567540f 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -335,11 +335,15 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				else
 					pos = b[MSG_METER_IDX_POS_4PRE_AE];
 
-				if (pos < 0x80)
-					pos &= 0x1f;
-				else
-					pos = (pos & 0x1f) + 20;
-				parser->meter.data[pos] = val;
+				if (pos < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_INPUT_COUNT) {
+					parser->meter.data[pos] = val;
+				} else if (pos >= 0x80) {
+					pos -= (0x80 - SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_INPUT_COUNT);
+
+					if (pos < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT)
+						parser->meter.data[pos] = val;
+				}
+
 				// The message for meter is interruptible to the series of other
 				// types of messages. Don't cache it.
 				fallthrough;
-- 
2.30.2

