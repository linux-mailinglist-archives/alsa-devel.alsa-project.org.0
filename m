Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141076B921
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D164852;
	Tue,  1 Aug 2023 17:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D164852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690905156;
	bh=tbSP3eWsnNqPs6+P9TAcg1XK2yOUVpI7mgBG7MfEbBU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ALXDpSNGs7Pl7dfuU90SVxQhtpUMjtivIFSZbvmAEMdWGXzWKOES6q6NZmyN0Alca
	 qrZbsby8Mb0XdR2pndpAQSZNZtMtybEDTggSVhcAT8R+czudDLwC9/acP9UIQTLaFy
	 QlPO7TIu7o26RVn0N4jGPmmqovVv3sCM3sOiBl8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7CF6F805C5; Tue,  1 Aug 2023 17:49:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 278FAF805AD;
	Tue,  1 Aug 2023 17:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E35F801D5; Tue,  1 Aug 2023 16:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C140F8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 16:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C140F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=TWAiQ8yD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=D/tnD
	hhtLKuYANELtN6YERyXJ7QVSlBim2KcElYcYng=; b=TWAiQ8yDm76gnwN3SHIw8
	C1RcXcSN2HLBH5eGeulAD9fTDsa0SAbfgzU3Imqc43ePKwX/eEPbVX4Asb+JYt/W
	mK5rXnZBTwQn50KK914bA6z+XEkkWVuX0a0wMjyL//BRbBVcpXDbRy8D0kAChUaF
	bLTSRyqehtE42SmxQhEnXk=
Received: from lml-Birman-PHX.. (unknown [112.96.224.101])
	by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id
 _____wDX75cUE8lkuruWBw--.17042S2;
	Tue, 01 Aug 2023 22:13:42 +0800 (CST)
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
Date: Tue,  1 Aug 2023 22:13:38 +0800
Message-Id: <20230801141338.116806-1-jim_monkey@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX75cUE8lkuruWBw--.17042S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4UXr1ftw15Ar4kGr4DJwb_yoW8uw1rpa
	1kCFZ5tFy7JF12k3yfK3W8Gw1rWry8uF42kasFqw1DtF1DJFsY9w13tr1DXFWvvFWUGFZx
	Jry3uw4rGrZxZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr9N3UUUUU=
X-Originating-IP: [112.96.224.101]
X-CM-SenderInfo: 5mlpsz5rqnv5i6rwjhhfrp/1tbitxy+81aEX1rG7QAAsa
X-MailFrom: jim_monkey@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WCX664U76P4VOCTY7WF7WMGT2DZEVRXR
X-Message-ID-Hash: WCX664U76P4VOCTY7WF7WMGT2DZEVRXR
X-Mailman-Approved-At: Tue, 01 Aug 2023 15:47:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCX664U76P4VOCTY7WF7WMGT2DZEVRXR/>
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

