Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB756DEB0F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 07:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9625DEDB;
	Wed, 12 Apr 2023 07:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9625DEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681277291;
	bh=fIyqBzzfyedgUnGEiV/NeD5ETe4DmVh2UTm9/xHv3y4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MFHK3zeNez8ndVKvvn9zcRwubU4tb6OlpKGLCen4LFnj32iNGDKyMsP4qQEz0gqPM
	 hGI22l5+k9KZrIzF419SkHjCm6I7k0s+Y43MaU/nDFTrODoGCILfvVqjeOCihAYzaw
	 Lz1jBH0SWueijx67mcWz2Slkx/MLmudCK4LGSFEQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B48F8052E;
	Wed, 12 Apr 2023 07:26:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26206F8032B; Mon, 10 Apr 2023 20:38:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D195F80100
	for <alsa-devel@alsa-project.org>; Mon, 10 Apr 2023 20:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D195F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B6iBCVkG
Received: by mail-ej1-x632.google.com with SMTP id ud9so14298228ejc.7
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681151915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ES1jInJXE7evTAiiVvJ4B0LrnjwfrosLFdTS3njiZg=;
        b=B6iBCVkG+cR1+fOZY7qGISLD3lPYamnsZFSnIJgz4z39cFNgWIXaehNf6CcN5NndBX
         s6TvA4Opw5WNuKngwKpDeTVOu1zI2x4rTS2f3JjxCnz5dTzlM6lEVbF78o+1tVTLCgF3
         6gSa30AaUOXu0s9o538zAICZ/1I9IZGZ1ZcyyaRRrED5774h+JN5S3adMFLwacEG4FV/
         2KgfNQra6k6aIUphWlXbapGV0YAlgOxcZMRf5pTKP1j5ceTmSbJ6LA7uroJAuX0A16A/
         4M/bmiexcHYQjkTJxfwZPdz8XO1P4jL8zAYuMhWjetHLZlwZ3jTGCBBrG83M0vxnmpPM
         aJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681151915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ES1jInJXE7evTAiiVvJ4B0LrnjwfrosLFdTS3njiZg=;
        b=YMVmj41j1StfvrHdG1DejTDUvJvQggs4rLTiyvgqj0ATV73r6qpwfRHqDn6mERTM30
         E/W0r6cYf2cSWeefRtxns/vEZrULUVrZrDQ9TqLjJsSGnXrBNTL5nmRB7nvAXJBnqNm1
         OAgJAm61kJGr2jZujPcPfw9bCPGYrl+VnFGXbF5puTNyuDrZD/ASEfOSvgYRETEw41cm
         V+FgWz5UzfBu69mmUowqGmvf3MDlpWsrJ9O+KATtOZYvxxNyo5wlglkg/ty7ZrwkpxdT
         rix+TlRG1yQ9KIgmyxqlM0avOy8YofYOukprGIyPdEmF0mGADJPd8xx8ZLQGrSLbdvV6
         ephQ==
X-Gm-Message-State: AAQBX9c5iwChTW2GKR7r/VaWf/Ti+J+hjCcbsfZEMHwQR+lVQix2eYJf
	cRTTcFqIw1AEi9XM9sBw5WM=
X-Google-Smtp-Source: 
 AKy350Y1LpknC1jb9Ian0Ak1N5oFZUyx8RoVLld7pvmNpHG3eGxr7/Byws4lR1g9PV0WnXEFDvccwQ==
X-Received: by 2002:a17:907:7d92:b0:94a:5195:7b6c with SMTP id
 oz18-20020a1709077d9200b0094a51957b6cmr7359536ejc.35.1681151915002;
        Mon, 10 Apr 2023 11:38:35 -0700 (PDT)
Received: from localhost.localdomain ([213.152.187.230])
        by smtp.gmail.com with ESMTPSA id
 jg7-20020a170907970700b0094bb4c75695sm630283ejc.194.2023.04.10.11.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:38:34 -0700 (PDT)
From: Cem Kaya <cemkaya.boun@gmail.com>
To: cemkaya.boun@gmail.com,
	tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH v5] ASoC: amd: Add Dell G15 5525 to quirks list
Date: Mon, 10 Apr 2023 20:38:15 +0200
Message-Id: <20230410183814.260518-1-cemkaya.boun@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: cemkaya.boun@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4OR6SGG562QKOYB7EMMRYXEWHRMC2DLQ
X-Message-ID-Hash: 4OR6SGG562QKOYB7EMMRYXEWHRMC2DLQ
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:22:34 +0000
CC: mario.limonciello@amd.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OR6SGG562QKOYB7EMMRYXEWHRMC2DLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Dell G15 5525 Ryzen Edition to quirks list for acp6x so that
internal mic works.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217155
Cc: <stable@vger.kernel.org>
Signed-off-by: Cem Kaya <cemkaya.boun@gmail.com>
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

