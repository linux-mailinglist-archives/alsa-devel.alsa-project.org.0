Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F36CC6BCC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F32B60234;
	Wed, 17 Dec 2025 10:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F32B60234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962788;
	bh=qf2DToJKcVofOC+wLSCtVPxKtD+NtVQkWXwsI0GMHtM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ER49ZjrsY5wK6UQR/zYL7R4UNniexKEW/Dd2V9pTjXL1D/cRGMNB5OrdKMs5vtAe0
	 Ig+FPkl6HpbE+mCoOZdw/j5QVsDvMHIgJXnxzM1CWxVkGobVFyzwDyIGr4cwUgUu66
	 0i5aW056UbAvhDA+8SvvxLfoh5yYSdSjwpiK2SgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ABDAF8075A; Wed, 17 Dec 2025 10:10:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E80FBF80751;
	Wed, 17 Dec 2025 10:10:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97323F800DF; Tue, 16 Dec 2025 07:02:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FDACF800DF
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 07:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDACF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=darknavy.com header.i=@darknavy.com header.a=rsa-sha256
 header.s=litx2311 header.b=JWoOipna
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=darknavy.com;
	s=litx2311; t=1765864944;
	bh=Qg6eCpBsOaOXTHBmaq1NQahZu3HYrOD54TuA171nEmw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JWoOipna7iwZYUBtT2DGeLy5R1O8ThyRoT/ovUpsqcUiyKsIZgFkiIJxmERhorg35
	 nxkkL2MMzHwo0tclPqcc9jdi1MOaMJGZA7ER1fUI8OBaP1bxUxqboxdm9I6TXNrvKz
	 MWYOgVaNLDBvnYTNKbe+2Ce6Qr62aYQ21J94nnnE=
X-QQ-mid: esmtpsz20t1765864938teeba9f43
X-QQ-Originating-IP: nJoj9iCtCkLkpvIYaJwyL4D5UcurBASJvz3QvVoWGx4=
Received: from localhost.localdomain ( [223.166.168.213])
	by bizesmtp.qq.com (ESMTP) with
	id ; Tue, 16 Dec 2025 14:02:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14045563849092445381
EX-QQ-RecipientCnt: 6
From: Shipei Qu <qu@darknavy.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Shipei Qu <qu@darknavy.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	DARKNAVY <vr@darknavy.com>
Subject: [PATCH v2] ALSA: usb-mixer: us16x08: validate meter packet indices
Date: Tue, 16 Dec 2025 14:01:56 +0800
Message-Id: <20251216060156.41320-4-qu@darknavy.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:darknavy.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NJ/+omVLhVgau0Cu4IckbaQfHuNUYDl0pApOy69J+9SefH4vyoebKGxr
	bQKK+XoAzRirncElo+evHX0cMHjAFa2JJBMW0hnUkCpNCD/is8gsiL7D7Tv5fXQ6aj+X95i
	YK7Flxxe3Ti0KDttO1Ha7XJ8r+YAcdANLNDjn/c/O4LQoZWZtTy5Xd3VvhQ9tOcgRzJa8CN
	huO8SlpWy1qy9tyxg1HFGtNElsdWqFm2tVEKkY9x4zcwOjTMPrVHXgB36VLKcfOFW2y5LJR
	rR8cMai0eETpS51PHVgKASjKPwXmlzejDzm1BtdpWQbUwMPl/h5nZOisr4QWqyXhGzn/NuL
	KImPfl2kvm/2RDCFKTS7jAWPeDapX5VDJJJA7aWN7MhyuISR2gmT3d99A7WFGSCBdRNJuL4
	aSMhbOg4zPOQS7iR4XrCPeN+sMafPL1b4KkiFWbo3dq+ZYEvfO6Ak6NdhkfyOeQPJoC8e6i
	+XmuQRPyL8FDx3fc3n+NXffkvbG2PHULObrE25zTzQ1ejNlBYwa2eHF/QKa+MDGaZwKjgEN
	U7W8iwNbjpAT71ahM/Y1SFaOe+SE+NjpoxnZOj3dbVvsM7uyFstuVuPSbU+1mijZ3TZrKtO
	gasIkb4vLrakIv8LnrYNIFv+l2u3MwtkXv8LXSU38YBWNyu2gm7oJTbrsPINPy98HUFspZ7
	estwyHJNP3GlhNwsMHyVpt8dvfgEsyDb6EvqurdlplSsoo7K76Nc/+wzzeKzbD0wxheoikk
	qpSCkem+2IS542ZfgUD+luFqI3uKh6X4yqL6EqtyMxL4L6ls47QjLb4pz8nfqXHQRd6h2AM
	S/hep3whvX3f+Zs+hwz9jwE+Xw1pqrClTzzUmcCpjqoYoIfRpDrVETNfF8+OeBjXSdfUwEY
	2Xr2mrQfMseFdJn5EQiPYlvStFVvT98hmzxSQTT6Sk4otsehYhceQBGIFPj0RqC4uYQm4mB
	+QEj5jLopMvFnYtYiaMZnfdFhJuKf+a773prKV4LXfIyKYK5f75AwGvv1kB9CFMDc8nMLCD
	65XxTc8IKwKqzn0KgZ
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-MailFrom: qu@darknavy.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LBYWXXO6OCQ4J4WCLBZVS6DGE6PIGS2W
X-Message-ID-Hash: LBYWXXO6OCQ4J4WCLBZVS6DGE6PIGS2W
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:10:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBYWXXO6OCQ4J4WCLBZVS6DGE6PIGS2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

resending with a properly formatted diff (the previous email had a malformed
patch header). The change itself is the same: while fuzzing a USB gadget that
emulates a Tascam US-16x08 we found that get_meter_levels_from_urb() in
mixer_us16x08.c uses a channel index taken directly from the 64-byte meter
packet to index meter_level[], comp_level[] and master_level[] without any
bounds checking. A malformed packet can therefore cause out-of-bounds writes in
the snd_us16x08_meter_store.

A malicious USB audio device (or USB gadget implementation) that pretends to be
a US-16x08-compatible interface can trigger this by sending crafted meter
packets. We have a small USB gadget-based PoC for this behaviour and can share
it if that would be helpful.

This driver is used by common distributions (e.g. Ubuntu) when a US-16x08 or
compatible USB audio device is present. The same pattern is present in current
mainline kernels.

This issue was first reported via security@kernel.org. The kernel security team
explained that, in the upstream threat model, USB endpoints are expected to be
trusted (i.e. only trusted devices should be bound to drivers), so they
consider this a normal bug rather than a security vulnerability, and asked us
to send a fix to the development lists. The patch below adds simple range
checks before updating these arrays.

Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
Signed-off-by: Shipei Qu <qu@darknavy.com>
---
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
