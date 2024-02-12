Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E205851444
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73BF2B71;
	Mon, 12 Feb 2024 14:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73BF2B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743568;
	bh=BYxMMgnfl6Vo3FvICtt90++r+JIBRmHZBJczJMyhSwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gyn3/w8fwxJ9DBqTvcBdUdpM0yM73vFU4OcrbxFfgi/F8NvCX81eaOUw93WKSWXs4
	 Iex+0cEzNefU/zRnm+lU4cEx6nmpmGw2+2XRhe4NKPKtI7ZLZfHkHhFUjP1SCCrUwl
	 mheL/29pJTpZVYFVPrKzJqM6O74BGLouiiGbHHAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E49FF80680; Mon, 12 Feb 2024 14:11:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00649F80680;
	Mon, 12 Feb 2024 14:11:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2307F8025A; Mon, 12 Feb 2024 14:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EE6FF8016E
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EE6FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YXn/FRCj
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50eac018059so3995427e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743429; x=1708348229;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqViFHK+D1LRqA6EZxzjCFX8jqipAbwRXLuah7Y53vo=;
        b=YXn/FRCjC7fFZI3i33NjLAEqmIthXXl6xAqoQk+QkRgyDR2rTdu+7kKf1tPfuiGN5E
         m4ED6eeZOD2ED+9uE2WvZ4KUmsPzD2ZFvFzjucXL3j3t9pmt9F4+MslyDnKzu6QCrg2n
         OGuP2QsCwvN9dbpCAoCC2+/Sq4aFbqhGt8kiD7TiMZqjFwC6i4nMgilb68w1cbzolkbi
         9bnptrmfv9sSl7+bWUOm9F2C8GF8lCSdFy5kdsnhhpR2c1sMyygQdPo6YLGEiZl5gfrv
         hsnPA6D4AfOB4HGzEN7rlDqG4cE77xq3SVA4/ZzrqFP/mjJWesbf9QEQEHuQF9/Gm4lC
         S9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743429; x=1708348229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqViFHK+D1LRqA6EZxzjCFX8jqipAbwRXLuah7Y53vo=;
        b=fz12TmknBD6HPixGgNhiCL24fBTPyRdja+AoPzJ3oNAxK8fSaVVpTi2cdKpcvSq6xX
         FHOkHQ+Oh/L+GKiN/lVHHVBgSF3K2Zsi4bv4FI82e38rLSBbhWkXIwT6PSKLrS0DtUG5
         UrEowoX1AZiYMO7PVSpeXgOLWmevkBlJldUYU7BYxHQlnI284gLQq4wyN+SfWXWR54Ky
         IxgHszdoeFz5mvAq0EAs/pFCGoSrzh+0ph0fnHz2UtmRcZKUhosQjeyDLXDJCx1Puc0j
         NNT6KuHI3xaJm+M+dEobmRPxGiTmu9O+duy5RbbJVDqY90OIUonBveDmn5oqY1qVsV2P
         uOkQ==
X-Gm-Message-State: AOJu0YyvAyFUwQGrwKskKm9dC5Wi9WnlndOqKeKhf+IrOxZwsN8+o/Kd
	5xvjGrYtnomX7wJiju5VWQCPm2PT+k6Qp+6Azf3o7D0QzEZZDn6XIrBsFfuVoE0=
X-Google-Smtp-Source: 
 AGHT+IEIjIjw+diayxYIeTsT9G192l7yKdFJ/iVb+VW8lcuPZDuHCAr/3pX7O0bpKKbpqT9hdsHqsA==
X-Received: by 2002:ac2:518d:0:b0:511:694b:245a with SMTP id
 u13-20020ac2518d000000b00511694b245amr3856676lfi.58.1707743429537;
        Mon, 12 Feb 2024 05:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXFrtR0Ppr2O4QZdyJXB7qGZICmVbwC7Rsf94s77wQdlGqR8ZRG3VjABkpzDKHbyAGrmol358V47jw7xw1GrngmiOx37dS5qi0CzfblGgee8jP1nWKP+/u2YsUZQEf88oWgsbOyjff2sbWyiz1Xdi0a/Z7odfUDOTMHB7rKjF56EnVW+4P0H+1uG2YK8jd8d/VQBsHFiMQ0ccvFy2JDynLKZMvR15VLFqVBl7meiEg/14OKvof3W3krdpPnJJzGsg+6ynQPo8PMxeGOZDEOKiJlhtkpaw5/u0FCzXkTp6Q2mcax3d9YgoztvEecSG93je24junf8RG9B8MDWlvvyHkOHfSr4/BjKMyT5MYKWbVf1YA3c7rkHMuIMHHF4ZVQ2UAqesgLiM7zZafZvOFdk7fWIGK6UtfJzjOK0om36TNk5WAKUH5jFk5oMQoPp/xSATSQ0l09H3o0Xjfxta0bBaD/ZI1pjKShYMq8/dUx5FLTVwtBrdbTISj0gvl0j+EofmTZ+eZwfZ/TIMfv4RwpfpdQs1C/R1iuQI+Q1j4sgjh0GNRviJv9q7eEMmHH0wA54AkgCaDcVfz1osiMvlsJLDWBJgUvMU63rm8ILcOys5zQMynWE3QObjj68b9bfVmmG8LE+CdS1mN7YEhCGPPe3dZrCuAW17uzy27QWgN5uLNLEWh3Hv/Sry5+FCaujwCnThMZqHy6QfmTH+lSrGr12ebcldRBaqxfd852DH9yfT03qsR80BSYP8HOtLawYXGHo18++xqsal+56RSzakx1IKJ7UPwkhaSrnQGz8l1PI/5kNNBKDdbOx8F16oCDysBL/Qae2yboFy3o8Ag/G0ag0oCc9134
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:29 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:13 +0100
Subject: [PATCH 5/7] arm64: dts: qcom: sm8550: Add missing DWC3 quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-5-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=1404;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BYxMMgnfl6Vo3FvICtt90++r+JIBRmHZBJczJMyhSwk=;
 b=BVfXqO9pGrNZlcLW0yoUdDXyI3lwhL79E0y5sKgoORe9P1VUu8jT9h9S437tWRb7sucOC99Un
 AjovaL1EEYHB/X+0xku+/Crr4sQF+pNyJPi2ZtBEhDgXAfmCPQHRuRd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: DJ3XEEZEWLVYPAUMK5V2KYZVPNK6MOX6
X-Message-ID-Hash: DJ3XEEZEWLVYPAUMK5V2KYZVPNK6MOX6
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJ3XEEZEWLVYPAUMK5V2KYZVPNK6MOX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As expected, Qualcomm DWC3 implementation come with a sizable number
of quirks. Make sure to account for all of them.

Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 868d48b85555..925e56317fb0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3193,12 +3193,20 @@ usb_1_dwc3: usb@a600000 {
 				reg = <0x0 0x0a600000 0x0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x40 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
 				phys = <&usb_1_hsphy>,
 				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,is-utmi-l1-suspend;
+				snps,usb3_lpm_capable;
+				snps,usb2-lpm-disable;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.1

