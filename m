Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E869448A5E3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 03:52:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81DB218D6;
	Tue, 11 Jan 2022 03:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81DB218D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641869540;
	bh=Mth9/dR41w8NcBzIdKVkAKKJQLws8ZtZq4Q06QtgOSo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DXv6AqTUHGP5UNmUwblNi4OGWrccCUtul0rkJqFdSIr0LPR1foBXN6hkI762+YffA
	 96GXr/GKRzCjRTQKLlDvgpTDinG/baFz90lKjxTFOvWU3V8abqSZsK2VPTZvOTwC2X
	 5GocuWGnW7SMoIavYcvkmcFGR4amM9JUR8dUMGmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E9FF80430;
	Tue, 11 Jan 2022 03:51:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79932F80302; Tue, 11 Jan 2022 03:51:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by alsa1.perex.cz (Postfix) with ESMTP id 902F9F800A7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 03:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 902F9F800A7
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-03 (Coremail) with SMTP id rQCowABnb1uO8NxhZQNmBQ--.51057S2;
 Tue, 11 Jan 2022 10:50:54 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 tony@atomide.com, sre@kernel.org, pavel@ucw.cz
Subject: [PATCH] ASoC: cpcap: Check for NULL pointer after calling
 of_get_child_by_name
Date: Tue, 11 Jan 2022 10:50:48 +0800
Message-Id: <20220111025048.524134-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABnb1uO8NxhZQNmBQ--.51057S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr13KFy3XryxZryktF4fXwb_yoWfKwb_K3
 y8ua9agry2q3WIqFZrZw12vrnYvrn3Cr1jqr4ktry7ta45AF4fJanxZr13ur4UWrs7WFy5
 GF9I9rW2yr12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbpwZ7UUUUU==
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

If the device does not exist, of_get_child_by_name() will return NULL
pointer.
And devm_snd_soc_register_component() does not check it.
Also, I have noticed that cpcap_codec_driver has not been used yet.
Therefore, it should be better to check it in order to avoid the future
dereference of the NULL pointer.

Fixes: f6cdf2d3445d ("ASoC: cpcap: new codec")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/soc/codecs/cpcap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 05bbacd0d174..f1c13f42e1c1 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1667,6 +1667,8 @@ static int cpcap_codec_probe(struct platform_device *pdev)
 {
 	struct device_node *codec_node =
 		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
+	if (!codec_node)
+		return -ENODEV;
 
 	pdev->dev.of_node = codec_node;
 
-- 
2.25.1

