Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD343CA36
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 14:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E446C16BA;
	Wed, 27 Oct 2021 14:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E446C16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635339474;
	bh=q3vL4FjTXhIazy83oG2VOAtdyMiqei+5/jSavwL7wxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbumrK0DwemIcLmRSCT2HHpesEpBuTbbm4B4e1VW/iR1903zIxQhR+SqZtvbmxJy1
	 axY8RH9tOSwzvHCJV7VXUfqJ0oPNi67q/uEqIMgcXu5ZbiCu6I8sqP5YIwxl6P69B+
	 +Ucqd+YtYzLyexY9SpzHihlb3h4dGIadpEuebf64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3312F804D0;
	Wed, 27 Oct 2021 14:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27D08F8032B; Wed, 27 Oct 2021 14:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1068CF8025A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1068CF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="fFRQxgpO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TADbxYrl"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DD6D5C0211;
 Wed, 27 Oct 2021 08:55:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 08:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ybdm4MrgODAHt
 HbfgT45jRvxfSX0HNGR0g+FMzPd45A=; b=fFRQxgpOr+B86xj/YBwkW2WA6J0J6
 kpa8o95TEqDoJYIdrScl2iI1+xQbGhGSRwCYbrZesM570npZXNBqJG2fzqFMkeuM
 QFaqmmdy5qgTnhnSaNqYQTXw53qq4oz58LDHI0TcVl7iqMHf16YBrRcLR/znTG7+
 n0L1y1S3AdW9f6JtPo2bWh1fUwUojynWu7GR2Y6VhDKJOU7YwoB8YREoX7pdgYQM
 BnTWQFRfrGxmbEzVQydKGgHcXgEtPw779Qe2wHVMhSZ7UjLMmy9gSVUc8Y655J2N
 3Icqxznyp1ir/xDAdu2fi1dZu690vcNm9w767ZwoL8sn/Yt5yPeC+UHHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ybdm4MrgODAHtHbfgT45jRvxfSX0HNGR0g+FMzPd45A=; b=TADbxYrl
 IhIZhQ3hONoqNPK3v5C4b40ErSXGmu/2bRta5LqIOtdlegWMjKdET/cN2W0h6Xbw
 w0kEPUs49MyYCOZhJFzTB7w87igou+20IK21F8APYbvd41jtAvKtLBaIJivBdUSH
 SX+aIrKBFpDALrsVyk2E2/PKvUoobv6mvt6OysJjOyq8/g3PHVi0vFGpGQcXh/Eh
 lztNOGH8gwqRW6cr5W29bEV+xgXMlAYtd7VeyilXUbSZuAetgGF/yQjTW3pwJnCZ
 uUqMy+dFPasSCV4aQINM7Cm75jsPvgDQZIyq4ykfOrO5ET5amG0OrPihNyNk6YWL
 qgPOneaflP9qNA==
X-ME-Sender: <xms:Tkx5YQiE-W8a4SOXijOIefVlLgAcc4BhZ9d4iLuIfq5BQZsUyRBexA>
 <xme:Tkx5YZCDMskjcV4E2E24wX24MHqzU2_xtVWgL5tHOgg4rOM5857k9zIFSAyKmRx2s
 piGXixTmO6bCJSe-Yc>
X-ME-Received: <xmr:Tkx5YYG81SwUSk2hjkizKa9JO7RmF7xVzqhS6EelUl4BbmEVZUCwD84-BSUoFNSP-4xYUfSo5-h8xFL8ucgm8E0TLD0S7SyPSoFii0kSngl_bPM6CisF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Tkx5YRSVLAgoQauUlbbab8Rfvbf8XQUDqTmxmJY64oY9g_Mo3bs1Jw>
 <xmx:Tkx5Ydw1n4tMr2uJpCs66epQ5_AJlupleTLj-wxtZ0-NgMpJzEmKEw>
 <xmx:Tkx5Yf4y5GyzWTwwOukF2ZHaliUsBkdfARNoArLB4mrRcxceKm7PdQ>
 <xmx:Tkx5YY-ikAsXDrDbKQd1xnl0d64X_yukZ6WYaJQX2lh20B6UrTFzeA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 08:55:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: firewire-motu: export mete information to userspace
 as float value
Date: Wed, 27 Oct 2021 21:55:29 +0900
Message-Id: <20211027125529.54295-4-o-takashi@sakamocchi.jp>
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

In command DSP models, one meter information consists of 4 bytes for
IEEE 764 floating point (binary32). In previous patch, it is exported
to userspace as 32 bit storage since the storage is also handled in
ALSA firewire-motu driver as well in kernel space in which floating point
arithmetic is not preferable. On the other hand, ALSA firewire-motu driver
doesn't perform floating point calculation. The driver just gather meter
information from isochronous packets and fill structure fields for
userspace.

In 'header' target of Kbuild, UAPI headers are processed before installed.
In this timing, #ifdef macro with __KERNEL__ is removed. This mechanism
is useful in the case so that the 32 bit storage can be accessible as u32
type in kernel space and float type in user space. We can see the same
usage in ''struct acct_v3' in 'include/uapi/linux/acct.h'.

This commit is for the above idea. Additionally, due to message
protocol, meter information is filled with 0xffffffff in the end of
period but 0xffffffff is invalid as binary32. To avoid confusion in
userspace application, the last two elements are left without any
assignment.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                         | 8 +++++---
 sound/firewire/motu/motu-command-dsp-message-parser.c | 7 +++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 68eb0e43c052..39cf6eb75940 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -248,12 +248,14 @@ struct snd_firewire_motu_register_dsp_parameter {
  *
  * The structure expresses the part of DSP status for hardware meter. The 32 bit storage is
  * estimated to include IEEE 764 32 bit single precision floating point (binary32) value. It is
- * expected to be linear value (not logarithm) for audio signal level between 0.0 and +1.0. However,
- * the last two quadlets (data[398] and data[399]) are filled with 0xffffffff since they are the
- * marker of one period.
+ * expected to be linear value (not logarithm) for audio signal level between 0.0 and +1.0.
  */
 struct snd_firewire_motu_command_dsp_meter {
+#ifdef __KERNEL__
 	__u32 data[SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT];
+#else
+	float data[SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT];
+#endif
 };
 
 #endif /* _UAPI_SOUND_FIREWIRE_H_INCLUDED */
diff --git a/sound/firewire/motu/motu-command-dsp-message-parser.c b/sound/firewire/motu/motu-command-dsp-message-parser.c
index 18689fcfb288..9efe4d364baf 100644
--- a/sound/firewire/motu/motu-command-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-command-dsp-message-parser.c
@@ -141,12 +141,15 @@ void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const stru
 					++parser->fragment_pos;
 
 					if (parser->fragment_pos == 4) {
+						// Skip the last two quadlets since they could be
+						// invalid value (0xffffffff) as floating point
+						// number.
 						if (parser->value_index <
-						    SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT) {
+						    SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT - 2) {
 							u32 val = (u32)(parser->value >> 32);
 							parser->meter.data[parser->value_index] = val;
-							++parser->value_index;
 						}
+						++parser->value_index;
 						parser->fragment_pos = 0;
 					}
 
-- 
2.30.2

