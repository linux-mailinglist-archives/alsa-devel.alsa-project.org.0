Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC428822169
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:53:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0960ED9;
	Tue,  2 Jan 2024 19:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0960ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221618;
	bh=ZO1nbBDS/3XN5pif6mo49Br10pz4Q+TkOLhjb6LnLFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MMRKPtSOYmOVvtPUydp36n3oLnC1lrEpVMAGIg8HoVVYdME7xAB4D2k8gycQRMqXe
	 3S7bOy6Ik5kYY+qDXT9GBFixQ9TwRfFOOzQFspEr+xYYqxfwJur+wQ9H77JD0GMg1K
	 eOf+WQp0SqQPwfQRmVqYyD95I16MaBcnLcLGsDdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF0DF806BD; Tue,  2 Jan 2024 19:50:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFA5F806BC;
	Tue,  2 Jan 2024 19:50:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 038FEF80425; Wed, 20 Dec 2023 08:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB845F8016E
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 08:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB845F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gA5rjwNq
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5532b45c286so4655267a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 23:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703057891; x=1703662691;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxdaR881KYWxnVjE5RFuD+xNEp0CWp7EUb3EZJFwG58=;
        b=gA5rjwNqzmN2jStgK+60W1g9foEqTxvzsLRveMmYbH7cn5/ExkdHZcXCFljkOJo/bh
         YQG5GFE45AdavWZ+QnOL+TJjiXCUnDjWBeocqWVqMZmk//Yf6PPtlBaWW8TmWUmDrSYY
         pBbD7N3f8ILu9P/zQPjinDimNhWEgkptrj7h9e4CqUE2Ej2sLOr7uUSRfYURbL5suXz5
         BR91p+XB5dptPVPHF0jEr0DgTxlvBSva9QWedaJrHrpp+Vp70LVGhdTbi5SBYxOQBK8k
         r5+4BqAghRVrPuKrWsQlROIBDT+2DrWVssoFRKD1fqTk6Y9hNbYDV1Cg9E/yAJbjhluc
         ILfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703057891; x=1703662691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxdaR881KYWxnVjE5RFuD+xNEp0CWp7EUb3EZJFwG58=;
        b=f8HCxDbaWZG29PFwRW36/GWu/yghdAyW6NdK7AXQiEwY43NAzPAY2QzyT7xJmm8x1a
         n4+F3pzald32SOsgmuR6HmHpx21I2NTzTkCkhWcWlVXiYYltm/3rBvsQDH7D4wgvYKeU
         jXZhKgBBBRbzZDmH+3AiMDpNWu7Mho5BJBQhyuUX85wvVaeKheHGsHQqUvEnHqm+nZC0
         aa3BtlVPgKl6btYnfhCQOXiyVS6U0sS4vAoht3fdtoyRdqiZzhtK9lMdtSkECgy1dh/z
         osX+qwBySR64rB6eN1UBvw89rQP9o/mVkKbDt6ECzt5/ebFHpC8m7B5XlhodVdzru9Dq
         xqeA==
X-Gm-Message-State: AOJu0YzYrAosPOkCVtKJMNcdEiZaF5f7FWI1zkQzXACHH4nv98qaNCMg
	VM1gFXsg2a928crAgPypMw==
X-Google-Smtp-Source: 
 AGHT+IF1+fG3lPptD5qJNeH9L9Yw2E+IRSt3K4z5bx6nfNUz4NixxmGTMGu3Eq9TuPiyNB8OraLeiw==
X-Received: by 2002:a50:d71a:0:b0:553:99fb:ae47 with SMTP id
 t26-20020a50d71a000000b0055399fbae47mr526017edi.27.1703057891414;
        Tue, 19 Dec 2023 23:38:11 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-153-16.cgn.dynamic.upc.ch.
 [31.10.153.16])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a056402500700b0055283720ec3sm5979043eda.76.2023.12.19.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:38:11 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: tiwai@suse.de
Cc: alex.vinarskis@gmail.com,
	alsa-devel@alsa-project.org,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	josbeir@gmail.com,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	stuarth@opensource.cirrus.com,
	tiwai@suse.com
Subject: [PATCH v2 1/2] ALSA: hda: cs35l41: Safety-guard against capped SPI
 speed
Date: Wed, 20 Dec 2023 08:38:08 +0100
Message-Id: <20231220073809.22027-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220073809.22027-1-alex.vinarskis@gmail.com>
References: <87ttokpyws.wl-tiwai@suse.de>
 <20231220073809.22027-1-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alex.vinarskis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AA4XHMFHQWI7C3IW72NOPE7HVFDJPVXZ
X-Message-ID-Hash: AA4XHMFHQWI7C3IW72NOPE7HVFDJPVXZ
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:16:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AA4XHMFHQWI7C3IW72NOPE7HVFDJPVXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices with intel-lpss based SPI controllers may have misconfigured
clock divider due to firmware bug. This would result in capped SPI speeds,
which leads to longer DSP firmware loading times.
This safety guards against possible hangs during wake-up by not
initializing the device if lpss was not patched/fixed UEFI was not
installed

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index c9eb70290973..cb305b093311 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -210,6 +210,19 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 
 	if (cfg->bus == SPI) {
 		cs35l41->index = id;
+		/*
+		 * Some devices with intel-lpss based SPI controllers may have misconfigured
+		 * clock divider due to firmware bug. This would result in capped SPI speeds,
+		 * which leads to longer DSP firmware loading times.
+		 * Avoid initializing device if lpss was not patched/fixed UEFI was not installed
+		 */
+		spi = to_spi_device(cs35l41->dev);
+		if (spi->max_speed_hz < CS35L41_SPI_MAX_FREQ/2) {
+			dev_err(cs35l41->dev,
+				"SPI's max_speed_hz is capped at %u Hz, will not continue to avoid hanging\n",
+				spi->max_speed_hz);
+			return -EINVAL;
+		}
 		/*
 		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
 		 * This is only supported for systems with 2 amps, since we cannot expand the
@@ -219,8 +232,6 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 		 * first.
 		 */
 		if (cfg->cs_gpio_index >= 0) {
-			spi = to_spi_device(cs35l41->dev);
-
 			if (cfg->num_amps != 2) {
 				dev_warn(cs35l41->dev,
 					 "Cannot update SPI CS, Number of Amps (%d) != 2\n",
-- 
2.40.1

