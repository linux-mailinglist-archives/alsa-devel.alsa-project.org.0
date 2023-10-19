Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE957CFF97
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 18:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0798829;
	Thu, 19 Oct 2023 18:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0798829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697732999;
	bh=geXNpVRgk3I20R80hxfUGqxn435aRrCWq3UP1y1Q65Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pIsvORSdQsPySOADtfeT8fT9UHqy9SHKkZUY1Hml9vD0YsVHoMaZCNXHn4rpdDP5K
	 oigzPVKfBbKRr9Nf4bzheZ8wasxF9Z4qqSRTRO1fxCzyyZO9JYWYnHYAyls8AjLMZf
	 50sM3kmtFiEwvmcUY/IHJrcBioNcw5LbhVGEg4SM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEA24F8019B; Thu, 19 Oct 2023 18:28:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F0EF80166;
	Thu, 19 Oct 2023 18:28:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51981F8055B; Thu, 19 Oct 2023 16:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84A9FF8024E
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A9FF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iBB01nwq
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a696f358bbso5698739f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697725372; x=1698330172;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+TngcIMRgF81R1bqa99WS9iwPqGLiZkgYXXdVzQ87k=;
        b=iBB01nwqSY7jf0QZQNU2w3GJfMd28kz78lJ04UhM3ZiBARPtWKGRpRqbXzlHXgmc+v
         1vAZP39Fxb/DsKNZyn4+rRyWBHOfpLAB3rlmMIh04O9NCChlIsOgsjr1CNBsGEEUxVWL
         DwZDiTVVgyefduNghKHR8QWoNrpu9YUkc3RYbN5l5eUqWdoHtXfqIT8ZC590sOQfrcMb
         t/L841XzAQ9i4wlaNHVt7eriR5/JxUz+OOhaItPpxc0tRcs2MNoAaLkM+TlbZ5fBNZCi
         NqhsXQAAQyust379cqcoiPLcReAOFiqoW+eJ4ZoFgJp18Cp8u6FDRWZzlBBJxZQMt95O
         UFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697725372; x=1698330172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+TngcIMRgF81R1bqa99WS9iwPqGLiZkgYXXdVzQ87k=;
        b=dO7LDNGsc1KYi+V1vC7RgQHVNx6bDMyQwQ4fM6etkGRQrYlYRKkPNgwa32MM4ex7Pv
         H+mCKfdnA/oHLuskcYhTUMcnvaDqICueMEyIlo9jeHWcerNX9du19rADe8PiRtyJOyXZ
         gqFcgoMTNeuJHNrxlxfqTw4vNkOxvCwRfZlKlB7KigJlRNoxaF/1TPiMw4Fse7ZGWGl/
         1Dwz/74Ux9WjnfoxElkRnyW5KoK2sZYXAnflYotNdfrZhrcZAcEVbFx9O1xazzQxUfmb
         OHJu6aW3auTlJy4zCCk3/nPkC9d3oF50NxlO7GxiosTJoqXuNN2yUIDabwjK/qdT5nIn
         N7/Q==
X-Gm-Message-State: AOJu0YwuB3Mgqo6Xq7hV1C23XnSwtvLnLWKwIOH7FE2mEeCjb5YOQI/1
	6HLmk3Vsni5da4CWra7lpmfVV5wJhiwkyQ==
X-Google-Smtp-Source: 
 AGHT+IG3NG4nZYNrevzYgdr1zheHGx64Oivpj24qY3vRQK6KgJxQVf3oBWWWoQnE231UMXe93OIycg==
X-Received: by 2002:a05:6602:2e90:b0:79f:cdb4:9532 with SMTP id
 m16-20020a0566022e9000b0079fcdb49532mr2809938iow.18.1697725371598;
        Thu, 19 Oct 2023 07:22:51 -0700 (PDT)
Received: from haunter.home.lan (c-98-55-9-47.hsd1.co.comcast.net.
 [98.55.9.47])
        by smtp.gmail.com with ESMTPSA id
 l9-20020a0566022dc900b007a67b8e9e34sm965516iow.32.2023.10.19.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:22:51 -0700 (PDT)
From: Tim Crawford <crawfxrd@gmail.com>
To: alsa-devel@alsa-project.org
Cc: productdev@system76.com,
	Jeremy Soller <jeremy@system76.com>,
	Tim Crawford <tcrawford@system76.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
Date: Thu, 19 Oct 2023 08:22:25 -0600
Message-ID: <20231019142225.13660-1-crawfxrd@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: crawfxrd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ROWXPSBZADSYQ4EZYR3JLYLKQN5YOJQT
X-Message-ID-Hash: ROWXPSBZADSYQ4EZYR3JLYLKQN5YOJQT
X-Mailman-Approved-At: Thu, 19 Oct 2023 16:28:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROWXPSBZADSYQ4EZYR3JLYLKQN5YOJQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jeremy Soller <jeremy@system76.com>

Add pang13 quirk to enable the internal microphone.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3ec15b46fa35..fd5b7d6c6eec 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -353,6 +353,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "pang12"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "pang13"),
+		}
+	},
 	{}
 };
 
-- 
2.41.0

