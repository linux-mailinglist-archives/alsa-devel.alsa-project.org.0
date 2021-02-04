Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EF030E9F0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 03:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6D8C16FF;
	Thu,  4 Feb 2021 03:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6D8C16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612404430;
	bh=efUEQwzwrIUaKD1q5qQTsQi1f0MpfGnqOEefOxB8RiA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dZQtJVhPzIJOPgj6ZdMjvVigBbEkV87tvLTqOXfE6y/cRDn8DUtxg2Imi4GtO82l2
	 +gYhrpcWzR3Mkvfyi+KarSWqAkE/WkNGAolAw/dY6eF/yEqQg4pGjL2z+yjF1yX4Mk
	 b6+23wrx0ZV9Y2dFID8oN43sqhNKrTos0hQBgqJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C53F80155;
	Thu,  4 Feb 2021 03:05:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 541EFF8015A; Thu,  4 Feb 2021 03:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by alsa1.perex.cz (Postfix) with ESMTP id 678CFF8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 03:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 678CFF8013C
Received: from localhost.localdomain (unknown [124.16.141.241])
 by APP-03 (Coremail) with SMTP id rQCowADHZrhhVhtg3RA3AQ--.39496S2;
 Thu, 04 Feb 2021 10:05:21 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: perex@perex.cz, tiwai@suse.com, alexander@tsoy.me, e.burema@gmail.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: endpoint : remove redundant check before
 usb_free_coherent()
Date: Thu,  4 Feb 2021 02:05:18 +0000
Message-Id: <20210204020518.76619-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowADHZrhhVhtg3RA3AQ--.39496S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWrZw4UGr47GFWDWF4UJwb_yoW3Kwb_Za
 ykCr4kWryDXwnIvryDGr4FyF4293yfZFn7WF4Iq398AFWUt3yYyr48Xr1kGF1rCan3tF95
 Jws3Kr4rKr18KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ec7CjxVAajcxG14v26r
 1j6r4UMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI
 7VAKI48JMxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjxUcBHqUUUUU
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCgkCA1z4jWIVlAAAsI
Cc: linux-kernel@vger.kernel.org
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

usb_free_coherent() is safe with NULL addr and this check is
not required.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 sound/usb/endpoint.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8e568823c992..d5ed4ddfd451 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -82,10 +82,9 @@ static inline unsigned get_usb_high_speed_rate(unsigned int rate)
  */
 static void release_urb_ctx(struct snd_urb_ctx *u)
 {
-	if (u->buffer_size)
-		usb_free_coherent(u->ep->chip->dev, u->buffer_size,
-				  u->urb->transfer_buffer,
-				  u->urb->transfer_dma);
+	usb_free_coherent(u->ep->chip->dev, u->buffer_size,
+			  u->urb->transfer_buffer,
+			  u->urb->transfer_dma);
 	usb_free_urb(u->urb);
 	u->urb = NULL;
 }
-- 
2.17.1

