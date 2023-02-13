Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB6F694165
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 10:38:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6A0208;
	Mon, 13 Feb 2023 10:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6A0208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676281092;
	bh=J6qxQBIjFxrqXByr6QtQR8A3Yluz5mnFuqM5ctPrhTE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GpPuLPJ5/K5Fm3HcRRYHiK35fo2OSdeC3boL7x27VUqvc3rG87uiFURjSam2fZ2xt
	 ZDMib9vROOyxi7S+1CwMyHLl9rxcecEYAo0EFoUxes7zBc/H6FxnpFLQmIlfhbdJaa
	 DtvgB7noJRPoJ4MDiA5gEJu4+fIYsY3fNBjQDKOw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA34F800B0;
	Mon, 13 Feb 2023 10:37:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39B3CF804F2; Mon, 13 Feb 2023 10:37:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com
 [115.124.28.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B471F804B4
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 10:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B471F804B4
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1599715|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00673938-0.000857743-0.992403;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=21;RT=21;SR=0;TI=SMTPD_---.RKjcWmU_1676281015;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.RKjcWmU_1676281015)
          by smtp.aliyun-inc.com;
          Mon, 13 Feb 2023 17:36:56 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	rf@opensource.cirrus.com,
	pierre-louis.bossart@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	james.schulman@cirrus.com,
	doug@schmorgal.com,
	yang.lee@linux.alibaba.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3][next] ASoC: codecs: Modify the log print statement
Date: Mon, 13 Feb 2023 17:36:48 +0800
Message-Id: <20230213093649.22928-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213093649.22928-1-wangweidong.a@awinic.com>
References: <20230213093649.22928-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFUC3LTS3PTBC6TOIA3YMTARTE2KWYCZ
X-Message-ID-Hash: ZFUC3LTS3PTBC6TOIA3YMTARTE2KWYCZ
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: wangweidong.a@awinic.com, liweilei@awinic.com, zhaolei@awinic.com,
 yijiangtao@awinic.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFUC3LTS3PTBC6TOIA3YMTARTE2KWYCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Change hdrlen to hdr_len

Signed-off-by: Ben Yi <yijiangtao@awinic.com>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index d7c31a202adc..05bcf49da857 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -932,7 +932,7 @@ static int aw_dev_check_cfg_by_hdr(struct aw_device *aw_dev, struct aw_container
 
 	hdr_ddt_len = cfg_hdr->hdr_offset + cfg_hdr->ddt_size;
 	if (hdr_ddt_len > aw_cfg->len) {
-		dev_err(aw_dev->dev, "hdrlen with ddt_len [%d] overflow file size[%d]",
+		dev_err(aw_dev->dev, "hdr_len with ddt_len [%d] overflow file size[%d]",
 		cfg_hdr->hdr_offset, aw_cfg->len);
 		return -EINVAL;
 	}
-- 
2.39.1

