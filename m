Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E86233B16B6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 11:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 606D4850;
	Wed, 23 Jun 2021 11:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 606D4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624440026;
	bh=e5KALOLfxJpMMpZV99lu/nNfBbP1tBftg3K3FklrdD0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GQgeu/7gsDsGM58VEsG9unn9iAYMfQudvU7RfraYJFAVu+KmS0KfCmZ1V4HIR8sVs
	 Be89VO4+vFIaKb+uzkTx1Ksj7j4PnOJSKnNrQUs4W3sgDkRdXhpU362vE460/xmFo/
	 0VaKnbajcNJfwFdAGWL3o9LTaMpletzAT0PdA+tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53D28F800E1;
	Wed, 23 Jun 2021 11:17:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA58F80268; Tue, 22 Jun 2021 15:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from zg8tmtu5ljg5lje1ms4xmtka.icoremail.net
 (zg8tmtu5ljg5lje1ms4xmtka.icoremail.net [159.89.151.119])
 by alsa1.perex.cz (Postfix) with SMTP id 6832AF80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 15:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6832AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=fudan.edu.cn header.i=@fudan.edu.cn
 header.b="o0C6D4EL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=ZOVCmjtN4hOBQh1DKf9a6KHhvEzyeUUkbIct1IDWLiU=; b=o
 0C6D4ELRgG6ezFpazEo5UyYUEKf/zRbpI3dP8ESlP+cwwx4wuwIbzF16px3SF8IY
 gSE5SDJAmnfbzLW9xAqVh6kFb40R+prtH2s9jP1c4CZv9Lux/omCi5tGG6PD3RZt
 PygbDfFHk+fDQUFn1pDqzSkS04QfwL1h2h2WSbMNsA=
Received: from ubuntu (unknown [10.177.89.109])
 by app1 (Coremail) with SMTP id XAUFCgAnLy+h49FgJZUUAA--.20132S3;
 Tue, 22 Jun 2021 21:20:33 +0800 (CST)
From: Jiajun Cao <jjcao20@fudan.edu.cn>
To: 
Subject: [PATCH] pci: hda: Add IRQ check for platform_get_irq()
Date: Tue, 22 Jun 2021 21:19:42 +0800
Message-Id: <20210622131947.94346-1-jjcao20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgAnLy+h49FgJZUUAA--.20132S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4rXryUuF1DJr1DtF1fWFg_yoWDXwb_Kw
 4xZwn7u395Gwn7tFn3Kwn3Xr17Jw40kr12g34xtF4Iga9Igr40qry5ArnxCFWxWrs3tF47
 Crn2yrsavry3KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI8E62xC7I0kMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRcAw7UUUUU=
X-CM-SenderInfo: isqsiiasuqikmw6i3vldqovvfxof0/
X-Mailman-Approved-At: Wed, 23 Jun 2021 11:17:52 +0200
Cc: Xin Tan <tanxin.ctf@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, yuanxzhang@fudan.edu.cn,
 Takashi Iwai <tiwai@suse.com>, Jiajun Cao <jjcao20@fudan.edu.cn>,
 Thierry Reding <thierry.reding@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>
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

The function hda_tegra_first_init() neglects to check the return
value after executing platform_get_irq().

hda_tegra_first_init() should check the return value (if negative
error number) for errors so as to not pass a negative value to
the devm_request_irq().

Fix it by adding a check for the return value irq_id.

Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 6f2b743b9d75..6c6dc3fcde60 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -262,6 +262,9 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	const char *sname, *drv_name = "tegra-hda";
 	struct device_node *np = pdev->dev.of_node;
 
+	if (irq_id < 0)
+		return irq_id;
+
 	err = hda_tegra_init_chip(chip, pdev);
 	if (err)
 		return err;
-- 
2.17.1

