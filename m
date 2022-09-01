Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8FC5A95D2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 13:36:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937AE1637;
	Thu,  1 Sep 2022 13:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937AE1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662032166;
	bh=vhVGC2cxDNjYnTqj5N1m7edVJ5wy/+WYxTQ1QdW+FSo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+Os5B9DMwAv8sMEQE0VBY9w1AeZnTNCyDl7aRC/AMs0mjuw65FWZOgBI+pawqICV
	 LruCYWLrY8I2OP4kigpBo7A/kXwpb0dteRwZHdZwiMlI6nQcZ9E/FRsysh41nAq8/s
	 jj9T27WqG+rksgeE2VzgbkQkqevc94aYqaHEQT2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2036DF80527;
	Thu,  1 Sep 2022 13:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C5FF804A9; Thu,  1 Sep 2022 13:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C1F6F80163
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 13:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C1F6F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="QSOcuJpz"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662032064; bh=9K/ubU5/lJjGhiEptyCyT26bzZBKS5AKwNVg/nBi83E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QSOcuJpz14lYalHW0hwAbrV86WhHflonxSZNXVfz/7SWgKa7GOJPPC0tbM5v6qdPP
 N2GOxWzXjIesNZIdh4BEnDZRrllg8T8DIyr5G6TIhE+IuvvaPo4nSjxJUiT0ZqQNZ8
 BG1lKixb8MlkqZgL/JqpzD64vyoELj8omM92efVc=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] MAINTAINERS: Fix file pattern for ARM/APPLE MACHINE SOUND
 DRIVERS
Date: Thu,  1 Sep 2022 13:34:15 +0200
Message-Id: <20220901113415.27449-2-povik+lin@cutebit.org>
In-Reply-To: <20220901113415.27449-1-povik+lin@cutebit.org>
References: <20220901113415.27449-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
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

This is what was meant of course.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f91a6b62f2f..895e8ace80dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1905,7 +1905,7 @@ L:	asahi@lists.linux.dev
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/apple,*
-F:	drivers/sound/apple/*
+F:	sound/soc/apple/*
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
-- 
2.33.0

