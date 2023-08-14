Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AA77C2F5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 00:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF69741;
	Mon, 14 Aug 2023 23:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF69741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692050410;
	bh=/Kma0m/HdBNmCqOnMR7lPlA92je11aTwe8n3sswA/Rg=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KHF4sLUioQQk2sBMHSOqDL+ZYC72cPiSORRSe58GcP0O88Y3Ukt41GIXXJa/I9+LO
	 TeW88J3rXZhueeHpS9pZQDZMy670elCLRE/y/8dBXNtjngfB739y8Z06jrHdmDi61l
	 tZ9/HYxRb7LB40Q8a+LlDRRwakP2CVnugS5lvyr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 082A2F80551; Mon, 14 Aug 2023 23:59:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93BADF80254;
	Mon, 14 Aug 2023 23:59:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1500FF8025F; Mon, 14 Aug 2023 23:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 046EAF801EB
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 23:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 046EAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=0L350Equ
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-589f986ab8aso24706787b3.1
        for <alsa-devel@alsa-project.org>;
 Mon, 14 Aug 2023 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692050343; x=1692655143;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7+v0iX7TUi8hXK4ezowS7z03UPB+wBbokRKsGRyaepc=;
        b=0L350EquUU325cBBj1eTzGu3tEXyGVeFoQIo//7kpoLgNkhpvVf66wr4mx8QrqLIjO
         JEar1yOZEwtXsgBk0oBfEQyuxfQxrVORlDqsSjp2cSJ0pYibZJiKeSM5afFHPayZ0Fa0
         Sq+WhwLGmxZbzgAWH/69NymhUWLtKRZWGdb6acvm1JAMbnlpiIDYxg+2q45MH5EuNmWJ
         oJ7FsbI55wiuMsfdv4DVk4qNVr75c+Go0dzrLo3gsI/Cu0kSID50g33ba5F8vfj9LgUM
         kRkKbK14dZL8fLMzDqyQseUGzzfe7arAY11tDONeHHUlMNQTfmFdYnvuWmR/VGpQkRKM
         YfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692050343; x=1692655143;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+v0iX7TUi8hXK4ezowS7z03UPB+wBbokRKsGRyaepc=;
        b=IMQ7EXv5QXyqcKgiY5sxuTjaOydyB0BwvusEVL3tr4xHovKMhU3qk5+DMSRdSVJFFy
         dR1u2fJLkTtZMXnBWPvUzcFmgrlY0wxYGUfCs73qKkVhewaCksGtBp+6l0zZGZRC/znK
         yw29Prh0FoK1FU2C61gaZ+5z3XUCq6wJXKrlF9TO1KFfk6ji1KJy3/v3FCq0xBP5Azev
         +cCC+rkiHfwix0KyAFZfUuIlr8PjhdbkcN7/ui7twjirni0ZXgcF1GhTlwFIfSXCDEpj
         NkVd2YZyd6nSGBlkgpXuWZLfCSkwlvcx0yrngFOLaWEXs5Pgzg6ix96ESIKYyj61OtTS
         vZPw==
X-Gm-Message-State: AOJu0Yx483R0inWHDbMqDlEanNTn363RhbTWLVTGSBl2Q6M6NNX/aOxT
	MooF1YUgO02nL8xFllasGSaGt4uOq8VAWDD5bA==
X-Google-Smtp-Source: 
 AGHT+IE1/X4F1Yk+tRoqMPP9Haa1n3PJ07MR3kpFeBGZzmnffVq2tD3CUhozUrVMYK5V87wxO6y48G0lb4qDGmHELg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:690c:3305:b0:589:6c60:f4a0 with
 SMTP id fj5-20020a05690c330500b005896c60f4a0mr5357ywb.0.1692050342656; Mon,
 14 Aug 2023 14:59:02 -0700 (PDT)
Date: Mon, 14 Aug 2023 21:58:56 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ+j2mQC/x3MQQqDMBBA0avIrDuQaGzEqxQXMhl1NknJtEGQ3
 L2pmw9v8y9QzsIKc3dB5iIqKTbYRwd0rHFnlNAMvekHM1mHJUlATd/4LyGlwKSYP+PTewwbGWf
 Jrn5w0BbvzJuc9/611PoDJW/zKm4AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692050341; l=1438;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=/Kma0m/HdBNmCqOnMR7lPlA92je11aTwe8n3sswA/Rg=;
 b=xBHhDi4mcSlr1sHc0h4GlY4u8BBIj//mhzcKVjxHypIVM0sC61W4jIj4vp5C/DbjnfiDIyQ2c
 qFxpM+2gSL2BA2Du0iN4R9xa1TP1Ic5PCsa3aKdJslzaDOv6ZXIa91G
X-Mailer: b4 0.12.3
Message-ID: 
 <20230814-void-sound-soc-codecs-rt5677-v1-1-5c468c60fa37@google.com>
Subject: [PATCH] ASoC: rt5677: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 22BHRJ3PGGJDBSMUY4K36VHOQXVTG6EZ
X-Message-ID-Hash: 22BHRJ3PGGJDBSMUY4K36VHOQXVTG6EZ
X-MailFrom: 
 3pqPaZAsKCoUs312rw12r22pxxpun.lxvju1j-mn4nuju1j-y0xsnl2.x0p@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22BHRJ3PGGJDBSMUY4K36VHOQXVTG6EZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`match_id->data` is a void* and as such is being truncated when cast to
`enum rt5677_type` which is only int-width.

There is likely no data loss occurring, though, as `enum rt5677_type`
consists of only two fields from 0 to 1 wherein obviously no data loss
happens from pointer-width -> int-width.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: I'm not sure if `uintptr_t` is the correct solution here as I've
also seen a cast to `unsigned long` suffice. Any thoughts on the
semantically correct option?
---
 sound/soc/codecs/rt5677.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ad14d18860fc..278cb0b265e5 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5578,7 +5578,7 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 
 		match_id = of_match_device(rt5677_of_match, &i2c->dev);
 		if (match_id)
-			rt5677->type = (enum rt5677_type)match_id->data;
+			rt5677->type = (uintptr_t)match_id->data;
 	} else if (ACPI_HANDLE(&i2c->dev)) {
 		const struct acpi_device_id *acpi_id;
 

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230814-void-sound-soc-codecs-rt5677-dfc041c1a734

Best regards,
--
Justin Stitt <justinstitt@google.com>

