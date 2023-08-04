Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA476FFB0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 13:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66BBE823;
	Fri,  4 Aug 2023 13:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66BBE823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691149800;
	bh=bPKIUNhItkhAYOkjxyHjTekNr2rVAmyKCTbKsAzntJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JcjJp471itQMbh6v6fb3/23j4xx+QUi2Nr+YUgeZb+jac4nrALUd0nbHOk26JS/OH
	 Up39x4Vtqfbdfi9cFPBdsayod4AAga7lq/NNa+PIe6gfdq15t1aOMyevxPet1l5+Kc
	 sSZrYLi2vjuH375OPcxjJN7QvxYCpros6L+oZnc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFE2FF80557; Fri,  4 Aug 2023 13:48:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F24DF80552;
	Fri,  4 Aug 2023 13:48:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 510A6F80425; Fri,  4 Aug 2023 13:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-101.mail.aliyun.com (out28-101.mail.aliyun.com
 [115.124.28.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B34FF8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 13:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B34FF8015B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.4050049|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.017331-0.000432192-0.982237;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.U8VaX4z_1691149676;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U8VaX4z_1691149676)
          by smtp.aliyun-inc.com;
          Fri, 04 Aug 2023 19:47:57 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	wangweidong.a@awinic.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	ckeepax@opensource.cirrus.com,
	sebastian.reichel@collabora.com,
	ajye_huang@compal.corp-partner.google.com,
	povik+lin@cutebit.org,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	liweilei@awinic.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 1/3] ASoC: dt-bindings: Add schema for "awinic,aw88261"
Date: Fri,  4 Aug 2023 19:47:47 +0800
Message-ID: <20230804114749.215460-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804114749.215460-1-wangweidong.a@awinic.com>
References: <20230804114749.215460-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W2ZHMG5ETN2VVMQOCJSZEJB2LK6VZFXI
X-Message-ID-Hash: W2ZHMG5ETN2VVMQOCJSZEJB2LK6VZFXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2ZHMG5ETN2VVMQOCJSZEJB2LK6VZFXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88261 property to the awinic,aw88395.yaml file.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 35eef7d818a2..4051c2538caf 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: awinic,aw88395
+    enum:
+      - awinic,aw88395
+      - awinic,aw88261
 
   reg:
     maxItems: 1
-- 
2.41.0

