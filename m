Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E068F6FA153
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0242812B5;
	Mon,  8 May 2023 09:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0242812B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683531938;
	bh=8IEAxTCzBq2JPGGEYfLyk79zvoWSjLtAxaE+j4BSvkI=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ilaGYsVXrOpt8FgTjrqcGEHy+1XFaFZt+GUP0F/MRXcKYZ1fJ0fcM6OdyijghM2EC
	 1hlD/bSj32j9XSOJEQHruiU+B7sN2K3jymkBjpZTE/wOeXKzaxC1XzJqNRHorkpVQR
	 yoPQdfYQ2bo9C2P0F9DSVHiZpysZzLPjVirYXbLE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59BDFF80534;
	Mon,  8 May 2023 09:44:32 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: dt-bindings: designware-i2s: add optional resets
Date: Thu,  4 May 2023 10:16:18 +0300
In-Reply-To: <20230504071618.52012-1-fido_max@inbox.ru>
References: <20230504071618.52012-1-fido_max@inbox.ru>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 08 May 2023 07:44:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6LFGFCWSNJGJWKWR2IIQROQJRGMTM26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168353187164.26.12256856235696855679@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26B01F8049E; Thu,  4 May 2023 09:16:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5283FF80137
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 09:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5283FF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=rci1M9rt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=CJN5+m1KNeYBxu9b+ut5Y+Z5hkr1WgvRPiVXKn5htjo=;
	t=1683184595;x=1683274595;
	b=rci1M9rtDsDN0ngbGKZuZOg5Zfo3CwMPlP3dP00kquB1bXVvf3qAYTreu2cHV2eckc87b8yXVor7QzSb6AavTksXNwC4gS8sy2rbZYN8ZON8B04+RtipL1cGrsZ5JJM/olCa0kfeNo3qxOhtsmR8Fyjl149CRhECLJ4dUfNK1SAaZquWVB0kyFG09BXRoLBbVCG547ApaSv1LS8SoPuAYjSivFBZz5ZqWloLtzc/WfDE3ktG99qGA41KHjnwPJEWFNgYHb4tiF34hutJG+JcYFsUiA2Mo3NTYDyHKhvgD4NZQzS0oxvlUhqEqzRZ5RPgiOPeU9WCy0G6CiwMZfNP6g==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1puTCa-0007k3-R7; Thu, 04 May 2023 10:16:33 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: dt-bindings: designware-i2s: add optional resets
Date: Thu,  4 May 2023 10:16:18 +0300
Message-Id: <20230504071618.52012-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504071618.52012-1-fido_max@inbox.ru>
References: <20230504071618.52012-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9EB47717F7D2952927A96D7029F65AB07806C062B08BE12BB182A05F538085040D0B941AFC31CF3232069EADDF4C704C887D8DF0C5E877116333F29171445C099
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7548C33FFD72831AFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637838376990962B7D5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CE53BA037779EF86EDF175DAE5101D1CF320879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C04CF195F1528592878941B15DA834481FA18204E546F3947CB645AEB2D65EEA52117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7C4448250843310C09FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006370669898C38A383F16D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637AD0424077D726551EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 
 0D63561A33F958A5DDD583A1A1FC91162658D2C8601A3F543F09C2D513307342F87CCE6106E1FC07E67D4AC08A07B9B06A1CB4668A9CA5FA9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB334A04A0A29473D4A27C4CE95E0A46CDCBE2C60DED4EFA3D51FE52412DAA6218FF2D56E53A0872814EE98CD8E9D35FC312A0230C2E403E253558665F9EFD7356E346BF9FA413E5543082AE146A756F3
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojtUGOBMG7VVPLiMA+KLyLdw==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF54D9D4B6315CAD0F1CFAB24B71DD3744698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U6LFGFCWSNJGJWKWR2IIQROQJRGMTM26
X-Message-ID-Hash: U6LFGFCWSNJGJWKWR2IIQROQJRGMTM26
X-Mailman-Approved-At: Mon, 08 May 2023 07:44:29 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6LFGFCWSNJGJWKWR2IIQROQJRGMTM26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some SoC may have resets for I2S subsystem. So add optional resets support.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 .../devicetree/bindings/sound/snps,designware-i2s.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
index 56e623d4e168..a970fd264b21 100644
--- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -36,7 +36,8 @@ properties:
     const: i2sclk
 
   resets:
-    maxItems: 1
+    items:
+      - description: Optional controller resets
 
   dmas:
     items:
-- 
2.39.2

