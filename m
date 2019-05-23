Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2428B88
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 22:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D5B166F;
	Thu, 23 May 2019 22:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D5B166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558643472;
	bh=G3zoIUAvqk/5JF65hqIwqMykw3i60NaTMPLMGnlwbM4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RUwV2jvo0lin8QT1RrMx7SyJG7PltfjFILPOj29JmXHpqvmNgbDT/CQw3UPbuMdjo
	 qa5q/JVgusACPgTD4Ht9+mABgYiNlcztXH05gqZpdavofwDztTz4A5Ke+H0hPydZqR
	 U31Y7SfQ4gTUhNEsY/kISTp/pQXG0RAYJ6TS+OeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71465F80C0F;
	Thu, 23 May 2019 22:29:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39677F80C0F; Thu, 23 May 2019 22:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.144.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68009F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 22:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68009F80C0F
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 487287030
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 15:29:19 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id TuL0hx0w24FKpTuL1hJMQd; Thu, 23 May 2019 15:29:19 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=34524 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hTuL0-000Lzk-50; Thu, 23 May 2019 15:29:18 -0500
Date: Thu, 23 May 2019 15:29:17 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <20190523202917.GA12595@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hTuL0-000Lzk-50
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:34524
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ALSA: Use struct_size() helper
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

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace the following form:

sizeof(struct rate_priv) + src_format->channels * sizeof(struct rate_channel)

with:

struct_size(data, channels, src_format->channels)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 sound/core/oss/rate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index 2fa9299a440d..7cd09cef6961 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -323,8 +323,8 @@ int snd_pcm_plugin_build_rate(struct snd_pcm_substream *plug,
 
 	err = snd_pcm_plugin_build(plug, "rate conversion",
 				   src_format, dst_format,
-				   sizeof(struct rate_priv) +
-				   src_format->channels * sizeof(struct rate_channel),
+				   struct_size(data, channels,
+					       src_format->channels),
 				   &plugin);
 	if (err < 0)
 		return err;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
