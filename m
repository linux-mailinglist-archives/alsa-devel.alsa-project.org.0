Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB902CC6BCF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:13:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4339B6026E;
	Wed, 17 Dec 2025 10:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4339B6026E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962805;
	bh=UHKm9TI4ZdpWJLWVpz2JjTDYczdpHIpenz3cWIkg80Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nB938MtY5XRNxF4uQi2zzn2WEHAqrvfq+XleMkQg6jGgW7QSiuD4+jK8VJSLFncOG
	 nGQyx05xKVRArWfa3ZKQhjdGPeKOWRvYTfbJZumrFfGFqLG9llynY1oNn6g2Mzvn42
	 H9LiMyRxw0pSaYvitd1pShfjYcJCttP2769crhek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7C01F80803; Wed, 17 Dec 2025 10:10:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1A2F807B5;
	Wed, 17 Dec 2025 10:10:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4437F805A8; Wed, 17 Dec 2025 03:47:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCE5FF8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Dec 2025 03:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE5FF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=darknavy.com header.i=@darknavy.com header.a=rsa-sha256
 header.s=litx2311 header.b=mKugvDtm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=darknavy.com;
	s=litx2311; t=1765939636;
	bh=ROQvNZbGtVaOwmB2aZDpQMJr/nQT8HEfc1sbfIF6BGw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mKugvDtme8CsBfYuqxwyD6MqgcAMtM6EduG5zyPXDoNCndkrZzxPxrXWwQwxS+aow
	 qHiScuYMuak0V5EIt1ApEyxLjsLgWFztFFyVu+ykEO99mmvi48MauiwpL67DuElJ5H
	 fNKT1IGUZiF02MR5oBWl9cmxjryHfJw1AUQLmjPE=
X-QQ-mid: zesmtpsz4t1765939629tdba55e21
X-QQ-Originating-IP: meVduVQoajiEDmTa4YA95Uy5Asd9c1/mrh8e4BkxZzs=
Received: from localhost.localdomain ( [58.38.42.157])
	by bizesmtp.qq.com (ESMTP) with
	id ; Wed, 17 Dec 2025 10:47:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12894234897604456030
EX-QQ-RecipientCnt: 7
From: Shipei Qu <qu@darknavy.com>
To: tiwai@suse.de,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	vr@darknavy.com,
	qu@darknavy.com
Subject: [PATCH v3] ALSA: usb-mixer: us16x08: validate meter packet indices
Date: Wed, 17 Dec 2025 10:46:30 +0800
Message-Id: <20251217024630.59576-1-qu@darknavy.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <878qf2g0tm.wl-tiwai@suse.de>
References: <878qf2g0tm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:darknavy.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NHHBtKpbeb7pJdv5HyMt90wyBg1IhtdmuFqQr52Nmvch6gJALze4s+Gg
	Q7YsgDda+tx4cNXwQP/yxvZdx4k9lBIDXdbZ/0crDJ2p3F1B9fzEd+03zwvtnKcBHGr0BDX
	dT08BO3Prga2mf2CnzYzJ3aBe2nDvoBmYWM7woHeLNGQWyai1pIH7DCPVvP2eL+I427VxhC
	7UEEPF4PCeb5swnGgS6M2J38YIp/V06Ar90FcuF7VU/E5+dYJxlof+0VxUFQ3bkelxwUSUD
	BQnwHEueNGoFfoIVtnqHG26CQU22FAoRUnMPvIOHdubHcqK8coNnylf7wAs/0uiflURtkeY
	RoeUbv3oDzyl1ACT13JdV262xBHXSppeiGlV/HiMxURMr8013AH3cguumm+kfGAzVc6zs4P
	jMgWNiIcLtECygAXZHGTKwVbMvBtodBGT8n3TliBwwRniw2sqAgxMhr63I8QXLUms2RFtrl
	WhePmDYTJmhSp/XSlymKdED4XOy5Kpuy9LN0lALdi5ruKx5QPJjBFj9XFcPhHjGfZmv8pjf
	brk9TYxhk4AoFAGFN6BYjZGWDX+T/i92OkTnNKNLExxt9T5qHHzk9a40b4bdvavjBTiE2FY
	8wf5nlw0dPFVga/Yk5EC8JSHaiSM3a+QQz8jZGVySZj89SbYYdCFoqbAkOPtd2bW6RHv0Mb
	Flt4RwmoeumvzOu64DXc+Xs5lBKOC8Zd8sOoOMJWhzdlAPOLmgj8tmJBICFuitjiMpJoOPc
	gqmkNLpZSITBc7wKAP2JqqUbPfsQJZaihIDh8BiwwDE8+ih7GUHZSfelNWsfD2taohRmNIm
	mDYsFLSaB9jQab+MaJsh8MMA8JELuWtTfRRdfM0scw/DrbmdeHuk8eGxQmQP8pRfrgEDroO
	Ibf3W7yMrz9uNKgHpjNxAJOpLpc9T2G8BDvJ4FbAMHpudzqbqiBDGHPNbMnCX5FpKfqQNzb
	WeQkqa8O1h1wNsy8CLDdzeOy5ZHeymSCM5EIVlgTqqDhKWPvqMlFDTBaYYF+ak1E5mZPxiD
	M/xhVNSw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-MailFrom: qu@darknavy.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GT3COA4QTLV3PQN64EYKTGD256FN232K
