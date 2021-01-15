Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DA2F7FE2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 16:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430521807;
	Fri, 15 Jan 2021 16:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430521807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610725421;
	bh=ja9/zY5klKIbUFoe7SgZZdt/hWE5DZjgAyRvcwPZs7o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nKMCawzClwGYRaHd3uw88LX1KPumgJSH6iQAXPos4EbD4EhNUJrSc95Zaw/A0zaYg
	 EVcU2q1dTMpI7mHZIpz+l5I/gbHIuaismjZxRs4jK2+5MoYUvPU280rWEXxvz0ViNn
	 ySEKnNskC/6jgI4TLkXUMw2SG7RvzGzhV62W6h/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4804F80113;
	Fri, 15 Jan 2021 16:42:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2AC7F801ED; Fri, 15 Jan 2021 16:42:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72FD4F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 16:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72FD4F80113
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l0REV-0001U7-M1; Fri, 15 Jan 2021 15:41:51 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ALSA: usb-audio: remove initialization of
 param_period_time_if_needed
Date: Fri, 15 Jan 2021 15:41:51 +0000
Message-Id: <20210115154151.75022-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
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

Variable param_period_time_if_needed is being initialized with a value
that is never read, the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index f71965bf815f..ed654338f6b7 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -934,7 +934,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 {
 	const struct audioformat *fp;
 	unsigned int pt, ptmin;
-	int param_period_time_if_needed = -1;
+	int param_period_time_if_needed;
 	int err;
 
 	runtime->hw.formats = subs->formats;
-- 
2.29.2

