Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6681DC0D
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2027BE7B;
	Sun, 24 Dec 2023 20:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2027BE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703445646;
	bh=2GXKMJTk/5BsdNFmGmaDA7kp9kyNOueIJVZDIy9Ue4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ervbzMmS8/5WTWkkjgfwxW5YkR6vxmMedPBH5MtPMj2LBfw5pgV1CnmW2gpdHqBnZ
	 HI1FVxhZWWdAuHxX/NjIFN5Jvd5+UQGOH3djeI6FszWRYB90DqDCCXjcpoZR+sLWb7
	 rjE8XxNvg2BkKSbJIntButGAFKpivByGzwNb7pXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B73F8059F; Sun, 24 Dec 2023 20:20:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 999BFF805A9;
	Sun, 24 Dec 2023 20:20:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16716F80579; Sun, 24 Dec 2023 20:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ABA9F801EB
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ABA9F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=AfBLdt2/
Received: by m.b4.vu (Postfix, from userid 1000)
	id 04163604B9CB; Mon, 25 Dec 2023 05:50:10 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 04163604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445610; bh=3jihFecVm+IP0dfvnuLqvowgaKIa9XdhyQ6uYruwr/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfBLdt2/vyLyQx86CPwxWpa8KdQ/Xj9xI2EH4djhU0HGFL1wjTuvLLLqES+XfqOFB
	 lW6D1bdwI26dkOg1ZHy0nFNV5cjJzMC8U2yNqRChStaos4zW9btnDzztLZ0xmL03s5
	 5KwYiE3zfN0JOBMHggGLOJAVzU508W5XEYni24prehLOS5XcDcNWfF03Yn3KcBWyJU
	 Kw1nzMrbmQyB/09PCsRgWaR9Nu2GV+L5qLNWUmlsgekz3k7icrHHdjVT8AsUXvfBXv
	 t6pCnhzhXOsupdi8L6UfPVZ8W4m75GNP5U9ePkdwpObkZLc3elQ+rlUfJIb/g1hmOV
	 Z0oH0ol0zt0wA==
Date: Mon, 25 Dec 2023 05:50:09 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 01/23] ALSA: scarlett2: Simplify enums by removing explicit
 values
Message-ID: <67f0f1bb8b90d7c76dfe7062d22d33bbde19cf93.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: JMKZ6YYM3AD3MI2XXW7UD4SCXRIOU7T3
X-Message-ID-Hash: JMKZ6YYM3AD3MI2XXW7UD4SCXRIOU7T3
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMKZ6YYM3AD3MI2XXW7UD4SCXRIOU7T3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This commit removes the explicit integer assignments from the enums.
The actual values matter little, and not assigning explicit values
makes it easier to modify the longer lists in the future.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f1337a379833..6ab8b4c52357 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -223,11 +223,11 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
  * devices, dependent on series and model.
  */
 enum {
-	SCARLETT2_CONFIG_SET_GEN_2   = 0,
-	SCARLETT2_CONFIG_SET_GEN_3A  = 1,
-	SCARLETT2_CONFIG_SET_GEN_3B  = 2,
-	SCARLETT2_CONFIG_SET_CLARETT = 3,
-	SCARLETT2_CONFIG_SET_COUNT   = 4
+	SCARLETT2_CONFIG_SET_GEN_2,
+	SCARLETT2_CONFIG_SET_GEN_3A,
+	SCARLETT2_CONFIG_SET_GEN_3B,
+	SCARLETT2_CONFIG_SET_CLARETT,
+	SCARLETT2_CONFIG_SET_COUNT
 };
 
 /* Hardware port types:
@@ -239,35 +239,35 @@ enum {
  * - PCM I/O
  */
 enum {
-	SCARLETT2_PORT_TYPE_NONE     = 0,
-	SCARLETT2_PORT_TYPE_ANALOGUE = 1,
-	SCARLETT2_PORT_TYPE_SPDIF    = 2,
-	SCARLETT2_PORT_TYPE_ADAT     = 3,
-	SCARLETT2_PORT_TYPE_MIX      = 4,
-	SCARLETT2_PORT_TYPE_PCM      = 5,
-	SCARLETT2_PORT_TYPE_COUNT    = 6,
+	SCARLETT2_PORT_TYPE_NONE,
+	SCARLETT2_PORT_TYPE_ANALOGUE,
+	SCARLETT2_PORT_TYPE_SPDIF,
+	SCARLETT2_PORT_TYPE_ADAT,
+	SCARLETT2_PORT_TYPE_MIX,
+	SCARLETT2_PORT_TYPE_PCM,
+	SCARLETT2_PORT_TYPE_COUNT
 };
 
 /* I/O count of each port type kept in struct scarlett2_ports */
 enum {
-	SCARLETT2_PORT_IN    = 0,
-	SCARLETT2_PORT_OUT   = 1,
-	SCARLETT2_PORT_DIRNS = 2,
+	SCARLETT2_PORT_IN,
+	SCARLETT2_PORT_OUT,
+	SCARLETT2_PORT_DIRNS
 };
 
 /* Dim/Mute buttons on the 18i20 */
 enum {
-	SCARLETT2_BUTTON_MUTE    = 0,
-	SCARLETT2_BUTTON_DIM     = 1,
-	SCARLETT2_DIM_MUTE_COUNT = 2,
+	SCARLETT2_BUTTON_MUTE,
+	SCARLETT2_BUTTON_DIM,
+	SCARLETT2_DIM_MUTE_COUNT
 };
 
 /* Flash Write State */
 enum {
-	SCARLETT2_FLASH_WRITE_STATE_IDLE = 0,
-	SCARLETT2_FLASH_WRITE_STATE_SELECTED = 1,
-	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2,
-	SCARLETT2_FLASH_WRITE_STATE_WRITE = 3
+	SCARLETT2_FLASH_WRITE_STATE_IDLE,
+	SCARLETT2_FLASH_WRITE_STATE_SELECTED,
+	SCARLETT2_FLASH_WRITE_STATE_ERASING,
+	SCARLETT2_FLASH_WRITE_STATE_WRITE
 };
 
 static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
