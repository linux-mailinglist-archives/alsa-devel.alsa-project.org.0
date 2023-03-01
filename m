Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3786A6BD8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:40:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79069209;
	Wed,  1 Mar 2023 12:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79069209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670823;
	bh=KXEtH9jKkzGjGt3ggsFrpH4RQJqfkFidzUrK69mPhKo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bi3lPWIeAvmmboTQICvo34jm2/LaTS1wou3HkcUmvcs3aUQ8tuyb/q6VkBB46HL7/
	 pukFt4J+bakcs04I5EUYhqOmjeMsdWh54B9lwMJLUqCk7hsSu/IAgcsJbj9tDz/Pex
	 /tAP/1J4LdcKBe479xAEXmbKyMlbSo658BJYPQ+w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30FEBF80520;
	Wed,  1 Mar 2023 12:38:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32912F80520; Wed,  1 Mar 2023 12:38:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A11DBF800BA
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A11DBF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=qr0tge4i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670720; x=1709206720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KXEtH9jKkzGjGt3ggsFrpH4RQJqfkFidzUrK69mPhKo=;
  b=qr0tge4incRfzr6d+P5kZhABj29ehzqzAXjjgjFWanha2W51WAe1Jrly
   kjrAaSiiG0r0rzWLxk6Dfu6Xq8LhMwWMwAQ+/IqmnBckEYJxcNZJlfBdO
   Cy/U8mk/Kr04dbx9QpCa/+Rm/SQg4mwJ9d97/mXqHWdkKAl3xHhbjq2SH
   p8w1KGdgD9Jetg8xnH48IiDVXFbG/qo7t9X/PRUWO1anS/AUWO9chhND1
   n0WWNsWnEInmwzSRnQKYy7s3w/jIci7u36dn0osXAotiSJPyfGJh7gfcc
   NlIY0XTrue0Mn3ycApp5Xak04fiLLiXGXW8l6pXRhvVLcrYm0HVFFtMm0
   w==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="202746412"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:38:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:37 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:34 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 3/8] ASoC: mchp-spdiftx: update debug message
Date: Wed, 1 Mar 2023 13:38:02 +0200
Message-ID: <20230301113807.24036-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 3QZWV3CDI6K2QYTGZU3LMKTLAO3HIBRP
X-Message-ID-Hash: 3QZWV3CDI6K2QYTGZU3LMKTLAO3HIBRP
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QZWV3CDI6K2QYTGZU3LMKTLAO3HIBRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previous debug message states that there was a failure and tx was not
disabled. Which is not true as the TX in this function could also be
enabled. Thus improve a bit the debug message by s/disable/start\/stop/.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index e7241d819748..02a2fa7a42dd 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -337,7 +337,7 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
 	}
 	spin_unlock(&ctrl->lock);
 	if (ret)
-		dev_err(dev->dev, "unable to disable TX: %d\n", ret);
+		dev_err(dev->dev, "unable to start/stop TX: %d\n", ret);
 
 	return ret;
 }
-- 
2.34.1

