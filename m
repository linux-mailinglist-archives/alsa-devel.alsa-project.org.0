Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF144C6119
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 03:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B16843;
	Mon, 28 Feb 2022 03:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B16843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646015404;
	bh=KhY2kdruSZN5QxpY2U5AZN9um+8qLtwzTPHu6hDCJWQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k6zFGIEuH+7LPnH01039+LlIuOV7fTos9yImG812NKd7HTPaVegAFnX3Wf2WvNJfW
	 Q7NF3uCI/IIg8ONP62xY1QVMYX5NDymLqm2sTfujbpAVXr5URS4INAeD3zfImIIkpk
	 a+8TllpG1sqJSlcLq0/Spz12mFTI8EVx20Wl2Wq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B40F80158;
	Mon, 28 Feb 2022 03:28:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B66B9F80155; Mon, 28 Feb 2022 03:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by alsa1.perex.cz (Postfix) with ESMTP id 5EA1AF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 03:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA1AF800F8
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-03 (Coremail) with SMTP id rQCowAAHD8NYMxxiopZpAQ--.55928S2;
 Mon, 28 Feb 2022 10:28:41 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: spi: Add check for clk_enable()
Date: Mon, 28 Feb 2022 10:28:39 +0800
Message-Id: <20220228022839.3547266-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHD8NYMxxiopZpAQ--.55928S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1rWry5Ar4fXFW7tr1rXrb_yoW8tw4Dpa
 97JFyrt3ykJasa9F4ayr48XFy3Jr40kFZxXwn2gw1xZw1Syw4qkay8JrnYya90kryDG3W3
 Wr4xtFyUC3yUAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: alsa-devel@alsa-project.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
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

As the potential failure of the clk_enable(),
it should be better to check it and return error
if fails.

Fixes: 3568459a5113 ("ALSA: at73c213: manage SSC clock")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/spi/at73c213.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index 76c0e37a838c..8a2da6b1012e 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -218,7 +218,9 @@ static int snd_at73c213_pcm_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_at73c213_playback_hw;
 	chip->substream = substream;
 
-	clk_enable(chip->ssc->clk);
+	err = clk_enable(chip->ssc->clk);
+	if (err)
+		return err;
 
 	return 0;
 }
@@ -776,7 +778,9 @@ static int snd_at73c213_chip_init(struct snd_at73c213 *chip)
 		goto out;
 
 	/* Enable DAC master clock. */
-	clk_enable(chip->board->dac_clk);
+	retval = clk_enable(chip->board->dac_clk);
+	if (retval)
+		goto out;
 
 	/* Initialize at73c213 on SPI bus. */
 	retval = snd_at73c213_write_reg(chip, DAC_RST, 0x04);
@@ -889,7 +893,9 @@ static int snd_at73c213_dev_init(struct snd_card *card,
 	chip->card = card;
 	chip->irq = -1;
 
-	clk_enable(chip->ssc->clk);
+	retval = clk_enable(chip->ssc->clk);
+	if (retval)
+		return retval;
 
 	retval = request_irq(irq, snd_at73c213_interrupt, 0, "at73c213", chip);
 	if (retval) {
@@ -1008,7 +1014,9 @@ static int snd_at73c213_remove(struct spi_device *spi)
 	int retval;
 
 	/* Stop playback. */
-	clk_enable(chip->ssc->clk);
+	retval = clk_enable(chip->ssc->clk);
+	if (retval)
+		goto out;
 	ssc_writel(chip->ssc->regs, CR, SSC_BIT(CR_TXDIS));
 	clk_disable(chip->ssc->clk);
 
@@ -1088,9 +1096,16 @@ static int snd_at73c213_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct snd_at73c213 *chip = card->private_data;
+	int retval;
 
-	clk_enable(chip->board->dac_clk);
-	clk_enable(chip->ssc->clk);
+	retval = clk_enable(chip->board->dac_clk);
+	if (retval)
+		return retval;
+	retval = clk_enable(chip->ssc->clk);
+	if (retval) {
+		clk_disable(chip->board->dac_clk);
+		return retval;
+	}
 	ssc_writel(chip->ssc->regs, CR, SSC_BIT(CR_TXEN));
 
 	return 0;
-- 
2.25.1

