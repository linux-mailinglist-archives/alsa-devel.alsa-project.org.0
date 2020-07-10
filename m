Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04E21AEC0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7955F1616;
	Fri, 10 Jul 2020 07:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7955F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594359039;
	bh=zGZTqxNQIgbkxp05vfVNwztZfscsolCMJMQoRKHsT80=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmeiWRjabccA3R1XCs2geTM39bGyQDGg1c3vuk0SAy8UqGCurT5tqTlApuE5x21j6
	 cG/ahFpthLmhHISjOHvfTi2sOnWnQa4yNeXD/yMwbEsU9XrCFYkxMpmc0xNy2woHRA
	 uckqRgpjZ6r+hC8t/dkDGCLINh5DmXlXuspkqUFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C38EEF802F9;
	Fri, 10 Jul 2020 07:26:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA320F802F8; Fri, 10 Jul 2020 07:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF38F8015C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF38F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="maYPiFAt"
Received: by mail-yb1-xb4a.google.com with SMTP id z7so5780539ybz.1
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1jgnVvQzDsXT/ABFTj8+H2Are3uSraKIFsDEibLg2UM=;
 b=maYPiFAtUWbNvEVYCQbJ0xZgO544WdZF+qGkUgj5D0CAMiaMnNp8ukl9f8ziqkaRRX
 KxTO6PQouhv2cl/ipll0JDu2CYJbji4IsHatUzHX2N/ItDIeXvIEI2xtW1o8PRkGKzST
 naAk9HBTvAJQ0in2CLfoZAUmIkU5/Qh+Lu8IcXa58hMs5+23Fi6ea37BaVVmz001xdFJ
 KhZWDWjgMq8LsZnOor8E7vgSSv6YZhe5HGrOjj+07qN6uCGaytnHvMH9xBsLK0zCjrFC
 B3b8PkJqDFt7ZAu2/j1m911rsgdHlgimf4GL1eoKvVtkm9IAMa/pnVxnzI9AmXheYIYp
 KYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1jgnVvQzDsXT/ABFTj8+H2Are3uSraKIFsDEibLg2UM=;
 b=EgQmg898Z57hwvauRNNkZwFfDOWzIXyXfKl4JhbfCwU9NxEDaTmZTvZj86XIxQ9O+f
 bH2r92FZpv1nSwRxpCbRLhQjo4mBkWqKv78Tijr05lGEoVxIjPeTczvbV7pUw/AXY9N5
 Q/SB1DWVgGSjjdRPqpnqmiMhpuKSSndCgTXVxl6XMwgOdDXCM+OfM6KS9GpMyBRPqbH/
 zAH6ji3Qdny+ILmLwhVYkqEDWfHD57v2f2LXqsW7NA6ZeBBTWU4+1qRn6vgdjbxQaR3p
 6c82sVrGp8+UupOHd/+Kz4nVdoOO0jI42vo6NDaB3M0KXCHsPtgQUjoIzrAG41dX3Bwh
 98gQ==
X-Gm-Message-State: AOAM533x0mzpvaUjNq0rg6Atq1Bc0VuT9dJHTgF0Nzh1xpZ3ujMKknHi
 t54AvqgBOGbxxqW7qIlSUNOoMaeVr+gM
X-Google-Smtp-Source: ABdhPJyx/h8lcECiwFUQlr3JTA9UJv+40MDFq2/PvWa59T/tFgBoeQhHHSGd7vysVm70fuwLFQLRvZcyhcUi
X-Received: by 2002:a25:e481:: with SMTP id
 b123mr98012144ybh.126.1594358729312; 
 Thu, 09 Jul 2020 22:25:29 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:25:03 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 4/6] ASoC: dt-bindings: mt8183-da7219: add a property
 "mediatek, hdmi-codec"
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adds an optional property "mediatek,hdmi-codec".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8183-da7219-max98357.txt      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
index f7f3b83da630..6787ce8789dd 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
@@ -6,11 +6,15 @@ Required properties:
 - mediatek,headset-codec: the phandles of da7219 codecs
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
+Optional properties:
+- mediatek,hdmi-codec: the phandles of HDMI codec
+
 Example:
 
 	sound {
 		compatible = "mediatek,mt8183_da7219_max98357";
 		mediatek,headset-codec = <&da7219>;
+		mediatek,hdmi-codec = <&it6505dptx>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.27.0.383.g050319c2ae-goog

