Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947215A45B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 10:13:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 179C1166C;
	Wed, 12 Feb 2020 10:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 179C1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581498816;
	bh=Y9EWpQYx/bbkeRMmWZYYgD81qKdfFqr3/BsUg1mdwg8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k9+PuomqVFuyVdPG7LkDzGG2zORLeC3fRWhxGPzwFM+bChl5GF5bBujMsllCQm8Pb
	 quqHkp+y15+1MGj4kpxb6xrkBKqYBsz0FD3/rRpuhx49gAIB48pv73FymUV2wQfcdf
	 JIFp2oUrBRJQVtYFxedu1wMcbVk/sNXL6rXJQKXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCC5F800E7;
	Wed, 12 Feb 2020 10:11:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F488F80157; Wed, 12 Feb 2020 10:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B0D8F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 10:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B0D8F80125
Received: from ramsan ([84.195.182.253]) by albert.telenet-ops.be with bizsmtp
 id 1lBo2201C5USYZQ06lBoQR; Wed, 12 Feb 2020 10:11:49 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1o3g-0000Zh-RR; Wed, 12 Feb 2020 10:11:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1nij-0002WQ-51; Wed, 12 Feb 2020 09:50:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 12 Feb 2020 09:50:08 +0100
Message-Id: <20200212085008.9652-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: sh: fsi: Restore devm_ioremap() alignment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The alignment of the continuation of the devm_ioremap() call in
fsi_probe() was broken.  Join the lines, as all parameters can fit on a
single line.

Fixes: 4bdc0d676a643140 ("remove ioremap_nocache and devm_ioremap_nocache")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/sh/fsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 4b35ef402604ecd8..5ef4221be6c3965c 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1938,8 +1938,7 @@ static int fsi_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
-	master->base = devm_ioremap(&pdev->dev,
-					    res->start, resource_size(res));
+	master->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!master->base) {
 		dev_err(&pdev->dev, "Unable to ioremap FSI registers.\n");
 		return -ENXIO;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
