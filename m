Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFBE61D7B4
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 07:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B231634;
	Sat,  5 Nov 2022 07:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B231634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667628153;
	bh=R21yatxMhCZCEtV6KTp1Sci+NG8CUo+hIRYOdjt32Rg=;
	h=Date:From:To:Subject:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=odD9NCFV5Zvpsh88XOXcJgswx7BGOiBT/s62QeftXmQKui++PQKsXbsjcilXsbseI
	 yB29PzIhliuQb7bpVeZWotZNaFKL73SulwzWzLD57XWIm4GsTfMFwNlOAOueSipRvz
	 mXfW4PyvEE/Z4/VEtoowjrQp/JW0nK1Un3/zTECQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CCEFF801D5;
	Sat,  5 Nov 2022 07:01:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F0ABF80494; Sat,  5 Nov 2022 07:01:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C2DF8027C
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 07:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C2DF8027C
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0843D60A53;
 Sat,  5 Nov 2022 06:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D65C43470;
 Sat,  5 Nov 2022 06:01:31 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
 (envelope-from <rostedt@goodmis.org>) id 1orCFj-007Osw-1v;
 Sat, 05 Nov 2022 02:01:59 -0400
Message-ID: <20221105060159.433729602@goodmis.org>
User-Agent: quilt/0.66
Date: Sat, 05 Nov 2022 02:00:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4a 25/38] timers: ALSA: Use timer_shutdown_sync() before
 freeing timer
References: <20221105060024.598488967@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: alsa-devel@alsa-project.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Takashi Iwai <tiwai@suse.de>,
 Austin Kim <austin.kim@lge.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Before a timer is freed, timer_shutdown_sync() must be called.

Link: https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Austin Kim <austin.kim@lge.com>
Cc: alsa-devel@alsa-project.org
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 sound/i2c/other/ak4117.c | 2 +-
 sound/synth/emux/emux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index 1bc43e927d82..640501bb3ca6 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -47,7 +47,7 @@ static void reg_dump(struct ak4117 *ak4117)
 
 static void snd_ak4117_free(struct ak4117 *chip)
 {
-	del_timer_sync(&chip->timer);
+	timer_shutdown_sync(&chip->timer);
 	kfree(chip);
 }
 
diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index a870759d179e..0006c3ddb51d 100644
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -129,7 +129,7 @@ int snd_emux_free(struct snd_emux *emu)
 	if (! emu)
 		return -EINVAL;
 
-	del_timer_sync(&emu->tlist);
+	timer_shutdown_sync(&emu->tlist);
 
 	snd_emux_proc_free(emu);
 	snd_emux_delete_virmidi(emu);
-- 
2.35.1
