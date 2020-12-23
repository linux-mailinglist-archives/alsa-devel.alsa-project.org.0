Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5328F2E1FF9
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6B917BD;
	Wed, 23 Dec 2020 18:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6B917BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608744494;
	bh=NM79AciwL6zatIkSpMptnb79Lu4CEWkoVKhJOThlMD0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0nuFc4ddiEDPB0wNPGEgsyDfCXy1JHsV4g04rmH3GjWBY9fzduQ7uWZCOF+5puqR
	 ldfsprvHimm0KQfLi+QKACYsSPvlJeumjkbIGr7/7rVWS+lzrdX9pIKlWwZKLUl0MB
	 a/hOEdm/Y2rFO8z9txQM0jsqVf0KCRaa0SfE/qdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A81F804FB;
	Wed, 23 Dec 2020 18:23:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B82FF80212; Wed, 23 Dec 2020 18:23:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3F27F8028D
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F27F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="av13vv1F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=MVEmoHgDV9RzuYnXd+S9/N8ElGep3dHuK5jXmFKJVKU=; b=av13vv1F1pfLXeYGxJzXHWHW/W
 jO6OY+SBuaP1irWtGyRm27eL+0cXuWXMTusmZndOaV98creocTGe75Q+5Fy1oCxm90hs73Bg46iLU
 3r0CYh0fBxRwTCd+FiWCmc04hWGZn4rFQB4t05i74TRePyWfItvgRxVp1g6FVDutXmPxfK8VAHE9l
 AUgw57C5G8izQKIuW2eKAqCDMYDKkLDfEqo8CwsjX6+7LzNHnnL+Fi5DYkfvceLfR0RMObGMVWk51
 XRLCiCrgsUEBxjdhRYtK6gq6jVCxOSQCus+1xk8DAI/j5FcCnc5bg+KN6ZHhPs6JJMpns9943VIj2
 bPXxbUvQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Etk-CN; Wed, 23 Dec 2020 18:23:02 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-9L; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 05/18] ALSA: cx46xx: Use DIV_ROUND_UP() instead of open-coding
 it
Date: Wed, 23 Dec 2020 18:22:16 +0100
Message-Id: <20201223172229.781-5-lars@metafoo.de>
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
 sound/pci/cs46xx/cs46xx_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 4490dd7469d9..37f516e6a5c2 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -813,7 +813,7 @@ static void snd_cs46xx_set_capture_sample_rate(struct snd_cs46xx *chip, unsigned
 	correctionPerGOF = tmp1 / GOF_PER_SEC;
 	tmp1 -= correctionPerGOF * GOF_PER_SEC;
 	correctionPerSec = tmp1;
-	initialDelay = ((48000 * 24) + rate - 1) / rate;
+	initialDelay = DIV_ROUND_UP(48000 * 24, rate);
 
 	/*
 	 *  Fill in the VariDecimate control block.
-- 
2.20.1

