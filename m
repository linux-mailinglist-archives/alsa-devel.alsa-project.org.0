Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489223805A2
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:56:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FAFF17A1;
	Fri, 14 May 2021 10:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FAFF17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620982595;
	bh=m+/S3H8Fd7K7Ydmc9PdOfJwDzU55PeMcbF8ceq5uQVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSVGBxa7nTKKxJ5CKSxrEU1O7RRB78yR0zT2UBW9MjQ+P7eP196qdgK6d5yotkH5z
	 b1qaoBBivEXr0bhhPjPzmskhCQPeYytOC/oSljXlqcOnIR30pE00UCxsneRXBX0i5X
	 AQCJF0iPJCS3J0Rb9/LdU85sofaHSBeulPVa2z6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 274ABF8020C;
	Fri, 14 May 2021 10:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 595C1F8020C; Fri, 14 May 2021 10:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB0D6F8020C
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB0D6F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WoaTWLTm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TjdVemHc"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C0C55C00F4;
 Fri, 14 May 2021 04:54:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 14 May 2021 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jz94ulqf9iplJ
 AQgpFQD+EtLKh4YR0GrnvodjB7vzRg=; b=WoaTWLTmlVHRn7qKBSsKGorFme2+W
 eB7xXQTFdXxxIvRuyz95hnft9Q/rogmV2glx9+IqtLiELJyWj3Htgu0svyP09/sO
 cwYCg9ib+3SWs0jbWse3WbI4z6dbEohkPW4aQtXVjf2Kr6yyWMnV4RReqjNIhurC
 gUYAlgr3YJYOI1c8cjpbtl5E62/c2xPyr3uQsIiDPnBIV7jH/z8HYvYIIgDkgPT/
 9BszdCa1I+QOb9YdD2CNoZFXD+YCNOZNoe+X7EHvOW3VstNGK6/jb8bmczm1pKKz
 mUw6Kk8T9CyCk6ozEoAaWVx23nLV55H6I5XsQ2Y7IIIbHqnPHrATaDCag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jz94ulqf9iplJAQgpFQD+EtLKh4YR0GrnvodjB7vzRg=; b=TjdVemHc
 wA1WKquc4SXHycRispaEfeCtuLpdoxLj1DTTVOwx3ml/73b2rs+RzH5XjGyh2wKM
 5Wo2aTcBGi/uzeXhRi3TBMtJq/t4h6FvvfhQB3NVDCgHPSiF5/cJ6GyGgpiWfGDT
 3aIG4hMTf6KaSUbmqu4LQF4Ko/2iCkD1toEBw+L7cLAsU4x4M75MeRA0xwcuD/ll
 F1Emh7arvrm4P3nAp1wRSh1jS0XnYNpZfa8YJEpxjRYfxnoJ44/A0JcHfRrsrD9n
 OK86knvIPbNvPRNY6n/kf3lBF0TkhSlS6Tia79JiCjIAFsSSR1ijHD/6StuOf/Xw
 yEB6uWusOtKdhw==
X-ME-Sender: <xms:0TqeYOxsL86TdzmcLQY1KeFhzLFLuat0qfs-5Zk9c5NsJyhBobRflQ>
 <xme:0TqeYKSEk7_fRYvgdieKhSjiL22QwrnF5goorj1Rs31od_zGIuQ2bElwTWLBQ4Kus
 xicdcRob5BIppxIHDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudeg
 rdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:0TqeYAUqi5GrlyLDd7qgjKxDcJEk22DQGxwM4VuotQBtzNfVskumsw>
 <xmx:0TqeYEjOgFcmgIrmuw-WWNLFPs0M_XWYLL4rsqKQJu7O2CxMZ7fbNA>
 <xmx:0TqeYABJ0NFR85TaMpVO03fq5tidLkkygkZV3u_he9ui9R6CGhT67g>
 <xmx:0TqeYLqiD4h2eOjmpPZKMxGf9-iREY8fwRhe4nB1pwIpRmoZ1b6dhQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 14 May 2021 04:54:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/7] ALSA: oxfw: code refactoring for existent device entry
 with specifier_id and version
Date: Fri, 14 May 2021 17:54:29 +0900
Message-Id: <20210514085435.92807-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
References: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
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

