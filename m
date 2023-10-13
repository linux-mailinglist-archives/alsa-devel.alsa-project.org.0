Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C998D7C837A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 12:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF7983B;
	Fri, 13 Oct 2023 12:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF7983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697193873;
	bh=mILfmO/BxDrzYMqQg3NVAr/5DO1JJ+E4vgJS5HunMec=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i6kCQgYVrKEqZV5iA1YiijIceeNrJUw6cf5HVlls7Wkb+45K6AdriAfkEC184g6tE
	 1nibIqdwBBAOFfrFZvGGTI7K9oXTDbeeUfJDYbTglhRvarQBj+m6jCpZV6Po+22It3
	 qmIySHPOQghQCH9kBkS+8XyBqucL7WdWVsu7lBm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DDDBF8056F; Fri, 13 Oct 2023 12:42:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C19F8055B;
	Fri, 13 Oct 2023 12:42:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 817EFF802BE; Fri, 13 Oct 2023 12:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-197.mail.aliyun.com (out28-197.mail.aliyun.com
 [115.124.28.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F27AFF80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 12:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27AFF80166
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.4424414|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0223272-0.000603026-0.97707;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.V-L318f_1697193750;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V-L318f_1697193750)
          by smtp.aliyun-inc.com;
          Fri, 13 Oct 2023 18:42:37 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	rf@opensource.cirrus.com,
	arnd@arndb.de,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	fido_max@inbox.ru,
	sebastian.reichel@collabora.com,
	colin.i.king@gmail.com,
	liweilei@awinic.com,
	trix@redhat.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1 1/3] ASoC: dt-bindings: Add schema for "awinic,aw88399"
Date: Fri, 13 Oct 2023 18:42:18 +0800
Message-ID: <20231013104220.279953-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013104220.279953-1-wangweidong.a@awinic.com>
References: <20231013104220.279953-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NAN7RFWFIOKUTMKAQWHUGO6OB6HPBOEC
X-Message-ID-Hash: NAN7RFWFIOKUTMKAQWHUGO6OB6HPBOEC
X-MailFrom: wangweidong.a@awinic.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAN7RFWFIOKUTMKAQWHUGO6OB6HPBOEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88399 property to the awinic,aw88395.yaml file.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 4051c2538caf..db36b01206b7 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - awinic,aw88395
       - awinic,aw88261
+      - awinic,aw88399
 
   reg:
     maxItems: 1
-- 
2.41.0

