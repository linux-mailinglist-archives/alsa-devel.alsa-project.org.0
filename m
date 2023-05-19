Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB17095F4
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 13:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640C020C;
	Fri, 19 May 2023 13:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640C020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684494423;
	bh=mMrHWPoWGaJgC7aDXQSZwCLuVD9Nx0faeQXyTzcweCE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EAjpc/AOfF3egYBJQ4qXz9r3uZSARbvUjJ7RxI+VX8qqCXysKhE0TOQbQ7PVtWQwI
	 92+68KStMN4p/YnWR4mtF5AXl5Z2ZlYWuVybMcpcAtmeHisQSOpaBvhrO0oS6/SICD
	 08fQDd4ucqxrDYK6u7sX1qoOxdVcWEQz+d0g5MGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD01FF8024E; Fri, 19 May 2023 13:06:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B1AFF8025A;
	Fri, 19 May 2023 13:06:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CFCBF80272; Fri, 19 May 2023 13:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.missinglinkelectronics.com
 (smtp.missinglinkelectronics.com [162.55.135.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03CC6F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 13:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CC6F8024E
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 4D929205F2;
	Fri, 19 May 2023 13:05:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
 port 10024)
	with ESMTP id Lx5TR1TCMWDu; Fri, 19 May 2023 13:05:58 +0200 (CEST)
Received: from nucnuc.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: david)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id EEB3520412;
	Fri, 19 May 2023 13:05:57 +0200 (CEST)
Date: Fri, 19 May 2023 13:05:53 +0200
From: David Epping <david.epping@missinglinkelectronics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: tlv320aic32x4: Fix supply names
Message-ID: <20230519110545.GA18663@nucnuc.mle>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Message-ID-Hash: OQN3XBBL3JZMGMGBWIYFOWGMP43HOVOX
X-Message-ID-Hash: OQN3XBBL3JZMGMGBWIYFOWGMP43HOVOX
X-MailFrom: david.epping@missinglinkelectronics.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQN3XBBL3JZMGMGBWIYFOWGMP43HOVOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The term "-supply" is a suffix to regulator names.

Signed-off-by: David Epping <david.epping@missinglinkelectronics.com>
---
 Documentation/devicetree/bindings/sound/tlv320aic32x4.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
index f59125bc79d1..0b4e21bde5bc 100644
--- a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
+++ b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
@@ -8,7 +8,7 @@ Required properties:
 	"ti,tlv320aic32x6" TLV320AIC3206, TLV320AIC3256
 	"ti,tas2505" TAS2505, TAS2521
  - reg: I2C slave address
- - supply-*: Required supply regulators are:
+ - *-supply: Required supply regulators are:
     "iov" - digital IO power supply
     "ldoin" - LDO power supply
     "dv" - Digital core power supply
-- 
2.17.1

