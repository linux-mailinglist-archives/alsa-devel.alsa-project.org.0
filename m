Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E891EA75
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 23:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B8C1530;
	Mon,  1 Jul 2024 23:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B8C1530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719870449;
	bh=3uy1q1I00JtZDOX21BnWa0Q7cjtU+TTWpXWV748Igt8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PcEmqr4zvULyd+qlvEXHYFg1E3mBJPwKSrRph/soW+u8QNvw8pZ4svIZWaxp7m05n
	 boCvjw1pVsM2g0EZzz2BBTe63SeiDFwOKkLLRzOwbWxISwvHooR4iOt087fWPIhkCr
	 BU8Lo1d0NPP13eDOBpBEZcyojr1KKntHlwppL7RU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B1EF80600; Mon,  1 Jul 2024 23:46:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D3ACF805D8;
	Mon,  1 Jul 2024 23:46:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC864F8042F; Mon,  1 Jul 2024 23:17:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A4AEF800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 23:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4AEF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=TdF5ezAa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=sFgWIfMs0xoIMQw9IXDbgyrr3vk9/94ACpMKZVZhK6o=; t=1719868597; x=1719958597;
	b=TdF5ezAa32WLohRvfloPOffbqHTadGFD37TLOFN9jwpPuGZA87bDEeASlVTWLPJceCCwMaouzzh
	mue3CLqGtphx2tzGgsOBDwG+wHajPBh9nWS520J6WTv0ZMUmh0BA4yy45HjF8RN5I7y9X/u6NxGfI
	ID8Z2m+WEI8twCJ5S1RImf42OwyJtAT2pLjtfzMMImXiIDePngRPXcQVvmVm2Bh3EcNj32N4ZiNEo
	7SwViDJC5adfypGkYAgsdDb3d3o0Ph20PtwwCc2NolSQaXzHSo/4PTlaCHm+azqv9tJx06mQTXj7p
	Q2l++xRhJdQG9mWfkGOr8nsHR5H24mW5Wu6A==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sOOO3-0000000HXqS-035B; Tue, 02 Jul 2024 00:16:35 +0300
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
Subject: [PATCH v3 0/2] Add master clock handling for nau8824
Date: Tue,  2 Jul 2024 00:16:20 +0300
Message-ID: <20240701211631.92384-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp61.i.mail.ru;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD92EE09148F40C5446ED6AE8E79F10FAC9A00C41F324FD1478182A05F538085040ACD2589D9030AE9C89CEA9C911D099953E14ECB5C56879C0E597827C598CA07402FAF9720996C769
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C4A7E4C0BFE8628DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372E9841F416E2DCCD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82DB741A93B3CB90BD012B7F63A9194D3BF6D75D10A29B85520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FA18204E546F3947CCE135D2742255B35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370B730A9793D99025389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A5105DA9812A5A97635002B1117B3ED6965FAB9B8092746FEC406406D89DD9EB8A823CB91A9FED034534781492E4B8EEADC0A73878EBD0941BC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAA417771BA057110F6448DD6630E738689BB76B209CF8A129B2F883581A88A5124DE828755D94EE99DF1169A732047E38579629537E4F8E9E936252639E45A3BE673792307AB8CCD146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojn+1t2APtxW8Uhc2wOmDKWQ==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9B21965CBC0E059640E0E5D55A3A4A88C5599580C8E0FACCDD90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: RTIAEZQUY3MAIBFWUCLIYMBHLPHJ3YUC
X-Message-ID-Hash: RTIAEZQUY3MAIBFWUCLIYMBHLPHJ3YUC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTIAEZQUY3MAIBFWUCLIYMBHLPHJ3YUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

nau8824 has external MCLK pin. So add enable/disable external clock
management.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
Changes in v3:
- move bindings before their users
- use devm_clk_get_optional()
- let clock API care about NULL ptr

Changes in v2:
- move the devm_clk_get() to the nau8824_read_device()


Maxim Kochetkov (2):
  ASoC: dt-bindings: nau8824: Add master clock handling
  ASoC: codecs: nau8824: Add master clock handling

 .../bindings/sound/nuvoton,nau8824.yaml       |  8 +++++++
 sound/soc/codecs/nau8824.c                    | 21 +++++++++++++++++--
 sound/soc/codecs/nau8824.h                    |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.45.2

