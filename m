Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F25961A5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 19:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A8171637;
	Tue, 16 Aug 2022 19:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A8171637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660672561;
	bh=qyJnxXid+Aqd7W3I2UXdcvz9lNiMiAauMl7EapqA6c4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D3MWAbtA//W1M1mF0VjmdlxXvouoRqCn6TYD9318JY2xD/Sckkfi4wIBgV5LGc2rw
	 nqC9iKl7wto83gWFImr1VsMwIhQ/vtZT0y7141IYiUnO38zTsM3bv3YbkvQcJxdpT9
	 SGT3Z9xc/QEe/KBa+oGPQK96xj1G9IvsbKoHN6XU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8790CF80238;
	Tue, 16 Aug 2022 19:55:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4966F8032D; Tue, 16 Aug 2022 19:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 985F6F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 19:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 985F6F80095
X-QQ-mid: bizesmtp89t1660672485t22m9r2k
Received: from harry-jrlc.. ( [182.148.12.144])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 17 Aug 2022 01:54:35 +0800 (CST)
X-QQ-SSF: 0100000000200060D000B00A0000020
X-QQ-FEAT: WRZea3rwxQm38bQtddIlQQzQMDVWPimn6PrcR59epaiQk0+6UIUD596bEHmjy
 ihl3I06UN9FxtDhlOy0SWIBUsOo0PNFUMNuZHuQw65SAGg+qpTKQp6ubvtZdpgBQvlHvqBh
 NGVIP31euZHvYV5C9f9stb5nTJ0TReJmwnlu8IDrRpN1Ono8o/TrbAapEV7wKJ0xlO74E9n
 dsYMXMsW7NliJi6zdYzDKx4iottjrN4GzHaeA52uN4hxTpbQTGdjEHSchRvgFZdapDvH+dr
 m05XcZtYIYX6K8YvnQPNzgBESus+kJUrJqAEuYiOw7PbqwGLmz/Ddj4PuO025+x6rzvDKcm
 S7ZxA88hcs1fr6Hljo/9mLWN+947Vf1cnE9WRLis/ogwwD6DHtLVpBxZr4qVg==
X-QQ-GoodBg: 0
From: Xin Gao <gaoxin@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com,
	peter.ujfalusi@gmail.com
Subject: [PATCH] ASoC: Variable type completion
Date: Wed, 17 Aug 2022 01:54:34 +0800
Message-Id: <20220816175434.8263-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 Xin Gao <gaoxin@cdjrlc.com>, linux-kernel@vger.kernel.org
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

'unsigned int' is better than 'unsigned'.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
---
 sound/soc/ti/davinci-evm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 68d69e32681a..392bf17564bf 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -23,7 +23,7 @@
 
 struct snd_soc_card_drvdata_davinci {
 	struct clk *mclk;
-	unsigned sysclk;
+	unsigned int sysclk;
 };
 
 static int evm_startup(struct snd_pcm_substream *substream)
@@ -57,7 +57,7 @@ static int evm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *soc_card = rtd->card;
 	int ret = 0;
-	unsigned sysclk = ((struct snd_soc_card_drvdata_davinci *)
+	unsigned int sysclk = ((struct snd_soc_card_drvdata_davinci *)
 			   snd_soc_card_get_drvdata(soc_card))->sysclk;
 
 	/* set the codec system clock */
-- 
2.30.2

