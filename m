Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BF1EF019
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 05:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C7A166C;
	Fri,  5 Jun 2020 05:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C7A166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591329171;
	bh=uv5KE3lUub38o0RxoE+OYT6/+Q95KB8Xpvl+f3NkxUY=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkS41j1ps9ArB5x69mmo4bAXyS5/IIl/3zNOocr89tPxi0hnswqhf3ywDs2HgWsWA
	 MICNilzeq85foRBncLtzQ+5e87Z2TbBeP5JkyTnxWWXLI7jbCNj9Yq7IPz9ojNGK6O
	 8ZMXRl8pYkVKyoPqRvBeirM6oFnms33w87oZRtyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91DE6F8028A;
	Fri,  5 Jun 2020 05:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04CF9F801F5; Fri,  5 Jun 2020 05:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFCEBF80140
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 05:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFCEBF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CKsaViqh"
Received: by mail-qv1-xf49.google.com with SMTP id o1so6292111qvq.14
 for <alsa-devel@alsa-project.org>; Thu, 04 Jun 2020 20:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=jCKvwkQZSa1fCIJgRci4SNm+ecTY7BLQ/n3YL8J5gJ8=;
 b=CKsaViqhw2d9KHrAB8tPbJOWXOsP2J7LAiZdqefwat20nJjXJoMsZsder6wp3aDa7t
 zipnI1U/z3PwikCcVYDXrkwZqGHkYxSOsHFMO1nRrBRRaw5rxn6J9oxryTzII7AzMNT1
 7zvAAHsXxMv7ahYncyzE4YxuEEJel3Y+40dKdR61r39jOPGwNprCjj9MfchBK4RiIF1s
 1ifH9c+Dri38GJhhDX9/PltRk5pmLXAbGqf3EDF8EyCEqC/JZAU9zU6R3ZVcdF3bdDv8
 XTFJbTE5/STektjUEJXGSMpVgQxWFziqhFOa+kGcGOqT3Dl+22HtSOnC8xxWEVji/XN3
 TG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jCKvwkQZSa1fCIJgRci4SNm+ecTY7BLQ/n3YL8J5gJ8=;
 b=eddQ30//irWAqTzRttgHhIZiyo9Ecf5ZoQql4LBNkhoGTgxI80YrrEPCRscK7Evl/9
 YbDlj85nQwTEf/FNbfQOhdebCgwzncTte0X+U0XYLu7k/d1TJZy+gWDmr+0EBeH56Hkh
 kmRRPc+zjJM0ZUuwmajNXgkpz0U3za81yfMx3BWFxVSENETIm6dEaEtgwZ9zeyU92Lb9
 TaMc0K/zYViQ9fF8eg+wnt9p2fA64c5Dyrh9gMPehtz/E/mc3AxN+ueb2OY5sIkfpfFg
 TveD3KkvjNBk0+6p3oI5eTSCh8DixJdYBedHlg4Gngn1n5pM9gyzGrae6+7ih0Vv40VX
 ZPvA==
X-Gm-Message-State: AOAM530B1Bum4bBAz/0aGix12Fa8q73WFBurYAXonMsBnR0T5cTxKwyj
 PMGKKNeM8nfIr4g7er/n7yA5eWtQOcel
X-Google-Smtp-Source: ABdhPJz95KhsyQun9QYEz+apHIZfhyAEfeiqcXg7IbVhQZOOg3TMrjIsXxA+nrLSiH5jnauwUMWJQhC4EBjy
X-Received: by 2002:a0c:f6c3:: with SMTP id d3mr8089108qvo.138.1591328991352; 
 Thu, 04 Jun 2020 20:49:51 -0700 (PDT)
Date: Fri,  5 Jun 2020 11:49:31 +0800
In-Reply-To: <20200605034931.107713-1-tzungbi@google.com>
Message-Id: <20200605034931.107713-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200605034931.107713-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH 2/2] ASoC: dt-bindings: add compatible string for MAX98360A
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

Maxim MAX98360A audio amplifier is functionally identical to MAX98357A.
Adds compatible string "maxim,max98360a" for driver reuse.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/max98357a.txt          | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
index 4bce14ce806f..75db84d06240 100644
--- a/Documentation/devicetree/bindings/sound/max98357a.txt
+++ b/Documentation/devicetree/bindings/sound/max98357a.txt
@@ -1,9 +1,10 @@
-Maxim MAX98357A audio DAC
+Maxim MAX98357A/MAX98360A audio DAC
 
-This node models the Maxim MAX98357A DAC.
+This node models the Maxim MAX98357A/MAX98360A DAC.
 
 Required properties:
-- compatible   : "maxim,max98357a"
+- compatible   : "maxim,max98357a" for MAX98357A.
+                 "maxim,max98360a" for MAX98360A.
 
 Optional properties:
 - sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
@@ -20,3 +21,8 @@ max98357a {
 	compatible = "maxim,max98357a";
 	sdmode-gpios = <&qcom_pinmux 25 0>;
 };
+
+max98360a {
+	compatible = "maxim,max98360a";
+	sdmode-gpios = <&qcom_pinmux 25 0>;
+};
-- 
2.27.0.278.ge193c7cf3a9-goog

