Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADA907792
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC846B6A;
	Thu, 13 Jun 2024 17:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC846B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294025;
	bh=9NhvL8rRJ4NpIlfmWPhGyv2x7+JR1l7yy4pYIQI11b4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rV16N35zTsm4YNE6EOspobJ6bCZgAPZ+W390jTAGJ1+ZdCbvtnjMKrTu8GARp7n8+
	 2T4ADDEOsPGi7JO5TByss/FytsDgtw/hkHAIp0iMAU+S4KNT2jDb1TDE2xglqmvsxr
	 IkcGWqzfgvTy736+M2bIUwymDOBwTu0X7EvSec0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7BF2F80580; Thu, 13 Jun 2024 17:51:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04BF5F80724;
	Thu, 13 Jun 2024 17:51:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D0FF8020D; Sat, 25 May 2024 15:32:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A219BF804E5
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A219BF804E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V7eit6iH
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6265d3ccf7so207803666b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643697; x=1717248497;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVTf+ORIRGYRpXo2GEU5zQOEzBOgFtModBKMJI7KIkI=;
        b=V7eit6iHhzRVD4LHO8ZKR+VO9BCUCEu1kG64xIYU8/rgbSvOK0ORJm2stOxFX73oTf
         lumZKM/OGllujDyFEVyDYsSy4+pfK3M8p0PAPmaOR1f23p2j+M9imQn3KUehcsDe2gIv
         FS13U7Iw5NEnUqPAwSaqWrhfuMLwymFIGy7DY5jIyh2SV5/H51R8Ja/tNCAc2ZWwuMgw
         6rV62X3movm26YEd3AQ3BMG7v6Wnea3wXJArK7nfRYQj5WlFb6dQmmkCTHaeTJLyUc43
         +kNmIt626qKDMVKdqTVAlENKpqgC5CgTTG+X4pZq+HZdrdp8I0MUMvgPJS41vCyP2d7K
         bbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643697; x=1717248497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVTf+ORIRGYRpXo2GEU5zQOEzBOgFtModBKMJI7KIkI=;
        b=B9Am0SsiHzMMFHQhCUWfx+srxTJeI5zDFtqErAWHHaoH5SgimXNcBP3x/h+yt3hdt1
         0LOwhlh0HnumFmDhIDkonXSip0s2Vpj+4PmR8XC5ozFP59fQIQzBe00a7J03f3ww3Mc6
         p0lr0c8B82JWc3YHa7GHENviE25Q/tkthoUTTs5fdtXmPW80iyOB596iC4nJhBGk21KX
         gAhgGlnV53fBST+/HUuS3q/2VbxoZEwy9d7HTfQA2lfUVqVZtBsL2vD2gnrH0GLIKUQI
         vyCg3WtK/npG+DM2nMrGOzPQI39aqPIe2tTeypyDDtuBJr/3Cxjxj7RQzflGFf070ILz
         bE0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTsiTfaIvDDUbahdzgcIC96Lrpc9XhzwSdrybduX5Ecn8ChH1ofKRnr4zoWDPHnOdQz3efD5kNKVuusgDCqfjwIjJcbEU7AR2LiCI=
X-Gm-Message-State: AOJu0YzvSyMISZ7PpJv0anLuGLey1i8QhL7yAvirsMN8r146xD3mf68Q
	Kt0CZNLo2EqxLuzLrodGq2Pj2NMWDLIe5f4jGmVWeiNe68SCNMpSitq3bA==
X-Google-Smtp-Source: 
 AGHT+IGKy/nfMumZ+piDk12ki5yLScoDlP3w4SoUDbj6/OPTWDEjPeyHUakIPs5ygv6O1U2HHNXMYg==
X-Received: by 2002:a17:906:6d95:b0:a59:bbd6:bb39 with SMTP id
 a640c23a62f3a-a6264f0ebfamr326678866b.55.1716643697033;
        Sat, 25 May 2024 06:28:17 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:12 +0200
Subject: [PATCH v4 8/9] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock
 to WM1811 codec config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-8-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1280;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=9NhvL8rRJ4NpIlfmWPhGyv2x7+JR1l7yy4pYIQI11b4=;
 b=C0ynPtHNYmis/xfQ/wB1ZfG8JHLYQUqSEjR4rYX7GYbMQmbw4YCAxg/2J5P30kp+52wjTF7+8
 rsbM/TdIWdzB7cRXlBvMytyyjCrEOlBBw5psPJJ9C8szKVM66+8pWU4
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JWGOKO44LSDRZGBHF477JEUXVICQAKXS
X-Message-ID-Hash: JWGOKO44LSDRZGBHF477JEUXVICQAKXS
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:51:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWGOKO44LSDRZGBHF477JEUXVICQAKXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the schematics, the MCLK2 pin is shown as connected to CODEC_CLK32K,
which is derived from the same 32KHZ_PMIC clock as Bluetooth/WiFi and
GPS clocks. 32KHZ_PMIC is connected to the BTCLK pin, represented in
mainline as S2MPS11_CLK_BT.

Add the MCLK2 clock to the WM1811 codec clock property to properly
describe the hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split out from "[PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3:
  Fix up wm1811 codec config"
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 8dc81112172c..47e9a230f2e8 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -529,8 +529,9 @@ &i2c_4 {
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
 		interrupt-parent = <&gpx3>;

-- 
2.45.1

