Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CE787B70
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:24:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2E55A4D;
	Fri, 25 Aug 2023 00:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2E55A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692915852;
	bh=N5Zi+lRNVA3LBjR15rKYoLmvgAGsFY938SO739H6j98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nhiisJUGW6PUH269S8aQgXboar1TrWtM3cFfaNBUfdw1ONPQ0nwiIPspmCVtLgwur
	 2o9tqeJQ6+rJUGAdL/t2gWcPkiOj6QlFObJO/6h2j7cYFzbHm6jZFwRfrZippGE5pC
	 fvs5G/mGvX1mL4YRLVDqr53k3BLimoYxlLlP3Qe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B48A8F8055C; Thu, 24 Aug 2023 23:33:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7512F8055C;
	Thu, 24 Aug 2023 23:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CC59F80552; Thu, 24 Aug 2023 23:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13A60F80551
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A60F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=mA2iCHU4
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bd045336c6so238249a34.2
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692912814; x=1693517614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR1zji2Gv82pJsxNGTLF8FAId/T1+T9WSMkyC5Re18s=;
        b=mA2iCHU4cZQoPUknUKFT+ZenG/MYQ9Dzpqlqj9uLhCKG2/ZtuONNQDA/AAwp9oRuVf
         HKCpjRDyMn9p36bPwinuEXSh4lKRChitGZIGnsNxYzr9kFGv/ZtdnnymtmgJ7aS6me/0
         4rnqzeivExrHfaE397GbAxrNA035wk5Mq9Qkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912814; x=1693517614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR1zji2Gv82pJsxNGTLF8FAId/T1+T9WSMkyC5Re18s=;
        b=KM5U172cHwVuiQa+USnWHa7eEUsNHzORRsxv4Eb4eHUskn2q9q/v7DnUjLeEFTeqDP
         z0VuC1HNqKDmD+uZI5BtNvkVi9a5WWEx7dwnxhZRYx4h7iJRAG3Jr6lcEg6l5PiIq1NU
         zrrvIc1EbcWejt3qvql2KSmsMqyzEc93jFfNfpkaqeccoPadzOYzXRaIxKQOu7uRYHkG
         6weE+sYyQMwX9ZM6S+eXo6FbNycfl7PILUF4s024H46VyJqdQ7eCkGrcMfyX+BvO3dwl
         jEVV3bkmZJxn3fdGEw2RTWwdspKiCAX7tk2c4teOZCwS8A51w4MMIrBUo2NY8aGifWA2
         MQkg==
X-Gm-Message-State: AOJu0YzihT40H7QRLuhqRPZW+gPretMScUBC3pv93gBSvjxL8HVrRdUi
	XjDJem+rquCZCnM74oBjh4BKXvxiedH7Hwc9+w==
X-Google-Smtp-Source: 
 AGHT+IEhb3gKK2QxlZUuhJns3jnB8XoEKCVzG3BzBjZHULw4tX8C1WAJPN1uxVUIn3wEC3uuvkhu5A==
X-Received: by 2002:a05:6359:2f97:b0:134:de8b:17ef with SMTP id
 rs23-20020a0563592f9700b00134de8b17efmr12663790rwb.18.1692912813724;
        Thu, 24 Aug 2023 14:33:33 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:133d:5d74:91c4:bbb1])
        by smtp.gmail.com with UTF8SMTPSA id
 o21-20020a637315000000b00528db73ed70sm77390pgc.3.2023.08.24.14.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 14:33:32 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	ethan.geller@gmail.com,
	Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH 2/2] ucm: docs: Add IVEchoData
Date: Thu, 24 Aug 2023 14:33:12 -0700
Message-ID: <20230824213312.1258499-2-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824213312.1258499-1-cujomalainey@chromium.org>
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CK54MDECB2RRCKKSBSFFWP6M2ZRDPUOK
X-Message-ID-Hash: CK54MDECB2RRCKKSBSFFWP6M2ZRDPUOK
X-MailFrom: cujomalainey@chromium.org
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Provide a UCM value to mark devices which are needed to be opened only
for HW purposes but should not be consumed for userspace.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index 3c7c0a26..3d629667 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -387,6 +387,12 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *	  device with the same parameters it opens the source device with.
  *   - EDIDFile
  *      - Path to EDID file for HDMI devices
+ *   - IVDataEcho
+ *      - Used only on devices pointed to by EchoReferenceDev. Used to mark
+ *        references that might be lower quality (e.g. reduced bit depth) as
+ *        they are intended for a HW feature and not userspace consumption.
+ *        These PCMs still need to be opened by userspace but are not
+ *        recommended for consumption.
  *   - JackCTL
  *      - jack control device name
  *   - JackControl
-- 
2.42.0.rc1.204.g551eb34607-goog

