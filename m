Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03843E198
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 15:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D62016A3;
	Thu, 28 Oct 2021 15:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D62016A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635426311;
	bh=PqSRmw8QwDiFGRVBAcR7kg5YIIc12lTwMJIa7TSTMvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AyY6xcX1yk8Cg7910Z9E+rFwG4QrFq38dFk3eHXiIKUmtxBtoGQhK3eRBeV64zO+a
	 lbPg4x8s/e9O8kgwoBPH9F3l5M3F6zpd3439dOXO0rSSBRtakay9mpGygh5LEaJ+gq
	 3+38sli1MznZAK6CS00yFDNQvLXco8PPiLt458ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B4AF8014E;
	Thu, 28 Oct 2021 15:03:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEC81F802C8; Thu, 28 Oct 2021 15:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65375F8014E
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 15:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65375F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="aQxuLzpx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KW+vC0Qf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F5C43201C16;
 Thu, 28 Oct 2021 09:03:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 Oct 2021 09:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=EqV1+MwDCmEn47yUuATWJpLjgg
 O0XHBq8PLMtN0Irvo=; b=aQxuLzpxcy3aa/mRS9UolDnPbHI1XljbJ99QC/KLqT
 mpi6YRQ0kGOxsaBKLoIDBdbS/ExTPRz4reqCmpPAfLh+T9TEhFV8SjdcawQHh3Kf
 jP90/HAClzZ4xGebIUjJ+PDpdOHvWPxQmFj8sUUGNkuO8XvwQEyDqsrlgqPsqbFl
 oO3x9w8BwaVgoygj4jK3WYeMhgJwjvgMUzA1D/uWvxrd+YI7rpHOc90XowLK127q
 mKJ0w3q+DIF5F6wBq9WSO90F6TSdo0OWRPwwUguyfdrcOvcjt6AxAirEDAiCRJ9/
 AnFAh5eVJ9ZXrH/Mhz197W8L628ZQgZ7pFfkx6YXXldQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EqV1+MwDCmEn47yUu
 ATWJpLjggO0XHBq8PLMtN0Irvo=; b=KW+vC0QfbT4A/17E/SiYrKKDtAy1LrP7/
 RftYPLFFMW/kQjrKYA5WPYl9eUWxV3M2yg9nDNVe5aZFxgctR5mOMHGwf+OpMXSW
 P1VrX/waAEzF6RvZBYZskH9j7R2oVzOwhBD7ZqyImdDrlPW2NCaxL+lcS3l1Q4lV
 pZo6oMEt8EhDUM6Wokk12R8ECf4zIiCfV4vPZL59x3KqMgBuEchIXNfEndhjQ2vF
 04yOLTDZ5ptH3d0CuDewBrpNYNM6JWmkzYGyOna65Ia7uEs9pxDc352vV/CIVmFE
 rhMHNDtW6SoRLKjlCsshNu0/OTlGFX6Vrvp6KSOc3fO1xmWzuzcsA==
X-ME-Sender: <xms:o596YRPghtwS0ficXi52osogInjwWvLMvm6XgJ-F6SRFWAd2BL0mAg>
 <xme:o596YT-WOGaMAKiMnokqYt6yUeXurUgEJfPH6DiU3a_UzucQr4GMme3lUyT3dTDc6
 jvOO6CFinJc_5WNiz0>
X-ME-Received: <xmr:o596YQTriHjasKB-d-LIpO3d_n8CugAzM6U5to5ofD95a4tgtZ_eU6D2bAbuEQljMpa3ogPXDXTHxNl0DLWeZGL1hapQjvWiNYA1A5OaLnmW-NSX-Fgz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegvddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvddtgeegjeejte
 ejudffhfduvdefhfevhfelleevfeefhfelhefhgeeufeetvdehnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:o596YdsUBboE9L-hlFaprX4TSLNsJOiBSK2wkVaenchiJ20VERVCdQ>
 <xmx:o596YZdnDiX6efOsWVCTvMmHxQQeVyOc4udjnWQo84JCt-4GLF8-fQ>
 <xmx:o596YZ1hTqordGfRBYhpnhUlve0Jh0l25BoBWFpsbXDJ-4vWsaJR1w>
 <xmx:o596YZHAmUborMsNikBVjYzGUjW_rEVN0XEJtYVCSRP7pKGb06rk3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 09:03:30 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: oxfw: fix functional regression for Mackie Onyx 1640i
 in v5.14 or later
