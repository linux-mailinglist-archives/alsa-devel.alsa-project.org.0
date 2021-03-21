Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A61B3430B3
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 04:30:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C2B1666;
	Sun, 21 Mar 2021 04:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C2B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616297447;
	bh=und5HXyX3vi4NCAtWJ4cmJvGkjk1HSl2lT0txczmS2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXp+T69bnWbFC/LE5an0Zwc6jBQMzpRBVVo59LRtgDX3425SfOMtmahhLFGdMkOOK
	 L6sqK6EipWJWl1ApdyKKAc2ErGZNu3HUUw2Uj+aD1Dor/N406MczAnJt5zuyD/0dcS
	 2VEcaNg1ua61DwqlyxMb5NECleV5FykT/Qr4n8mA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFBEAF80257;
	Sun, 21 Mar 2021 04:29:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C97A5F8028D; Sun, 21 Mar 2021 04:29:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 481F7F80254
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 04:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 481F7F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ca5rDmvu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="W6eCJjTg"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 280941838;
 Sat, 20 Mar 2021 23:28:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 20 Mar 2021 23:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JLS48iijp/ilD
 vv0NrqwrL7p2U/48keqMNug2tHfJoU=; b=ca5rDmvuRmxXlmM6GL5IXVUr0QZf6
 MjWkNCuvljODIvSQth63ycEJkKOHffd5h/d/L6h8nv5DD69jINyrVdpkGdoy+S8/
 AU+EzI5p9YkMvElKr062K6g/UDQ0jLkMSvkiW72fYimUXdYelXtMWZpb370d6J+f
 2xoJcqD8YFfTwQsnClUVNAzM+r5iVpuNtzqEO6ED8KAFxOdTgaO/K/VeOuOBeIkt
 ea5XnsAamCjH1/kcEZxhifqnvMEgYEKQZVwZI0badzcBkg00V8PEsBFNfNFnV1uO
 v8cBV7OJku11l9mCsqt2b9L0FFyT9Ygk99y72fzTcuNm/6VPnZzFocVCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JLS48iijp/ilDvv0NrqwrL7p2U/48keqMNug2tHfJoU=; b=W6eCJjTg
 VGxzdTsRAoVrq7OYArF2fcDlMFWdxVGRCIfbpDIRLxu/M0enSBS3UfWGcsR68Hm+
 tcDdoaMal6urYzO3yA6g4uoiAevL6w7xw6W9sw2CD3c0dss0nRNHwb1kWijLyfrH
 iEUB+x/NKmNHNqRTX0CR/W0X8/CXZ9eFKvlL7Nhl+hI+ZLDp+dpx3OENA2/ijQkG
 tUvXeluVH6GD4u9iWqA5MRgLoxj9NSx70tKVITN3QcqVv710UVjf9MlRv0pzK92X
 BS6qiBguzhptVqcL1NxxyIthe+jyVPo1jR2Cbc5lEvcgWD9TJqnv8vUikXxlpYV8
 JtQCIcv9HTtcxg==
X-ME-Sender: <xms:Zb1WYHhFF60yBrzOKp_L5yiHAp0Cc0lw13imAWcNezyFKqcJ7Gw07g>
 <xme:Zb1WYECA6P291dk7WRnjIp1mj9Cs0KNwpJKA_l2yPvUk2SszCT0-Bzdpzyg3Swpu6
 P_SEgb92M9AoU307Tc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeguddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Zb1WYHFzmLEu3DImc3-zap4B2bE-ZsRNmCMQwbA_ddISp4uI9aTLBg>
 <xmx:Zb1WYEQZsERZkul9UqmS2wMzoVOkazAobxxy-Z7OE_Yfa13k0j_KHA>
 <xmx:Zb1WYEyeofTJpMfpZJhj-170ho2R0slemlFpu0MhHIAVaNbSyKHqsg>
 <xmx:Zb1WYKYt_JomBN0IBBQLe0a_CsqsN3G-WHpyVeRjqjGd7c1YgEAdsw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id C735724040B;
 Sat, 20 Mar 2021 23:28:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: bebob: detect the number of available MIDI ports
