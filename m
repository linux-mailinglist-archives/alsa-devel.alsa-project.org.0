Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC466EB818
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 10:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2CEECF;
	Sat, 22 Apr 2023 10:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2CEECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682153452;
	bh=k/W7J+h8mIT+x8XNT7jbNRkISUbVwJAhp1FWnCmb/yc=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=ByljyLD7qx+x/XsyO3zEJC+O519wVo1NiCggXJ039sDfbxJ8CmXuqwX6KSmObra8r
	 +at28AwmvWfSLzewuA0rjSpCWwTRmiqNGbuLyBoynRydSM7S9n51gLYwfmSGojsjeU
	 RL2zkLBI4Qk3FMaLRuCChJ4MMGLfcWR+YTYpcxx0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF07F8053D;
	Sat, 22 Apr 2023 10:49:15 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: dwc: add reset support
Date: Fri, 21 Apr 2023 22:33:19 +0300
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 22 Apr 2023 08:49:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5QKNP5OWHWEDTSHWNWJBSCTKHORQTXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <168215335490.26.141787346545792675@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3925EF80155; Fri, 21 Apr 2023 21:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D812F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 21:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D812F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=H4iGDg9w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=j9rUoPjdeJAcyfbV1sAeRDPickwaRz17PVPcTmmeXaU=;
	t=1682105618;x=1682195618;
	b=H4iGDg9wSHmKmqxucqznYMKhLWzhb3nkNS6SUQFjv9K64xhU4Nmw8gVyzSjjFMOvX+GOGtYx3dK42fgl2/47l9irJfJ48pDhqQyeVEZdn+N4K7e5uPiZrYtwpkYCRToW9eb0I4aCU+cC6lMwYdBtvhdDvvGQB/P/dUHWB/g8pDFzADa7qXVJnv/j4ZfyLbs5SfmZgJ90we5FXi+e5Vb56SceN+S2fCy/6bXyTGLYdulva+gbbbSGBWy5LRMRr4sr0xD4OhjCXcK2gQ9mdLQBgWMG+x+FvWiBZkmtCI/wlaqcK0bf2vAUYiD5OjbWHEr0aPPVaq0U523gspw0aSww5w==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1ppwVj-0005On-99; Fri, 21 Apr 2023 22:33:35 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: dwc: add reset support
Date: Fri, 21 Apr 2023 22:33:19 +0300
Message-Id: <20230421193319.14066-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD9329E3AD3F81E7346D5A3B232A3C92586FFB408233B2CE427182A05F5380850404C228DA9ACA6FE27FD0E2E965550AB2588341EF795AA283B6EE8BEE5467A191235AC983322194D09
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637802D3462438662818638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B2B5A93B95F1ACCDE78EF656FD776B226F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE709B92020B71E24959FA2833FD35BB23D9E625A9149C048EE1B544F03EFBC4D57F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B7F82A1F46C355A5389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B2303E78B907142AC75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A54EC9CF97BB544C203E1DA66776CFEC610CD941B9A4F8C687F87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9697028CA92F401948BBD1D282C0DE79AA7DDFDFF495D4C5B30D8125526B984425059624982F7461F42790DB0C4B64281793D7431C999151972843AD9AF9147D6E346BF9FA413E5543082AE146A756F3
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojr0si6YxBz7SqyxhiMcTYKQ==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF5E43395D0536F0507F3F30573564DC9FB98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z5QKNP5OWHWEDTSHWNWJBSCTKHORQTXV
X-Message-ID-Hash: Z5QKNP5OWHWEDTSHWNWJBSCTKHORQTXV
X-Mailman-Approved-At: Sat, 22 Apr 2023 08:49:11 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5QKNP5OWHWEDTSHWNWJBSCTKHORQTXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some SoC may have resets for I2S subsystem. So add optional reset
deassert at startup.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 9 +++++++++
 sound/soc/dwc/local.h   | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index acdf98b2ee9c..8c8bc7116f86 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
 #include <sound/designware_i2s.h>
@@ -648,6 +649,14 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_base))
 		return PTR_ERR(dev->i2s_base);
 
+	dev->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
+	if (IS_ERR(dev->reset))
+		return PTR_ERR(dev->reset);
+
+	ret = reset_control_deassert(dev->reset);
+	if (ret)
+		return ret;
+
 	dev->dev = &pdev->dev;
 
 	irq = platform_get_irq_optional(pdev, 0);
diff --git a/sound/soc/dwc/local.h b/sound/soc/dwc/local.h
index 1c361eb6127e..d64bd4f8fd34 100644
--- a/sound/soc/dwc/local.h
+++ b/sound/soc/dwc/local.h
@@ -89,6 +89,7 @@ union dw_i2s_snd_dma_data {
 struct dw_i2s_dev {
 	void __iomem *i2s_base;
 	struct clk *clk;
+	struct reset_control *reset;
 	int active;
 	unsigned int capability;
 	unsigned int quirks;
-- 
2.39.2

