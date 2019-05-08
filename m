Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B407171B4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C549D1841;
	Wed,  8 May 2019 08:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C549D1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557297362;
	bh=PbGeN9zqFMByHRrDcbmRtIxPBzq7HpQJAy0rFKlcSc8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y/+uytuKWZ0Pfo6EC3cO2sYkfrqOQE5SnFmt5aQs4edzcsaLUXkuRhBT7H8RUMLW4
	 ETPTF7KgKRyeinc210wd3lH/YaLTEqLqylRH+NWfGQEq4h9nroLYf8gpWBus+idLJX
	 s2JIsH/cpYqFd4ncQe7zgTJIWOe9Deh7D91HP9Y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17902F89727;
	Wed,  8 May 2019 08:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BECDDF8970F; Wed,  8 May 2019 08:33:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pecan.exetel.com.au (pecan-mail.exetel.com.au [220.233.0.8])
 by alsa1.perex.cz (Postfix) with ESMTP id E6AEAF807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6AEAF807B5
Received: from 212.199.233.220.static.exetel.com.au ([220.233.199.212]
 helo=localhost.localdomain)
 by pecan.exetel.com.au with esmtp (Exim 4.91)
 (envelope-from <flatmax@flatmax.org>)
 id 1hOG8k-0003Il-DQ; Wed, 08 May 2019 16:33:18 +1000
From: Matt Flax <flatmax@flatmax.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Brian Austin <brian.austin@cirrus.com>,
 Paul Handrigan <Paul.Handrigan@cirrus.com>, clemens@ladisch.de,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org
Date: Wed,  8 May 2019 16:33:13 +1000
Message-Id: <20190508063313.18099-1-flatmax@flatmax.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Matt Flax <flatmax@flatmax.org>
Subject: [alsa-devel] [PATCH] ASoC : cs4265 : readable register too low
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

The cs4265_readable_register function stopped short of the maximum
register.

An example bug is taken from :
https://github.com/Audio-Injector/Ultra/issues/25

Where alsactl store fails with :
Cannot read control '2,0,0,C Data Buffer,0': Input/output error

This patch fixes the bug by setting the cs4265 to have readable
registers up to the maximum hardware register CS4265_MAX_REGISTER.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 sound/soc/codecs/cs4265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index ab27d2b94d02..c0190ec59e74 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -60,7 +60,7 @@ static const struct reg_default cs4265_reg_defaults[] = {
 static bool cs4265_readable_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
-	case CS4265_CHIP_ID ... CS4265_SPDIF_CTL2:
+	case CS4265_CHIP_ID ... CS4265_MAX_REGISTER:
 		return true;
 	default:
 		return false;
-- 
2.19.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
