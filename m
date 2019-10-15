Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD62DA546
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 08:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B371670;
	Thu, 17 Oct 2019 08:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B371670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571292290;
	bh=R45f6dIZus5sXFL9d/FvfQKOcT9qEBPtbxP+BMhU7mw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CCfM/0occ1FdepRP9WF32kQKtJvYjN96TMF5KZ0XggL/5+D49TzJtwj92bD9zUokF
	 OI44pPAi/Lzdx8vUWezU33iWIjYLp7nMtqoo/YKxpZl5nUEAQ4C3gfcFjZa06MnHof
	 MhmImlsTqWdM6m4aDAN4IBUtj9fUVTgoYh3WwFO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 888BDF805FA;
	Thu, 17 Oct 2019 08:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33506F804AA; Tue, 15 Oct 2019 06:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A27EF800F4
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 06:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A27EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=bewilderbeest.net
 header.i=@bewilderbeest.net header.b="E/yn/xDz"
Received: from longray.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba22:6b9e:df64:6c86:95f5])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D4667805DB;
 Mon, 14 Oct 2019 21:37:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net D4667805DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1571114223;
 bh=+T+6kN00kssZgXticUPAOADF8eGG5XuazjOjaZ6wSQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=E/yn/xDzH2+Rg5/uHpjsCuhebOQXLtIZCVPky8glnaAaGOB+OnszYLybeYpXAmg9Y
 tDWo/Ywwj1NqZzq94+4bATqtbQKlvb0MbvUDV7oX2uZpNRlcw3/q0pMIiUgTK7uKqH
 gTWqTRI8dgnNAs8R0M5JNMQxfTCMoDm2tGhqXP0w=
From: Zev Weiss <zev@bewilderbeest.net>
To: alsa-devel@alsa-project.org
Date: Mon, 14 Oct 2019 23:36:50 -0500
Message-Id: <20191015043650.23536-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Oct 2019 08:02:16 +0200
Cc: Zev Weiss <zev@bewilderbeest.net>
Subject: [alsa-devel] [PATCH] alsactl: don't exit on EINTR from epoll_wait().
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

Previously, things like attaching strace to a running 'alsactl monitor'
process would cause it to exit.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 alsactl/monitor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/alsactl/monitor.c b/alsactl/monitor.c
index 6b090e4f5c92..cf4167bee165 100644
--- a/alsactl/monitor.c
+++ b/alsactl/monitor.c
@@ -342,6 +342,8 @@ static int run_dispatcher(int epfd, int sigfd, int infd, struct list_head *srcs,
 
 		count = epoll_wait(epfd, epev, max_ev_count, 200);
 		if (count < 0) {
+			if (errno == EINTR)
+				continue;
 			err = count;
 			break;
 		}
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
