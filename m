Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E66B474D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 15:49:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65A418CE;
	Fri, 10 Mar 2023 15:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65A418CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678459793;
	bh=LTdad0RY8y+8pitx4KgKGeq/0spsTbZ/wCaq/xPq1YI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WIGIOcCbL5F0FzmoXpPggiYn0NiV0YWjtruhb+D70YQbmnfp7ZxyDvY31JEHRUkzB
	 xDZC7pARV/BawnmGcx+g51i3h+bn7Hq8O0m2HdH50vLVzctF4C3VPsTp4ZP7rSREOY
	 yoKV5Q5w5EiaRbbYqozPaME7xOjYuIk8eLnaZrW0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F05F80534;
	Fri, 10 Mar 2023 15:48:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02A8BF8053B; Fri, 10 Mar 2023 15:48:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 871E1F80533
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 871E1F80533
Received: by mail-ot1-f44.google.com with SMTP id
 r23-20020a05683001d700b00690eb18529fso3054621ota.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 06:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMPAIKuNlYfwl+YKIIWa1ctChtks/5gg2kAnqibcaTE=;
        b=AkIAEYLJUg/bzaVaC11By8YFIkR4BvEr1q59T4QQHK5T2Pg+CHlguvEfDHj84ZieBj
         eoyFT9YBQixtgJfRNxON+bnD/IsUPYWZic8LnBqbTuJlzBHjRH0eNXz8MlMoukh5t8vz
         1zoaJFBN3D+Z4v2tB+W6zznv/9wxrTXF2/MfEMkUJ4IlSEG6E8KAe7kGdlWHY0iQZhW9
         fAo3S3DeyDSt6ZHASiMnV2UCpN9ijS9cedNX8ECworBvoT6KG4+ZNl4pDQIzYE+0y7BR
         qlGMPAdM0EdtRsUCUIwSp6vyWHruy7R5Jr23PL06disOJ1jdZxf5vcgj+z2DUNTvzKYZ
         mp4g==
X-Gm-Message-State: AO0yUKUkyHVtzTexEakGM8pzcrNIlJkYVATpzg9AHS15mvT2ZyA/EmuP
	rH9GvZZ/ofS3IBW0GQyOPg==
X-Google-Smtp-Source: 
 AK7set8OnAxQN6y3ccR26yajoFEGuzwZcaUQ5w2owL8ZDy3o89b64aD5KMomn/MPxmUbe/vy4DRJXA==
X-Received: by 2002:a05:6830:574:b0:684:b6d7:c804 with SMTP id
 f20-20020a056830057400b00684b6d7c804mr12890493otc.18.1678459701729;
        Fri, 10 Mar 2023 06:48:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a056830131000b0068bc8968753sm128553otq.17.2023.03.10.06.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:21 -0800 (PST)
Received: (nullmailer pid 1546544 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:33 -0000
From: Rob Herring <robh@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: ppc/tumbler: Use of_property_present() for testing DT
 property presence
Date: Fri, 10 Mar 2023 08:47:33 -0600
Message-Id: <20230310144733.1546500-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DV3DRJJV22K4T67GLXUIQN2WXEUI2R5C
X-Message-ID-Hash: DV3DRJJV22K4T67GLXUIQN2WXEUI2R5C
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DV3DRJJV22K4T67GLXUIQN2WXEUI2R5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/ppc/tumbler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index f3f8ad7c3df8..6c882873b344 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1363,7 +1363,7 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 		if (of_node_name_eq(np, "sound")) {
 			if (of_get_property(np, "has-anded-reset", NULL))
 				mix->anded_reset = 1;
-			if (of_get_property(np, "layout-id", NULL))
+			if (of_property_present(np, "layout-id"))
 				mix->reset_on_sleep = 0;
 			of_node_put(np);
 			break;
-- 
2.39.2

