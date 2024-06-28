Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EEB91B6EF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 08:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F3221DF;
	Fri, 28 Jun 2024 08:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F3221DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719555740;
	bh=y3OfKL/mIWCD2CU0dUGjLIhEKka14zVDGf/boSGV1qQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=faaDkhMUScyQVLxm3Tr5okRc+tF7Riww+9DzBOcASoaj/JFOH+DTIuV56uNnh4jio
	 NjmXko60oldOrnozFxl7h6cV6EjdMCg8phzhmD37/e69q5tct9NWSkfTqd4+oGFy0e
	 f0jtd8wAawOhRWHLD9MtjcVog23rejSfIUaA3kW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15F13F80588; Fri, 28 Jun 2024 08:21:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5CE7F805B5;
	Fri, 28 Jun 2024 08:21:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8090F8049C; Fri, 28 Jun 2024 08:21:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B25DF805BB
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 08:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B25DF805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=rXx6PiNN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=ge1m5xNnSjp5O705qLECpZaJUXZrf8RDfmnJN/mnCGg=; t=1719555519; x=1719645519;
	b=rXx6PiNNRXEWtrTqiMUi7zc51JI+vMXLpIuw/g9DckOlN9O+dkIunjSfxbuL//DtKBWz5jiK/WL
	1hkciLaUAUMNz6E4zlTMBk/HrPmtcZH3kTfBM2yRtgi922YvGiEF3fQaEZEHgnRu4X4wy5KZNWLVr
	Kh5hfkOdhsijYXfCxdB90LIE2UYPqLK3lSTBAlqynuxuklXVnrSC8T9lfWs6KV43w2UQFUDXX8Jmi
	eXkZK37gCLe5ZZrWIKM+uLRhO5GezXuSKJovcFtb04hl4F75Kp6vjruxfRcJNDtbVAd2bno23+MAx
	3x60pQaDFEokrhvTdDRRUK2TZdL91e7y/cUQ==;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1sN4wO-0000000DKRj-3U8Q; Fri, 28 Jun 2024 09:18:37 +0300
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
Subject: [PATCH v2 0/2] Add master clock handling for nau8824
Date: Fri, 28 Jun 2024 09:17:45 +0300
Message-ID: <20240628061750.11141-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp51.i.mail.ru;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 
 4F1203BC0FB41BD9749DDC91F62168F9434C08151801B152E33043C08F8D7FF8182A05F538085040B75E958E13EECA91AC8EDD30083ED68E5B7803034921C6E57BD3776DDB6887748E62883BDF625A9B
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE757AEC41D7AA04458EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379A6B93796C91DCB58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83C6E4B3470113C446682DC0906D38882DEF22AD61BD8707C20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F79006377C70927E34808485389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC86089696B24BB1D19F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A5ACF5F6CCAA16077E5002B1117B3ED69690200D2D90457A39B74D9144D44E4FCF823CB91A9FED034534781492E4B8EEADF1165EFABA1780A6C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC936A6000BFCC5EC7E936901FCABE1E64C628756CA9BDA33FE87FE105843AC59FB7A4CF61EC7A84F44A12D68860EECB7B3683851FD3713BC896C0CB3C25AE39F07416E56C15988D2146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3lFbbuTUPvMtA==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9BB0D3F26E3BD54D41A12365E67D9B78B74F465673F7486D3C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: 6Z3E7AS5UA7MPPRZGFDEWSXHLJKBSEWB
X-Message-ID-Hash: 6Z3E7AS5UA7MPPRZGFDEWSXHLJKBSEWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Z3E7AS5UA7MPPRZGFDEWSXHLJKBSEWB/>
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
Changes in v2:
- move the devm_clk_get() to the nau8824_read_device()

---
Maxim Kochetkov (2):
  ASoC: codecs: nau8824: Add master clock handling
  ASoC: dt-bindings: nau8824: Add master clock handling

 .../bindings/sound/nuvoton,nau8824.yaml       |  8 +++++++
 sound/soc/codecs/nau8824.c                    | 21 +++++++++++++++++--
 sound/soc/codecs/nau8824.h                    |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.45.2

