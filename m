Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D103E79166D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 13:47:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC0A9741;
	Mon,  4 Sep 2023 13:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC0A9741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693828064;
	bh=l0T7X4fCwcmtVeAk9/YN9WHD+MyY2pi/e7pYWzBoVfM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SMel5n4UPKbeZCuWdbS00UpC+Gdj/PN9TuffDOD+ZShg5Bl1/v+KnwNds4h7OtcG5
	 zvDlMtN/xAI8apng1+MQvFNILz2jQrPxsMzrz47eE+Bhu6SOO0twoJ4bJ6qMp7UVlb
	 vEN4HoKuJ4sopp++08U1NLcTSVUm64mEI/21JpMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0832FF80494; Mon,  4 Sep 2023 13:46:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97867F80431;
	Mon,  4 Sep 2023 13:46:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DC1AF80494; Mon,  4 Sep 2023 13:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com
 [115.124.28.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F00EF80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 13:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F00EF80236
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1591739|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00437455-6.83401e-05-0.995557;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.UXIjsfa_1693827983;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UXIjsfa_1693827983)
          by smtp.aliyun-inc.com;
          Mon, 04 Sep 2023 19:46:31 +0800
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
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	rdunlap@infradead.org,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	yijiangtao@awinic.com,
	liweilei@awinic.com,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
Subject: [PATCH V1 0/3] ASoC: codecs: Add aw87390 amplifier driver
Date: Mon,  4 Sep 2023 19:46:18 +0800
Message-ID: <20230904114621.4457-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W3CIXTRORG5RBZ3AO36IV35EMM4PR2ZV
X-Message-ID-Hash: W3CIXTRORG5RBZ3AO36IV35EMM4PR2ZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3CIXTRORG5RBZ3AO36IV35EMM4PR2ZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The awinic aw87390 is a new high efficiency, low noise,
constant large volume, 6th Smart K audio amplifier.

Add a DT schema for describing awinic aw87390 audio amplifiers.
They are controlled using I2C.

Weidong Wang (3):
  ASoC: dt-bindings: Add schema for "awinic,aw87390"
  ASoC: codecs: Add code for bin parsing compatible with aw87390
  ASoC: codecs: Add aw87390 amplifier driver

 .../bindings/sound/awinic,aw87390.yaml        |  43 ++
 sound/soc/codecs/Kconfig                      |  15 +-
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/aw87390.c                    | 463 ++++++++++++++++++
 sound/soc/codecs/aw87390.h                    |  85 ++++
 sound/soc/codecs/aw88395/aw88395_lib.c        |  23 +-
 sound/soc/codecs/aw88395/aw88395_reg.h        |   1 +
 7 files changed, 621 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
 create mode 100644 sound/soc/codecs/aw87390.c
 create mode 100644 sound/soc/codecs/aw87390.h


base-commit: 708283abf896dd4853e673cc8cba70acaf9bf4ea
-- 
2.41.0

