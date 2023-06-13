Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30D72E41B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755D0DEF;
	Tue, 13 Jun 2023 15:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755D0DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686662985;
	bh=5qKONUVk1AvbmaXX2smyeR6OsIabS4FnySdV9+vh1iM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uU8T2bAQ1XodXgmg4iL8+Es/LhTWDCz5XwMdP1OSQ3Wpp9eOWcgHrflY/hcGvx7FA
	 1UJV+uGn+7S0pbvOcMafEcH3b8k6NT7jkRIb3Snby8gdeloOTPTKdjJ3LG+2vsxkUC
	 LbPi3PzC4sCY23Y6qEAvcG2okACExnm81KHIKhis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62AAEF80549; Tue, 13 Jun 2023 15:28:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46802F80155;
	Tue, 13 Jun 2023 15:28:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4946F80149; Tue, 13 Jun 2023 11:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C562CF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 11:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C562CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=rvIN5wZ9
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF7E13F26F
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686650098;
	bh=YXC72gBJcEvm5pdwUJv2zRUSBOXAsWJCWtUFi9onxC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=rvIN5wZ9wGiEW1uLuFxf/iNxMcFXShQshXP8plFgQakIsA7XzrHOuPFWcKSP+OEPO
	 366+Oongjxu8QdxclpV0bDlJjUCVYzhBTUtEzolMw5T1E/wlbGO+RwofbXzVprAGLQ
	 2MEyU+lw508XJZlS/JCvJgCcRTdzzh4Gs+KKJVofVVvXpf6nduq6EZsLcGgj2+5yzS
	 bhf+L3sKcBrSr1vH7zAm24+IcRk91rtN1Q7Qc7CBt+qxnUtJw8wSwDtaMJcIVSQx91
	 Nw/M8DCCna+9m4TXRuemBK2JAM9mlUsprQHlaJizOFwhLA8SM0Bzp/GEqjIZRlbQ32
	 fwfArngtGtNLg==
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30fc7ab9ff3so747272f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 02:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650098; x=1689242098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXC72gBJcEvm5pdwUJv2zRUSBOXAsWJCWtUFi9onxC8=;
        b=kYSw5I+6ISVWDXYTX8JtckFMcw54E4fYDTzUd+1Z2hKpo9uLyGi/hAG6zRgB2qND2J
         dWlrGhSqx+mibQeTg4vmep07KL4+SGvrSvPJxMYXuoxsnV+xV7kgpOjs8+mYNhYPuHAP
         2PtIgIvmU5hArqVdOL7MhmMz42HHosc57x2jYP9fl0s2D91f0NGfJ5s7R+2/RMjRZ0xk
         sqWiTmxAt/GSrcK6dHrbTs7wfftSY+nGRJt7WCNfCByCCNR4FLwgwFiPnRJIRcIFlQ38
         V9lLiLWOaxfGnEreZVoLQm39QhHG2QpG50tXpv0ZUebMzi0lxhxyBIffUGfO4GfwEg5W
         Y/MQ==
X-Gm-Message-State: AC+VfDyFJs42vv+K3rOo3Gz+SVLgyMaFy4brMkXjb6d3JT73nNmWgGW2
	/c3uLNMcQUmx8jBtHXZ5aYSYnKdSf2PnDcl5G6iePG48Mm07wMZqHvlTwr2k1KAUEnE4hYnSnM9
	atMDKi1uMffUAN50SZDTQjw54Gpq+rksMuhBVH2Kl
X-Received: by 2002:a5d:5946:0:b0:307:92e8:ec60 with SMTP id
 e6-20020a5d5946000000b0030792e8ec60mr6454675wri.39.1686650098260;
        Tue, 13 Jun 2023 02:54:58 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ4rCBnlbE9e7jvs5YeCmTdM4fzgruz3biT42Lo2FqmAOnTYs8PAQHCBK9mkUeYVpoyRFl0cxg==
X-Received: by 2002:a5d:5946:0:b0:307:92e8:ec60 with SMTP id
 e6-20020a5d5946000000b0030792e8ec60mr6454660wri.39.1686650097949;
        Tue, 13 Jun 2023 02:54:57 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id
 b14-20020adfe30e000000b00307a86a4bcesm14921660wrj.35.2023.06.13.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:54:57 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Cc: inux-kernel@vger.kernel.org,
	u.kleine-koenig@pengutronix.de,
	nicolas.ferre@microchip.com,
	juerg.haefliger@canonical.com
Subject: [PATCH] ASoC: siu: Add MODULE_FIRMWARE macro
Date: Tue, 13 Jun 2023 11:54:54 +0200
Message-Id: <20230613095454.38696-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: juerg.haefliger@canonical.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6DG4NWRLMKQVIVYNKBPT7JK4AH5WAXXW
X-Message-ID-Hash: 6DG4NWRLMKQVIVYNKBPT7JK4AH5WAXXW
X-Mailman-Approved-At: Tue, 13 Jun 2023 13:28:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DG4NWRLMKQVIVYNKBPT7JK4AH5WAXXW/>
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
 sound/soc/sh/siu_dai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sh/siu_dai.c b/sound/soc/sh/siu_dai.c
index 84e1b14e68e4..d0b5c543fd2f 100644
--- a/sound/soc/sh/siu_dai.c
+++ b/sound/soc/sh/siu_dai.c
@@ -796,3 +796,5 @@ module_platform_driver(siu_driver);
 MODULE_AUTHOR("Carlos Munoz <carlos@kenati.com>");
 MODULE_DESCRIPTION("ALSA SoC SH7722 SIU driver");
 MODULE_LICENSE("GPL");
+
+MODULE_FIRMWARE("siu_spb.bin");
-- 
2.37.2

