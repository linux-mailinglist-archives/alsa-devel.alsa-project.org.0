Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93517E068A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:28:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3428EF0D;
	Fri,  3 Nov 2023 17:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3428EF0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028929;
	bh=3vMvyouTrSlTTv/1BlonUdvoKpdtri2jxGZJNXRvhAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jngJ+A8AAdk/EOjO94Ds4RFMqDTHjdtgABMqg+i64kFCgAA4uacAN6KrSMYhtWcwd
	 IkaYyKn/f6YVJbSEEG2/MMN1NIzQdU0Fp7uAA/5lX/SyfklJadmclgv5QfTujVcDVL
	 byrJ8HGFtixAbYMCvcA/AKPIdbX3IVi/Hn1HBegs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73B49F805D2; Fri,  3 Nov 2023 17:26:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB66BF805BF;
	Fri,  3 Nov 2023 17:26:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2904F8020D; Thu,  2 Nov 2023 16:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09EFCF80290
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 16:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09EFCF80290
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 58B5C836CE;
	Thu,  2 Nov 2023 16:12:06 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 02 Nov 2023 16:11:09 +0100
Subject: [PATCH v7 03/10] pinctrl: single: add marvell,pxa1908-padconf
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231102-pxa1908-lkml-v7-3-cabb1a0cb52b@skole.hr>
References: <20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr>
In-Reply-To: <20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Leo Yan <leoy@marvell.com>, Zhangfei Gao <zhangfei.gao@marvell.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Karel Balej <balejk@matfyz.cz>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=3vMvyouTrSlTTv/1BlonUdvoKpdtri2jxGZJNXRvhAY=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlQ7w4R0WGAouL6TrH9chgMtCm0ZfVKWBiq89tl
 Dd9aHZwzXKJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZUO8OAAKCRCaEZ6wQi2W
 4SsIEACRIEDbXydKjDCcaYpSifjIjFL7Gii4p2KLIUEwwf8DLR3hGlFL2XK3Mkf1OzluaRtlbns
 99kOngBNHCviv0q71rWYiah0Ge4gWEW7tAG9hJbzPdtbTPkFLp27NmVahm+KfSpY48fuDg1Ud6M
 flhLAYaW61mObhsdXbbF7j5ch76+dAQhgztJJ/XFQw/FT/wuwstxos+FyfLIHPgwCegnAe1Im9J
 DX/mPZB5AsBVWEZyTGRfIbNA6ZiFeLfBvJUYPquuPtiNywJu7IYmmGIqdMxW9Uh7mNMq95Fgx4z
 KUN4K6hEozWfFDAtG7NZ6tPqgEzDTL/5Xkd1C+ZCI3244y61yhAJkw3alfHQjZhBR0VooZjWWBk
 J7pILsKh0H1UhbcGL0umo+/BXUPOWGzHpQp19pY2rqJatvAx+apYtPK9G2z6Cs4V7mE6QsHCv6Z
 oxNbC0jsYumBAbvXLIAWUxpNEW6RripDS37iwmRr1Xc7gHfB1WfVGn1rF73cDjlJISZgJqL/lTk
 X9y/t/JGj55a/s8qm8Ll/bixprzbDe+gknRthafU9xWdmtG9pKtItumjJGQpfIoLIXF9Gjb4lTj
 TnrJr/M/MO27shjg6VusjjJswjN1XxEDqP1qdq0IDW91U4hB8AfeIa4677WGAaXycrTnvBv5XsE
 KeLsd+RofQxj0mQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-MailFrom: duje.mihanovic@skole.hr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U4RYYQL6RWRNZOF7YHYK22AD4XPQTV2H
X-Message-ID-Hash: U4RYYQL6RWRNZOF7YHYK22AD4XPQTV2H
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:26:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 461a7c02d4a3..a36f750cfe9f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1968,6 +1968,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
 	{ .compatible = "ti,dra7-padconf", .data = &pinctrl_single_dra7 },

-- 
2.42.0


