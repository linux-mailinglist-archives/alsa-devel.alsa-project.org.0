Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBC2E1FDD
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2491794;
	Wed, 23 Dec 2020 18:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2491794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608744352;
	bh=SDRhyBj6A/CnkWB+wgoMBIX95pD084nhrniGB0mWfxg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qNHG9bOyicb2Krmfrm6UX49f4JMGuZ2GuCUKkgQHI/FtHNXlVfHsDLdstRWsIQTqz
	 aqBJghJU3uFJjJuXnCrf22GOWnyXyAbP2XwxHifXYnabw4VHKmrlLgi3JwI78JBOKv
	 NTfayrkZl0MmHMtVvg/9QBUMIFi9MzRfZIrq5Nzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A17EDF804CB;
	Wed, 23 Dec 2020 18:23:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 274ECF80212; Wed, 23 Dec 2020 18:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA3A5F801D5
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3A5F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="Ec7Ihd7X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=WDDcrSCXs8gV93fKAibxvnLmcru5DbXMuQOl7b/bdsw=; b=Ec7Ihd7XIgSDemEDIAHUBzsgcI
 xfNrGvmjc7ccvlRWrLnXogHDs5qYLtEQNd4RcjcJFewb498TZx1ozrWVDAMNgqWotX5OarR4665R6
 NGJSeByHF3HnZ6EZm1nPa3KcdGiEW5if43DbEDydADO6RKy+XWSn+qTPXdEilYtlZZQjppIBb8Q+Y
 DIVMJtEJolvjdy/164aoRF5/71YgzoB0d3UuGnmoTo2syRlS6Rb41xaxENhRbTe3/k5tv1vM+nChQ
 0lYLwqLIcjHJv4bPMkl9SQsQhZEA28EIoUcME8mfnvsMwEVjfZpfkvN892yuSweXCzeQSV/Ag2u0m
 30uZ4Vdw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000EtP-7V; Wed, 23 Dec 2020 18:23:02 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-4E; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 02/18] ALSA: aloop: Use DIV_ROUND_UP() instead of open-coding
 it
Date: Wed, 23 Dec 2020 18:22:13 +0100
Message-Id: <20201223172229.781-2-lars@metafoo.de>
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

Use DIV_ROUND_UP() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-(((x) + (y) - 1) / (y))
+DIV_ROUND_UP(x, y)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/drivers/aloop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 702f91b9c60f..8a24e5ae7cef 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -219,7 +219,7 @@ static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
 		dpcm->period_update_pending = 1;
 	}
 	tick = dpcm->period_size_frac - dpcm->irq_pos;
-	tick = (tick + dpcm->pcm_bps - 1) / dpcm->pcm_bps;
+	tick = DIV_ROUND_UP(tick, dpcm->pcm_bps);
 	mod_timer(&dpcm->timer, jiffies + tick);
 
 	return 0;
-- 
2.20.1

