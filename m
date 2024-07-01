Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD891EA76
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 23:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C5815FB;
	Mon,  1 Jul 2024 23:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C5815FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719870468;
	bh=FPURB7gNINrC8wkHbXgeqzcwCc0hYhVzAJwONXDpHpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JIhsUVpCEgZSJX4pqg1VlFncY9AcfU+4VCbmCUJjYBD8X/YkWj4u5y+OmeMpJofu2
	 My78FlIlYML/s2B8Roq3UUeEW/qY3vcz2Gm5n271QxOHWUR4Hh/75G3bxNV+XtHUm/
	 VJnJfNiRMCG1aWFgafIO6zAEPxpz6i9oNz8byrtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1A68F805F1; Mon,  1 Jul 2024 23:46:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E029F805C2;
	Mon,  1 Jul 2024 23:46:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E873BF80238; Mon,  1 Jul 2024 23:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp61.i.mail.ru (smtp61.i.mail.ru [95.163.41.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ED93F8028B
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 23:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ED93F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ZRd4eXgJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=0EFDVOisnfDeUARgFLVX7SY2WERRcU2n7g4Z1HR42N0=; t=1719868600; x=1719958600;
	b=ZRd4eXgJxrpDKYyPlT97+Ccs14CjRiTzIl1h6kxnZMKc5JQ4XkeKWfAwgHD39mSGe7sQhY6HJqe
	Ce06aWMk1pWxJnRyqYyik18T0x8fzVKCtgzN9KgHMrvhw+bX5KN6h1Gdq2w7OudcelYHybXbDUvRu
	63m/sOqzPAeJBJvDit9GT31VSfDmV4506tPlRAM1faCsAoK7+FYh5mSmihuThcQz2yMu3kgBLILSP
	EUO9H3RPviPPmj9bNav8rlRtoAQiL0JYWp1lOcINcJRojDKTJ1l1jF4ti0E+J3v8zkjXKiZLu9BA7
	8+9DC43TT6am1mw3hCplOChtFTxBkcy+LMLA==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sOOO6-0000000HXqS-0kbJ; Tue, 02 Jul 2024 00:16:38 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Hsu <KCHSU0@nuvoton.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 2/2] ASoC: codecs: nau8824: Add master clock handling
Date: Tue,  2 Jul 2024 00:16:22 +0300
Message-ID: <20240701211631.92384-3-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701211631.92384-1-fido_max@inbox.ru>
References: <20240701211631.92384-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp61.i.mail.ru;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 
 4F1203BC0FB41BD92EE09148F40C5446A7FAE8DCEC8B7EB8BCFECBD40676ED7F182A05F538085040F2FC769EDF2A425789CEA9C911D09995FEC9FDF3516C4286E597827C598CA0741BB5EE8A55BF1B9C
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73C714006C69EB7BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375D8840FA58F505298638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8553737D154D544C9D012B7F63A9194D3F5ED2851CEA6C6E720879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0DCF4F0DC832992758941B15DA834481FA18204E546F3947CBC0ADEB1C81BB362F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F7900637B8FA30D9455089A722CA9DD8327EE4930A3850AC1BE2E73542F54486E6D6388DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A59CD1649BB2102F735002B1117B3ED6969B8061BD9E0DC36072305013E4AE841E823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF61160E4A2A59F8405DDCFE73700EBB0CBAFA4DCB9B2220B81237FE46B0A9C623FA89AC6828CC40489DF1169A732047E3D8E5EF67D927D99AE936252639E45A3B8D0EF07D98ED38C9146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW8WA9HlViieRw==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9BAAD3EAE657EF211AE0E5D55A3A4A88C596C95C018F9D311590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: 3K2MDFJ4XGQDFSZLTWQREDOMPOKWBHCO
X-Message-ID-Hash: 3K2MDFJ4XGQDFSZLTWQREDOMPOKWBHCO
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3K2MDFJ4XGQDFSZLTWQREDOMPOKWBHCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/nau8824.c | 21 +++++++++++++++++++--
 sound/soc/codecs/nau8824.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index f92b95b21cae..12540397fd4d 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -506,6 +506,7 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
 	struct regmap *regmap = nau8824->regmap;
 	unsigned int value;
 	bool clk_fll, error;
+	int ret;
 
 	if (SND_SOC_DAPM_EVENT_OFF(event)) {
 		dev_dbg(nau8824->dev, "system clock control : POWER OFF\n");
@@ -520,8 +521,15 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
 		} else {
 			nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, 0);
 		}
+
+		clk_disable_unprepare(nau8824->mclk);
 	} else {
 		dev_dbg(nau8824->dev, "system clock control : POWER ON\n");
+
+		ret = clk_prepare_enable(nau8824->mclk);
+		if (ret)
+			return ret;
+
 		/* Check the clock source setting is proper or not
 		 * no matter the source is from FLL or MCLK.
 		 */
@@ -563,16 +571,21 @@ static int dmic_clock_control(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	int src;
+	unsigned int freq;
+
+	freq = clk_get_rate(nau8824->mclk);
+	if (!freq)
+		freq = nau8824->fs * 256;
 
 	/* The DMIC clock is gotten from system clock (256fs) divided by
 	 * DMIC_SRC (1, 2, 4, 8, 16, 32). The clock has to be equal or
 	 * less than 3.072 MHz.
 	 */
 	for (src = 0; src < 5; src++) {
-		if ((0x1 << (8 - src)) * nau8824->fs <= DMIC_CLK)
+		if (freq / (0x1 << src) <= DMIC_CLK)
 			break;
 	}
-	dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, nau8824->fs * 256);
+	dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, freq);
 	regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 		NAU8824_CLK_DMIC_SRC_MASK, (src << NAU8824_CLK_DMIC_SRC_SFT));
 
@@ -1871,6 +1884,10 @@ static int nau8824_read_device_properties(struct device *dev,
 	if (ret)
 		nau8824->jack_eject_debounce = 1;
 
+	nau8824->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(nau8824->mclk))
+		return PTR_ERR(nau8824->mclk);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
index 5fcfc43dfc85..d8e19515133c 100644
--- a/sound/soc/codecs/nau8824.h
+++ b/sound/soc/codecs/nau8824.h
@@ -434,6 +434,7 @@ struct nau8824 {
 	struct snd_soc_jack *jack;
 	struct work_struct jdet_work;
 	struct semaphore jd_sem;
+	struct clk *mclk;
 	int fs;
 	int irq;
 	int resume_lock;
-- 
2.45.2