All of the devices known to be based on OXFW ASICs have the same layout
of configuration ROM, in which unit directory includes vendor, model,
specifier_id and version immediate values. Especially, the pair of
specifier_id and version is fixed to represent AV/C general protocol.

This commit refactors device entries to fulfil with these 4 elements.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 82 ++++++++++++--------------------------
 1 file changed, 25 insertions(+), 57 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 9eea25c46dc7..f01c8bfd71cc 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -320,36 +320,24 @@ static const struct compat_info lacie_speakers = {
 	.model_name = "FireWire Speakers",
 };
 
+#define OXFW_DEV_ENTRY(vendor, model, data) \
+{ \
+	.match_flags  = IEEE1394_MATCH_VENDOR_ID | \
+			IEEE1394_MATCH_MODEL_ID | \
+			IEEE1394_MATCH_SPECIFIER_ID | \
+			IEEE1394_MATCH_VERSION, \
+	.vendor_id    = vendor, \
+	.model_id     = model, \
+	.specifier_id = SPECIFIER_1394TA, \
+	.version      = VERSION_AVC, \
+	.driver_data  = (kernel_ulong_t)data, \
+}
+
 static const struct ieee1394_device_id oxfw_id_table[] = {
-	{
-		.match_flags  = IEEE1394_MATCH_VENDOR_ID |
-				IEEE1394_MATCH_MODEL_ID |
-				IEEE1394_MATCH_SPECIFIER_ID |
-				IEEE1394_MATCH_VERSION,
-		.vendor_id    = VENDOR_GRIFFIN,
-		.model_id     = 0x00f970,
-		.specifier_id = SPECIFIER_1394TA,
-		.version      = VERSION_AVC,
-		.driver_data  = (kernel_ulong_t)&griffin_firewave,
-	},
-	{
-		.match_flags  = IEEE1394_MATCH_VENDOR_ID |
-				IEEE1394_MATCH_MODEL_ID |
-				IEEE1394_MATCH_SPECIFIER_ID |
-				IEEE1394_MATCH_VERSION,
-		.vendor_id    = VENDOR_LACIE,
-		.model_id     = 0x00f970,
-		.specifier_id = SPECIFIER_1394TA,
-		.version      = VERSION_AVC,
-		.driver_data  = (kernel_ulong_t)&lacie_speakers,
-	},
-	/* Behringer,F-Control Audio 202 */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= VENDOR_BEHRINGER,
-		.model_id	= 0x00fc22,
-	},
+	OXFW_DEV_ENTRY(VENDOR_GRIFFIN, 0x00f970, &griffin_firewave),
+	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
+	// Behringer,F-Control Audio 202.
+	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
 	/*
 	 * Any Mackie(Loud) models (name string/model id):
 	 *  Onyx-i series (former models):	0x081216
@@ -367,34 +355,14 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 		.specifier_id	= SPECIFIER_1394TA,
 		.version	= VERSION_AVC,
 	},
-	/* TASCAM, FireOne */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= VENDOR_TASCAM,
-		.model_id	= 0x800007,
-	},
-	/* Stanton, Stanton Controllers & Systems 1 Mixer (SCS.1m) */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= OUI_STANTON,
-		.model_id	= 0x001000,
-	},
-	/* Stanton, Stanton Controllers & Systems 1 Deck (SCS.1d) */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= OUI_STANTON,
-		.model_id	= 0x002000,
-	},
-	// APOGEE, duet FireWire
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= OUI_APOGEE,
-		.model_id	= 0x01dddd,
-	},
+	// TASCAM, FireOne.
+	OXFW_DEV_ENTRY(VENDOR_TASCAM, 0x800007, NULL),
+	// Stanton, Stanton Controllers & Systems 1 Mixer (SCS.1m).
+	OXFW_DEV_ENTRY(OUI_STANTON, 0x001000, NULL),
+	// Stanton, Stanton Controllers & Systems 1 Deck (SCS.1d).
+	OXFW_DEV_ENTRY(OUI_STANTON, 0x002000, NULL),
+	// APOGEE, duet FireWire.
+	OXFW_DEV_ENTRY(OUI_APOGEE, 0x01dddd, NULL),
 	{ }
 };
 MODULE_DEVICE_TABLE(ieee1394, oxfw_id_table);
-- 
2.27.0

