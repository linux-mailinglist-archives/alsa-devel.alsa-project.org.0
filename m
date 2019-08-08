Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5986202
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 14:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8885886F;
	Thu,  8 Aug 2019 14:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8885886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565267937;
	bh=AflpNWWBHERjvnLmNHw4yejnRnRT0HUlJMHMacuMAEQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DRQ6yO/S4UJtSFSYYBXTkCpARRdMz0/BvosIGZasYSomOeuRZv/oKfmlA6fWF9spg
	 SvO2dgT0ez2yff9i/Hd0rToHBgj3OLqh2UB71/LyzSHdpsM+zEYNOJpzoKG+dYrf5X
	 wF9FahgyElWlWNCJ2qygU4hWqEcHYpY0G7ufF7NU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6EDF80534;
	Thu,  8 Aug 2019 14:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABE85F80534; Thu,  8 Aug 2019 14:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1413AF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 14:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1413AF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.b="qJLZxufy"
Received: from trochilidae.toradex.int (unknown [46.140.72.82])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 136CF5C0B09;
 Thu,  8 Aug 2019 14:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1565267827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=wtFe+lHH5wgW8y/mXg/CY0VkdqJZERhAhmOoK1c4XW0=;
 b=qJLZxufy6ebIcIQeo0NH8stt2lYEQJkO0N9X1O+7FewYQ0bhsOhsmJvyDc4Gy3qZQBEpRL
 9Z57C/em5CQK0zDHn0xW0LCttjt1WRiJPBM1x4LAQoZ5cUqPWLCOc7aRhIykPMyBrZ0+F2
 y+7iV8Pu+34fux8y/dUCwKzx1anKrzs=
From: Stefan Agner <stefan@agner.ch>
To: perex@perex.cz,
	tiwai@suse.com
Date: Thu,  8 Aug 2019 14:36:55 +0200
Message-Id: <20190808123655.31520-1-stefan@agner.ch>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 Stefan Agner <stefan.agner@toradex.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: soc-core: remove error due to probe
	deferral
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

From: Stefan Agner <stefan.agner@toradex.com>

Deferred probes shouldn't cause error messages in the boot log. Avoid
printing with dev_err() in case EPROBE_DEFER is the return value.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 sound/soc/soc-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fd6eaae6c0ed..98e1e80b5493 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1985,9 +1985,11 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	mutex_lock(&client_mutex);
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = soc_init_dai_link(card, dai_link);
-		if (ret) {
+		if (ret && ret != -EPROBE_DEFER) {
 			dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
 				dai_link->name, ret);
+		}
+		if (ret) {
 			mutex_unlock(&client_mutex);
 			return ret;
 		}
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
