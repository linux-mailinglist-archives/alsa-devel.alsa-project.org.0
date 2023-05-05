Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC16FA164
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C2D312BC;
	Mon,  8 May 2023 09:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C2D312BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532077;
	bh=zCZpBn1/gKgYrA+INrfA2aWDQR7Ix34fVLWZqstxgME=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=iHGhPKc+OJOBmreDSk83VZJZ1pwfIo51ZwRIIM2OCTYeNjkPlSS8ZyjHPP8IY86mQ
	 QkZdbUV5dms/Vqk/Ktl+G4twzpf1jEwFKpCkyeKr8CSPO0ISjL1LEziIt89yeCJX8z
	 pJa9vemjCcpm6+yIYyPVD9nUK+yy4d4yqdRGCpEY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39256F805AF;
	Mon,  8 May 2023 09:45:18 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ASoC: dwc: limit the number of overrun messages
Date: Fri,  5 May 2023 09:28:20 +0300
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIE4SVROKURNAN4XIBSOMK6MST2JMJNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168353191757.26.7569317424052350872@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, nicolas.ferre@microchip.com,
 u.kleine-koenig@pengutronix.de, Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C87E1F8053B; Fri,  5 May 2023 08:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43C71F80529
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 08:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C71F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=E44Y6fuw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=w19r/bnmeQETgryQv1iIi3iN09PWER6hP3yMlsCH8eY=;
	t=1683268105;x=1683358105;
	b=E44Y6fuwYk47b9eZ8KsTNC5jTgEBZXu1RmIy94wiBHTqxKcdpF8s15kvu6um4lSIYX1zrNEvQVxP6nfhxY5XYnGIE+ocE30a9vfY9ts416c3JKp7f2GPaXwo00Q4Hmu9wudJXS0KTAMDX8bqf0q+wkfOnirLVL9R66yclY0Y+/MLOzhhEQmxHMhKIB1JCrckkQ7Buz8fX36QXzTpK7GHVzj1GSzxEOwtPqTW3HWdyv5VkBs6DIxWmg+lEAnjcHXpgUTsQ0o1g5/FOK1pnG6Tdu1CDPZBl0+fZWE9vACqqYlx8l4C8noCTiX/jfHrn5OBlTABrO4Huc2sU+qskbcarw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1puovW-00028V-MP; Fri, 05 May 2023 09:28:23 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ASoC: dwc: limit the number of overrun messages
Date: Fri,  5 May 2023 09:28:20 +0300
Message-Id: <20230505062820.21840-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD9CDD72DB02570E1E69F65CF5A383CA60943DD864320CF4B411313CFAB8367EF908E2BE116634AD74D4F6BBD8AD64DF50C24F29287ACC5C24655FADD5F4B5A515B7B9585C59A2DDEF7
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE716FAD50E497B9C14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376AFB9B40001E44068638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D802F15FF47CBB9EA07155B019091615D06F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71DD432BB81541BCF9FA2833FD35BB23D9E625A9149C048EE0A8783F69A4C1398BDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3066B9820929774A389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC8C7ADC89C2F0B2A5E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BD00653D74F80EC5F75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A56E546AF34195C6F10E2829C2CF38B811FE7B195693D6E021F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FB9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC6C1A3D38B6795CE317A5A611E1D04D2960524E4A57BBC48CC3F3EFA9E2777E3B9228B76B87D064D14EE98CD8E9D35FCC3674DFEE1CD913126CA9985D1D297CD0CB5B17375C3CAE6
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojAeDCk4EFldEolkEDguM7oQ==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF590C713BA32C72AB5C7F0208CF814589798CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NIE4SVROKURNAN4XIBSOMK6MST2JMJNM
X-Message-ID-Hash: NIE4SVROKURNAN4XIBSOMK6MST2JMJNM
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:12 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, nicolas.ferre@microchip.com,
 u.kleine-koenig@pengutronix.de, Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIE4SVROKURNAN4XIBSOMK6MST2JMJNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On slow CPU (FPGA/QEMU emulated) printing overrun messages from
interrupt handler to uart console may leads to more overrun errors.
So use dev_err_ratelimited to limit the number of error messages.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index acdf98b2ee9c..ca20cade6840 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -132,13 +132,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 
 		/* Error Handling: TX */
 		if (isr[i] & ISR_TXFO) {
-			dev_err(dev->dev, "TX overrun (ch_id=%d)\n", i);
+			dev_err_ratelimited(dev->dev, "TX overrun (ch_id=%d)\n", i);
 			irq_valid = true;
 		}
 
 		/* Error Handling: TX */
 		if (isr[i] & ISR_RXFO) {
-			dev_err(dev->dev, "RX overrun (ch_id=%d)\n", i);
+			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=%d)\n", i);
 			irq_valid = true;
 		}
 	}
-- 
2.39.2

