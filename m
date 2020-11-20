Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908E2BB033
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:25:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA4A117AA;
	Fri, 20 Nov 2020 17:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA4A117AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889514;
	bh=sO3ez0EZ5UNNfG4j2+8DCfucIft1SFisc/XRA8bljPg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N85HhcniJCXhZYMRqp3WrXGX1XLUDB0/i6acEKUIE2i8wRlhvSZtc5gFBHwwYNO94
	 lvEyZBLJR1dp8FsC6tphJNIs3Los2/Rh2ifzfLWIX6Gtke1xqZafZHMBsn90nBOVp6
	 B5Y3L8zzWdAYqhqV71bQphr7XNVfainkeRrC2yiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A42E2F80539;
	Fri, 20 Nov 2020 17:18:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F415F80539; Fri, 20 Nov 2020 17:18:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87C3EF80525
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C3EF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Iu2G6q/l"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48E56238E6;
 Fri, 20 Nov 2020 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889121;
 bh=sO3ez0EZ5UNNfG4j2+8DCfucIft1SFisc/XRA8bljPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iu2G6q/lFfrOFsxMq4VY+LtkGiDw6vywWtAHTWo8BJpJ35bD23Z6Wk4nM8YbTsefq
 SjGUZM6xEW/6Y4PA14wQ1VBy+ZEiRo6de7xR5ddPh8PUm0yVk9r6BHMD3Du3u7vi2W
 uh3oKk+SOCq24uPaKwce9aEdv8Qzj/E/ydvtZM90=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 16/38] ASoC: da7218: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:30 +0100
Message-Id: <20201120161653.445521-16-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can match by multiple methods.  Its of_device_id table is
referenced via of_match_ptr() so it will be unused for !CONFIG_OF
builds:

  sound/soc/codecs/da7218.c:2281:34: warning: ‘da7218_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/da7218.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 6d78bccb55c3..2bfafbe9e3dc 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2278,12 +2278,14 @@ static irqreturn_t da7218_irq_thread(int irq, void *data)
  * DT
  */
 
+#ifdef CONFIG_OF
 static const struct of_device_id da7218_of_match[] = {
 	{ .compatible = "dlg,da7217", .data = (void *) DA7217_DEV_ID },
 	{ .compatible = "dlg,da7218", .data = (void *) DA7218_DEV_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da7218_of_match);
+#endif
 
 static inline int da7218_of_get_id(struct device *dev)
 {
-- 
2.25.1

