Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB66DEB09
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 07:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D04EBE;
	Wed, 12 Apr 2023 07:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D04EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681277072;
	bh=77gmlvtFa9aiZ+o19jFOLL2O9xpTsxBk4JLB2DozhgY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t0l6JyuPt8HcomOMBbqiLaHe/umhUhYQi5+nN523zWA0k+pWTyABZY5zBQUPvdess
	 49x/RQyhbmvsEqEnc0pj44602DAImQEd6VSYkoDLngIhk0+J4/Csf7nyEo2L1g7PoT
	 taC9XFTRvYL1SiUaXYG0xE02ejz9gmt7RIJuSYZ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6EFF8025E;
	Wed, 12 Apr 2023 07:23:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E9BF8032B; Mon, 10 Apr 2023 17:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DE2EF80100
	for <alsa-devel@alsa-project.org>; Mon, 10 Apr 2023 17:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE2EF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RvfvpaR8
Received: by mail-ej1-x629.google.com with SMTP id j17so3778992ejs.5
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681141827;
        h=content-transfer-encoding:commit:signed-off-by:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLYER13K+NrI6zCmIwDtQmW2Dz0up0GnJYK0qZbJDm4=;
        b=RvfvpaR8UJE/2K5y4uouPge/ZZnR6QmPwIP2g7jrsugShEiOOhPuqdOU78fTEN2GhC
         I9UB3ilxKMbWdFnCylvt1HFIa0FmaFUG7ByP7C0TwLWnWDhPx/5JHIV+o8BndHt6dCOZ
         jtM16XzzE/4GeoGnFvCc7aAhl/Qp1IfMgY8sNzLyyiga792JC2lSoR/i9vV6fquKtJ/8
         dB1MNFfHqTMP/fFhXokNgyBalGA1Y1vAjOji193CjFbWrv0lw8/8ax1mRq5O7jpQSWhj
         sD0rMUXl7NVBR8E9RztTQVhX2JlArWHRF3j40U00dpELq4qOGEpoDyEXHjECXDp8ddN5
         MGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681141827;
        h=content-transfer-encoding:commit:signed-off-by:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLYER13K+NrI6zCmIwDtQmW2Dz0up0GnJYK0qZbJDm4=;
        b=nJhKM1xHzVMp851+n1jFsqHzXsvmg4bgxISakVLRCa6KCLBIB1q2+G3UuvQmT33RXT
         o73HlW06CpWgdp/YO7OsLCqY0/e2CA7HhpVI2PevMx58pn+nzMjrnSD48etFF0RjphgO
         3Nhed47aHFAhAxcwycH285q2WXa7Pymx5TC9eYLf4iQMB7ZY2NBFNnR8uM10XjgtKaIv
         dnU0u7IQzUfchxleeyJiLP7B4AYeXZY//sztcUUg8HN71nCq0/+gioMvKWBx71rFzQ2Y
         /I+qnnv8P+/Ab1544bB8IIJkNhCNg6IuP/S6HUcuUTeGNx+MFyuOPBOzrHwVAT9aGi6Q
         IHNQ==
X-Gm-Message-State: AAQBX9edrUJIZEKChMKsWdqRV1Yi+ttxPkyhQ1sRKoYHwILqLH8wEZSS
	v6Va9UDEWBMW0bkl/rwcJF4=
X-Google-Smtp-Source: 
 AKy350ah7wbvYwPmQzATzu4hxFlZa1kWlhyJJjYoEB7zGFAeyxIFE2NxSBlN6dagvKRVznnURUhHJw==
X-Received: by 2002:a17:906:b118:b0:935:20d8:c3c with SMTP id
 u24-20020a170906b11800b0093520d80c3cmr8412872ejy.61.1681141826814;
        Mon, 10 Apr 2023 08:50:26 -0700 (PDT)
Received: from localhost.localdomain ([79.142.69.160])
        by smtp.gmail.com with ESMTPSA id
 tg12-20020a1709078dcc00b0094a473988b9sm2387908ejc.27.2023.04.10.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 08:50:26 -0700 (PDT)
From: Cem Kaya <cemkaya.boun@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] Add Dell G15 5525 Ryzen Edition to quirks list for acp6x so
 that internal DMIC works.
Date: Mon, 10 Apr 2023 17:49:28 +0200
Message-Id: <20230410154928.171975-1-cemkaya.boun@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Signed-off-by: Cem Kaya <cemkaya.boun@gmail.com>
Commit: Add Dell G15 5525 Ryzen Edition to quirks list for acp6x so that
 internal DMIC works.
Content-Transfer-Encoding: 8bit
X-MailFrom: cemkaya.boun@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4I3IFDIT5KDSQNPE2HQAHRVBUMAIBUMS
X-Message-ID-Hash: 4I3IFDIT5KDSQNPE2HQAHRVBUMAIBUMS
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:22:26 +0000
CC: mario.limonciello@amd.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Cem Kaya <cemkaya.boun@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4I3IFDIT5KDSQNPE2HQAHRVBUMAIBUMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a428e17f0325..e044d811496e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5525"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.40.0

