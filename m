Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2A9077DA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E93B218C;
	Thu, 13 Jun 2024 18:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E93B218C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294897;
	bh=mT1/rVVdWV+5QoTSApPnuEEIlkiQJf0kw1vPslyrMIY=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KnMLPUL6hK/EeJHEcQQvnUx59zbRJiEspsZJR4nTgimqkOCBiU8DwsW39tkD/fWxa
	 K7zEBtzuucSduD4WPcxV3JSKH2n6yHekMjeYASRxALRUUgzFpwnyAU++eBs4+5veSU
	 uKESJHZsZQzmKvOeMaTnq3cjEofEOgmmPfEThGlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABA5DF89713; Thu, 13 Jun 2024 18:02:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4C4F80694;
	Thu, 13 Jun 2024 18:02:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7259F804B0; Tue,  4 Jun 2024 12:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFF09F800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 12:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFF09F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=JLLNPyxR
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454A2DmO090283;
	Tue, 4 Jun 2024 05:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717495333;
	bh=lEeeA5XVGydla/KRte/WAZAqdb4muiovvZrIFmRss1s=;
	h=From:Subject:Date:To:CC;
	b=JLLNPyxR1w5+lmhYx9ZbWHXKfrSIa7/v6lEB+XvtUusMK0Yuzknk+sbqSrAVYd1xk
	 OiV92W0Z46cWH1GVjAo5FErQPN+MQkde10gOxWMnZRLyfR6KpkSYXQjzdK2UuyB0+m
	 z2o/Y3KWPkbiUFi/MgZ6nKASyUFW3An8WmnexC1A=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454A2CJU007010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:02:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:02:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:02:12 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454A2BRB130365;
	Tue, 4 Jun 2024 05:02:12 -0500
From: Jai Luthra <j-luthra@ti.com>
Subject: [PATCH 0/2] Fixes for McASP and dmaengine_pcm
Date: Tue, 4 Jun 2024 15:31:49 +0530
Message-ID: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3mXmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwMT3cTi/OT4vNSKEt1kAzPjtORkQ0uDZDMloPqCotS0zAqwWdGxtbU
 AE2GY9VsAAAA=
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=mT1/rVVdWV+5QoTSApPnuEEIlkiQJf0kw1vPslyrMIY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmXuYgB8FlkmaUfeYeISFrnAiKrV3JaFHoPcw3e
 zYjan9orCqJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZl7mIAAKCRBD3pH5JJpx
 RXaTD/9mm61MjSw+c7tSjgOLv58uadvLpqkDpKp5w8Twl1roQ+6Y/taGUyWg27a1LrAa1LYObpk
 rlHA30idq7AIFHTFvj1cBE8GUekfbnzqXYlbjsBqV11/A8qAAwCf/U/AoqHq9TqDb8xSSTHgT3c
 GhTPbvpsxp5VQDKU5jQu23LEstByqjE1IIvkQxodPNl56G+BlOmKyhnewT7fi5xwzgH/fSnxaRH
 Ak2BKvE4mwjNBk0dtKt9q7hnrLdqVmhMy6gQGLZbJYj2p+Yl0Ql2OayzDKF1Ak8346YIJXvfHf7
 rMxS47tzEFll+D2fRHQTbu1ICPJK78jg2quD0rwOPXRFFEfNI+8UuGfxFdfLGvj+GiOV3Auy3Rd
 vS+NwJwJ5NnnV50viG/mjbARnLVlTSljB5yIHP85PcNLIq678IjLL9ad42O8UKkusHIhYLB8veY
 Uasuz0kLgig8uvxk3YtewOiTQlkIXIPp9RlYlNp4PasX8V+hGrLbfUXqYN2TfMKslvxZyL2PRLU
 m2aZBx3FWwLR3n47o7yBcoDIqU1nIHCJBDLDhjpAaKYG0R252XBXiYmvyEuHZAPnUt/R4aSu86i
 IiwHTfJ12nBbkLxagoaHh7TEXHChwLM95Gw/Un88WY+ffEYAVjpBAhNlbJKeAaSj3a7pnBjg08w
 Ja3MzA2SG36zlaw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NGY5WLLD7HWZF5WXBDWDAF2PZBJRGUXY
X-Message-ID-Hash: NGY5WLLD7HWZF5WXBDWDAF2PZBJRGUXY
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGY5WLLD7HWZF5WXBDWDAF2PZBJRGUXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series fixes two patches:

1. Fix the dmaengine API usage by calling dmaengine_synchronize() after
   dmaengine_terminate_async() when xrun events occur in application
2. Use the McASP AFIFO property from DT to refine the period size,
   instead of hardcoding minimum to 64 samples

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Jai Luthra (2):
      ALSA: dmaengine: Synchronize dma channel in prepare()
      ASoC: ti: davinci-mcasp: Set min period size using FIFO config

 include/sound/dmaengine_pcm.h         |  1 +
 sound/core/pcm_dmaengine.c            | 10 ++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++++
 sound/soc/ti/davinci-mcasp.c          |  9 +++++++--
 4 files changed, 26 insertions(+), 2 deletions(-)
---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240604-asoc_next-c063fcc190c6

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>