@@ -1211,22 +1211,22 @@ struct scarlett2_usb_volume_status {
 
 /* Configuration parameters that can be read and written */
 enum {
-	SCARLETT2_CONFIG_DIM_MUTE = 0,
-	SCARLETT2_CONFIG_LINE_OUT_VOLUME = 1,
-	SCARLETT2_CONFIG_MUTE_SWITCH = 2,
-	SCARLETT2_CONFIG_SW_HW_SWITCH = 3,
-	SCARLETT2_CONFIG_LEVEL_SWITCH = 4,
-	SCARLETT2_CONFIG_PAD_SWITCH = 5,
-	SCARLETT2_CONFIG_MSD_SWITCH = 6,
-	SCARLETT2_CONFIG_AIR_SWITCH = 7,
-	SCARLETT2_CONFIG_STANDALONE_SWITCH = 8,
-	SCARLETT2_CONFIG_PHANTOM_SWITCH = 9,
-	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 10,
-	SCARLETT2_CONFIG_DIRECT_MONITOR = 11,
-	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH = 12,
-	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE = 13,
-	SCARLETT2_CONFIG_TALKBACK_MAP = 14,
-	SCARLETT2_CONFIG_COUNT = 15
+	SCARLETT2_CONFIG_DIM_MUTE,
+	SCARLETT2_CONFIG_LINE_OUT_VOLUME,
+	SCARLETT2_CONFIG_MUTE_SWITCH,
+	SCARLETT2_CONFIG_SW_HW_SWITCH,
+	SCARLETT2_CONFIG_LEVEL_SWITCH,
+	SCARLETT2_CONFIG_PAD_SWITCH,
+	SCARLETT2_CONFIG_MSD_SWITCH,
+	SCARLETT2_CONFIG_AIR_SWITCH,
+	SCARLETT2_CONFIG_STANDALONE_SWITCH,
+	SCARLETT2_CONFIG_PHANTOM_SWITCH,
+	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+	SCARLETT2_CONFIG_DIRECT_MONITOR,
+	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
+	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
+	SCARLETT2_CONFIG_TALKBACK_MAP,
+	SCARLETT2_CONFIG_COUNT
 };
 
 /* Location, size, and activation command number for the configuration
-- 
2.43.0

