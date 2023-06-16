Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505C73827E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3422E820;
	Wed, 21 Jun 2023 13:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3422E820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687348782;
	bh=tDqlr5n3qYZbXs2CvbVXaXWRIm3kKRNv/4pr3a5R0wI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vpuvzTiTvL+2cu5CyrhwMP7GNx3JfxcFLjmITpjB5UUbB2XKwQSbjWpPuLQBiOChN
	 c+0Enzc6+24BFfPjDECFBSZFHWdaWvQ/iFHkXyn4JobuBo1hRLgvnHtHehFlP5M7Ye
	 GkH5C3Md0fzGlF8fjJ5naIQnAEYkoNcwIFo5sz9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD527F80535; Wed, 21 Jun 2023 13:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0FF1F80132;
	Wed, 21 Jun 2023 13:58:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8CD8F80155; Fri, 16 Jun 2023 13:54:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A8B7F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 13:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A8B7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=BVDNin/S
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C3823F16F
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686916476;
	bh=sLVGap7x4sxeAYbFdajItjxU/GxjLbYhz9H3rvqQDXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=BVDNin/SboI4iG4E2Al6EKaetM9dktrbf3KtO+uHKQJzff8ACRMr6wEIaMN0xlY95
	 m7OGCEI/tXC8PpDgY3+Qh/jZZ2Xf2+gN8RPtd6BZ9v5H85H+n02j6dOdFX0QhSpo58
	 3RO66xawvUqmwka/HTkvRTBrZWCUnRVCXWnugUoPgRykYyJ5Pd2zohx/I1VYCCGuYv
	 qtpMnpoyShBG+5IDnOM1LGq57JmrljcArZW2l9bibfaAIJ/EZ5zaahAfOr6K58MKmf
	 Du7ZLln9E32yYHNPGsw1YDikieBhrvKePcdzaFK7stC04KJrnTKK+YyebSGGxCKc2b
	 pMgsvokK4J6xw==
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f739a73ba4so2368955e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Jun 2023 04:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686916475; x=1689508475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLVGap7x4sxeAYbFdajItjxU/GxjLbYhz9H3rvqQDXU=;
        b=XIl4oybImy781towF6hyH37k/hUStjMcT8rMU4leE5LghgC79AHzQJzb5pQp4EpT+I
         L0gW9EwioZAltIQOobY6MyQNrJZf49PDAuaBuig9hAs0IUrtHz/NHnjljWpfsCkJEMss
         hRFAeGjRql2FzbR5N5h0T83G0Aj3wrGyFL/sStG9a6O/USIcdBz+lnzAgQj7A6+JbFjy
         V48hPjF5P7UAywScHXkrrLnSNYS+LBTnPCi6+VBfe05kzCzVuIOF4a1cohktF8Dct/0s
         PUTN6UgGvXj7doutIgccMyhP/0MgDUBh4M9EfcXED7cxlwGLBhNO2ykpkeeav/9oZmNC
         2YMw==
X-Gm-Message-State: AC+VfDzEzzs6QyMj83EHUNcDbBON8x/nnhXowVJOyzJ4t6HvCuIim9aN
	LXu9aXnWGYyrEyPfacpGakE7NxKX2Mz/mEsgx133aKGLYMSyOiewQxFqj5/Mk4fZfFaam3oUgMt
	yCQWew6DcoZKNbdLyM3k2lL708M4Y1W1hp/3Uwc8r
X-Received: by 2002:a05:600c:2295:b0:3f7:5e3:c1f2 with SMTP id
 21-20020a05600c229500b003f705e3c1f2mr1576278wmf.8.1686916475806;
        Fri, 16 Jun 2023 04:54:35 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ5ZJx3D+sk0J+4p9n8paf68JVv1pnslll6eY87FpntkLaIvEy9qj3//FdXtnHrmhRSCzmTJEw==
X-Received: by 2002:a05:600c:2295:b0:3f7:5e3:c1f2 with SMTP id
 21-20020a05600c229500b003f705e3c1f2mr1576268wmf.8.1686916475530;
        Fri, 16 Jun 2023 04:54:35 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id
 l20-20020a7bc354000000b003f4248dcfcbsm2005155wmj.30.2023.06.16.04.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:54:35 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com,
	juerg.haefliger@canonical.com
Subject: [PATCH] ASoC: codecs: wm0010: Add MODULE_FIRMWARE macros
Date: Fri, 16 Jun 2023 13:54:32 +0200
Message-Id: <20230616115432.1011707-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: juerg.haefliger@canonical.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2JQWA4PN67D2EIWOI2O5QNLYKJSUSEPA
X-Message-ID-Hash: 2JQWA4PN67D2EIWOI2O5QNLYKJSUSEPA
X-Mailman-Approved-At: Wed, 21 Jun 2023 11:58:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JQWA4PN67D2EIWOI2O5QNLYKJSUSEPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The module loads firmware so add MODULE_FIRMWARE macros to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 sound/soc/codecs/wm0010.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 034a4e858c7e..1d4259433f47 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -994,3 +994,6 @@ module_spi_driver(wm0010_spi_driver);
 MODULE_DESCRIPTION("ASoC WM0010 driver");
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_LICENSE("GPL");
+
+MODULE_FIRMWARE("wm0010.dfw");
+MODULE_FIRMWARE("wm0010_stage2.bin");
-- 
2.37.2

