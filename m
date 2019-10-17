Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA4DAF2E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89DAC84F;
	Thu, 17 Oct 2019 16:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89DAC84F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321318;
	bh=eHw8bycOyOSiZWbUzgscXXcb8jZdjPSUncbWdsXBhFs=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCvWFjGN1UxQywsvn9ulxRomS752zNm4B+k/vf59VQL/wXhCkhi+xCPxKPylNylWi
	 Z2XsqJ8E3alck1zF0LypXaSble1dH5WXdvYangCUzBgU8s4wWKHXF+bLAUrR8DJkmD
	 FRFNKKytlcvlDVz0b5T+i1rsmQwTeCs7a9d0TSMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09E9FF8070B;
	Thu, 17 Oct 2019 16:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0847FF806F8; Thu, 17 Oct 2019 16:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50F49F806F0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50F49F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GS4q6NIN"
Received: by mail-vk1-xa49.google.com with SMTP id w1so966062vkd.10
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8XXPJEKmRQHJ260AjlgjGDf0xJK5vMVAKae8lLscoNA=;
 b=GS4q6NINjE4xmnov9Tj1ZS/4JK8l9aGi1ykJcDV+DhEns0zPmLcnxU4YJ6gJc2Ugo3
 A2MOVp/YJUc0sSR4QcuGvH/N0d4R+2DSO3r13spwS9WCjhI3P8uEUPAi1PaT2ze0rznP
 ghjZD7kPcxtZ0A8INTl0VB/NmbEbUIPEbVnYp1uNf3rKmJIcVeBor4C0m/c36zUrn8HI
 PllDvLoHoaNTjKD7Dj/j9cfj65qLcUtvvw+9DaSQOzuXzulLyz2yjxNPaceMQERfeVch
 zqcOBFRnhvbZ+hRM944VMMGT1YZMxdXboF2s1zLnv2C31O5zH3cyMZJwNzCBOjbLgfRF
 pZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8XXPJEKmRQHJ260AjlgjGDf0xJK5vMVAKae8lLscoNA=;
 b=oGaPdEsD/kr3NpnP++jdXhFk+ezWbT6V+kPy4WuYbvdtV1cGoL42/Y1fr60M0+glv3
 Ybc+ET3bO0UWvaQP06ZuOwnZXrlHSlCabCI55BKMN3TVFrIPQDDRhOy6OlXIajwpDqZf
 HuQG1MmjBCRjhin0sfEkwy1hvARobPZh4817nhp7KpDRDAkCtRISTy/ZFsaKock5eII9
 5iOVd+c3O3Y/HXIFMQs1hou5GCeMdfoXNIJKw6dCHkQkGpEsxie6unp01y3rZkBjYcwB
 xqsG0wPnzyw+NyyQ2pEO1bHwQZTZkNbANBhfx7XJGtTW8AvFzx3Pi9moY//wjcc/0KQ5
 8Mdw==
X-Gm-Message-State: APjAAAXZma5u12Ee5ZcqFQm8U2fXp1Myf6hjm/5ZDns3c0z6xdkhUxHn
 cwtUuzBC7MioSfvOpfh8oNVlx1BMyVBF
X-Google-Smtp-Source: APXvYqwpVGe41Ec51jUiFN3Y7Lw5cwYf7xP9Z7G806scmiFjMPVFlEkaDEETTRRW6AvS2uVmHPj6zSsS1l5y
X-Received: by 2002:a1f:3a15:: with SMTP id h21mr2067933vka.17.1571320879606; 
 Thu, 17 Oct 2019 07:01:19 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:14 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com, Rob Herring <robh@kernel.org>
Subject: [alsa-devel] [PATCH v4 09/10] ASoC: dt-bindings: mt8183: add
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

Acked-by: Rob Herring <robh@kernel.org>
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
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
