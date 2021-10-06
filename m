Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C54423C6C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E48A51691;
	Wed,  6 Oct 2021 13:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E48A51691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518907;
	bh=3bZ0l2e9fq6OQbxRWcrK/pEDNJzTx0y2BSzq7eI+KEQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aG+jQal/7SLZ1+yYjfpeTOIoZ7pklyL1JmOKsn/limClU+oEQ6wKKUG0DV+VUAuux
	 hExtZ1fQawdVkXzGEdVy9ArC6JHkuyaLjK38ZsIW5/MaV2uja5+H3XMkCoJXFkaLFu
	 bclTslmCCLhvNnz+g9T4ASNxkHSMXJeOLPhyR0hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D638F80240;
	Wed,  6 Oct 2021 13:13:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76337F80249; Wed,  6 Oct 2021 13:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 155D0F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 155D0F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o0rLr4Qv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3539261100;
 Wed,  6 Oct 2021 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633518769;
 bh=3bZ0l2e9fq6OQbxRWcrK/pEDNJzTx0y2BSzq7eI+KEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o0rLr4QvGMvDK5GTcgn3nBfUZ9VRM6xyAoP4VtevrjUttjgccfc+KUMnU4AogHl6S
 Z8hwr1wKfT/TnTK4NGivEaVV7gpU0SvxDektaie9y0st1grDig4jzQ0D0C6eaNRqbR
 9iJWLolpWFeVjYX1kMXhd50HDiFZcLSbAzQqR6YdEXG+dVBnUmwTz7QphjXDfPRjCh
 xaZ1fZWSVK+sKp3w+QvUF0RZuR+YMKBRS4ACxVPVGoIFEUgpzeXbForRuu24CjP4dY
 HkcHGzdV4wn5EXI/b3e6+hbtVy+SiY7vhiNvIjV86OTElW5WGNU8iu259xUELf9aAK
 jqXuAIo0jZr7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH MANUALSEL 5.10 7/7] ALSA: pcsp: Make hrtimer forwarding more
 robust
Date: Wed,  6 Oct 2021 07:12:33 -0400
Message-Id: <20211006111234.264020-7-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006111234.264020-1-sashal@kernel.org>
References: <20211006111234.264020-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit f2ff7147c6834f244b8ce636b12e71a3bd044629 ]

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
Link: https://lore.kernel.org/r/20210923153339.623208460@linutronix.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/drivers/pcsp/pcsp_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/pcsp/pcsp_lib.c b/sound/drivers/pcsp/pcsp_lib.c
index ed40d0f7432c..773db4bf0876 100644
--- a/sound/drivers/pcsp/pcsp_lib.c
+++ b/sound/drivers/pcsp/pcsp_lib.c
@@ -143,7 +143,7 @@ enum hrtimer_restart pcsp_do_timer(struct hrtimer *handle)
 	if (pointer_update)
 		pcsp_pointer_update(chip);
 
-	hrtimer_forward(handle, hrtimer_get_expires(handle), ns_to_ktime(ns));
+	hrtimer_forward_now(handle, ns_to_ktime(ns));
 
 	return HRTIMER_RESTART;
 }
-- 
2.33.0

