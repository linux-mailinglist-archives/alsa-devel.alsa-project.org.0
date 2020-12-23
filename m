Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D433B2E201C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:47:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E9A17ED;
	Wed, 23 Dec 2020 18:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E9A17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745638;
	bh=rbLzn8724zW0PT6dPhEL1L70ImPz3rX0us93VXdQ+h4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6GLBvS4mbrKUzIWB4DyYq7X0ZE9LuSvY8v13rTWoiw09nVF+P0CT+MZkMwbhu2rx
	 vK73n17w+kafZzGikCVFBGoPxP7wMUQFC755M58qEZ73bYlNKZ0Iqv5KIKip5PStzA
	 eJQmY2TnOJ6yqhl6Mev8JhMOPRb1Jv/1qRw/yp8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C01F804E0;
	Wed, 23 Dec 2020 18:44:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 916ABF804D2; Wed, 23 Dec 2020 18:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 525D2F800BC
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 525D2F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="ie4xv2ZR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=irU4ok4di1n21Jo8y2elJOfnOB0TgpA0rzfahs/6SuU=; b=ie4xv2ZROIcg8qqpziOpr5EW97
 KLbvIpcxT+oQFBhqnGK4NRDP8SV3lNqKs+14hM3MguEpVv8sGrSNxpcW04VgYrQFaXp7sIEO9/jHv
 AQ7nyvNZVUIPnsXI4jsoMidRdcn7Ys1EJRAomT35DTPQ5PiND2rOlx8pddC+koKv4zLQZhJhQV0/U
 gMTyUAYTXDD7DaOXH3n9CcwbGLFQIap+WXXEiHHZhrkfEiIGblIrb1YYcSqoJReoZVnSpq93+AYhq
 6K4xvuKXcEEUEi7mQ3z0/4DE+b1pxN5xv4YCf3OhA1UUSwXEB9mvT4VExzSR3Uu61LuL0cOZk/B0X
 ge73Su+w==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks8Ba-0001PJ-Pf; Wed, 23 Dec 2020 18:44:30 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-TN; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 17/18] ALSA: sis7019: Use DIV_ROUND_CLOSEST() instead of
 open-coding it
Date: Wed, 23 Dec 2020 18:22:28 +0100
Message-Id: <20201223172229.781-17-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_CLOSEST() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@r1@
expression x;
constant C1;
constant C2;
@@
 ((x) + C1) / C2

@script:python@
C1 << r1.C1;
C2 << r1.C2;
@@
try:
	if int(C1) * 2 != int(C2):
		cocci.include_match(False)
except:
	cocci.include_match(False)

@@
expression r1.x;
constant r1.C1;
constant r1.C2;
@@
-(((x) + C1) / C2)
+DIV_ROUND_CLOSEST(x, C2)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/pci/sis7019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 7bf6059d50fb..8ffa2f53c0b5 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -363,7 +363,7 @@ static u32 sis_rate_to_delta(unsigned int rate)
 	else if (rate == 48000)
 		delta = 0x1000;
 	else
-		delta = (((rate << 12) + 24000) / 48000) & 0x0000ffff;
+		delta = DIV_ROUND_CLOSEST(rate << 12, 48000) & 0x0000ffff;
 	return delta;
 }
 
-- 
2.20.1

