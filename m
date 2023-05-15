Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA58702779
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 10:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC85282B;
	Mon, 15 May 2023 10:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC85282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684140180;
	bh=g87RweiRVYEUQN9Oo8a04W6MJeIdKddNLYZCLONeNys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4lAbIBYDaTC7TWIyZ+9sWeuX+UMoGj91SBQ49ARWscW5+jceoDS83HTDbwMJcanP
	 SCVPzTedhN/20iyvGbsgCzyNeoQkS1QfpGPhDX/2cSU8u0deHxFMvDs7OI6UbHrWrq
	 Qj2femZ9YMbeKeMNghnz+s1OZLnscPo24LnlU8EE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2791F80563; Mon, 15 May 2023 10:41:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7557EF80551;
	Mon, 15 May 2023 10:41:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E13D4F80272; Mon, 15 May 2023 10:41:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF1A0F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 10:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1A0F8024E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 050E62424B;
	Mon, 15 May 2023 04:41:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyTlS-Std-00; Mon, 15 May 2023 10:41:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] pcm: hw: fix excessive silence fill on drain
Date: Mon, 15 May 2023 10:41:06 +0200
Message-Id: <20230515084106.3447657-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230515084106.3447657-1-oswald.buddenhagen@gmx.de>
References: <20230515084106.3447657-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RLIMAND3XSZAPWLMHN3MX3RNONQ772AI
X-Message-ID-Hash: RLIMAND3XSZAPWLMHN3MX3RNONQ772AI
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLIMAND3XSZAPWLMHN3MX3RNONQ772AI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Setting the threshold to the size of the buffer results in additional
filling each time a period elapses. As draining is usually initiated
with a rather full buffer, this would usually result in filling way in
excess of what was intended.

A sufficient threshold is the required worst-case fill, that is, one
period size plus the "overhang".

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

This patch is entirely untested! But it's derived from my previously
posted v3 kernel patch, which was successfully tested.
---
 src/pcm/pcm_hw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index ecc47a76..a5f87215 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -764,12 +764,11 @@ static int snd_pcm_hw_drain(snd_pcm_t *pcm)
 	}
 	silence_size += silence_slack;
 	if (sw_params.silence_size < silence_size) {
-		/* fill the silence soon as possible (in the bellow ioctl
-		 * or the next period wake up)
-		 */
-		sw_params.silence_threshold = pcm->buffer_size;
-		if (silence_size > pcm->buffer_size)
-			silence_size = pcm->buffer_size;
+		sw_params.silence_threshold = pcm->period_size + silence_slack;
+		if (sw_params.silence_threshold > pcm->buffer_size)
+			sw_params.silence_threshold = pcm->buffer_size;
+		if (silence_size > sw_params.silence_threshold)
+			silence_size = sw_params.silence_threshold;
 		sw_params.silence_size = silence_size;
 		if (ioctl(hw->fd, SNDRV_PCM_IOCTL_SW_PARAMS, &sw_params) < 0) {
 			err = -errno;
-- 
2.40.0.152.g15d061e6df

