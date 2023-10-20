Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA67D0AAA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 10:37:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B581A4A;
	Fri, 20 Oct 2023 10:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B581A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697791021;
	bh=qDApE+/+Uek8eDNf5MPMzbnznXBBGK+GTzQINyrtSYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mSVrIKtCrtXjjsJ0qfi0NLx4cf5XwrseD/TS8tMn/WQa+H/HL5gAd3R0mv7Wphl3k
	 YdX75UjDDmryP6xgOtjU1KyjbYVT26f+G0/I6Oow1/dMraN5iA5DZFq512+IkPXan8
	 CvsnO0r3oX4DCnJ34OCmLiYMfz3CoOkPLzbudorY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91A2AF8057C; Fri, 20 Oct 2023 10:35:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE66DF8056F;
	Fri, 20 Oct 2023 10:35:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBCA9F8055B; Fri, 20 Oct 2023 10:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com
 [115.124.28.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AB30F8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 10:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AB30F8019B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.3107921|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00854121-0.000347876-0.991111;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.V3YjlkR_1697790898;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V3YjlkR_1697790898)
          by smtp.aliyun-inc.com;
          Fri, 20 Oct 2023 16:35:05 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	shumingf@realtek.com,
	rf@opensource.cirrus.com,
	herve.codina@bootlin.com,
	ckeepax@opensource.cirrus.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	sebastian.reichel@collabora.com,
	ajye_huang@compal.corp-partner.google.com,
	harshit.m.mogalapalli@oracle.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	dan.carpenter@linaro.org,
	trix@redhat.com,
	liweilei@awinic.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com
Subject: [PATCH V2 2/4] ASoC: codecs: Modify max_register usage error
Date: Fri, 20 Oct 2023 16:34:24 +0800
Message-ID: <20231020083426.302925-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020083426.302925-1-wangweidong.a@awinic.com>
References: <20231020083426.302925-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GWVHK4IPAZVA35OJVJGL4R5CW2EZNYEA
X-Message-ID-Hash: GWVHK4IPAZVA35OJVJGL4R5CW2EZNYEA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWVHK4IPAZVA35OJVJGL4R5CW2EZNYEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Modify the value of max_register, otherwirse
the AW88261_EFRL1_REG register will not be
accessible.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a697b5006b45..0db7a0a3c179 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -20,7 +20,7 @@
 static const struct regmap_config aw88261_remap_config = {
 	.val_bits = 16,
 	.reg_bits = 8,
-	.max_register = AW88261_REG_MAX - 1,
+	.max_register = AW88261_REG_MAX,
 	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
 	.val_format_endian = REGMAP_ENDIAN_BIG,
 };
-- 
2.41.0

