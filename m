Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE911938C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966921670;
	Tue, 10 Dec 2019 22:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966921670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576012388;
	bh=YFa3fhlmboKxUyBVzBvCUwtgdPUZrncmdZjTG103BK8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GsRuM/PHWHg9rZIZuUlM2JxnXe+Drju1331ZX0k1BJRNvROm7oM5SJWxHu2ucnSQU
	 Ty/98P1gjk9xCrVkgoWmdG8EiIyFSnjTcco7xg6IA1jxKH2nD9Ckj9l1uoh48TTbJ/
	 pJgp0sFqGnhYaKd+JQzUEeJ2b+E22znqtKPVJfoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E436AF80259;
	Tue, 10 Dec 2019 22:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72AD5F80259; Tue, 10 Dec 2019 22:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EA28F80257
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA28F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oVq0i3pV"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 574EC246AA;
 Tue, 10 Dec 2019 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012243;
 bh=lODidp+xqeK9X0+Fcutlh0HKg83nX1UWyAhTUhsKRRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oVq0i3pVVAaFpHGbzhUH+8gFURWcMe7rGIGdWto9Pri8uALQj9zyLMVnW5Cwmndep
 DXUc/0LSSbYjsfGeI1oEK1+Ut2etfTZ4tPvNCwAYkU1Orw/DR2W60z635S1bmGWgPa
 FPfqY2BREGEXjv8XcSmfKMUrzSWwBjpNb6lsjA6w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:04:56 -0500
Message-Id: <20191210210735.9077-152-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 191/350] ALSA: bebob: expand sleep
	just after breaking connections for protocol version 1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit d3eabe939aee3ffd5b133766a932629a9746298c ]

As long as I investigated, some devices with BeBoB protocol version 1
can be freezed during several hundreds milliseconds after breaking
connections. When accessing during the freezed time, any transaction
is corrupted. In the worst case, the device is going to reboot.

I can see this issue in:
 * Roland FA-66
 * M-Audio FireWire Solo

This commit expands sleep just after breaking connections to avoid
the freezed time as much as possible. I note that the freeze/reboot
behaviour is similar to below models:
 * Focusrite Saffire Pro 10 I/O
 * Focusrite Saffire Pro 26 I/O

The above models certainly reboot after breaking connections.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20191101131323.17300-2-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/bebob/bebob_stream.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 6c1497d9f52ba..ce07ea0d4e71d 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -415,15 +415,16 @@ static int make_both_connections(struct snd_bebob *bebob)
 	return 0;
 }
 
-static void
-break_both_connections(struct snd_bebob *bebob)
+static void break_both_connections(struct snd_bebob *bebob)
 {
 	cmp_connection_break(&bebob->in_conn);
 	cmp_connection_break(&bebob->out_conn);
 
-	/* These models seems to be in transition state for a longer time. */
-	if (bebob->maudio_special_quirk != NULL)
-		msleep(200);
+	// These models seem to be in transition state for a longer time. When
+	// accessing in the state, any transactions is corrupted. In the worst
+	// case, the device is going to reboot.
+	if (bebob->version < 2)
+		msleep(600);
 }
 
 static int
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
