Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C58E837
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 11:28:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00767852;
	Thu, 15 Aug 2019 11:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00767852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565861285;
	bh=iyzvxKfMy+j8BNypg7iVQkLanQ3aMi4AU+fb9+XnFG8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hAoFgpc+TOrp/cC55ALDdpapvTt6REVKxiB+8DimL87J3ucIYvOQV1RaDpJVQcnyZ
	 Ym4V7eJB4S4neRUoxf8RYbI36TuasUu7SGmbPNAjuGCD/e0oltNPhasr4qFyJ4lDXk
	 ymIWeJkONEFmNaLytH7MUv1g/79dGZyt5qWH901U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C05EFF8044C;
	Thu, 15 Aug 2019 11:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ACBBF80274; Thu, 15 Aug 2019 11:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFC56F801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 11:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC56F801DF
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 06BAE57D9039B02D2BAC;
 Thu, 15 Aug 2019 17:26:09 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 15 Aug 2019
 17:25:57 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <tglx@linutronix.de>, <kstewart@linuxfoundation.org>
Date: Thu, 15 Aug 2019 17:25:47 +0800
Message-ID: <20190815092547.29564-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: 88pm860x: remove unused variables
	'pcm_switch_controls' and 'aif1_mux'
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

sound/soc/codecs/88pm860x-codec.c:533:38: warning:
 pcm_switch_controls defined but not used [-Wunused-const-variable=]
sound/soc/codecs/88pm860x-codec.c:560:38: warning:
 aif1_mux defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/88pm860x-codec.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index e982722..00b2c43 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -529,10 +529,6 @@ static const struct snd_kcontrol_new pm860x_snd_controls[] = {
  * DAPM Controls
  */
 
-/* PCM Switch / PCM Interface */
-static const struct snd_kcontrol_new pcm_switch_controls =
-	SOC_DAPM_SINGLE("Switch", PM860X_ADC_EN_2, 0, 1, 0);
-
 /* AUX1 Switch */
 static const struct snd_kcontrol_new aux1_switch_controls =
 	SOC_DAPM_SINGLE("Switch", PM860X_ANA_TO_ANA, 4, 1, 0);
@@ -549,17 +545,6 @@ static const struct snd_kcontrol_new lepa_switch_controls =
 static const struct snd_kcontrol_new repa_switch_controls =
 	SOC_DAPM_SINGLE("Switch", PM860X_DAC_EN_2, 1, 1, 0);
 
-/* PCM Mux / Mux7 */
-static const char *aif1_text[] = {
-	"PCM L", "PCM R",
-};
-
-static SOC_ENUM_SINGLE_DECL(aif1_enum,
-			    PM860X_PCM_IFACE_3, 6, aif1_text);
-
-static const struct snd_kcontrol_new aif1_mux =
-	SOC_DAPM_ENUM("PCM Mux", aif1_enum);
-
 /* I2S Mux / Mux9 */
 static const char *i2s_din_text[] = {
 	"DIN", "DIN1",
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
