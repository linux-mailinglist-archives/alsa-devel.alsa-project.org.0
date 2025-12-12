Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B8CB95D9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Dec 2025 17:53:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FC960219;
	Fri, 12 Dec 2025 17:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FC960219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765558437;
	bh=dBE55fGA9SPoyrAsDB/+SxZFjDCYia4gGJVfSXMYpl4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A0Sxvr+5znXTYdjDCz/ED0buvGMf/1sBnjO5ITEaVxrPwCUA1kLKSlvi7vIEaLkYX
	 J8VAKlSjd9+xLWrqOsNY3JNEcu3CdzhV0i9miWJClwhIG3hXUQ32i2by0AVu/mxoLl
	 QVgmsMliS9VMHxU8piJxTmiZFxF4AGzwSdrD+JVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6E65F8060F; Fri, 12 Dec 2025 17:53:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A6DAF805EA;
	Fri, 12 Dec 2025 17:53:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12F22F8014B; Fri, 12 Dec 2025 07:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FROM_EXCESS_BASE64,HTML_MESSAGE,MSGID_FROM_MTA_HEADER,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE086F800F3
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 07:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE086F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=darknavy.com header.i=@darknavy.com header.a=rsa-sha256
 header.s=litx2311 header.b=aIjY2TXo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=darknavy.com;
	s=litx2311; t=1765522485;
	bh=6kGyaOyesep/N+pAYTcr3tnMaD23YxbFkguVuDmysGI=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=aIjY2TXoQ6aP+rxw/PdEmbJIqepXVdHstaZ7/hhbQEV2qNgClZT9hZNNGw9YL81Ar
	 pygXnFuuz8tblf02o23azytofCNYfShfD4eERHY/Qksr/oGSUA4S7IsTCPcenpUV7c
	 ylewVQAuujWUk97gnXQl3ZysIhq+/KRAORtglJu0=
EX-QQ-RecipientCnt: 5
X-QQ-GoodBg: 2
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 00400020000000F0
X-QQ-FEAT: ySJ3WsVYOxuKF6HqgRRcc9GSngRkNJuJ7tiPvtBAyhA=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: 2NkoBsp7g/FY6vq7kJPAmQbFiI8wL7RlYYVENe2etV8=
X-Originating-IP: 58.38.96.44
X-QQ-STYLE: 
X-QQ-mid: lv3sz3b-7t1765522478t88686f9d
From: "=?utf-8?B?VnVsbmVyYWJpbGl0eSBSZXBvcnQ=?=" <vr@darknavy.com>
To: "=?utf-8?B?SmFyb3NsYXYgS3lzZWxh?=" <perex@perex.cz>,
 "=?utf-8?B?VGFrYXNoaSBJd2Fp?=" <tiwai@suse.com>
Cc: "=?utf-8?B?YWxzYS1kZXZlbA==?=" <alsa-devel@alsa-project.org>,
 "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-mixer: us16x08: validate meter packet indices
Mime-Version: 1.0
Content-Transfer-Encoding: 8Bit
Date: Fri, 12 Dec 2025 14:54:37 +0800
X-Priority: 3
Message-ID: <tencent_21C112743C44C1A2517FF219@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 3424617670848202761
X-Address-Ticket: 
 version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Fri, 12 Dec 2025 14:54:39 +0800 (CST)
Feedback-ID: lv:darknavy.com:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: ONjL9v3+DhWkm1QCVxj68urVeHXmzb9OHdrbtWw4Et1CQvBufnAc4AK6
	rTKLSXmi3TI+gvGVJ1LjjRi52PHimXY5kUI2W1PGUBCEYnx27JUx8E2XI9+au76UjYxR29U
	YswlzOvaB1IAPsHvby04Yk3FAIm5yEJzEMXE9A+OAYWiV7S35vTUrYhGJ++VQbmGRo+lMqk
	Ycjf2C3G3ac1o3piBo+E1zRJ3IeSNjAqZyFlQ1lHhyL3g11bKdp2EBGcBowPqyWuvYFKjhi
	y3zjITV8IBgdYXkp7ULbFEPDefK0/ZXDxz0ulKUoK4JDC0WTrHxe5Ng/xdrg0fuMZTFNJXq
	Plpyfs7Q35o2Ac/59mBZxr6162PoRB/6lX7sBoAUfmtkdVCTnkMe4JGXXJ/StZZtKz3KJD2
	C/7bE36y0yaJ6u0DHNiCMwO7o3i2iCTMC+5pcDhYjg8JQtXPTDfmODs1ezLR7xwIGmqvmF+
	lXO6ncb8mwf2UkIhWSrHhhLI5bjp9NpKilmXVQF5VhIeDq4ZZluoP7bKTja4HrJ4G5yYPsT
	iEj5kSQNsrFL7Ut2f5kSIspiWsij26oRnDh52oHvvnYM0lgPgSYa/xkNXok//TaKDfK9q9i
	mm1dOPV1l+3hvCKyrGVOZOf2ArRmN9zslMKwI9aC3eSIdn8RNjcK6oKOlsZ4D1hkikFv4pd
	C19pV+rEgLLe2Au3GYpnMrrvEGtfd/6JpBknUl/LBrou/VhyQd3Q0i1xA3tg5DPtMgFcL8I
	3c9IGXd5wwN/mfbZY1Boff2CTebCzfmzZHQ7zIkS/l/qld03kJO2a2WAKRIOPKFVBsKqWfp
	RqhKADXi7/kumLz+HuQqhDU1NawcVfgryqmwLoH6QmtbEasgkTsRpk0C3J3eQCxVC5aquyQ
	XdcwBfMOHJUX0791EAfdWrEH88TJb4lUw43MWMTHTyJ8AbevpU5hfH/JI8S67Iyn4M+4Z+T
	59I1d2xhPDjDw3IhsCUnhF6yYoHukM7OGkvihhPglh0+toJ8FXvI2HNuZ50qrz9ZsOy24CX
	a6w0x6avK0l+l/xf66h6TMdDJMMQpJxSA1gJ/NaFX1vmkiWL0mevKCm3k0024IGPZCZD1tG
	q8belVj/rPw
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-MailFrom: vr@darknavy.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UTCLQWOSUP3L2WEGWNQUYL4L37HGRVHE
X-Message-ID-Hash: UTCLQWOSUP3L2WEGWNQUYL4L37HGRVHE
X-Mailman-Approved-At: Fri, 12 Dec 2025 16:52:28 +0000
Content-Type: text/plain;
	charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTCLQWOSUP3L2WEGWNQUYL4L37HGRVHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

