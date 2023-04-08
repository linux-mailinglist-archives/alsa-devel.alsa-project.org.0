Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B66DC415
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Apr 2023 09:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5437CE72;
	Mon, 10 Apr 2023 09:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5437CE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681113534;
	bh=WqR38v7IF0XlMkieVTyGURAJpiwD1PrRwmuXss0hWvs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ThECzToSHkEcMMx5eiv04ewClLPxwFDtClCeSWDHZNfECivbJuaPIrNR49eQvc77B
	 p0da/u7iSueitNXxm2ttD5ifYWllGwmDv2YRJxfuX06EUD/t0vQsHs+e2DYxLi04xX
	 +MyKEcAcltjg+tZ+AkDGXl2dxWFrJiId4iWU45oc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC6FAF80548;
	Mon, 10 Apr 2023 09:56:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE77F8026A; Sat,  8 Apr 2023 16:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD6F5F8015B
	for <alsa-devel@alsa-project.org>; Sat,  8 Apr 2023 16:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD6F5F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XP+2g3SM
Received: by mail-ej1-x62f.google.com with SMTP id sh8so2844013ejc.10
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Apr 2023 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680963900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cF6yBKKnzsuUwLUEnUelWmFwMmajd8nhOsYDAx2H3A8=;
        b=XP+2g3SMYiL5tunI73D00LXN9YeKYnpn9r/gl7Ltaj5VCb9n2pSLFfmOKg6H7ArcOW
         0y14CSHtpL3C1oeWmfNzfZUsIBOmm2cw8MSeSctjmGOdp3Va0jqsqHjpokd4fAy0f97w
         29Ud+wvbKm3ciRYL/gZM0wX41ofbkBcAm0PuPAQfm1dr+xzkEteKIfOlnXqPKXMXNE8c
         asQx7etyq4Utm1BHeGBppxpprtdjzYDW+dDNoH/HVg12XwzPpirpA4ZlimtzMZhMN2A0
         OmvdjdyK1QYphTlCQOstY1aBFsWvX1qg5OuVyKzUvruGFhs2DEdvMSQEiPNUd+wCATXt
         8XRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680963900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cF6yBKKnzsuUwLUEnUelWmFwMmajd8nhOsYDAx2H3A8=;
        b=ec3CSRBzMEHMqLtZlKzX4cWWmXBzfIiS0zqfLUnmY4ZEt8OWh4kuUVj4CshQRTcJsw
         klKhbgEOgtwwYa416vS2Aq7UrUzUf0Olqc9jfMRMv3zM4ENgCmvqgiw23umKPb1qr64i
         6FO3jsUp+nBzeG8OJ//Tb6pOqQuwyhSQyluRVO08LRyiLJSscPCbI+HNnX3ywMA3pyyK
         IsRosqp1Xh5Viz4sIqpNqwwmqfkjtwJHj5Rs31OlcwcJQflcxBT9mYCwtXZBuqS2klG7
         yxACvkO2T5muBySluRTTRJFc4toXqeajhdDUVED/HyVDepoSSzeG8d2hyGCoikAdP3XQ
         pMLw==
X-Gm-Message-State: AAQBX9f34IzQ0OUyfUl9CpCujlsx+5ZtyH86MlOVxGFMTFe7aBoUPC67
	nE+VYswl3L95VM6swlPrstuj06TCDmclpA==
X-Google-Smtp-Source: 
 AKy350ZWCf1K3Kibr38X2wtjfTu6SxVtLxFqo9qQIGJgUwShZA42ZRSo3aKfXBR6cxDyXksECjeKsA==
X-Received: by 2002:a17:906:4d13:b0:94a:56b3:ee66 with SMTP id
 r19-20020a1709064d1300b0094a56b3ee66mr364740eju.31.1680963899869;
        Sat, 08 Apr 2023 07:24:59 -0700 (PDT)
Received: from localhost.localdomain (ip5886395f.dynamic.kabel-deutschland.de.
 [88.134.57.95])
        by smtp.gmail.com with ESMTPSA id
 c22-20020a50d656000000b004be11e97ca2sm2926522edj.90.2023.04.08.07.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 07:24:59 -0700 (PDT)
From: Cem Kaya <cemkaya.boun@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add Dell G15 5525 Ryzen Edition to quirks list for acp6x so
 that internal DMIC works.
Date: Sat,  8 Apr 2023 16:24:40 +0200
Message-Id: <20230408142440.1437041-1-cemkaya.boun@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: cemkaya.boun@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QCZOXXM2CT6HQRTQKRQUU7OTPR5Y2BZW
X-Message-ID-Hash: QCZOXXM2CT6HQRTQKRQUU7OTPR5Y2BZW
X-Mailman-Approved-At: Mon, 10 Apr 2023 07:53:40 +0000
CC: Cem Kaya <cemkaya.boun@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCZOXXM2CT6HQRTQKRQUU7OTPR5Y2BZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a428e17f0325..e044d811496e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+ 		.driver_data = &acp6x_card,
+ 		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5525"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.40.0

