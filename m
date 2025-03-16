Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF5A674B2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 14:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5143660195;
	Tue, 18 Mar 2025 14:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5143660195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742303767;
	bh=hL8Ci+1dLZqHgQvF2vFzsbD9FJWVpMb5Nilmdug37q4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qh+spdwivP1vz71xZGrzHyT5DloaGvaui1UMXUkAjqOs0xklVTNHhDVDvW2aK530/
	 yj5TTzaeoH+SHmN47dENEE1wlCghm4TvcX1FPBfRv+X0bBSGnRyPZorO20JRVoPiu4
	 j6ZYDHwKm0Yb27hpcjRILRnYaNJFX1UIALS0jetY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1305CF805E3; Tue, 18 Mar 2025 14:15:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F20A7F805DA;
	Tue, 18 Mar 2025 14:15:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D3FF80171; Sun, 16 Mar 2025 16:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA512)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B849F8010B
	for <alsa-devel@alsa-project.org>; Sun, 16 Mar 2025 16:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B849F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=base.nu header.i=@base.nu header.a=rsa-sha256
 header.s=20250128 header.b=kjazE91G
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=20250128; bh=hL8Ci+1dLZq
	HgQvF2vFzsbD9FJWVpMb5Nilmdug37q4=; h=date:subject:cc:to:from;
	d=base.nu; b=kjazE91GmVllByPb3z9cP3IRk6CxbUOT24JYMC/74sn3af5pbyrU8RZLS
	9QLWeR9n3lrIB3/c0cnfTEUPSpN1PAteBboVO4rFNSd9HbJ/BMPeoyfikBpheuXcAbFCnY
	tiOnapG5gtncFlZaR7QnQuIUnxyQssMH0QFfI0lIXRsQYuJ+aaFxr0S7bI7RpniTYTQZqm
	WbQj7mC+6Z/gpmksvvAgV55krxBJ+0Y8QgFkbJ3nghSd96Xce8JVrUf5a7o7Ny9WEyc5W+
	B543IWwqyygmVvcrPjrf76UJI/mQCHAayeb5lCaX/HH0E/3+BRLeeNTqFAvmOO0IGs4dIb
	FSVvQ==
Received: from hellmouth.base.nu (localhost [127.0.0.1])
	by hellmouth.base.nu (OpenSMTPD) with ESMTP id f43f7c65;
	Sun, 16 Mar 2025 15:33:38 +0000 (UTC)
Received: from localhost ([194.55.157.212])
	by hellmouth.base.nu with ESMTPSA
	id hT+WBFLv1me9IQEADaPQrA
	(envelope-from <livvy@base.nu>); Sun, 16 Mar 2025 15:33:38 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Cc: Olivia Mackintosh <livvy@base.nu>
Subject: [PATCH] ALSA: usb-audio: separate DJM-A9 cap lvl options
Date: Sun, 16 Mar 2025 15:33:23 +0000
Message-ID: <20250316153323.16381-1-livvy@base.nu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: livvy@base.nu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: F5VDMVTHXJDEWSW4TN2PL2N2HQEG4ARK
X-Message-ID-Hash: F5VDMVTHXJDEWSW4TN2PL2N2HQEG4ARK
X-Mailman-Approved-At: Tue, 18 Mar 2025 13:15:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5VDMVTHXJDEWSW4TN2PL2N2HQEG4ARK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mixer quicks for the Pioneer DJM-A9 mixer was added in 5289d00 with
additional capture level values added to the common DJM array of values.

This breaks the existing DJM mixers however as alsa-utils relies on
enumeration of the actual mixer options based on the value array which
results in error when storing state.

This commit just separates the A9 values into a separate array and
references them in the corresponding mixer control.

Signed-off-by: Olivia Mackintosh <livvy@base.nu>
---
 sound/usb/mixer_quirks.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 79c8c1540ee2..49fb849f7d40 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3688,8 +3688,7 @@ static const char *snd_djm_get_label(u8 device_idx, u16 wvalue, u16 windex)
 
 // common DJM capture level option values
 static const u16 snd_djm_opts_cap_level[] = {
-	0x0000, 0x0100, 0x0200, 0x0300, 0x400, 0x500 };
-
+	0x0000, 0x0100, 0x0200, 0x0300 };
 
 // DJM-250MK2
 static const u16 snd_djm_opts_250mk2_cap1[] = {
@@ -3831,6 +3830,8 @@ static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
 
 
 // DJM-A9
+static const u16 snd_djm_opts_a9_cap_level[] = {
+	0x0000, 0x0100, 0x0200, 0x0300, 0x0400, 0x0500 };
 static const u16 snd_djm_opts_a9_cap1[] = {
 	0x0107, 0x0108, 0x0109, 0x010a, 0x010e,
 	0x111, 0x112, 0x113, 0x114, 0x0131, 0x132, 0x133, 0x134 };
@@ -3844,7 +3845,7 @@ static const u16 snd_djm_opts_a9_cap5[] = {
 	0x0501, 0x0502, 0x0503, 0x0505, 0x0506, 0x0507, 0x0508, 0x0509, 0x050a, 0x050e };
 
 static const struct snd_djm_ctl snd_djm_ctls_a9[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Capture Level", a9_cap_level, 0, SND_DJM_WINDEX_CAPLVL),
 	SND_DJM_CTL("Master Input",  a9_cap1, 3, SND_DJM_WINDEX_CAP),
 	SND_DJM_CTL("Ch1 Input",     a9_cap2, 2, SND_DJM_WINDEX_CAP),
 	SND_DJM_CTL("Ch2 Input",     a9_cap3, 2, SND_DJM_WINDEX_CAP),
-- 
2.48.1

