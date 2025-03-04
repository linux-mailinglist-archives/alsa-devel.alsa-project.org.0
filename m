Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C415AA4FA60
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:40:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60628603A0;
	Wed,  5 Mar 2025 10:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60628603A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167614;
	bh=2Wdf/nXJmhdP5txUmExG42pFrA+HefZUHyWrocj+shM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RcQrf5xC4VWxDUtbcv/JNgLfLb/5ZG4ouWTfrbVcji8d9MWXziYhUoplBCTUnoLuY
	 Ymjc43ZtH0BJemsy1l1EfiGSHbTRp58PwH9XwIn1U6oKJ80HtvmqeFmkFaVfu9HEK1
	 EjSs69DnGvU6HaZcQeiKCy7J2/FgkHb9VtyknUOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFEDAF80804; Wed,  5 Mar 2025 10:37:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A31C8F807FC;
	Wed,  5 Mar 2025 10:37:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A8CEF8049C; Tue,  4 Mar 2025 02:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-86.sina.com.cn (smtp134-86.sina.com.cn
 [180.149.134.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3709F8051F
	for <alsa-devel@alsa-project.org>; Tue,  4 Mar 2025 02:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3709F8051F
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.30) with ESMTP
	id 67C65B3200001EC2; Tue, 4 Mar 2025 09:45:22 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0C7642DBC62D4C5F8681AC6426877103
X-SMAIL-UIID: 0C7642DBC62D4C5F8681AC6426877103-20250304-094522
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	robh@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 0/2] ASoC: codecs: add support for ES8389
Date: Tue,  4 Mar 2025 09:45:18 +0800
Message-Id: <20250304014520.83292-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TZIH7ENK7ABNNOZSP3EPDORA6CGSAXIV
X-Message-ID-Hash: TZIH7ENK7ABNNOZSP3EPDORA6CGSAXIV
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZIH7ENK7ABNNOZSP3EPDORA6CGSAXIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver is for codec ES8389 of everest-semi.

Zhang Yi (2):
  ASoC: codecs: add support for ES8389
  ASoC: dt-bindings: Add Everest ES8389 audio CODEC

 .../bindings/sound/everest,es8389.yaml        |  78 ++
 sound/soc/codecs/Kconfig                      |   6 +-
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es8389.c                     | 971 ++++++++++++++++++
 sound/soc/codecs/es8389.h                     | 139 +++
 5 files changed, 1195 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
 create mode 100644 sound/soc/codecs/es8389.c
 create mode 100644 sound/soc/codecs/es8389.h

-- 
2.17.1

