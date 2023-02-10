Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB99699847
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4427F25;
	Thu, 16 Feb 2023 16:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4427F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559851;
	bh=l1mY3v7XisyoS0G6b9bLyG//O9/PqcL1u7Hbiqumryw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NW62fd+2/g496lv/H+GwPS2A+zux2n1yYh5FYEMqWO+IoOPBDhNScxG6BGKjxQ8Rm
	 WZ6buo10YVrLUaH6gU/V+P5gDqe8XW12m1AcBYNaE1nP54R5HFbWZG6iMsnrwRCN3k
	 Ulo0RH8tLwnA14w440XqP8YD+Hg3SD4Hx5E6JH6o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C15F80563;
	Thu, 16 Feb 2023 15:56:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB117F8018A; Fri, 10 Feb 2023 05:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FC2BF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC2BF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JVtiloj7
Received: by mail-pf1-x436.google.com with SMTP id o75so2728789pfg.12
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mAzAHTdZsC5IqNul3xJsl6wPXmAHfKwZ27VCzKXGF4=;
        b=JVtiloj7yRa4BQFYW86RmJebSQYTmr6ulQWbaNdE813YnQNwxXxigdeqKGwJ547OA9
         iKneGqYybribFvactjWAxLOC1FFyHyE+vrJN9XEm4Abm2yHTeo6rcn+1OgEhy5wP98gZ
         +ThcUd3YSIgv/n1tSUkAQD0bQGEO9epBP65UtYfzB4TDt5HkYEHAUsO9ybZHG+TDzu0u
         hqJKP33cLtrVl0eYH6Qi6HmbIoL1D0nmoU8eLgaP0zLDynkeKmwUzTLzZaRDN3rU0PL/
         En5vvM6GmtpTk46YMQcS55SP+xFg1xh1ZcTgKWrbYfmIOMTZVYpC6OIy+kKwcbJ4fUCF
         NfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mAzAHTdZsC5IqNul3xJsl6wPXmAHfKwZ27VCzKXGF4=;
        b=gwE0P/cNJTRax4970rajZ3AxLFvB+YNbVd079TLuuOzQCoC2Y2yv/6pUUKlppmLMff
         ZJgiTdBHWvxtKdirpaM4b9SbgYO0RLmngLnubuRxpy1QdEgUcVbZ2QyN5LWvgJ4AO+KF
         HCtA1LTgRLPeHBzUrs3qcHdnsp3i966XH9PIXYEyK+BaGMyoCYHr2kaPNu+wOoGYMPql
         gg7mVqa6L7dw9A7JlmLcETi5W8BhtKyaGKjMIwsDwXjkBM25tgxeGyoaLtGAYBllpcfn
         aR60fGvrWy3Ze8VYrzNlePiEnt0pCre73XFHU6wo7iCx23X/QSeqkn2Y5hV3pZeV0Rxa
         fQKQ==
X-Gm-Message-State: AO0yUKXMCUT1Pd9Qwep16jfov/BNXEZVBb9+H2Y8Qw6bKxtSWZhEkeDX
	wBsKfsZGm26SzRShwmBE2Xc=
X-Google-Smtp-Source: 
 AK7set8TKp+XoOdzFSSniCiSLofONjJNjijxRgei3TQG94xGgDFfQ+8mh0QAUiI4aSA+indqTsT/jA==
X-Received: by 2002:a62:1c13:0:b0:593:2289:f01c with SMTP id
 c19-20020a621c13000000b005932289f01cmr11514678pfc.25.1676004609052;
        Thu, 09 Feb 2023 20:50:09 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:50:08 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/9] apple-gmux: use cpu_to_be32 instead of manual reorder
Date: Fri, 10 Feb 2023 15:48:18 +1100
Message-Id: <20230210044826.9834-2-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FGIXQRLXT2ILYQVY3V2QOGYWYDLSIVC4
X-Message-ID-Hash: FGIXQRLXT2ILYQVY3V2QOGYWYDLSIVC4
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:56:51 +0000
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGIXQRLXT2ILYQVY3V2QOGYWYDLSIVC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently it manually flips the byte order, but we can instead use
cpu_to_be32(val) for this.

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 9333f82cfa8a..e8cb084cb81f 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -94,13 +94,7 @@ static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
 static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
 			     u32 val)
 {
-	int i;
-	u8 tmpval;
-
-	for (i = 0; i < 4; i++) {
-		tmpval = (val >> (i * 8)) & 0xff;
-		outb(tmpval, gmux_data->iostart + port + i);
-	}
+	outl(cpu_to_be32(val), gmux_data->iostart + port);
 }
 
 static int gmux_index_wait_ready(struct apple_gmux_data *gmux_data)
@@ -177,16 +171,8 @@ static u32 gmux_index_read32(struct apple_gmux_data *gmux_data, int port)
 static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
 			       u32 val)
 {
-	int i;
-	u8 tmpval;
-
 	mutex_lock(&gmux_data->index_lock);
-
-	for (i = 0; i < 4; i++) {
-		tmpval = (val >> (i * 8)) & 0xff;
-		outb(tmpval, gmux_data->iostart + GMUX_PORT_VALUE + i);
-	}
-
+	outl(cpu_to_be32(val), gmux_data->iostart + GMUX_PORT_VALUE);
 	gmux_index_wait_ready(gmux_data);
 	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
 	gmux_index_wait_complete(gmux_data);
-- 
2.39.1

