Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A68BFDC8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF0AEC0;
	Wed,  8 May 2024 14:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF0AEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172897;
	bh=UL/4N8rXRM70GUqix5tPsZFEQGhkMZHDmI2ayaFJGlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z3OpvCc4dMUkieOq9chPd4g5yv+3YkrXWvkcz/Y1vdKGV2ex26y1sAmNTr0WsbFMN
	 /DLRG/xYqd77adquGZ395Fb6HP34B5vtil+1CracmLe7sDYsIoYSxilMQj3OwrxmJx
	 c0WqwuwxtsrJU/5A486n5zd7S8+6f0QdelYsIgqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F720F80771; Wed,  8 May 2024 14:52:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8969BF8076D;
	Wed,  8 May 2024 14:52:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5D38F8003A; Wed,  8 May 2024 13:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 936E9F80563
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936E9F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Oai2KAE5
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59ece5e18bso488475666b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166087; x=1715770887;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xXdtLXh9Wq/U+DCcvi3Zl9MvXXMxZj9qmUG/1NN6b8=;
        b=Oai2KAE54CMzwOc1hT2jAolmUo/UcQjP4kHwTV5pUSMrihvCtbu4VhyrsuzokW9fYc
         QuCBb9F2KPc+SU2fe3MO34qi14w37FvF8VKCSfjGyrI+jHoy1WnIuBumILonoBVRt+Nq
         HdpWnNShLxUx7lRgMMI2/RDNSW0OlvZ8Kc1rxKYqIzzjf5BtLYH/VMUNRw9EWmE73Ldw
         ja//kGVZv1qPE2huqH6PLhU+DvGKERhAegSU4965f3XudCUDBve9N25blwJdC+GvFTMT
         /DgGgCYAMD5eu0dwOrS49t0I4ybDxH1DPVh4D8OkFigEdtQ+pQmqB3OcjPN79HHUt74s
         q2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166087; x=1715770887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xXdtLXh9Wq/U+DCcvi3Zl9MvXXMxZj9qmUG/1NN6b8=;
        b=MF0fLcaF05zNsiyG/QghUpAkNTI6tVQTZN36GFkpQbT5uKhLUee4XSTfjNLox/Ur3v
         Yyx1iXEOlf6z4rSPNCcb88aDetUuKITgu1bZ3BAuCqk3V9JCE/04mame6JYfFNLkIUGb
         UBWan72o6x0WfjYSO1mYDzrt8xNpwZQs6uyj4gnxRhdXjtt6VbdnTfAhdPWAqqhy2v/x
         qeHwa+pXUGrKeuDYv9tuQBuF1u8eNAt/NTDSXSpBLCvWHNTaEfPmvHL4BTxUqECz5Uhl
         /ftHNDXREnXBngdmTRYyVZRAz3u/RC83PZMh10z2MJF7utC7y1j7rRT2LLzKqoqLbrFx
         Z0sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQrOV9X0k6cc+mEeD22XREmO6d84AStv/P6r2N4ERtN2RqAXvF5Jf4koNiov9EyjxpFK3D5n6sRjfL+rVFFbU4kMpqgBXTfPbBi2I=
X-Gm-Message-State: AOJu0YwCZPPSs5rL2Zx7484XyduxJq0qvMUWVTDgGjD2baXFNHhJ7ia4
	FJ11WGfps2RMMBHtMe2ruvyPTRxi0CJOMdxMO4a6ATVMfIPbKT1k
X-Google-Smtp-Source: 
 AGHT+IHSvqngLWudU2mq3sRdhAXsMHPmyVHOgZ0v5JQdfowG5AeyhCGC/cKuo86niykSWYIXOiqDig==
X-Received: by 2002:a50:a699:0:b0:572:664c:83f2 with SMTP id
 4fb4d7f45d1cf-5731da68d64mr1873313a12.27.1715166087014;
        Wed, 08 May 2024 04:01:27 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:26 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:55 +0200
Subject: [PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3: Fix up wm1811
 codec config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-7-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=1054;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=UL/4N8rXRM70GUqix5tPsZFEQGhkMZHDmI2ayaFJGlM=;
 b=7BPWy7GfZUBZ3TTXDAlEmhxr7SnPBBZ9ehQ1CJLgWoE87M699gDN5kcEDVe31eaoWB0oP2YD5
 Aj6UHKKMILGCsBtWyvT/a6q3VshUe0QJDlyqa8bnGA8MeXyc3wPf4XJ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O7FD6D3LKZKSCHNYXRLASZZJ6XAJ2FMB
X-Message-ID-Hash: O7FD6D3LKZKSCHNYXRLASZZJ6XAJ2FMB
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7FD6D3LKZKSCHNYXRLASZZJ6XAJ2FMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop incorrect interrupt parent and add MCLK2 clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Split out wm1811 changes from midas-audio config change patch
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 8dc81112172c..20e5e7ba6b92 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -529,12 +529,11 @@ &i2c_4 {
 	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clocks = <&pmu_system_controller 0>,
+			 <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.0