X-Message-ID-Hash: GT3COA4QTLV3PQN64EYKTGD256FN232K
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:10:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GT3COA4QTLV3PQN64EYKTGD256FN232K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

get_meter_levels_from_urb() parses the 64-byte meter packets sent by
the device and fills the per-channel arrays meter_level[],
comp_level[] and master_level[] in struct snd_us16x08_meter_store.

Currently the function derives the channel index directly from the
meter packet (MUB2(meter_urb, s) - 1) and uses it to index those
arrays without validating the range. If the packet contains a
negative or out-of-range channel number, the driver may write past
the end of these arrays.

Introduce a local channel variable and validate it before updating the
arrays. We reject negative indices, limit meter_level[] and
comp_level[] to SND_US16X08_MAX_CHANNELS, and guard master_level[]
updates with ARRAY_SIZE(master_level).

Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
Signed-off-by: Shipei Qu <qu@darknavy.com>
---
v3: rephrase commit description
v2: resend with properly formatted diff

 sound/usb/mixer_us16x08.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 1c5712c31..f9df40730 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -655,17 +655,25 @@ static void get_meter_levels_from_urb(int s,
 	u8 *meter_urb)
 {
 	int val = MUC2(meter_urb, s) + (MUC3(meter_urb, s) << 8);
+	int ch = MUB2(meter_urb, s) - 1;
+
+	if (ch < 0)
+		return;
 
 	if (MUA0(meter_urb, s) == 0x61 && MUA1(meter_urb, s) == 0x02 &&
 		MUA2(meter_urb, s) == 0x04 && MUB0(meter_urb, s) == 0x62) {
-		if (MUC0(meter_urb, s) == 0x72)
-			store->meter_level[MUB2(meter_urb, s) - 1] = val;
-		if (MUC0(meter_urb, s) == 0xb2)
-			store->comp_level[MUB2(meter_urb, s) - 1] = val;
+		if (ch < SND_US16X08_MAX_CHANNELS) {
+			if (MUC0(meter_urb, s) == 0x72)
+				store->meter_level[ch] = val;
+			if (MUC0(meter_urb, s) == 0xb2)
+				store->comp_level[ch] = val;
+		}
 	}
 	if (MUA0(meter_urb, s) == 0x61 && MUA1(meter_urb, s) == 0x02 &&
-		MUA2(meter_urb, s) == 0x02 && MUB0(meter_urb, s) == 0x62)
-		store->master_level[MUB2(meter_urb, s) - 1] = val;
+		MUA2(meter_urb, s) == 0x02 && MUB0(meter_urb, s) == 0x62) {
+		if (ch < ARRAY_SIZE(store->master_level))
+			store->master_level[ch] = val;
+	}
 }
 
 /* Function to retrieve current meter values from the device.
-- 
2.45.1
