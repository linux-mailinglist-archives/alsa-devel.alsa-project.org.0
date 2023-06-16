Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40630738281
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8849183A;
	Wed, 21 Jun 2023 13:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8849183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687348832;
	bh=WT31DrhMLZRolYJv3Z7WSrgJPo6a1tXjsjsjHSnIHCM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gfv1zO9QykTbk1vUcutt5kkRYtvLY+eMaUXBX86eSpP4gGKwOjZShORL0a0gLIEGO
	 WiclM4ycyxiAdLuvXMW88iQrDJKyO8gbD33W9H7dHtMlL2ADTojtg7lDAKyXsMyC/n
	 DoS8hvTh5nWDshaa1XKTcGB/LBWVpmMhqLwHG3gM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3F56F80548; Wed, 21 Jun 2023 13:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1656DF80548;
	Wed, 21 Jun 2023 13:58:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC214F80130; Fri, 16 Jun 2023 13:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76ADFF80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 13:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76ADFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=T6z4GHmj
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1C473F04C
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686916552;
	bh=uEciiZDYLaCZOmEM1cxPY7+VzbXKRsNbeBnxrBRt1fI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=T6z4GHmj8/2dsuggEbts25JKqMmbf7i2CPOM6kYZ+rKyDrM/+5d2Qt53vzAVWVTH2
	 XnclhhTJm9mib7bTH7EFFZ4YnDu5C3Ut67uyeO9cO92CNNDRgnWODMRoIJER3xo+Fm
	 WdEAILch0rErzdAo8vFwS7VX9JUiNJnaJf3jrbvYsirJcZGREdAbnHYiHNyOIGz6Vc
	 QNs8swl5xQ4wvqUyacL6ahtp6feEXx0NWJEUPx+ocd4AWoYy4FmI3t/bKnKYsStIIc
	 cLOxlF1G8zR/v9bXgI/CpUkYUy04+zUc4EZlX1jt+wT5IaROZsuGGDhvqdgTRInvgP
	 nc3Y+EQpdgsgw==
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3110d623e2bso247446f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Jun 2023 04:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686916552; x=1689508552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEciiZDYLaCZOmEM1cxPY7+VzbXKRsNbeBnxrBRt1fI=;
        b=lMdzhTtNoI7g8Id5QW2rgE+oqYv4XMYYf06KoRhDTY5Bhc7K49Mk3AMbg5qpKraS0h
         tqYg+33T2QGoHVOah/w/Bh5SsXMn1mE64AVILg5B109xBojcJJeWpIkwSgJv2HqQRU9T
         8Vq3MKAzZNHhQVPs4RPS5UvEpIhF6Yxd9mbBjenJotu18g3780gVpfTcNSAzCAAu1yXz
         F9mob4gcmSHbKRw6yklhlEBlf8rqmUUjWwJuCSCTkuGRikLZk/nexoPiomSzvGAaKDk1
         mdN+q0JcGam01Ob8Zv72wpzc4IX7BiwhvWkajakhygiRIpExs6cp/KzQZDowqbcLEWB0
         my8w==
X-Gm-Message-State: AC+VfDx7gKV17ESNqL3h7fe/kiKNi+ZOCUMYPvHjmlbkwwPFQFKOnK5+
	dmXdrWmW21jIP9UGKxiHL80X4RIgrSd3hdI7JaExGDdlLXZMkJr9PYOBFN/59JbXrQk+OJBnizW
	K8ltKYXHdmVx0x9L9ODI/OFncy+30qDv70d3nX1jS
X-Received: by 2002:a5d:5684:0:b0:311:1bd3:6c7b with SMTP id
 f4-20020a5d5684000000b003111bd36c7bmr1096690wrv.32.1686916552712;
        Fri, 16 Jun 2023 04:55:52 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ5h4jzXqaMa6s7e/pNspXURO7AdL2UkpBAzpZd13x4UDJcUHCyPAzddYxyJdkh8rhByn3QcXg==
X-Received: by 2002:a5d:5684:0:b0:311:1bd3:6c7b with SMTP id
 f4-20020a5d5684000000b003111bd36c7bmr1096676wrv.32.1686916552430;
        Fri, 16 Jun 2023 04:55:52 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a5d404f000000b0030fcf3d75c4sm9516016wrp.45.2023.06.16.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:55:51 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH] ASoC: rt5677: Add MODULE_FIRMWARE macro
Date: Fri, 16 Jun 2023 13:55:49 +0200
Message-Id: <20230616115549.1011903-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: juerg.haefliger@canonical.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4RLDWXVC3GSNKSBVQUORPJAM4RGZGTNQ
X-Message-ID-Hash: 4RLDWXVC3GSNKSBVQUORPJAM4RGZGTNQ
X-Mailman-Approved-At: Wed, 21 Jun 2023 11:58:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RLDWXVC3GSNKSBVQUORPJAM4RGZGTNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The module loads firmware so add a MODULE_FIRMWARE macro to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 sound/soc/codecs/rt5677.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3bf019b3f700..c8fb98e3406f 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5712,3 +5712,5 @@ module_i2c_driver(rt5677_i2c_driver);
 MODULE_DESCRIPTION("ASoC RT5677 driver");
 MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
 MODULE_LICENSE("GPL v2");
+
+MODULE_FIRMWARE("rt5677_elf_vad");
-- 
2.37.2

