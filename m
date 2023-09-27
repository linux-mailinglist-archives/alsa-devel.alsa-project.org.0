Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585677B3F10
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2CC6F99;
	Sat, 30 Sep 2023 10:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2CC6F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061557;
	bh=XcKcx1P3dkEvRJFLj6Dk/MrHQejwFEeYURAcp+nsFow=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=seNcEyKytkTzdhFQTY0itWwnVVAjPWXz+a5lw7yaU+qkrADpG+kOJQxSkYmA6xF39
	 ODN/X36rdSoKWSER9QahKlQOgUlKc5+q5+wPy0/x+g2LlrlD79HCzeYLQQviLsvEmy
	 WH85qmRYI5pmSw/VAjrY0f1AXybgO5CL+nLt5yFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FF32F805A1; Sat, 30 Sep 2023 10:09:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A038BF8055A;
	Sat, 30 Sep 2023 10:09:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6562EF8016A; Wed, 27 Sep 2023 21:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD122F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 21:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD122F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Mm5bzzlB
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3215f19a13aso11710775f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 12:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695843319; x=1696448119;
 darn=alsa-project.org;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/kwHgGSPER833mfnZsloSnG2/QVneER5ld9wWGGfCM=;
        b=Mm5bzzlBtVxy3y5cdJhgMJ4m0eryTsxIV6y6q1Qq65BGoQtVl4DY2QVYlgt7Z9GJMX
         Y3KXI/7mALF8KJfZcS3Hls8ynpM4HvHFiZLmOkMz1IXbvk5i6uKIAjIAXSTSfZM5MvRt
         uTCZ5I6g9DNeAY8FkfuSlhG4G3oZlX8jCap0V6z5w73gsoXmpMiHuguERiNvScBfaa7w
         rpB8A/qJPTJxA/U0ZORxAfPE7kdvt971hWPm/ws0gvj0KdY2KGnsIo2tboblFuazqcKN
         kQQbnhA/iXpuzRJqtj/bJuDrFWSekgDWT+IYNHSoc+iap18fTTzjz5nD0voGEn0hhKVx
         J3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695843319; x=1696448119;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/kwHgGSPER833mfnZsloSnG2/QVneER5ld9wWGGfCM=;
        b=LoxHGHExJJNkd5i0RdHOfHm1meVuS4L9R7pwd8ggYbW0NmsW+wTqYv3oMg5bRhr7Ma
         p5kTSNBBx9p21r9ooirBVqCL+YJS1VllIejabXaBtuoUmqc1LduM2bgNbo/7MeIKUuO/
         /9VDQVDZnlhhNN/ZvL65253SadAlLMxOjanwDJRSxERP8IzVKj/ak32WtOMnAPJb5b0i
         yfy+y6xQBHXfNm9+lN/FcjyzPcjdezIzuGhk1h4Zl843fdOhkrN2VL3+CpGQycMoHBW5
         cLkdzr6xn4CQdlCApNxqf9lJpbDl9Qn3XFACAI3x26LLifBT68gLebtPq5/CmXqudPkM
         n1jw==
X-Gm-Message-State: AOJu0YznXfKa/u21hwyODBXk7ZalazqpFrIDkQKHiv7MgMKyeGZb7z6Y
	W7Hj3JoO+wX5oKVASBBTyX0=
X-Google-Smtp-Source: 
 AGHT+IHl9dYpXN9XqXHiG6al2NGt7W95zzeD9nIMVhn3PlsdI/RctpeCZKJ/BoF5mQLG7aW3oIiarw==
X-Received: by 2002:a05:6000:1112:b0:321:6a61:e45a with SMTP id
 z18-20020a056000111200b003216a61e45amr3040357wrw.15.1695843319317;
        Wed, 27 Sep 2023 12:35:19 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 m4-20020adff384000000b00321673de0d7sm2379099wro.25.2023.09.27.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 12:35:18 -0700 (PDT)
Date: Wed, 27 Sep 2023 21:35:12 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: broonie@kernel.org
Cc: git@augustwikerfors.se, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev
Message-Id: <O2TN1S.57QJOL6TXOBC1@gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AXZ4F4664ZU6NGZJO7SIGVIT65NEN4FS
X-Message-ID-Hash: AXZ4F4664ZU6NGZJO7SIGVIT65NEN4FS
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:09:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXZ4F4664ZU6NGZJO7SIGVIT65NEN4FS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
requires an entry in the quirk list to enable the internal microphone.
The latter two received similar fixes in commit 1263cc0f414d.

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 
82SJ")
Cc: stable@vger.kernel.org
Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
---
v1->v2 changes:
* add Fixes and Cc tags to commit message
* remove redundant LKML link from commit message
* fix mangled diff

sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c 
b/sound/soc/amd/yc/acp6x-mach.c
index 3d8a51351e29..e3d2b9d01552 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -241,6 +241,13 @@ static const struct dmi_system_id 
yc_acp_quirk_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 	}
 	},
+	{
+	.driver_data = &acp6x_card,
+	.matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+	}
+	},
 	{
 	.driver_data = &acp6x_card,
 	.matches = {
--
2.42.0