Date: Sun, 21 Mar 2021 12:28:30 +0900
Message-Id: <20210321032831.340278-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210321032831.340278-1-o-takashi@sakamocchi.jp>
References: <20210321032831.340278-1-o-takashi@sakamocchi.jp>
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

Current implementation counts the number of input/output plugs for MIDI
type and uses the count as the number of physical MIDI ports. However,
the number of channels of the port represents the count.

This commit fixes the bug by additional vendor-specific AVC command
extension.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.h         |  2 +
 sound/firewire/bebob/bebob_command.c | 36 ++++++++++++
 sound/firewire/bebob/bebob_stream.c  | 83 +++++++++++++++++-----------
 3 files changed, 89 insertions(+), 32 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index d1ad9a8451bc..4e0ed84adbee 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -200,6 +200,8 @@ int avc_bridgeco_get_plug_ch_pos(struct fw_unit *unit,
 int avc_bridgeco_get_plug_type(struct fw_unit *unit,
 			       u8 addr[AVC_BRIDGECO_ADDR_BYTES],
 			       enum avc_bridgeco_plug_type *type);
+int avc_bridgeco_get_plug_ch_count(struct fw_unit *unit, u8 addr[AVC_BRIDGECO_ADDR_BYTES],
+				   unsigned int *ch_count);
 int avc_bridgeco_get_plug_section_type(struct fw_unit *unit,
 				       u8 addr[AVC_BRIDGECO_ADDR_BYTES],
 				       unsigned int id, u8 *type);
diff --git a/sound/firewire/bebob/bebob_command.c b/sound/firewire/bebob/bebob_command.c
index e276ab8f9006..022df09c68ff 100644
--- a/sound/firewire/bebob/bebob_command.c
+++ b/sound/firewire/bebob/bebob_command.c
@@ -143,6 +143,42 @@ int avc_bridgeco_get_plug_type(struct fw_unit *unit,
 	return err;
 }
 
+int avc_bridgeco_get_plug_ch_count(struct fw_unit *unit, u8 addr[AVC_BRIDGECO_ADDR_BYTES],
+				   unsigned int *ch_count)
+{
+	u8 *buf;
+	int err;
+
+	buf = kzalloc(12, GFP_KERNEL);
+	if (buf == NULL)
+		return -ENOMEM;
+
+	// Info type is 'plug type'.
+	avc_bridgeco_fill_plug_info_extension_command(buf, addr, 0x02);
+
+	err = fcp_avc_transaction(unit, buf, 12, buf, 12,
+				  BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(5) |
+				  BIT(6) | BIT(7) | BIT(9));
+	if (err < 0)
+		;
+	else if (err < 11)
+		err = -EIO;
+	else if (buf[0] == 0x08) // NOT IMPLEMENTED
+		err = -ENOSYS;
+	else if (buf[0] == 0x0a) // REJECTED
+		err = -EINVAL;
+	else if (buf[0] == 0x0b) // IN TRANSITION
+		err = -EAGAIN;
+	if (err < 0)
+		goto end;
+
+	*ch_count = buf[10];
+	err = 0;
+end:
+	kfree(buf);
+	return err;
+}
+
 int avc_bridgeco_get_plug_ch_pos(struct fw_unit *unit,
 				 u8 addr[AVC_BRIDGECO_ADDR_BYTES],
 				 u8 *buf, unsigned int len)
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index d96d2feb15a8..23579a73e038 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -844,6 +844,49 @@ static int fill_stream_formations(struct snd_bebob *bebob, u8 addr[AVC_BRIDGECO_
 	return err;
 }
 
+static int detect_midi_ports(struct snd_bebob *bebob,
+			     const struct snd_bebob_stream_formation *formats,
+			     u8 addr[AVC_BRIDGECO_ADDR_BYTES], enum avc_bridgeco_plug_dir plug_dir,
+			     unsigned int plug_count, unsigned int *midi_ports)
+{
+	int i;
+	int err = 0;
+
+	*midi_ports = 0;
+
+	/// Detect the number of available MIDI ports when packet has MIDI conformant data channel.
+	for (i = 0; i < SND_BEBOB_STRM_FMT_ENTRIES; ++i) {
+		if (formats[i].midi > 0)
+			break;
+	}
+	if (i >= SND_BEBOB_STRM_FMT_ENTRIES)
+		return 0;
+
+	for (i = 0; i < plug_count; ++i) {
+		enum avc_bridgeco_plug_type plug_type;
+		unsigned int ch_count;
+
+		avc_bridgeco_fill_unit_addr(addr, plug_dir, AVC_BRIDGECO_PLUG_UNIT_EXT, i);
+
+		err = avc_bridgeco_get_plug_type(bebob->unit, addr, &plug_type);
+		if (err < 0) {
+			dev_err(&bebob->unit->device,
+				"fail to get type for external %d plug %d: %d\n",
+				plug_dir, i, err);
+			break;
+		} else if (plug_type != AVC_BRIDGECO_PLUG_TYPE_MIDI) {
+			continue;
+		}
+
+		err = avc_bridgeco_get_plug_ch_count(bebob->unit, addr, &ch_count);
+		if (err < 0)
+			break;
+		*midi_ports += ch_count;
+	}
+
+	return err;
+}
+
 static int
 seek_msu_sync_input_plug(struct snd_bebob *bebob)
 {
@@ -886,8 +929,6 @@ int snd_bebob_stream_discover(struct snd_bebob *bebob)
 {
 	const struct snd_bebob_clock_spec *clk_spec = bebob->spec->clock;
 	u8 plugs[AVC_PLUG_INFO_BUF_BYTES], addr[AVC_BRIDGECO_ADDR_BYTES];
-	enum avc_bridgeco_plug_type type;
-	unsigned int i;
 	int err;
 
 	/* the number of plugs for isoc in/out, ext in/out  */
@@ -918,37 +959,15 @@ int snd_bebob_stream_discover(struct snd_bebob *bebob)
 	if (err < 0)
 		goto end;
 
-	/* count external input plugs for MIDI */
-	bebob->midi_input_ports = 0;
-	for (i = 0; i < plugs[2]; i++) {
-		avc_bridgeco_fill_unit_addr(addr, AVC_BRIDGECO_PLUG_DIR_IN,
-					    AVC_BRIDGECO_PLUG_UNIT_EXT, i);
-		err = avc_bridgeco_get_plug_type(bebob->unit, addr, &type);
-		if (err < 0) {
-			dev_err(&bebob->unit->device,
-			"fail to get type for external in plug %d: %d\n",
-				i, err);
-			goto end;
-		} else if (type == AVC_BRIDGECO_PLUG_TYPE_MIDI) {
-			bebob->midi_input_ports++;
-		}
-	}
+	err = detect_midi_ports(bebob, bebob->rx_stream_formations, addr, AVC_BRIDGECO_PLUG_DIR_IN,
+				plugs[2], &bebob->midi_input_ports);
+	if (err < 0)
+		goto end;
 
-	/* count external output plugs for MIDI */
-	bebob->midi_output_ports = 0;
-	for (i = 0; i < plugs[3]; i++) {
-		avc_bridgeco_fill_unit_addr(addr, AVC_BRIDGECO_PLUG_DIR_OUT,
-					    AVC_BRIDGECO_PLUG_UNIT_EXT, i);
-		err = avc_bridgeco_get_plug_type(bebob->unit, addr, &type);
-		if (err < 0) {
-			dev_err(&bebob->unit->device,
-			"fail to get type for external out plug %d: %d\n",
-				i, err);
-			goto end;
-		} else if (type == AVC_BRIDGECO_PLUG_TYPE_MIDI) {
-			bebob->midi_output_ports++;
-		}
-	}
+	err = detect_midi_ports(bebob, bebob->tx_stream_formations, addr, AVC_BRIDGECO_PLUG_DIR_OUT,
+				plugs[3], &bebob->midi_output_ports);
+	if (err < 0)
+		goto end;
 
 	/* for check source of clock later */
 	if (!clk_spec)
-- 
2.27.0

