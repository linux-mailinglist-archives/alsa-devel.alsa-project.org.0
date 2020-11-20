Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 491482BB031
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:24:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B6C1736;
	Fri, 20 Nov 2020 17:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B6C1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889466;
	bh=C3hkFsDb3sE4GUFvIjYxN4SbnZ/Y/EW4EfgcLWyYLN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q41WWwyWLa0kZqK7sh9ly7uBG09n+5qwFtvUkzdQo/BrYicYuiLBAAz/lGWDxU+lv
	 dwgp7YLb5ioQIFtnSrf5tIdd5NERMBugFUawY2wCTSkw3grr3xlMZdvrGlUad62xh+
	 cjSekmkxzL6eP3sCrIJMs1o8iCv2ysL4XmaECfEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D312F80534;
	Fri, 20 Nov 2020 17:18:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F4DF80533; Fri, 20 Nov 2020 17:18:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76AD9F80525
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76AD9F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aRD8DSGx"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 126B122464;
 Fri, 20 Nov 2020 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889115;
 bh=C3hkFsDb3sE4GUFvIjYxN4SbnZ/Y/EW4EfgcLWyYLN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRD8DSGxZF+07oeRNYrMzRzm+SfF/S0iK7bxL77poIehWZ9NObx/rT9PSOv1VmcnM
 gwIGmYEgXMeJYtCJnFvlVw6pN0uEmGd+Gzqe2Ce9qyVqLGEztof3N/BNlUw5m+s7ep
 ydJtpTlEi+p/AmBaew/nPtRzaI8iHCePjQHoK1Q4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 14/38] ASoC: alc5623: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:28 +0100
Message-Id: <20201120161653.445521-14-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

  sound/soc/codecs/alc5623.c:1071:34: warning: ‘alc5623_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/alc5623.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index 3d1761a531f5..54f489837162 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -1068,11 +1068,13 @@ static const struct i2c_device_id alc5623_i2c_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, alc5623_i2c_table);
 
+#ifdef CONFIG_OF
 static const struct of_device_id alc5623_of_match[] = {
 	{ .compatible = "realtek,alc5623", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, alc5623_of_match);
+#endif
 
 /*  i2c codec control layer */
 static struct i2c_driver alc5623_i2c_driver = {
-- 
2.25.1

