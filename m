Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7E71A408
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4618E73;
	Thu,  1 Jun 2023 18:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4618E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635738;
	bh=P+9hI9xdrea80rabX7D1ujMrgUvukLbSTS6tFpqvvjU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aZcOmMinh0JCMz0HK+X45X43L5OiSAHqBhOfhYzccsrd1mQHD6j1gOjK3q5sx+JmI
	 q47GFMaKn6O8pfZKzHYNTPrmc1AimeFflXwcU+7AuZeZi0Bf36N74Gau9uDmQQA0TH
	 NmncFc+Nxut7RiZr+bWR+503YubJpOFqZO/fFiHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E90CAF80671; Thu,  1 Jun 2023 18:03:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA2FF8065E;
	Thu,  1 Jun 2023 18:03:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89A46F8042F; Wed, 31 May 2023 11:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FB26F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 11:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB26F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Uw4hPKMx
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6af6df7f93aso4084486a34.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685524026; x=1688116026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6dEyi6AGYaP28foBidULwGN56hxXAodGv+YU14GBEY=;
        b=Uw4hPKMxgez7mchEcYKo2y8YNzmXe8VJrzDMRFmvOcvtS6wh0PgWgayIJVwxET1vlk
         7ULG5OXofFnYxHNWiaQJV49vwveRMHMf9bj0NcVR0fgQyAHhZEX/u3zZlQqjSTi1IUz0
         QEu6Ig7uAEqBqqzuEUSbsK1JhX1DuYL1Uh1OOroB2VTPP64BwMtt+WpOX1hduzhNY3El
         iywApcDy8g1tUf+RXWKh35a1oNIp1c3HTsYywr5MbC6z1xnqqiU3LqC6WBfGgM/z1bze
         NnQG9NZ6/7XNCdbk2hdRMlFITQI05hUBCHRZu8fiB6dE+NxfMKKJmBwS6+IfB/Wdv8Fg
         vIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524026; x=1688116026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6dEyi6AGYaP28foBidULwGN56hxXAodGv+YU14GBEY=;
        b=YRCMl3MQcdwrErYg9zDcCIVQz6H78QrOS0A0moSlwUOXwM0tO+xFDQlLBp7YwJGDyB
         JDd9V/bh3iSP1xWfaAX0QR2Nt0zfKS+Q+mTwN5wV8SLdMnRTFkXjwIv4m3/HwCtVbEcR
         P6ZAdKY3T42x5LGSgLkQNMPNslQYoNegN3LLHZNBlQgZYv6eXiFa8uIkrJVXt1dTe1oi
         82wpk3mMnznY+3mgFHt8QqiYl5UkReizQDLOvKPNno8bWS6U33V9UR1upPutXb4wgrqF
         ZjGjxJvwC3MJbRZkUfPEFyFIpW6v7EyGhRw9wtqs1uPEF2QmSalrdSeGbiHb8PaYlBNT
         rZOQ==
X-Gm-Message-State: AC+VfDx7YVGpwGIaIFL36RZ0ebdT2XzNj17kigOZUOYrVpLERxP0p0WA
	n99UjnDNzoyX/2gCHHCMNvo=
X-Google-Smtp-Source: 
 ACHHUZ50Ep+NjfhDZ1k3WX0bHLfzzHFO4lgKhgkjrkRCIYpFGYnhJOuLPi1i7e5c6mzo5U7tQ5ty1Q==
X-Received: by 2002:a05:6358:5290:b0:123:2b2e:529d with SMTP id
 g16-20020a056358529000b001232b2e529dmr1948123rwa.6.1685524026360;
        Wed, 31 May 2023 02:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2406:e003:15d1:ec00::6e2])
        by smtp.gmail.com with ESMTPSA id
 23-20020aa79157000000b0064fff9f540csm2104824pfi.164.2023.05.31.02.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:07:05 -0700 (PDT)
From: Sicong Jiang <kevin.jiangsc@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: kevin.jiangsc@gmail.com
Subject: [PATCH] ASoC: amd: yc: Add Thinkpad Neo14 to quirks list for acp6x
Date: Wed, 31 May 2023 21:06:35 +1200
Message-Id: <20230531090635.89565-1-kevin.jiangsc@gmail.com>
X-Mailer: git-send-email 2.38.0.83.gd420dda057
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kevin.jiangsc@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LHILG75SG4ES5FI5UTQ4GJOLMU2EO5PE
X-Message-ID-Hash: LHILG75SG4ES5FI5UTQ4GJOLMU2EO5PE
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHILG75SG4ES5FI5UTQ4GJOLMU2EO5PE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thinkpad Neo14 Ryzen Edition uses Ryzen 6800H processor, and adding to
quirks list for acp6x will enable internal mic.

Signed-off-by: Sicong Jiang <kevin.jiangsc@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4406a5def..246299a17 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21CL"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21EF"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.38.0.83.gd420dda057

