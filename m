Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFF69995E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 17:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8ACEEC;
	Thu, 16 Feb 2023 17:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8ACEEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676563270;
	bh=fqV5myKqJnEVsgdLbBpO98fBDCh6JSOSwRZUmtyrDgQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KBCev7rblTRfUG+08O03H3oVnwOdHdz89CMqXw4EfKTqWUpUnVlZjiraUvkoMDFoV
	 np5bAoDaLU/KQ/l27IQdDIVaCU0yVFeoNXpWnlaZAlTcoxwsqhI2WMXTwGvDEAdXjq
	 XCa+QC0nfKhPbC31/i62jAezl1FSlgPqzTxNQKCI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 367FFF800E4;
	Thu, 16 Feb 2023 17:00:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB69DF80171; Thu, 16 Feb 2023 17:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BF9BF800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 17:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF9BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q33rqeXe
Received: by mail-qv1-xf2a.google.com with SMTP id i5so1520689qvp.6
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 08:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=090PiZboWm4xKAxokbVWDfrV3xrsWJlZwqvYSImMRoI=;
        b=q33rqeXeRbuTnWBfq4xJA2U7uspFazDKHLWhY0GzG3ZmPtIg3WeMYI4dlKoqsdiZj3
         8kaik4slpbHdZuOq2mSHpOfQTymngQ4mVUjUY9RL3PqxnD1ogdo3usfZJZpiTYwPA41d
         Ck/kfiFydd8s7snRnU75zXZEYAotd+49s0fYHeXY1/WlxU5VwytBnNHiSFQcEenBRo0K
         hAHawc3uCmfdRb2ISlprcAfMEA9Y7kXDjZhvXtCieqs/1VKW/qzgPi+T1Y5pYwQZeX7m
         yBpuFo4oqvmcYVaRt0v+KyNLFXTfWGEH5wsMj93s9Kh6zgeK0wqCTO/ypeFd6CPhreed
         aHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=090PiZboWm4xKAxokbVWDfrV3xrsWJlZwqvYSImMRoI=;
        b=BgtwXnG1IlNO+CUpopSnzEDkqlN70fmuXY+Dgo55D/iwjbxqOj9vNLUOj0tCdTOs9c
         5DyUIkYh4HeES4BGzuFxdPoJM9hMAiAEACjrYkEyERkuQ2IKOuW0aQNFs8c/3yUdjxIO
         2fyugEEbhfi9EEdfhxT3F5xg//J2xFnvKohHMyikQzd0H50SMBr0LAhFjTtQ1bPKrSKC
         +K50J9ybxkxqLkCqrWIPLCc/fR9hv2Jjija32jqzsvHQGLRLSbfNXNJDJuZ1OT3toa0m
         pW7LIM1VPe7eFXhXelDSaVYoHRUtVv7RAKiKOK/PPgccR+XYZEsOTYGRb+ScUlfR+811
         /cdQ==
X-Gm-Message-State: AO0yUKUCr7K9trNJcqZIo8oKCohEkhHxkK7rHEoE4MqstVXJe0C2RWsk
	jWhHB3FPYhBQZ3x5iEfmWz0=
X-Google-Smtp-Source: 
 AK7set/slyxS0VTiycNJWvqfexed9tSt/x1r2N1T0sTVLe20qQdkH0hCX0ZHeg4i255H71bxBQyJBg==
X-Received: by 2002:ad4:4ea8:0:b0:56e:a331:cf14 with SMTP id
 ed8-20020ad44ea8000000b0056ea331cf14mr12985012qvb.51.1676563207358;
        Thu, 16 Feb 2023 08:00:07 -0800 (PST)
Received: from localhost.localdomain
 ([2601:14d:4e80:336e:6940:faac:fba5:1dee])
        by smtp.gmail.com with ESMTPSA id
 t80-20020a374653000000b007203bbbbb31sm1430439qka.47.2023.02.16.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:00:06 -0800 (PST)
From: Joseph Hunkeler <jhunkeler@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to quirks
Date: Thu, 16 Feb 2023 10:50:07 -0500
Message-Id: <20230216155007.26143-1-jhunkeler@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DE2EAGF44N7CGNEPTYOPNWQIWLRFIQJ5
X-Message-ID-Hash: DE2EAGF44N7CGNEPTYOPNWQIWLRFIQJ5
X-MailFrom: jhunkeler@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Joseph Hunkeler <jhunkeler@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DE2EAGF44N7CGNEPTYOPNWQIWLRFIQJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enables display microphone on the HP OMEN 16z-n000 (8A42) laptop

Signed-off-by: Joseph Hunkeler <jhunkeler@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 363147539..4e681e9c0 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -255,6 +255,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "15NBC1011"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
+		}
+	},
 	{}
 };
 

base-commit: e1c04510f521e853019afeca2a5991a5ef8d6a5b
-- 
2.39.1

