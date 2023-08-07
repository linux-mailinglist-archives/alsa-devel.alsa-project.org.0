Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87297772D46
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 19:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2515826;
	Mon,  7 Aug 2023 19:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2515826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691430642;
	bh=xdOHWoLsICV7kUxr/6xDknStuYMXv78lIRyu9paMiP8=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Hw/NPiJqzVya1DKd5L9GBoyUrT8QYfSfzzDuqAxKquSumISfyGePRJ0vgKwP0OxwV
	 yxt5C2V+B3tzHKSVVngcTxiZ8ynbf7aTBmfgUQx4nGi5OSq7xdwDzMarWxW48R9TIX
	 4TvtUFHzm4XwyJAB8AqzIckrkLLVQx7G81Wgd7Xw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E909F80520; Mon,  7 Aug 2023 19:49:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B75C3F8016B;
	Mon,  7 Aug 2023 19:49:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28B56F8016D; Mon,  7 Aug 2023 19:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 328B7F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 19:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 328B7F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=VYtva0u1
Received: by mail-ot1-x349.google.com with SMTP id
 46e09a7af769-6bc9bb5019dso9367930a34.1
        for <alsa-devel@alsa-project.org>;
 Mon, 07 Aug 2023 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691430571; x=1692035371;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lvTqsAuYDg6pJiZTtB6ZMlYo7Jtn6FS/cj5mVT1Lh+0=;
        b=VYtva0u1UQj3x9ZSO1yuqxuAHrjmu3o+hHzAmbTG2LG3SW2I2x4Ahm/h0/boF43ElS
         R0NKeHmz2vFckrQPp1dqMkPRx6riDwxHuE7ZyWa3TrfpFB6ZTRYgeIqvZn/epGrEnuIk
         AqaGb2CAHARkz1eTMLvLPSvlZJiXdeKgtc6QDIbwbUdN+tcDmkD2QmCYORDCqaZ8TM0p
         nHoNrvHy00LeCE/OIBaB8xqpf3NbTvh+USGgky0bv85rwQTXy1mBcPYn9j7AMZrFQauP
         ce3GruZFlczh3rr90Z/gYYsqoV4dzqt0jUBTja+enXD/QUJSETU8FXP+RCGEffwzv+nq
         xzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691430571; x=1692035371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvTqsAuYDg6pJiZTtB6ZMlYo7Jtn6FS/cj5mVT1Lh+0=;
        b=MiTuh17GwyJuWJsnGR0IdL3s9lDZEMaCpxKhyDPAKkHF4i0rJkg21+0owiaOZfwfYh
         ZpXraK1XMFxRPdWWpZJvMaNzFNBUhZ9xdkcar+O7PkU6zPt3dPTl8zvFJXSnZ+do1Z6H
         PtQo3Pfyl5Jug5x2H39MRKkc+YKdMZkkSMYoGUEP/sHRUmqGA9ntO0X4zdrTNPrnX/0k
         b6Vl/GlmrRx6P2hz4LpoTRv1UfErLp1vvM9zmJn59d4wNOKxbezxg2m7jJBYmU1w7wAd
         LhY5ZTInAfxQ4YTNCG0Pmhddiqhj8+vup7zyu3rtVFC9E5wyqw2d0j91sqejLUVvolIS
         rGWg==
X-Gm-Message-State: AOJu0YwELqhhAHuNaAkkWSCxBnav0+dF77IQCJYPMDXg+p7jDheSPklE
	B/J7ZWsluRQvx0I4PKXqPHwHqp0o69tmIIYBOg==
X-Google-Smtp-Source: 
 AGHT+IHn3JrxBCkxtBRwtWs4Y+KDOf5zBeJmbUjMvvC7zoFNpobgh85JmBn1m+oRFaKQ1C0WAv0im5nnt94mQPvwOg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a9d:7c95:0:b0:6bc:b75c:f32f with SMTP
 id q21-20020a9d7c95000000b006bcb75cf32fmr11241444otn.2.1691430571266; Mon, 07
 Aug 2023 10:49:31 -0700 (PDT)
Date: Mon, 07 Aug 2023 17:49:28 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKcu0WQC/x3MTQqAIBBA4avIrBvwhyi6SrQwnXI2KkoRhHdPW
 n6L916oVJgqLOKFQjdXTrFDDQJcsPEkZN8NWmojZ2mwpit6zI4xeIvO2EnpfdLWjNCbXOjg5/+
 tW2sfnbTOTl8AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691430570; l=1948;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=xdOHWoLsICV7kUxr/6xDknStuYMXv78lIRyu9paMiP8=;
 b=tFxAj2FlZPOq0oZKEB/bIYDagN+DiU16Koww8F9rnQI1LEkVkzSsnFMSpUQ4J53g/GPHsTbiL
 jC4KhL4eV8mA93uTvIXU3O3oEwXceeyJagwD2lIK4s1jLye7qa03Wcg
X-Mailer: b4 0.12.3
Message-ID: <20230807-sound-pci-hda-v1-1-6d9cdcd085ca@google.com>
Subject: [PATCH] ALSA: hda/tegra: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: ACQHNVKQWR5IK2GDNOALOBS35DSVVGOZ
X-Message-ID-Hash: ACQHNVKQWR5IK2GDNOALOBS35DSVVGOZ
X-MailFrom: 
 3qy7RZAsKCnohsqrglqrgrremmejc.amkYjqY-bctcjYjqY-npmhcar.mpe@flex--justinstitt.bounces.google.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ the case for `strncpy`!

It should be noted that the current implementation is unlikely to have a
bug because `drv_name` is a string literal with a size of 9 while
`card->driver` has a size of 16. However, it is probably worthwhile to
switch to a more robust and less ambiguous interface.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/pci/hda/hda_tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 9d0ab043880b..f16740500d46 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -378,14 +378,14 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	}
 
 	/* driver name */
-	strncpy(card->driver, drv_name, sizeof(card->driver));
+	strscpy(card->driver, drv_name, sizeof(card->driver));
 	/* shortname for card */
 	sname = of_get_property(np, "nvidia,model", NULL);
 	if (!sname)
 		sname = drv_name;
 	if (strlen(sname) > sizeof(card->shortname))
 		dev_info(card->dev, "truncating shortname for card\n");
-	strncpy(card->shortname, sname, sizeof(card->shortname));
+	strscpy(card->shortname, sname, sizeof(card->shortname));
 
 	/* longname for card */
 	snprintf(card->longname, sizeof(card->longname),

---
base-commit: c1a515d3c0270628df8ae5f5118ba859b85464a2
change-id: 20230803-sound-pci-hda-c3a712b72a35

Best regards,
--
Justin Stitt <justinstitt@google.com>

