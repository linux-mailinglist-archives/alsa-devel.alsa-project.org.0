Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32D6E3002
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF433DF4;
	Sat, 15 Apr 2023 11:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF433DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549994;
	bh=kQpFsTqxr5tr9OuWMtHm6t5kRCAUTC1YPwS9aXJLyGo=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=e77Cf3gXWJbiTic8Wj9OEEFQO8IAqULlQWX7X0L20TMo9V1R8zp2AHxLCXdjRTFxy
	 S/GziPfzoZqC+lu+hq0Ltm0HRfVNsKllH8nKjxkKNoBPp9JGJPEwS2+lrVTtQbIKan
	 lX7m8wSu3H5hppsFGjZ2jOXjCu6MjQdpd72We5VQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 462B1F8057F;
	Sat, 15 Apr 2023 11:09:39 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 9/9] ARM: dts: chameleonv3: Add ssm2603 mute gpio
Date: Fri, 14 Apr 2023 16:02:03 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCWFYXLYVXPEYE4SUGYYWL6TK6AHHH4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154977817.26.18087200308312475922@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BABFF8032B; Fri, 14 Apr 2023 16:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C3D0F8025E
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C3D0F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=m3EUEris
Received: by mail-lj1-x22b.google.com with SMTP id l7so4745254ljq.11
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480974; x=1684072974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YA5l458OG2xTSndJtJKAZvkZUt5Wi8ebzINtZE34dg=;
        b=m3EUEris+Gszu2c+E8GGw6gGzpt4sDNj107p2ZIilXUFmbTbGsKLm6NdlOpQpptIUX
         N4Qq7fKgJ3NbBQfGSO/Y2l9AXqga816Fb33t7GdzoycHpBzJi0BPR+Im58EHuYePTr6K
         35qfsSB/ws4Q1yFa4Mq8SFyn4LPeWPvhJRHe+T0wrel5WDLLUzplMShn5K6uIirBp2Q0
         2QU3tAnK7/4Wls5/mUAMlPpLRAjT3/jrwlbR8R7vYexFu+KGiUFTzVpY41YACjeaziR0
         mnRcRfK/RHRl3paL2KBQ3tG2yGWJlybKfJsDKRb+2XagAOqcQx51qVWjGhX2UP5NiqV6
         6Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480974; x=1684072974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YA5l458OG2xTSndJtJKAZvkZUt5Wi8ebzINtZE34dg=;
        b=eZ1EE+kcjciHbhyntILdjQQzC5PKCu3gHAebXkCmF8vVWE3VUgP7sNubAv6yC1ttMy
         zC6pSq5bbB2sg3v4PWglzxIxOkG3710u0hCnu2MWaxWP/57VYYMZIS1ZOc6cqGJC+24x
         tcgyWUawzo6MT7EP/Bso+ex0Gsh34NctsSiB6B0uh3zQtfow0fnJSHTVWokDQsIEGwoK
         RqHNMr9VZC2Cd4a2QA2iAK1fHafTLb1uIiARoKYwFcVuqSuhl1jfGiZqliQ6C8fdqduT
         TdsYjyy27naPJnm+s+oC54AEwGWs7OOJDlZs02gwwQm9Iqb3FfZeNSAe370kfSzUxtnh
         VrSw==
X-Gm-Message-State: AAQBX9fPrS3NHmmVmillml1A3Jvi3MdSqDUBtazc8IUVWQcfgURxC15e
	KQL4AvTAkGhj9A6mo7fh6mx77rS/JlR4jnluAYJ3DQ==
X-Google-Smtp-Source: 
 AKy350YAbEsWVjeiiZRye1QbGqhGM+1HTvCZL1EsMT7NMasjE6Bie7EA43J69Wcu8qE2YMAwAr66iw==
X-Received: by 2002:a2e:880a:0:b0:2a8:a573:aed5 with SMTP id
 x10-20020a2e880a000000b002a8a573aed5mr1333306ljh.27.1681480973763;
        Fri, 14 Apr 2023 07:02:53 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:53 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 9/9] ARM: dts: chameleonv3: Add ssm2603 mute gpio
Date: Fri, 14 Apr 2023 16:02:03 +0200
Message-ID: <20230414140203.707729-10-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OCWFYXLYVXPEYE4SUGYYWL6TK6AHHH4F
X-Message-ID-Hash: OCWFYXLYVXPEYE4SUGYYWL6TK6AHHH4F
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCWFYXLYVXPEYE4SUGYYWL6TK6AHHH4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ssm2603 mute pin is connected to a gpio expander. Add this
connection to the devicetree.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
index c75f41058196..81e83ce0f8e7 100644
--- a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
@@ -3,6 +3,7 @@
  * Copyright 2022 Google LLC
  */
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "socfpga_arria10_mercury_aa1.dtsi"
 
 / {
@@ -67,6 +68,7 @@ &i2c0 {
 	ssm2603: audio-codec@1a {
 		compatible = "adi,ssm2603";
 		reg = <0x1a>;
+		mute-gpios = <&u80 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.40.0.634.g4ca3ef3211-goog

