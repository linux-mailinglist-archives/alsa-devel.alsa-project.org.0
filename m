Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5979A498
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 09:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE89AEA;
	Mon, 11 Sep 2023 09:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE89AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694417629;
	bh=jhcX76MBalOVmQpwyyhOBpkobejbf9VarSjAB7UTrQc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aPVCHoTtt/NsPykIA7/VOEuWxmJ/bMg6HQD9W2D6lTEWNdP+5+wirfJIIeYbXb5hN
	 RcH6ijoKdXot19RTFE5/RO9ZtkwSnbK0vV46UQXllTTIeY4OAL7YikZY3bvzjAQgj2
	 SGnG/is5WjUu96LpDoUSHPKwe84JbbCk5Y9gcSb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6170AF805B3; Mon, 11 Sep 2023 09:31:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2E8F80589;
	Mon, 11 Sep 2023 09:31:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97E78F80425; Sun, 10 Sep 2023 20:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF780F80212
	for <alsa-devel@alsa-project.org>; Sun, 10 Sep 2023 20:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF780F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CDK2+1jy
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d804639f346so1462866276.1
        for <alsa-devel@alsa-project.org>;
 Sun, 10 Sep 2023 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694372119; x=1694976919;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwBCsDEe3pP4npvvDU6A0lOrTZauWrfElEBpix8kmtM=;
        b=CDK2+1jyK9zfrWApw+EzwT1mEAznb1P29xURWLLzzJeBsenVEka2Zj4vkRCXvltXV1
         oTQ3lsxDaqscmaQ2c43fbiNyILGgxb6L3qIXRRS0/1g3pNgK5mfxRaWlRUcC9LBmH8x7
         OeT2vcrM2rfX4zX4dgMZXHBxYccnGv6vpIG4buqQjtA52bZHUN+jno8abM4UI1p+tQJx
         ecNdUldnQI/kXFdeYMA+kPVSHGi2CYGtFtKVMebICRbTgxRKoLJe66yd68U28zZXXmxT
         8Gy0Gm31decmcfY5tGHMAlEFDDh+vKQXpS0YbkGK9USHHX4N5o2IZiyRTQ3YaGU0tNxl
         EEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694372119; x=1694976919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwBCsDEe3pP4npvvDU6A0lOrTZauWrfElEBpix8kmtM=;
        b=LoD8+ydhT8/JkAx9KcxR5Ho58nniK3SjyEbNXqldFJb7mUnvwx3bOlRFibg5MHqW2e
         6fLaJJ/uRY02Drpe6T8AP+dBql0i6FhQh0lMmBxVYKTy9W+GXVFU4D9mYt0on/5zEZjb
         2iJodhIccWn2voXEfV4fw3z7WSS7DZu+JkOz2J2U1P0M8bTHgLMzcbDzy5DO7SaczAFV
         csbiBK0W/gOFggX+ga+hetfjgTAFTb/0DtzoBTHz8AO5SuEuH57D97Igugn5ki4ce+cI
         jmOSZz1Ez9T3L1ZX+HicomXGTtk7/8juGQ+nGMcGDVCn6dtPDuSQ52TPY7t3cfYOULNO
         IrQg==
X-Gm-Message-State: AOJu0Yz+ijTEsZ4WGs10ABAe6oEX5weZGbP9FSGVPmeM7Qu5emM1pTKc
	nGRMun1r5tkiES2jOyusyII=
X-Google-Smtp-Source: 
 AGHT+IFoIoYyT2lrFaLL52INI6UmFegsLyf8DKT+U3w+wu8iJBDe+eGKN96x1MNlK/e4b1OdQ+espg==
X-Received: by 2002:a25:abc7:0:b0:d80:1344:3cd7 with SMTP id
 v65-20020a25abc7000000b00d8013443cd7mr7138200ybi.4.1694372119454;
        Sun, 10 Sep 2023 11:55:19 -0700 (PDT)
Received: from walt-ROG-Strix.. (99-176-3-182.lightspeed.brhmal.sbcglobal.net.
 [99.176.3.182])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a254109000000b00d74c9618c6fsm1345655yba.1.2023.09.10.11.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 11:55:19 -0700 (PDT)
From: Walt Holman <waltholman09@gmail.com>
To: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	lgirdwood@gmail.com
Cc: Walt Holman <waltholman09@gmail.com>
Subject: [PATCH] Add DMI ID for MSI Bravo 15 B7ED
Date: Sun, 10 Sep 2023 13:54:34 -0500
Message-Id: <20230910185433.13677-1-waltholman09@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: waltholman09@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XWLOXE4JUUD2URLRNFYXCD7TY3CJOVK6
X-Message-ID-Hash: XWLOXE4JUUD2URLRNFYXCD7TY3CJOVK6
X-Mailman-Approved-At: Mon, 11 Sep 2023 07:31:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWLOXE4JUUD2URLRNFYXCD7TY3CJOVK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Walt Holman <waltholman09@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3ec15b46fa35..59aa2e9d3a79 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -262,6 +262,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 B7ED"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

