Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E602BB040
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 470A21700;
	Fri, 20 Nov 2020 17:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 470A21700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889674;
	bh=j+GEylzAMN2zUvEnkSfnfv3ZaAJlkD6Cx2txUHPz7Zw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBpfJbJF4/7iPI+gOlF66157/QHm1K9MYGRpYdJu83cXx+sa+b04xfYPLnr+u1WuL
	 BnnV+CMfOuT57XJDKIvaj0psidn4s14cF5ZdM4u478EixrurPTPgma/xud+3fn9c3u
	 0DZzJTtLZSxaP1Ii6Jm9nosceqKaPxbPXkl1xqeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC6AF80587;
	Fri, 20 Nov 2020 17:19:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134C1F80587; Fri, 20 Nov 2020 17:19:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C33A8F80567
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33A8F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oFk2kuqb"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 459332245B;
 Fri, 20 Nov 2020 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889146;
 bh=j+GEylzAMN2zUvEnkSfnfv3ZaAJlkD6Cx2txUHPz7Zw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oFk2kuqbAyaoneYImlDE60PhLNCL4CO8UtMrKsg1jjNc7Q069PszWYntN2cDP0JNi
 8H1grWl1yv1aPZ3y0Y+3cslZGA2XXGjwMhyT9JbGvzAridiMyR51/LaX/D3fNep59h
 KqWi55k9Ho86mLozCiMcGcP1i6nfOVJSrdZnwizY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 23/38] ASoC: max9867: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:37 +0100
Message-Id: <20201120161653.445521-23-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Pavel Dobias <dobias@2n.cz>
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

  sound/soc/codecs/max9867.c:652:34: warning: ‘max9867_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/max9867.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index aef2746bfb94..512e6f2513d3 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -649,11 +649,13 @@ static const struct i2c_device_id max9867_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max9867_i2c_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id max9867_of_match[] = {
 	{ .compatible = "maxim,max9867", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max9867_of_match);
+#endif
 
 static struct i2c_driver max9867_i2c_driver = {
 	.driver = {
-- 
2.25.1

