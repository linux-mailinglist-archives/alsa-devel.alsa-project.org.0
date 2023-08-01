Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388D76B922
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32282DEB;
	Tue,  1 Aug 2023 17:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32282DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690905164;
	bh=tbSP3eWsnNqPs6+P9TAcg1XK2yOUVpI7mgBG7MfEbBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fAlcduOI8DCKfKYTivRcTDRgkoXPsWa39t5EqaRqp90OEcKDvH/p8PpclfULi/GIA
	 ka35+Nf4WTorUExv54u7vKr1hfPCN5Q/PgOy1R1s8e8GXFBGuXnpyd65DjOiWZgIdI
	 axTPlmUgv0Bsvk27139yoR67oHefapO380FveLLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0644BF805D4; Tue,  1 Aug 2023 17:49:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB014F805C7;
	Tue,  1 Aug 2023 17:49:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A2AFF801D5; Tue,  1 Aug 2023 16:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
	by alsa1.perex.cz (Postfix) with ESMTP id C25AEF80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 16:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C25AEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=KWfE4OH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=D/tnD
	hhtLKuYANELtN6YERyXJ7QVSlBim2KcElYcYng=; b=KWfE4OH3C92BlkD6a54Ib
	FYCeBlSrcf9beeHBCkjXqQMXfAq3KGyNeHuE2w/Xhs4LeS9Dl9iS4dwWAJqujvht
	SCuisXctUQbC98MXB4ebu0V0KxMnkB14hpCEdQh0pjtBADvFToPPj72t4AWDaidX
	UKTqfZg7PLqCZusIgvaYYU=
Received: from lml-Birman-PHX.. (unknown [112.96.224.101])
	by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id
 _____wB3f0OKFMlkldd6Bw--.12472S3;
	Tue, 01 Aug 2023 22:19:58 +0800 (CST)
From: "Baojun.Xu" <jim_monkey@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	krzysztof.kozlowski@linaro.org,
	rf@opensource.cirrus.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	povik+lin@cutebit.org,
	ryans.lee@analog.com,
	ckeepax@opensource.cirrus.com,
	sebastian.reichel@collabora.com,
	fido_max@inbox.ru,
	wangweidong.a@awinic.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	peeyush@ti.com,
	navada@ti.com,
	tiwai@suse.de,
	mengdong.lin@intel.com,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH v1 2/2] MAINTAINERS: Add the MAINTAINERS entries for TEXAS
 INSTRUMENTS AUDIO DRIVERS
Date: Tue,  1 Aug 2023 22:18:58 +0800
Message-Id: <20230801141858.130745-2-jim_monkey@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801141858.130745-1-jim_monkey@163.com>
References: <20230801141858.130745-1-jim_monkey@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3f0OKFMlkldd6Bw--.12472S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4UXr1ftw15Ar4kGr4DJwb_yoW8uw1rpa
	1kCFZ5tFy7JF12k3yfK3W8Gw1rWry8uF42kasFqw1DtF1DJFsY9w13tr1DXFWvvFWUGFZx
	Jry3uw4rGrZxZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07ja_M-UUUUU=
X-Originating-IP: [112.96.224.101]
X-CM-SenderInfo: 5mlpsz5rqnv5i6rwjhhfrp/1tbiMRC+82NfshHiVgAAsH
X-MailFrom: jim_monkey@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CDTNCF5ZFEKKFBBNNZ3SVD4SCXK6UKL6
X-Message-ID-Hash: CDTNCF5ZFEKKFBBNNZ3SVD4SCXK6UKL6
X-Mailman-Approved-At: Tue, 01 Aug 2023 15:47:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDTNCF5ZFEKKFBBNNZ3SVD4SCXK6UKL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Baojun Xu <baojun.xu@ti.com>

Add the MAINTAINERS entries for TEXAS INSTRUMENTS AUDIO DRIVERS.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
Change in v1:
 - Add the MAINTAINERS entries for TI.
---
 MAINTAINERS | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53b7ca804465..2c16168167e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21063,6 +21063,38 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
 F:	sound/soc/ti/
 
+TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
+M:	Shenghao Ding <shenghao-ding@ti.com>
+M:	Kevin Lu <kevin-lu@ti.com>
+M:	Baojun Xu <baojun.xu@ti.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/tas2552.txt
+F:	Documentation/devicetree/bindings/sound/tas2562.yaml
+F:	Documentation/devicetree/bindings/sound/tas2770.yaml
+F:	Documentation/devicetree/bindings/sound/tas27xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,pcm1681.txt
+F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
+F:	Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
+F:	Documentation/devicetree/bindings/sound/tpa6130a2.txt
+F:	include/sound/tas2*.h
+F:	include/sound/tlv320*.h
+F:	include/sound/tpa6130a2-plat.h
+F:	sound/soc/codecs/pcm1681.c
+F:	sound/soc/codecs/pcm1789*.*
+F:	sound/soc/codecs/pcm179x*.*
+F:	sound/soc/codecs/pcm186x*.*
+F:	sound/soc/codecs/pcm3008.*
+F:	sound/soc/codecs/pcm3060*.*
+F:	sound/soc/codecs/pcm3168a*.*
+F:	sound/soc/codecs/pcm5102a.c
+F:	sound/soc/codecs/pcm512x*.*
+F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/tlv320*.*
+F:	sound/soc/codecs/tpa6130a2.*
+
 TEXAS INSTRUMENTS DMA DRIVERS
 M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
 L:	dmaengine@vger.kernel.org
-- 
2.34.1

