Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17E2BB03B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A2121734;
	Fri, 20 Nov 2020 17:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A2121734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889612;
	bh=pK2aXxPdlgp8adWwLZSWyw3m60lda9J3oEtug2jUDCo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcBcgom+WtjoPahqXQ2O0HNcXB+4zwlIaDC6mqnHXWJqozbu1ZuozVY6uVjI+Cm7Y
	 POnRzD3+FeupDvVCxSVaMfKPUHNi46x6jwA479IcZnTZE/aYxGFE8jMsEE0ZEKK/5Y
	 gJqSlxc/qzdXz1FD/DLwpcciZjYbFO3dUxiRpbfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9735F8055B;
	Fri, 20 Nov 2020 17:18:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEAA6F80566; Fri, 20 Nov 2020 17:18:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 890ADF8055B
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 890ADF8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EAjomR1l"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AAC02245B;
 Fri, 20 Nov 2020 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889135;
 bh=pK2aXxPdlgp8adWwLZSWyw3m60lda9J3oEtug2jUDCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EAjomR1lz/jTDyJe2lPCvCIEC8I18OrztlCe1eDcsXdKbxTD6x9flsZsDNk/z/GyP
 GCY5upWeOINt6mbHm3h5UyJXdVvAxa9nAiLG/9DstU8uiugAbM/zoguc8Dr+Jc4zQl
 21E44+uleClrd4f+O/I6QyTTgz5MCrsPetTM/+bE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 20/38] ASoC: max98090: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:34 +0100
Message-Id: <20201120161653.445521-20-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

  sound/soc/codecs/max98090.c:2671:34: warning: ‘max98090_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/max98090.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 945a79e4f3eb..06276ff5f8a3 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2668,12 +2668,14 @@ static const struct i2c_device_id max98090_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max98090_i2c_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id max98090_of_match[] = {
 	{ .compatible = "maxim,max98090", },
 	{ .compatible = "maxim,max98091", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max98090_of_match);
+#endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id max98090_acpi_match[] = {
-- 
2.25.1

