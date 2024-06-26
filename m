Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741CB918523
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 17:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76EC7E72;
	Wed, 26 Jun 2024 17:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76EC7E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719414177;
	bh=ZGHpU2mK6LnO2Jxl+CqhYMo9BSGbEhn6NgP1Aqn63iA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sA08jStQKh1mQ3tshsQcbYEOhBz5gHL+C2Cu1WI/BgG5T6DX0Pn9mwSKgFZnFllYk
	 SqMNhVWLQTh0UaKqpFlvbdR6AndsgaXGSt4K4Fstu+Wx4SFg0hEX8NwWJtaW9uoadj
	 6K3G/79emeBxghddYETOzJxn24R719Lu6SKzI44U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C355F805B0; Wed, 26 Jun 2024 17:02:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CB1F805B0;
	Wed, 26 Jun 2024 17:02:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B54ACF8049C; Wed, 26 Jun 2024 17:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp58.i.mail.ru (smtp58.i.mail.ru [95.163.41.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD649F800E4
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 17:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD649F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=u6J5oVsL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=kjIQc7jeZaVYEiwPdh4XTzlvgv05UxecfDBnXhnpxZk=; t=1719414012; x=1719504012;
	b=u6J5oVsLTlWGlF6O/U+RDExwdN4h+RCoX68r7bR5AlPITGVmOIiMgC9xctaHGPwKW0P/BtkrN23
	4GWzoVW/kQABxh/eLY4g+XX6GivsAjN4hboq/xqSHdOWkH7giRrZXOFvzbfMD8U5niliOEiVw3ebA
	j38fV4TM/WBjxJi4rr/BG+suW47wDDH9C/5bZFhoqyAtopclz1WhAzQ5r8Sf8nX3CcLRpgPKxthqD
	QMRD+rvpgEpSniEwpTX90wjJUDbIbzPGU0AlK3qJuNlRdgh3+say5abv+F+rRjvTWioCW/sN3TlK3
	3pm0K3v82BCdp/2bw4YLYs3GifOOlxe7pemQ==;
Received: by exim-smtp-84f7fbf7d8-c7c8k with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1sMU7w-000000007Ow-2qHR; Wed, 26 Jun 2024 18:00:05 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Hsu <KCHSU0@nuvoton.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] Add master clock handling for nau8824
Date: Wed, 26 Jun 2024 17:59:28 +0300
Message-ID: <20240626145931.25122-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-84f7fbf7d8-c7c8k;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD99270B3E0DC24D31F560AFC71CB21568C458C378DBEF046C3182A05F538085040BA2C9FD91A17C6B83DE06ABAFEAF6705D2CF90257329E938A349DC5573309D55697DF1A24495553A
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E50EC9128971FD6EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727BBC20C3D5F36038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86FCB8616DAA552D858B7FB142A6C57702FD777B0F2880A2620879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C08794E14F7ADDB10D8941B15DA834481FA18204E546F3947CC2B5EEE3591E0D35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063706C07FE7DDBB4AB7389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A55CD4BD7E422D185B5002B1117B3ED696D4954C7A71B7E3FABFF4097FFC9E796F823CB91A9FED034534781492E4B8EEAD2F8D89FC5850081EC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4AEE0A9E6E197997319919EFC76C0EF7A59577C50A0A7102C5FFF87E0D2C559D45CF0F9AF1251E13443676941C84C1C82B1131C14F6480A1A654F9AD099EF804B778B86CC83EC70C146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoou/hQ5t0W3tw==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9B5E031A3F3DD4F6E00534B403F2BB02FE7CC3029A5A90DEC190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: DJO6K2OJPVRLR3WDY7TPSH7LFI4RCSC4
X-Message-ID-Hash: DJO6K2OJPVRLR3WDY7TPSH7LFI4RCSC4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJO6K2OJPVRLR3WDY7TPSH7LFI4RCSC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

nau8824 has external MCLK pin. So add enable/disable external clock
management.

Maxim Kochetkov (2):
  ASoC: codecs: nau8824: Add master clock handling
  ASoC: dt-bindings: nau8824: Add master clock handling

 .../bindings/sound/nuvoton,nau8824.yaml       |  8 +++++++
 sound/soc/codecs/nau8824.c                    | 21 +++++++++++++++++--
 sound/soc/codecs/nau8824.h                    |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.45.2

