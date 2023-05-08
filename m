Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2926FD70B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 390381070;
	Wed, 10 May 2023 08:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 390381070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700385;
	bh=qSnF1P4BWo8KQP+htovtVu1p3wY9MF28zjK2Uj19sBw=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=scg6EDk5US60RKvZObvI4cgNglGJb670eUjIlzwsV0v9rlI13+SeWpBgZ0Pxf8Zrn
	 38dWNa/fp4kBuamFnS382vbYFmSyK4YB4U3DKUIAp9PlA5FDcbYlmjnmBbPvSag79v
	 EEbLPMmNqeCcfWLVhK0H4DzxDdXelyb8tXW4ERKI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DADFF80548;
	Wed, 10 May 2023 08:31:01 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 5/7] ARM: dts: chameleonv3: Add mute gpio hog
Date: Mon,  8 May 2023 13:30:35 +0200
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:30:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L32C7M6TMRRI7WD5DVBHRIB5PN3YOUWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370026056.26.18241623196612563601@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C865BF8053B; Mon,  8 May 2023 13:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EF21F80534
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF21F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=ubqJyPUX
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac8cc8829fso32055781fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545459; x=1686137459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ago5W1TH3NtYlqnoMKL2QoZcqhImH0EhtanUKlx90+o=;
        b=ubqJyPUXHkbI4WVG4p1/PBG73AtSJIpqB/ICYxMLF8yrq2pTPj0EmaTlq3zuCful4n
         MFM9xrXSTPVnn4YflEdt3wvK4GTbpC3Xj2EeRLfcCKfyEtX4jXTwKMWNG/dQOLRvLFfp
         xy7ky6fMUjmLdBl5TBiz+RqdJWePrLWSaJln1Hxes8TL6RxSTRfDpG1IDXsXe432PRZV
         Wr1rxHAZ66XoVTFDYbgrOFkA+ohh52HMjDI8drQu8SZw4zGiKMZ0f41TAj4KT17K9ogG
         HZ2jU4GPk/oRejiYUuBS9z13dOZXLx0o1MRT2uR8V+LhKeCy2kWDGNja1DvLGZJT0W7Q
         E6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545459; x=1686137459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ago5W1TH3NtYlqnoMKL2QoZcqhImH0EhtanUKlx90+o=;
        b=HNS1AQKX630mIdFI45D/wGOrkSuCSQBK9DYoP7KyEnsXMLw6HD9vUdXvkIQrFS6nYX
         k2yLuOG9Ndnz6Twl66HRtlOv28Qlq4/3J0QmRbSlUmRgYDZ3dCSGezKoPo9loBQl7RUG
         uG/mh4h/fJNj5XBiP4Y2v37DFJg+B9stTJFY3xramlLpNlPyfVGhef5G+QPg7cBBI3xZ
         1EbRRlN05WzEOvb9+GIrrWcDHCJ/piDgDra+VTI0j/lH6sW8nK9DPOslQCi1xaZZK8zb
         VTpcDviwp8lC8K5UW1unJpXvtBtoA0QqijdMNH5F2uyqvc2YPu6TLbXB2q8TT+5StphY
         B4nQ==
X-Gm-Message-State: AC+VfDyaSZwF6AVups1eXt01iMtKTPRrhAGo3hhQpUA3Jvf9ivCj1LUw
	FHtdwt/d2DM9DrsWmTwhzSeLxGI/A7lF6T3zDpQ=
X-Google-Smtp-Source: 
 ACHHUZ6dznyxLhJT/VBoJN3aVEWWHkYoCuIWMKXSx1E6hT10TgdkNvC/r4/EbQWmrtsm3zZdT804Jw==
X-Received: by 2002:a2e:9b08:0:b0:2a8:e480:a3c8 with SMTP id
 u8-20020a2e9b08000000b002a8e480a3c8mr2548687lji.44.1683545459588;
        Mon, 08 May 2023 04:30:59 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:30:59 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 5/7] ARM: dts: chameleonv3: Add mute gpio hog
Date: Mon,  8 May 2023 13:30:35 +0200
Message-ID: <20230508113037.137627-6-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: L32C7M6TMRRI7WD5DVBHRIB5PN3YOUWN
X-Message-ID-Hash: L32C7M6TMRRI7WD5DVBHRIB5PN3YOUWN
X-Mailman-Approved-At: Wed, 10 May 2023 06:30:55 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L32C7M6TMRRI7WD5DVBHRIB5PN3YOUWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add an output-high gpio hog for the mute pin.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
index 422d00cd4c74..f0483ef46a36 100644
--- a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
@@ -69,6 +69,12 @@ u80: gpio@21 {
 			"TP122",
 			"TP123",
 			"TP124";
+
+		mute {
+			gpio-hog;
+			gpios = <0 0>;
+			output-high;
+		};
 	};
 };
 
-- 
2.40.1.521.gf1e218fcd8-goog

