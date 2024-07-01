Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C5391EA73
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 23:47:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D54514E0;
	Mon,  1 Jul 2024 23:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D54514E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719870436;
	bh=HGkEF4lcnH+qevXx2N/hUawe5/qwnBOtlM63bp19uJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pAlDz8CJcdq0emdNqLgYC2aR/mmnv+af1aP4GfMHG8KTZSj8JnJJ93Q4+Lg3TuKL3
	 snrfibpoMdFdx8Sls7Q+jGcSixoUsxKNLJXYnfArh9JeOYVsL+LJlsNhZZgvH+eGC6
	 Pcu2bEPSY3hsf/V0sYdkYk9b3KWSmFmwzsZ6BCXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B641F8028B; Mon,  1 Jul 2024 23:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F90CF805AC;
	Mon,  1 Jul 2024 23:46:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 833CFF8045D; Mon,  1 Jul 2024 23:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp61.i.mail.ru (smtp61.i.mail.ru [95.163.41.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C521F80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 23:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C521F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=sUCM/t+5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=i/oVyUdCR6U4wBRrOrUwouvOgleqfCfvRfrhxua8/8I=; t=1719868599; x=1719958599;
	b=sUCM/t+5yrWYDWVnVjRoHcEXHLNB+DAR2CmYRmGDweV1Ql4QewxbiHpRW9DL9Cq6CCGdBcRTolz
	GiDU6wReJ61NIC6zDc9/jdw+Y+/1uE+ap/3POz0JNsef/c6foabrk5XCrVX9TpZyqBxxdG/R+HHzd
	zyqvWzyjzQHdQoRMw0qRLGxIbMB6gi1XyjnLmaUU99TX4wv2f9Tx1iB+ggzMIfqYCzKWcM9VA3KPZ
	5rSMdUioqIn7k2wRQMbTAI9Ogv3sUsJmN7kU1aWJvmHMTLd+tXyPYm/Mmaw3MqlIIM2XgCk/t7EKf
	3XSu47KxN5TkGravrQpBseGtJGi0u4waL/Tw==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sOOO4-0000000HXqS-0WN6; Tue, 02 Jul 2024 00:16:36 +0300
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
	alsa-devel@alsa-project.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: nau8824: Add master clock handling
Date: Tue,  2 Jul 2024 00:16:21 +0300
Message-ID: <20240701211631.92384-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701211631.92384-1-fido_max@inbox.ru>
References: <20240701211631.92384-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp61.i.mail.ru;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD916CE66F793C0480225FCB3F685FD1C89CA2793B104534974182A05F5380850404C228DA9ACA6FE27D247BB7565BA393F89CEA9C911D099954B57C4F626803741E597827C598CA07429C25ED172725C63
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C2204D4F9A221771EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063797024C28700A46CB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E072BBCE38384E95D012B7F63A9194D3AFEC760CC299C78520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C4E7D9683544204AFF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063753733A85D94CE7A19FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407978DA827A17800CE773BC869C69ECC1572DBA43225CD8A89F83C798A30B85E16BC6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 
 0D63561A33F958A58CCA0DB3962BF2075002B1117B3ED696773726BAA4FE8E8C7E0012C66AE17B00823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6A24D1083EC183048C98BA5C7C7671DD8D74D03B5166C2F605B01D8F696991EBACCD0F0CDF7B38979DF1169A732047E3308C5C702036253EE936252639E45A3B5F7F135DFCEFC6D5457F7985AD47CF5C02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW9F2kO9LoS5lA==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9BDAB720856E5F194DE0E5D55A3A4A88C5E02BB9B6B840F2AA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: 2CJSWQKQUIDHAYXDAHPXM4MSDN3NHXDX
X-Message-ID-Hash: 2CJSWQKQUIDHAYXDAHPXM4MSDN3NHXDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CJSWQKQUIDHAYXDAHPXM4MSDN3NHXDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use master clock "mclk" if provided through device tree.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/nuvoton,nau8824.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
index 3dbf438c3841..232dc16a94a3 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
@@ -23,6 +23,14 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    items:
+      - description: The phandle of the master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   interrupts:
     maxItems: 1
 
-- 
2.45.2

