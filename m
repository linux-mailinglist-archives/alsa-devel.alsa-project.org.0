Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D8388C27
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0217B166E;
	Wed, 19 May 2021 12:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0217B166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621421768;
	bh=1kLAa4tfpQ5ZqWfgfvQwF+yNTK3+CRddf4+wfGouv40=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N46R+6PtW7GTks5JFZgtTIi8/9ak/96/zOeCyw/iUVReHShy0cOXL0W4mFLdUOslf
	 lI1nv/NX50Viou0N9Qh4RhG/mjkjiYc7VLMRLdkIe1UpA2UkPGtdai9imHurMnpwIm
	 VKZqoPBSpkemnn1s8MDhYMX7oQsH5QWYFY/8Jbaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 901EEF80153;
	Wed, 19 May 2021 12:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55CE1F8016E; Wed, 19 May 2021 12:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F75F80148
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F75F80148
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1ljJqL-0000Tq-4b; Wed, 19 May 2021 10:54:25 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ALSA: rawmidi: fix incorrect array bounds check on
 clock_names
Date: Wed, 19 May 2021 11:54:24 +0100
Message-Id: <20210519105424.55221-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The array bounds check on clock_names is currently checking the size
of the entire array rather than the number of elements in the array
leading to a potential array bounds read error. Fix this by using
the ARRAY_SIZE macro instead of sizeof.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 08fdced60ca0 ("ALSA: rawmidi: Add framing mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/core/rawmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 4a6534db77d6..6c0a4a67ad2e 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1679,7 +1679,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    buffer_size, avail, xruns);
 				if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
 					clock_type = substream->clock_type >> SNDRV_RAWMIDI_MODE_CLOCK_SHIFT;
-					if (!snd_BUG_ON(clock_type >= sizeof(clock_names)))
+					if (!snd_BUG_ON(clock_type >= ARRAY_SIZE(clock_names)))
 						snd_iprintf(buffer,
 							    "  Framing      : tstamp\n"
 							    "  Clock type   : %s\n",
-- 
2.31.1

