Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C273873FB2B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 13:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC25B1ED;
	Tue, 27 Jun 2023 13:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC25B1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687865639;
	bh=PQLUp+0KsfbzPm3LkTY8bnHE6ExRC3aZCA1nKorsMJM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NiOlTdYmgXV5tSKN00XDRxi3IqXXfVrkOpDR69IDG5bd1p3DkKP6g2QUuefDxv/Bf
	 r9qdrsZtzNsAfCraEX4zmxuouqIUHolVOmMc8pMXOS1BJaLBiBYae6c9J05KCB2rNe
	 kuU3KEjLculv/dkp8f6TO5u5bMvW3qH5U3EBzj2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB9FF8053B; Tue, 27 Jun 2023 13:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99527F80212;
	Tue, 27 Jun 2023 13:33:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DF4AF80246; Tue, 27 Jun 2023 13:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1AC9F80093
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 13:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1AC9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SVXDWSDm
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so6237895e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687865575; x=1690457575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=latEXESOogZnUPOdUSC1WbprrLaf0ZKBvwN2Fizyc0w=;
        b=SVXDWSDmBzVoIu4D2vclVwhFmmc6g4IsDJlpskbMT9qU4+qYosbHhFmFJydwkLbol+
         RykW0MvYUyQf4xD/X3hWvkAYKmUHqQ61pqu7IBpYvuImZB7j+/wdvVhi/nAJxqhKMo3y
         ZEw/DEhiGCQJTsfjR6O+7kLo+2A5us3qkp4OKDLpzeZcgALr0gJcCvaUrGFhjE6xL5b7
         alHUUHavuGQRs0HgelnEkBUZQFFekVrkG0Hpa+rUTp3UOoQbYTZ2iZMexMRA3a1hlo2D
         CXeGXUoUXHuN9Gug694Ev0pMoLj3/T0XTlYie3CGC+pw7Sj10FjBb9xXBaimwkgy6Txv
         5r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687865575; x=1690457575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=latEXESOogZnUPOdUSC1WbprrLaf0ZKBvwN2Fizyc0w=;
        b=bYmNElYCucOti35Vh6ITmjte6RpYqrJNEk02PbobPZJOeSRYRPzkK4bLFVDEQKmM2T
         CBBdmBcuJEMKV7YPJ4X2FiDAZjwBfAH0s99fw0gxN7X39nuyxX0ifh1JTiDBZN7NCKya
         ARLGED4ZE+7mRNeSD3LQdNEfCWtLomrHEKNkYqer9O+gs/jZBjKcuoOv//xeoa1Qubrt
         r21KcIOwYSffdyV0Tca/ISuUlS2Im3E/TWyVodx6d+DbayutQlHlgxzi/FYInxi/+Vzq
         n9WXupvcHspvImffvPB6iYb7ZBVs6m8py4f9jxav7Z7CFCiIb9vYchHckP4VQU4InY5Z
         KDSQ==
X-Gm-Message-State: AC+VfDwX1XTxyEZ0J1fdxOX3ES8K4xA0xVAZcUjZLkf3TGSo+RhMv0Xh
	zmfU83qy0K2ZxRgs563ujqg=
X-Google-Smtp-Source: 
 ACHHUZ4+fT4OuXpoIilYTnkrqDKpDJyrPtrc9BdzgajLJRgmaHKRTRVwrIPAKVjVZJaxUcf9rhkRxQ==
X-Received: by 2002:a19:6d0c:0:b0:4f8:4245:ed57 with SMTP id
 i12-20020a196d0c000000b004f84245ed57mr19871536lfc.35.1687865575347;
        Tue, 27 Jun 2023 04:32:55 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 f10-20020a7bcd0a000000b003fa99969e61sm4868605wmj.45.2023.06.27.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 04:32:54 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: oxfw: make read-only const array models static
Date: Tue, 27 Jun 2023 12:32:53 +0100
Message-Id: <20230627113253.700065-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IYOOFGUIGIJWPG6PGBA4IQHWSKD6NW66
X-Message-ID-Hash: IYOOFGUIGIJWPG6PGBA4IQHWSKD6NW66
X-MailFrom: colin.i.king@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYOOFGUIGIJWPG6PGBA4IQHWSKD6NW66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Don't populate the const array on the stack, instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/firewire/oxfw/oxfw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 9523479fa94a..63d40f1a914f 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -44,7 +44,7 @@ struct compat_info {
 
 static bool detect_loud_models(struct fw_unit *unit)
 {
-	const char *const models[] = {
+	static const char *const models[] = {
 		"Onyxi",
 		"Onyx-i",
 		"Onyx 1640i",
-- 
2.39.2

