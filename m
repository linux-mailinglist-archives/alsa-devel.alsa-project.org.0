Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB62CA3B9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:24:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 414ED1795;
	Tue,  1 Dec 2020 14:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 414ED1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829093;
	bh=a45LvJEi5yUW32woI20swc9c1EFIK39Wx3AULm3q9Eg=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aicwM9Tm6inCz6naiRdRrgTVzeinrqS6tEOKCTpJdVGAAmJuCjXnyb2vvesqTZeyB
	 Q9NTudo6hPCIp5ldWWwKJP3nVLNXW4hPOrHistSfE5x/YPZ5WhlZ7aZG/Y2ERgeZD4
	 UzHeecIC8r5wcXLuuyoL3zK2nkhR2idWP9jPle9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 455A6F804C3;
	Tue,  1 Dec 2020 14:22:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90106F804CB; Tue,  1 Dec 2020 14:21:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE8FF804C2
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE8FF804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qhSswhsb"
Received: by mail-qv1-xf49.google.com with SMTP id b9so1176457qvj.6
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=YyZbO8wYD/ijX6J9aI2QPdV/RaONINl7Yn5VzMFPwgs=;
 b=qhSswhsb5wDbOnx0jXyVTTfaskMleFUYxkVHhnA9N9GSk3jQa7UeQH5JGLLxlknO4K
 8fu68I7CjvSL1wEEbqT5kvqAn7C0hZ1ui9Gk94IdyKXDKxacmGq1dldjyswWiwPH8e57
 L4W6tyM2MLZni3u/MqaQJmrP7LYHAzb04Nl6TxJ6dbYENJh8W1l6awrKJu7F6OJgJXxu
 GCh4DqzcyhYdLZ0qCB6aedC2OOA1/1RWD5gEH6rEBhFHYEUm2AajuNPCnIVluefj60tg
 FHZXz6C6zMm7ECSfI832JJfpcDmYvNIiIq9Y6iiU8yvrwVm+v7iZ8KYhja3MQLXk4d4g
 C5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YyZbO8wYD/ijX6J9aI2QPdV/RaONINl7Yn5VzMFPwgs=;
 b=IC2uLjnc9dzoAjK0QnQ3sqazxA5srmI66VdVRHmTeqccNMoODCXno5fINIRWPN+Mrr
 thDkW07rpYYTduVWPP7xBdYua3HkMYJeB6Xy/Bi73rs9YZ9D7fOI0HZZmyYKLsln61Lh
 CDn1Zvix3ah2nM+MyAiSkod8AOjCOm+JwXp3ud7ubFTnvF/mNmDy3Ms3PR9POQnhD+U5
 UClZ+QLYmqlgc8rtqIpvbWdr6KBrHR+zHNgtiGLRcs1rzFXNWScleUgJn3AH2qQtE9vI
 xukAVLBoPpV/zJtSADr47gtWz1xy4sPitOqY8cHbMtuQ+hHZPSfA9vCm4Tr2p1P05gQK
 WgYA==
X-Gm-Message-State: AOAM533chfuC5mOQDBDprCnI0XWQuBPDPlrUpWbFu9u7g1tr+ph2ZDXt
 /pUlUxr+VI0UZte02UQZzn3L+FO4Eo5C
X-Google-Smtp-Source: ABdhPJyFormI9mXL0Q9+tuUktIe1//4k7zlvsdy1O1P5VnktrLLfnS+pFrKPRDJWwXkeJeyOnp1bePZQBu+Z
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:40d:: with SMTP id
 z13mr3035612qvx.60.1606828911769; Tue, 01 Dec 2020 05:21:51 -0800 (PST)
Date: Tue,  1 Dec 2020 21:21:24 +0800
In-Reply-To: <20201201132126.1676005-1-tzungbi@google.com>
Message-Id: <20201201132126.1676005-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132126.1676005-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 4/6] ASoC: dt-bindings: mt8192-mt6359: fix typo in the example
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Both driver "sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c"
and DT binding property use underscore version compatible string.

Fixes the typo in the example.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 342232a61cfb..b336a42bbb16 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -31,7 +31,7 @@ examples:
   - |
 
     sound: mt8192-sound {
-        compatible = "mediatek,mt8192-mt6359-rt1015-rt5682";
+        compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
-- 
2.29.2.454.gaff20da3a2-goog

