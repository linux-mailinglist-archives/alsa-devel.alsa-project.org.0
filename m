Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9DAD6FE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFBF166B;
	Mon,  9 Sep 2019 12:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFBF166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025483;
	bh=jkoBUw5aJZHLgIwtCWNJYOsIg0odIaXURdaBASNryDs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bDPQiuJ2VplM/wb8XELXYsir2QHQg0UpnucDo8uO2Fq+SW0/+WH3fnF2lXZkZWeAz
	 pdgxgiWLuWH4K7HE+PfUjs8kwLT3qlFfA5KS/Irw7Y4xQAI7S+D+SjmREM7ruTWfpD
	 B8WluON+EdcNN9M+I/DpgUhDRwXejtvYeFpwsarE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1EC8F80611;
	Mon,  9 Sep 2019 12:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC876F80507; Mon,  9 Sep 2019 12:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50D3BF804CF
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50D3BF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oZkReiDh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jA4gXYie+BdKhsUujJLdEzqs2HgXbuGXYSEnTS8I5N8=; b=oZkReiDhtOT6
 3qfXntGm8n9OB91NlPFo3VRdM/xnwfV/D8s/gsUeLmLlkqTs3SI2l6UJY/cwaYzcAJMRrv6q3OEyG
 GfR8L7LlFkLXRpvfoKudwlq+gsJrf3CQrwpDByaJonNcpbc/kCmeMEZYsPm2eX76FV5i1t9ibiDgG
 pnXoo=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZp-0001ra-G3; Mon, 09 Sep 2019 10:07:17 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D48ECD02D3E; Mon,  9 Sep 2019 11:07:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
In-Reply-To: <20190907074634.22144-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100716.D48ECD02D3E@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:16 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt1308: make array pd static const,
	makes object smaller" to the asoc tree
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

The patch

   ASoC: rt1308: make array pd static const, makes object smaller

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 13ab0d1ab8ae4d1b3b247fd5caec2c10e35c7269 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Sat, 7 Sep 2019 08:46:34 +0100
Subject: [PATCH] ASoC: rt1308: make array pd static const, makes object
 smaller

Don't populate the array pd on the stack but instead make it
static const. Makes the object code smaller by 82 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  26548	   7288	     64	  33900	   846c	sound/soc/codecs/rt1308.o

After:
   text	   data	    bss	    dec	    hex	filename
  26370	   7384	     64	  33818	   841a	sound/soc/codecs/rt1308.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190907074634.22144-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 6f2ee6809dbb..b75931a69a1c 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -436,7 +436,8 @@ static const struct snd_soc_dapm_route rt1308_dapm_routes[] = {
 
 static int rt1308_get_clk_info(int sclk, int rate)
 {
-	int i, pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
+	int i;
+	static const int pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
 
 	if (sclk <= 0 || rate <= 0)
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
