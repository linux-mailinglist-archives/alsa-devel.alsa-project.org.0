Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04029CC8ED
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 11:03:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96AD9169F;
	Sat,  5 Oct 2019 11:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96AD9169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570266198;
	bh=dgMBczG8n4eX59NRcsNeTAzspGgIHXeUjDFry49lhoo=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PepahN1Ytfgwn3BfQYDixgGRVNpp5SF3FEF63j3ec6aUl57yiuAv/IzwB6FHSVP/P
	 GqbbMmhqPF14zncO030ijJNM8NYSISi6W/sIxswyX3+b7sp/Byli0Tcfu9FiG2V/9s
	 gf5700S8nX7BvUauGoiOMmgMo7LaqwBYIMmJ2q5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE692F806ED;
	Sat,  5 Oct 2019 10:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28979F806E8; Sat,  5 Oct 2019 10:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6772F8067B
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 10:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6772F8067B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="UraZicHw"
Received: by mail-vk1-xa4a.google.com with SMTP id 63so307183vkr.23
 for <alsa-devel@alsa-project.org>; Sat, 05 Oct 2019 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qa8lzqL1R0bb0ynaHlYSrIGdb8PV3M5EMBcQMQXD2v8=;
 b=UraZicHwjCEtlcAcIlTe6U/OCfDrPJuOUT15Bs5ywid0E9tY6/NA6zYE6ek4sII0+V
 ZH4WsO2y2mQ0N+zgfx6xzFBEDbWCXLtjTyY0CyMYLt2U1oqThRk1YPVgC1/GMRVMF+aK
 7Ja6+J3vzQk4PykixTC5Lm1ETCss7R/mqN5Q7+dBmBbRHQY3EOlcvwIZQ/5UJdgQM8d1
 l/6RZibDM2z4E3W64TNi0jDw9ioFQ2o2pjmYtpe1/MFNkQ/7tnp5zjWmp9wk67/PFoCA
 gH6SCJscRPCYyuXtg+f5Nhg9WZ4sXGie9oJqM/+tjya4DUOXp3Y6BHbEM1WvLF/KMPjh
 jVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qa8lzqL1R0bb0ynaHlYSrIGdb8PV3M5EMBcQMQXD2v8=;
 b=ZzLDq4f910So2xpM1TgFiWI5S5XLdNke+nl6P0vwldJTL32G4FaWmXFPEmrGd/rXHu
 qJWU3/w1t3f9NVy5kSZS0RgEPUEA6os+rqjk5Ohn/yrI3Fdkwyi1QWff4buAk2l0m9dD
 bUIPtNRf8DLZZ0cqPhvranOczVTZoAUj8cS68UFDN3MvDkH7AmVmrg+3mXf9N46HIZKE
 PucPQvxfsNRDHGMMKq0H00u0rm7lRlI4ZbRyfFV0SMuyL9Ufof1uNB6hCbSmfbP/hra6
 z9kePWtdPLqMzNMP7X1fnSuaUhiBgls9NYgtgtiw5B4Yxn/aZQthNPIXnP88cptZSRzL
 /Erw==
X-Gm-Message-State: APjAAAXPUlgkxYPxAbsLPWlKiiLUZ+wNSRTp22TrLuzXpR51+CVNf0eh
 n10+xFlGQeXNirNjoUQfF8o6O5y2nMm2
X-Google-Smtp-Source: APXvYqyjwL8MOE9N8yRaRWFpyHtPJoChFMKlMx/LTpE0kY6mCotQO59jomg21CrtUgtdWcFZQ0TtiitA4jKg
X-Received: by 2002:a1f:4342:: with SMTP id q63mr10068217vka.69.1570265770569; 
 Sat, 05 Oct 2019 01:56:10 -0700 (PDT)
Date: Sat,  5 Oct 2019 16:55:08 +0800
In-Reply-To: <20191005085509.187179-1-tzungbi@google.com>
Message-Id: <20191005164320.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
References: <20191005085509.187179-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v2 09/10] ASoC: dt-bindings: mt8183: add
	ec-codec
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add an optional property "ec-codec".  If specified, mt8183 could use the
"wake on voice" feature offered by EC codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index 17ff3892f439..decaa013a07e 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -6,12 +6,15 @@ Required properties:
 
 Optional properties:
 - mediatek,headset-codec: the phandles of ts3a227 codecs
+- mediatek,ec-codec: the phandle of EC codecs.
+                     See google,cros-ec-codec.txt for more details.
 
 Example:
 
 	sound {
 		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
 		mediatek,headset-codec = <&ts3a227>;
+		mediatek,ec-codec = <&ec_codec>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
