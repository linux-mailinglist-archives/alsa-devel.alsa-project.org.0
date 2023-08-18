Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 109437827AB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E9284C;
	Mon, 21 Aug 2023 13:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E9284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616472;
	bh=FgA65yTUBKT8MzcwpSFlA2tX5Tcsz+ML2jEpk+2JOQs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rlB3vXd/NcUkJbcMUKROftfAP/jmEoWpCNfiVBCIKDoEME+D/hd2rQwuRSsYtrHAM
	 n7sj1XSSF2KWrLoNQZnEpZl1pLy3+M2A9tgB+XkrMQPShc+3Tn5LNgqXsteufiyOWU
	 iv1Ib1ETaaXe4kxfyfvbypGO6Gwnpvfi2z0sK31U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88BA4F805D7; Mon, 21 Aug 2023 13:11:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C73C9F805D8;
	Mon, 21 Aug 2023 13:11:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3AACF8016D; Fri, 18 Aug 2023 23:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 505D4F80027
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 23:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 505D4F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=L8Uk9ewK
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-56d263da4f2so946118eaf.0
        for <alsa-devel@alsa-project.org>;
 Fri, 18 Aug 2023 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692393270; x=1692998070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiLNEqO3RQVovKsfrOU7Xg2I81wb5TNuTl74DFna1Vo=;
        b=L8Uk9ewKbx9s0nuoV2ErfRIVUr73PHNpOwLkRteCyGzsmiS2c9nDkomKK4rOPOZh2C
         krKXme801oWY2ta2hg9DO+6eE2YNddiZRpkser8c3qGBbFiNmJn3vVhH/aBvd/bnBhHR
         SbV6GdTQSO07NT5VLG/enSBpYgL11oT8oVkU3ZIjvJQwZhc7yAdlTT3zxFXrVDHVfGIp
         Tmk89X+lVd5F4Q89I/+h21tk2XqLfhnGEg6lAcZt72C1BQUonUb/WGfu6HchLRuOZ12z
         E1WVWcjzyYbakaKUg7CdQTkzwllhSqxK4w9Jtl88vByFsu7MW76DhdPaWaqlKwM2qG70
         qwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692393270; x=1692998070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiLNEqO3RQVovKsfrOU7Xg2I81wb5TNuTl74DFna1Vo=;
        b=e1J57sztds8KzFFAQykcO1pQwiPD5CmdO3b5t/8QntUc2/7eiynSrQI4X9/PPhyL7j
         rBakBT7yNPMlXWKAQDawhGckpB5Y6mCDYaRczCurXrOtp+ep2kVRPI2F8jZ48MAcnah2
         MhJBpd7+m1kprrh6XnrN0pdf5OE2oL0ZmQ8JyhbefQxLosJ0eFtmH5Ub/ba/MijUQi0O
         neyTXWp1VSW+ND7uBRMVBZJojVgcGlBawWa8kaHT8C/cf/nJYcrs05S4cdtFj4W4k79E
         7a+qftkz/qy4ZE1/BBKIYzIYWaquE95pKv/WFEl0Xr/avcfvFLSylsPafzNhV7p/R6jP
         +OEQ==
X-Gm-Message-State: AOJu0YxIgdEl9RRXIKbG/fYtyXDJHFwBtmk9O4+SkUbajxDSq239RmvF
	F4l2wLbvFr2RNgtmQSfE0R0=
X-Google-Smtp-Source: 
 AGHT+IG3POy/xWG/WDyZ0XfwMnRnvgN+lvkh+bOPbSZZR+8fqC69v8m8mzODHp3Q8B1EgiFH7jNqcQ==
X-Received: by 2002:a05:6870:b295:b0:1c0:fe16:90fa with SMTP id
 c21-20020a056870b29500b001c0fe1690famr489853oao.56.1692393270026;
        Fri, 18 Aug 2023 14:14:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2804:56c:d7a7:4200:af4f:edcc:126f:213d])
        by smtp.gmail.com with ESMTPSA id
 c5-20020a05687091c500b001b03e0c0970sm1470671oaf.2.2023.08.18.14.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 14:14:29 -0700 (PDT)
From: BrenoRCBrito <brenorcbrito@gmail.com>
To: 
Cc: brenorcbrito@gmail.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	linkt <xazrael@hotmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add VivoBook Pro 15 to quirks list for acp6x
Date: Fri, 18 Aug 2023 18:14:16 -0300
Message-Id: <20230818211417.32167-1-brenorcbrito@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: brenorcbrito@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XWTE3XVG7AO5WSWGT7BVYYM6D22XNIKJ
X-Message-ID-Hash: XWTE3XVG7AO5WSWGT7BVYYM6D22XNIKJ
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWTE3XVG7AO5WSWGT7BVYYM6D22XNIKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VivoBook Pro 15 Ryzen Edition uses Ryzen 6800H processor, and adding to
 quirks list for acp6x will enable internal mic.

Signed-off-by: BrenoRCBrito <brenorcbrito@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a2fe3bd4f9a1..a2661dd637a5 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -248,6 +248,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M3402RA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.40.1

