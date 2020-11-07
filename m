Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1932AD34B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E8A16FC;
	Tue, 10 Nov 2020 11:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E8A16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003402;
	bh=gGSUycJFVWjBuFw25Ysv4GN3V5nLBNVG1QCmBymJPeM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G+fL832kQwcHuXhqiqbYsXNltFTt+x3Hb3oRSMexy5aIxwWUkuZ50gD4JvOdm+xHA
	 PAxNxlWZItaLrYXwcenw79rOMLL/LUVw/WO78fMuCIPObYZ3lkCyXuvOz8T38ypPBA
	 pY79IiD2kuDklcYFUiz6fWRpvyFevrFhvzmIGefQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B6AF801EC;
	Tue, 10 Nov 2020 11:14:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F74AF800BA; Sat,  7 Nov 2020 17:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F06CF800BA
 for <alsa-devel@alsa-project.org>; Sat,  7 Nov 2020 17:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F06CF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JVzsJXqn"
Received: by mail-pj1-x1043.google.com with SMTP id r9so948224pjl.5
 for <alsa-devel@alsa-project.org>; Sat, 07 Nov 2020 08:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=P5jbgj6ga3DTAIYJLP70354dsAkH43LDVwNjCSc3Lu8=;
 b=JVzsJXqnRxVNXvlRmJMFPFOahQlHR9Afqzwd04hKgojEWJKuB/n5dsHk1UEFWKgw+A
 1cMq+UmuQG8L1UnMR5Ca1nQE2WrbFNV0ktIpKjRy/sX+iMIK5bct30X0xU5mwIvTAjBf
 ODs8HE3iHHGqcDqudeBT40ITTnu59wtKgS766jR1c/WWsRn5eLaz9Xb0+KiCbub+OWHm
 MCD5qKz/smkYJctz7zvPJtbqJ3jDeeN9Qt05JRHXeXpN09qsmZFQ34JRg+73CpmO1tvd
 +H0yS7/AaD2uEqyuTXecxpgsUSoAFmz0vsseQ0ztbHREOWuBUzFbxR9wn/FKeKGlfbCj
 I1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P5jbgj6ga3DTAIYJLP70354dsAkH43LDVwNjCSc3Lu8=;
 b=XBOdEoL2NzBItAM7CR97gLYJT3IwBEYMbJV7Y0SXJckvm+semjx7Ofp/xAGc4XMRwh
 dX5DQtrrlsvWpeD/Y+a2Cysa38a8wWQswAVB2mdUPaEh1dBZQQn/b401c3AhxVhTx8nv
 2BcBLnp6cre760iqPnTwlu16uIQriLqtFzPRi6mcUzMdqwBvE/acf++9A1VBNJW9ALDD
 hf9KcpTzlZmQzAMUt5HJOJ+BPvkahyBU2TrKWvNrDHZCfwuOG2cP+BXhAdSp3IWPdfcy
 /+IaR/L2zjVE4F+OY55d7VFPG4mhAlcMwvKGKj/ked7XaDBmB0L9XEUEafBoaS4WdKq9
 GISA==
X-Gm-Message-State: AOAM530tZ1v8ZdulGKQrq7s57ALnW6HCv67PkInjmhNX0F4VeAUzx208
 aIDtSsoW3gaLaiWowXIqhA==
X-Google-Smtp-Source: ABdhPJzo8ABN6u+mCozytwwHLIrUDVpJSNi7I1by0dKWmCdbnYZnYUpcGIzn9/b4+GA5dQotttfeUQ==
X-Received: by 2002:a17:902:8504:b029:d6:7552:19ab with SMTP id
 bj4-20020a1709028504b02900d6755219abmr6032101plb.83.1604765616580; 
 Sat, 07 Nov 2020 08:13:36 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com.
 [67.216.221.250])
 by smtp.gmail.com with ESMTPSA id l62sm5623296pga.63.2020.11.07.08.13.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Nov 2020 08:13:35 -0800 (PST)
From: xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: firewire: fix comparison to bool warning
Date: Sun,  8 Nov 2020 00:13:31 +0800
Message-Id: <1604765611-8209-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:55 +0100
Cc: alsa-devel@alsa-project.org, Kaixu Xia <kaixuxia@tencent.com>,
 linux-kernel@vger.kernel.org
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

From: Kaixu Xia <kaixuxia@tencent.com>

Fix the following coccicheck warning:

./sound/firewire/amdtp-stream.h:273:6-19: WARNING: Comparison to bool

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 sound/firewire/amdtp-stream.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 2ceb57d1d58e..a3daa1f2c1c4 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -270,7 +270,7 @@ static inline bool amdtp_stream_wait_callback(struct amdtp_stream *s,
 					      unsigned int timeout)
 {
 	return wait_event_timeout(s->callback_wait,
-				  s->callbacked == true,
+				  s->callbacked,
 				  msecs_to_jiffies(timeout)) > 0;
 }
 
-- 
2.20.0

