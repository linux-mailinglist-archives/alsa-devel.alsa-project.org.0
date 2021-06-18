Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBC3AEAE1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 16:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F076D16AD;
	Mon, 21 Jun 2021 16:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F076D16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624284760;
	bh=bmZj5eofhGGdE+GsCJvGgHPWmr2AIrEcYFCT77k6P8k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ThFRBa7jB2T4vxGm32YBo8lcwETozsrZNM35f/wVYq7kPpGuyIw5lX6CyDAp9EjnF
	 vK1GOcOm6HqFpVGJa9NXKUM7YyogVbcl6D+ONfyDfuG3WBh2tqDHO6YivojR3wIkJ7
	 zCX9/IdTTz08xWD2xlnM5AwJW+zaCVzOFL/oCVWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA47F804E0;
	Mon, 21 Jun 2021 16:10:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03C08F8032D; Fri, 18 Jun 2021 10:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.asem.it (smtp.asem.it [151.1.184.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B51F800E1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 10:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B51F800E1
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 8.0.0)
 with ESMTP id da3b0eb26fe24751b93f36585a0e1f15.MSG
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 10:53:54 +0200
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 10:53:53 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 18 Jun 2021 10:53:53 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsi: fix spelling mistake
Date: Fri, 18 Jun 2021 10:53:24 +0200
Message-ID: <20210618085324.1038524-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F26.60CC5F21.00D9, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-Mailman-Approved-At: Mon, 21 Jun 2021 16:10:06 +0200
Cc: alsa-devel@alsa-project.org, Flavio Suligoi <f.suligoi@asem.it>,
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

Fix "thse" --> "these" in struct fsi_stream declaration.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 sound/soc/sh/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 3c934f87c242..cdf3b7f69ba7 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -219,7 +219,7 @@ struct fsi_stream {
 	u32 bus_option;
 
 	/*
-	 * thse are initialized by fsi_handler_init()
+	 * these are initialized by fsi_handler_init()
 	 */
 	struct fsi_stream_handler *handler;
 	struct fsi_priv		*priv;
-- 
2.25.1