while fuzzing a USB gadget that emulates a Tascam US-16x08 we found that
get_meter_levels_from_urb() in mixer_us16x08.c uses a channel index
taken directly from the 64-byte meter packet to index meter_level[],
comp_level[] and master_level[] without any bounds checking. A malformed
packet can therefore cause out-of-bounds writes in the
snd_us16x08_meter_store.


A malicious USB audio device (or USB gadget implementation) that
pretends to be a US-16x08-compatible interface can trigger this by
sending crafted meter packets. We have a small USB gadget-based PoC for
this behaviour and can share it if that would be helpful.


This driver is used by common distributions (e.g. Ubuntu) when a
US-16x08 or compatible USB audio device is present. The same pattern is
present in current mainline kernels.


This issue was first reported via security@kernel.org. The kernel
security team explained that, in the upstream threat model, USB
endpoints are expected to be trusted (i.e. only trusted devices should
be bound to drivers), so they consider this a normal bug rather than a
security vulnerability, and asked us to send a fix to the development
lists. The patch below adds simple range checks before updating these
arrays.


Suggested patch:


---
&nbsp;sound/usb/mixer_us16x08.c | 15 +++++++++++++--
&nbsp;1 file changed, 13 insertions(+), 2 deletions(-)


diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index XXXXXXXX..YYYYYYYY 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -647,15 +647,26 @@ static int snd_get_meter_comp_index(struct snd_us16x08_meter_store *store)
&nbsp;/* retrieve the meter level values from URB message */
&nbsp;static void get_meter_levels_from_urb(int s,
&nbsp;     struct snd_us16x08_meter_store *store,
&nbsp;     u8 *meter_urb)
&nbsp;{
&nbsp;     int val = MUC2(meter_urb, s) + (MUC3(meter_urb, s) << 8);
+     int ch = MUB2(meter_urb, s) - 1;
+
+     if (ch < 0)
+           return;
&nbsp;
&nbsp;     if (MUA0(meter_urb, s) == 0x61 &amp;&amp; MUA1(meter_urb, s) == 0x02 &amp;&amp;
-           MUA2(meter_urb, s) == 0x04 &amp;&amp; MUB0(meter_urb, s) == 0x62) {
-           if (MUC0(meter_urb, s) == 0x72)
-                 store-&gt;meter_level[MUB2(meter_urb, s) - 1] = val;
-           if (MUC0(meter_urb, s) == 0xb2)
-                 store-&gt;comp_level[MUB2(meter_urb, s) - 1] = val;
-     }
+           MUA2(meter_urb, s) == 0x04 &amp;&amp; MUB0(meter_urb, s) == 0x62) {
+           if (ch < SND_US16X08_MAX_CHANNELS) {
+                 if (MUC0(meter_urb, s) == 0x72)
+                       store-&gt;meter_level[ch] = val;
+                 if (MUC0(meter_urb, s) == 0xb2)
+                       store-&gt;comp_level[ch] = val;
+           }
+     }
&nbsp;     if (MUA0(meter_urb, s) == 0x61 &amp;&amp; MUA1(meter_urb, s) == 0x02 &amp;&amp;
-           MUA2(meter_urb, s) == 0x02 &amp;&amp; MUB0(meter_urb, s) == 0x62)
-           store-&gt;master_level[MUB2(meter_urb, s) - 1] = val;
+           MUA2(meter_urb, s) == 0x02 &amp;&amp; MUB0(meter_urb, s) == 0x62) {
+           if (ch < ARRAY_SIZE(store-&gt;master_level))
+                 store-&gt;master_level[ch] = val;
+     }
&nbsp;}


Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com&gt;
Signed-off-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com&gt;