Date: Thu, 28 Oct 2021 22:03:25 +0900
Message-Id: <20211028130325.45772-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
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

A user reports functional regression for Mackie Onyx 1640i that the device
generates slow sound with ALSA oxfw driver which supports media clock
recovery. Although the device is based on OXFW971 ASIC, it does not
transfer isochronous packet with own event frequency as expected. The
device seems to adjust event frequency according to events in received
isochronous packets in the beginning of packet streaming. This is
unknown quirk.

This commit fixes the regression to turn the recovery off in driver
side. As a result, nominal frequency is used in duplex packet streaming
between device and driver. For stability of sampling rate in events of
transferred isochronous packet, 4,000 isochronous packets are skipped
in the beginning of packet streaming.

Reference: https://github.com/takaswie/snd-firewire-improve/issues/38
Fixes: 029ffc429440 ("ALSA: oxfw: perform sequence replay for media clock recovery")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 7 ++++++-
 sound/firewire/oxfw/oxfw.c        | 8 ++++++++
 sound/firewire/oxfw/oxfw.h        | 5 +++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index fff18b5d4e05..f4a702def397 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -9,7 +9,7 @@
 #include <linux/delay.h>
 
 #define AVC_GENERIC_FRAME_MAXIMUM_BYTES	512
-#define READY_TIMEOUT_MS	200
+#define READY_TIMEOUT_MS	600
 
 /*
  * According to datasheet of Oxford Semiconductor:
@@ -367,6 +367,11 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 				// Just after changing sampling transfer frequency, many cycles are
 				// skipped for packet transmission.
 				tx_init_skip_cycles = 400;
+			} else if (oxfw->quirks & SND_OXFW_QUIRK_VOLUNTARY_RECOVERY) {
+				// It takes a bit time for target device to adjust event frequency
+				// according to nominal event frequency in isochronous packets from
+				// ALSA oxfw driver.
+				tx_init_skip_cycles = 4000;
 			} else {
 				replay_seq = true;
 			}
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index daf731364695..b496f87841ae 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -25,6 +25,7 @@
 #define MODEL_SATELLITE		0x00200f
 #define MODEL_SCS1M		0x001000
 #define MODEL_DUET_FW		0x01dddd
+#define MODEL_ONYX_1640I	0x001640
 
 #define SPECIFIER_1394TA	0x00a02d
 #define VERSION_AVC		0x010001
@@ -192,6 +193,13 @@ static int detect_quirks(struct snd_oxfw *oxfw, const struct ieee1394_device_id
 		// OXFW971-based models may transfer events by blocking method.
 		if (!(oxfw->quirks & SND_OXFW_QUIRK_JUMBO_PAYLOAD))
 			oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION;
+
+		if (model == MODEL_ONYX_1640I) {
+			//Unless receiving packets without NOINFO packet, the device transfers
+			//mostly half of events in packets than expected.
+			oxfw->quirks |= SND_OXFW_QUIRK_IGNORE_NO_INFO_PACKET |
+					SND_OXFW_QUIRK_VOLUNTARY_RECOVERY;
+		}
 	}
 
 	return 0;
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index c13034f6c2ca..d728e451a25c 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -47,6 +47,11 @@ enum snd_oxfw_quirk {
 	// the device to process audio data even if the value is invalid in a point of
 	// IEC 61883-1/6.
 	SND_OXFW_QUIRK_IGNORE_NO_INFO_PACKET = 0x10,
+	// Loud Technologies Mackie Onyx 1640i seems to configure OXFW971 ASIC so that it decides
+	// event frequency according to events in received isochronous packets. The device looks to
+	// performs media clock recovery voluntarily. In the recovery, the packets with NO_INFO
+	// are ignored, thus driver should transfer packets with timestamp.
+	SND_OXFW_QUIRK_VOLUNTARY_RECOVERY = 0x20,
 };
 
 /* This is an arbitrary number for convinience. */
-- 
2.30.2

