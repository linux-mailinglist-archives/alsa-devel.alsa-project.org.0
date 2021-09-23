Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBD4162B9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Sep 2021 18:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA79165E;
	Thu, 23 Sep 2021 18:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA79165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632413167;
	bh=K5JR84ozoXXu7lBOP8cius681XDAg5SR4KDIm/TZprs=;
	h=From:To:Subject:References:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=phjQE/+Qtd2sDe8giYhcWUL6Phofjz4tK3n2gZC0YKKuz7gcb3ma0Gq0ps46tomp6
	 +b4Yp3cVDkueZ45BLpjTae36IhGFHF84oo1yZkYZJwy3CD/nRQ5AAlO6UF3krX7RWj
	 ljG9FWU2pE29cB7QVP2sTCPoQrSORHS2s24suynY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0490F804B1;
	Thu, 23 Sep 2021 18:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA05F804A9; Thu, 23 Sep 2021 18:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C266FF80268
 for <alsa-devel@alsa-project.org>; Thu, 23 Sep 2021 18:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C266FF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="hxjpN/fi"; 
 dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="/pakvF5t"
Message-ID: <20210923153339.623208460@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1632413066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=O+eQk8u/ka3YLY7XRsH/AdQMs3q0/TK+//yr5k43qZM=;
 b=hxjpN/fiZbguPl9Ugg65t8iJZTEsptDGMcYbmqKyyQqUZErlcTJjInhjJrseUFfLcOoDSp
 G2niHC+tL3UzXtQuTpwFxOXt2Q6neXbVG3aOc6vPVXtNw/Ro1yajganewAkrbSNHcu0gGn
 FjIkTH9axPhfftmx2JEXzLQrQ+70wHAxyuXYnUlIdCozG0KEURa4sT4ibF2yLNCb846Eu7
 wiqsA4UCpBWn29ZfrG1C7eNrOG3mFAlq6VMcX/avs/F48lcrmkdykByrTj9Z0g7WhjP8c+
 5m/SfPlXJ/rtnoyQ+d6y5e+A7YRZACPydJnqJ5bJMh8LlGOfvLZ69J5OYO+8Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1632413066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=O+eQk8u/ka3YLY7XRsH/AdQMs3q0/TK+//yr5k43qZM=;
 b=/pakvF5tifiIv5hz720qFG+huSlyRoYiz+DD/cB0haV8bNXI1S1moBtwGCqa0PZkpLn5UW
 lRfXFWWZtlU8b/DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 04/11] ALSA: pcsp: Make hrtimer forwarding more robust
References: <20210923153311.225307347@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Sep 2021 18:04:25 +0200 (CEST)
Cc: Peter Zijlstra <peterz@infradead.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

The hrtimer callback pcsp_do_timer() prepares rearming of the timer with
hrtimer_forward(). hrtimer_forward() is intended to provide a mechanism to
forward the expiry time of the hrtimer by a multiple of the period argument
so that the expiry time greater than the time provided in the 'now'
argument.

pcsp_do_timer() invokes hrtimer_forward() with the current timer expiry
time as 'now' argument. That's providing a periodic timer expiry, but is
not really robust when the timer callback is delayed so that the resulting
new expiry time is already in the past which causes the callback to be
invoked immediately again. If the timer is delayed then the back to back
invocation is not really making it better than skipping the missed
periods. Sound is distorted in any case.

Use hrtimer_forward_now() which ensures that the next expiry is in the
future. This prevents hogging the CPU in the timer expiry code and allows
later on to remove hrtimer_forward() from the public interfaces.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>
---
 sound/drivers/pcsp/pcsp_lib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/drivers/pcsp/pcsp_lib.c
+++ b/sound/drivers/pcsp/pcsp_lib.c
@@ -143,7 +143,7 @@ enum hrtimer_restart pcsp_do_timer(struc
 	if (pointer_update)
 		pcsp_pointer_update(chip);
 
-	hrtimer_forward(handle, hrtimer_get_expires(handle), ns_to_ktime(ns));
+	hrtimer_forward_now(handle, ns_to_ktime(ns));
 
 	return HRTIMER_RESTART;
 }

