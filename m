Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04370E786
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C8F982C;
	Tue, 23 May 2023 23:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C8F982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878039;
	bh=Pvp4KZgvWR0NVecv2rJGwdGy4xEnwiRrFQgh2H/zL7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kM5tshX3gVNOV0+MJz+5lugnSW8Czbu8ZhnkH0TYGl1JQuCBkxNXApAaPXdDw/DFi
	 dyok+vB1XiAELXPVBCt8F1/ZXVcSPcUmNB2qhIdoHbGOytApJULQLArE0V/aUYojZ4
	 1xCuK7Ad8jiXQ2Yd7oJv6AO2wEWm7FziUX2Rccjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D1D2F80580; Tue, 23 May 2023 23:38:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D6FBF80570;
	Tue, 23 May 2023 23:38:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6475AF80542; Tue, 23 May 2023 23:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 770A5F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 770A5F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VP2eYu0m
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-55554ab909cso166019eaf.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877913; x=1687469913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTtNHswnW0p7Ai5VHBQqwpfovct4y1t2cSckR4RYhYQ=;
        b=VP2eYu0mYZKLNe6VF95IV1KSztQTFzqKSR8AAUZeDFp5sxJD+S8uJIWxaRpTWI8as5
         YKICteRTItw9ONjGEZ8cQSCOqnHAtaC0f9eiqiPWlngdK+tO5lnAbJl396V5Oo5+dscx
         HBPl8ojxNaF8s9lBQS+3gZDAz0Ztn2MdhDHoHSIQ50qz0Lpw2YC7dNU8xo/y+ON+j5Np
         7Ya/ro0fBpN3Mb171bOJlzxnAMovpik89E4/cGFr6qucoYAVojUcbT0Vm58iDrAKZ6JD
         Ixg4Ftjo+2t9vy6I7lN12D7rfT21LH9VHZQ0I/rd9w/5Ao0nPlTmgoH0dNDoUBdQ4KrI
         gfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877913; x=1687469913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTtNHswnW0p7Ai5VHBQqwpfovct4y1t2cSckR4RYhYQ=;
        b=Lq4sb2m2b682uPbK3pqVa3Fntg+2Bx+WodZBqINTQNZY2hdSYetBWTJcyMQflb9S3T
         MajVP27ms4BviLnIFR6jdpg0YyKGILrthQwQqreV7aJWx91K7nw0sC1aEgF1hH3t+ffd
         7qEOGc7S/mhOHJH2KhQk9HkOT8xzDFdExEBECOj6MGDL52MXmL0N9AMwvlZ3QtJgfjr8
         3ImpUnJiA9gEAur9kck53yG/3oO4uusgsR6NrIpf9RjOM+O3hGKbgJ+9n2xthbxpEYjg
         zMuRtQRiYD1NN75dT5bZ+3339mLCPkLWChg8jhwQrETNb4KDMOHrOo8n7aQysOF9s36X
         IEuQ==
X-Gm-Message-State: AC+VfDytbzDrLBbp4VS0PcJ1oc36RCMmtlHQ1S8a1IW+7SwzDAbST+fn
	fS/M88CXvvTzXwaUTE94W34=
X-Google-Smtp-Source: 
 ACHHUZ4UHIvVwq9NygCAysw98QAheITp2cCaku+r4NtfRdiUslxK33f+rgJpUGnfmnmvQjEyKq2TcA==
X-Received: by 2002:a05:6808:5c5:b0:398:342a:f491 with SMTP id
 d5-20020a05680805c500b00398342af491mr1452917oij.34.1684877913521;
        Tue, 23 May 2023 14:38:33 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 y83-20020acae156000000b0037832f60518sm4442359oig.14.2023.05.23.14.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:38:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	zyw@rock-chips.com,
	sebastian.reichel@collabora.com,
	andyshrk@163.com,
	jagan@amarulasolutions.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/6] arm64: dts: rockchip: add default pinctrl for rk3588 emmc
Date: Tue, 23 May 2023 16:38:21 -0500
Message-Id: <20230523213825.120077-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523213825.120077-1-macroalpha82@gmail.com>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7AQLJWFVSEQOUIYNBGBC7HC6HTBEHIO3
X-Message-ID-Hash: 7AQLJWFVSEQOUIYNBGBC7HC6HTBEHIO3
X-MailFrom: macroalpha82@gmail.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AQLJWFVSEQOUIYNBGBC7HC6HTBEHIO3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add a default pinctrl definition for the rk3588.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 657c019d27fa..571cdec24a66 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -1187,6 +1187,9 @@ sdhci: mmc@fe2e0000 {
 			 <&cru TMCLK_EMMC>;
 		clock-names = "core", "bus", "axi", "block", "timer";
 		max-frequency = <200000000>;
+		pinctrl-0 = <&emmc_rstnout>, <&emmc_bus8>, <&emmc_clk>,
+			    <&emmc_cmd>, <&emmc_data_strobe>;
+		pinctrl-names = "default";
 		resets = <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
 			 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
 			 <&cru SRST_T_EMMC>;
-- 
2.34.1

