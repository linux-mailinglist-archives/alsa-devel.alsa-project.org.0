Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4B91B6F1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 08:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18DEB2346;
	Fri, 28 Jun 2024 08:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18DEB2346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719555773;
	bh=wXupM/sGCTMKIVg9zidcHBj/bXkZFYfzdldrhAQKGuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l07X0VQ8CXNI2y4xkaH/MHZxMiLY6rG6VcQgaryqXDDb44VJypic2TpiNzeRLKAJx
	 u40M8BlLXFNT3f0DdvveqNIPFk1NB8v6bTiDwZqgj98BHZf3Z2/6P649viS5A3eIPR
	 31a5i/59NlSb7mhj32wWPWBMF3KgOwFLt0KZyd6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6493DF80609; Fri, 28 Jun 2024 08:22:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DF0F805F4;
	Fri, 28 Jun 2024 08:22:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FDABF8013D; Fri, 28 Jun 2024 08:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp51.i.mail.ru (smtp51.i.mail.ru [95.163.41.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52C3DF805AC
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 08:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52C3DF805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ppr06gbe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Z1gyLv0ESrMuuRJY5UN58Hh1+nv/oSXBLDcsbhVihBU=; t=1719555521; x=1719645521;
	b=ppr06gbeIBrXmEZ/OilP76YtV24252R58GI796nTG+knOy8xdkzgEepQ5XcD0sDLHR5VT5Rnxua
	lhZEizvzxGXjrkZ4LcYjM89CDo+mvJ6THhKppbFOp1c1ejnHG2RWRhpUehdKI9TOFaNazwCjIwsa+
	C/nj4/Co9EWPDyzPExYDhS3VBvdk33ZwORencSUJz5xheZcpI4TFY1Sxh9Cjg+PxBaTqQ4G8Ia2Bd
	svk6N5ngrdbFKHWTZ3W3maPKFSH0Imh4HIN0GhWKMMUVw5NTbKhHJApUzA/dmU3B44QZMxz0xS2Kp
	zdbE8v04ag33PiQeyieWj39l52fh8YEsuwJA==;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sN4wQ-0000000DKRj-0z0S; Fri, 28 Jun 2024 09:18:39 +0300
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
Subject: [PATCH v2 1/2] ASoC: codecs: nau8824: Add master clock handling
Date: Fri, 28 Jun 2024 09:17:46 +0300
Message-ID: <20240628061750.11141-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628061750.11141-1-fido_max@inbox.ru>
References: <20240628061750.11141-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp51.i.mail.ru;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 
 4F1203BC0FB41BD9749DDC91F62168F96858D558BB6F8ECDBC1E4CBB32F923D0182A05F538085040C7E28C4B4DE50ECDAC8EDD30083ED68E60ACC50AC9A7B37E7BD3776DDB6887745488E5A83A4F5E58
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78EA80DE462DCD770EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375E7A1B5661595F038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C7FAB39B5BEC44226682DC0906D38882FE8B2F64B0C3E0DC20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F790063706586D6E6283AEAE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FA486DC37A503D0BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A50985828F7D6B0B8C5002B1117B3ED69632021838AFC2989D1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFE146DB16C4F81615CB7DD9278B494E9D69CBF862BFD67DF2B292CB58E7858F681545B20770F7F5D44A12D68860EECB79E1BE3578573AC86896C0CB3C25AE39F8F09A5C9E72996AE146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3mRPyj6SSyzBQ==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9BAE739AF5F5FC55F1A12365E67D9B78B7C2B028ED107BAAEA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: 3KY3NCHL3KLCYMJROR2PUX2WCD6EJX3J
X-Message-ID-Hash: 3KY3NCHL3KLCYMJROR2PUX2WCD6EJX3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KY3NCHL3KLCYMJROR2PUX2WCD6EJX3J/>
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
index f92b95b21cae..7153b746f4b1 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -520,8 +520,15 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
 		} else {
 			nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, 0);
 		}
+
+		if (!IS_ERR(nau8824->mclk))
+			clk_disable_unprepare(nau8824->mclk);
 	} else {
 		dev_dbg(nau8824->dev, "system clock control : POWER ON\n");
+
+		if (!IS_ERR(nau8824->mclk))
+			clk_prepare_enable(nau8824->mclk);
+
 		/* Check the clock source setting is proper or not
 		 * no matter the source is from FLL or MCLK.
 		 */
@@ -563,16 +570,22 @@ static int dmic_clock_control(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	int src;
+	unsigned int freq;
+
+	if (!IS_ERR(nau8824->mclk))
+		freq = clk_get_rate(nau8824->mclk);
+	else
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
 
+	nau8824->mclk = devm_clk_get(dev, "mclk");
+	if (PTR_ERR(nau8824->mclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
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

