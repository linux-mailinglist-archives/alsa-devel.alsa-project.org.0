Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05234315C6
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 12:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD63189A;
	Mon, 18 Oct 2021 12:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD63189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634552278;
	bh=HYj1jYjokVkyDUWrSB4eWba8JpWj9bj7k++X4tFJVkc=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XSs/vcyTJp4QpAJimteeWRRUExzJohA2zLMMbb4oVdDGHnAdV5ehvFWQr6/Iw9pXa
	 lqMbmglpdVZ3P6A8SAcfdPwrFsO6WP1RPSPrjnF6OvDEBkvRP+RsTGTpd/ZMNej33e
	 y6bt5AUkUiafXIS1Rpa+eif19tESs/UUfsWfKqH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF8EF80159;
	Mon, 18 Oct 2021 12:16:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 295A6F80224; Mon, 18 Oct 2021 12:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CF88F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 12:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF88F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gocHWodp"
Received: by mail-pj1-x1049.google.com with SMTP id
 m9-20020a17090ade09b029017903cc8d6cso11648238pjv.4
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oY7miojajBsvdF3HUMaS1feE4pIqN0wiCXEms77CPnU=;
 b=gocHWodpj1y3RO74fcCC1l5rTkjYEX63jbzk4uPVGXLoZBssxTA641D0KRQ7Px6ol7
 Uy463QdXHg2f6fow9IKru0iQZrSPCHnLYpcd8hfQ2zKWIzPRdMEf97R3oOcvTNeApZGb
 ZzdhjXQPNBdXqnn7nrPFJUkaN2UFpowkQ/FACzdsdeYa0xS1QN7y7t5SQAu2MVk8QvUo
 YTiwGQud5dfd6G7YEOs7Hj162ebHr9v6GPL1J3ctY1m9Gx0I42JV7HOnIwYa06PYCmDp
 uW8N/ele3Gt1rYLG8Pye2O/ZARSZ0z2PBl7BSG1C4e0Ln1ISfiBeRg7oQSLo/DGfl/DC
 qw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oY7miojajBsvdF3HUMaS1feE4pIqN0wiCXEms77CPnU=;
 b=ZLoEgB1ldslzlE5Gamj4eYzWyZ7Lg5y9f7NJEk58YOmisrb+Taqac+54eoqWHnjh1b
 /Qf9U1L9ZoGfqzIxwtmbXBdNzNJhshm/LS0u+nUkUbvhw48GnO655SdhXE3oYyuR0U8b
 S/no2+AE9YQ+LDHlAU8xV9wUJiNjn3CJMgFM0AFqS4sgcauC9umApjRUQKNIiPWZ4aKi
 KIw82rSA3Z4UUV9mkLuAPMz7zVo6QiM7JNScleAFMfmGm8y8UjdinQejVv4I9/FMadCK
 2wM2bnEkRsvfKZlPYEkO6XCj6eolKsQfWr8GtpO6/GUnqW+fkA4fOiiuEcwdHBYNInnJ
 97AA==
X-Gm-Message-State: AOAM533GnaSXluQxr3FPVKXV+pNup7zdWiahufwJb62FS3Uj5t3Pk+du
 CVyM48o3S8QJ6WZFQkaacmQc3FvtOgzT
X-Google-Smtp-Source: ABdhPJxVXkwD7Z4p19zoY0d6mrWKkV0hcUjQUx0QD9KXka6554CXjU42fH+hYE1xRvsAkQZcAaWr6WHqk0Ff
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e23e:fe98:6410:7fad])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:1d85:: with SMTP id
 pf5mr31883714pjb.64.1634552189741; Mon, 18 Oct 2021 03:16:29 -0700 (PDT)
Date: Mon, 18 Oct 2021 18:16:08 +0800
Message-Id: <20211018101608.3818840-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller headers
 in DT example
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-watchdog@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com
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

Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
constants into common location") moves the reset controller headers.
However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.

Renames the DT example to pass dt_binding_check.

Fixes: f07c776f6d7e ("arm64: dts: mediatek: Move reset controller constants into common location")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch bases on next-20211018.

In Mark's tree[1], the commit f07c776f6d7e hasn't shown up.
In Matthias's tree[2], mt8192-afe-pcm.yaml hasn't applied.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/

Also, I am not sure if the commit hash "f07c776f6d7e" would change
or not after it applies to mainline.

 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 5e9fe067f440..7a25bc9b8060 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -74,7 +74,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/power/mt8192-power.h>
-    #include <dt-bindings/reset-controller/mt8192-resets.h>
+    #include <dt-bindings/reset/mt8192-resets.h>
 
     afe: mt8192-afe-pcm {
         compatible = "mediatek,mt8192-audio";
-- 
2.33.0.1079.g6e70778dc9-goog

