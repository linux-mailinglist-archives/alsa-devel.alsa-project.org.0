Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CE765EF7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 00:10:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4384683E;
	Fri, 28 Jul 2023 00:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4384683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690495857;
	bh=oD0r9GQJcI4a0oPPFKD+f4eCazsB8WXRECfFQ/3Qn80=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iwazfRXcU607HQa4kY9/IUWYqo4OGDboowMm6Auc9vG8CRumIdiyMz2z8pSBSipay
	 sKGVQ7caauRPYjGVeW8FFHImHrxD82MXIkZLohNwr83KF/V91+4XjIbo6hBoVIKdD5
	 6c1AzmsZ7hGF9nBBHDSURVeYUBCPMsLs92FboPwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E84EF8019B; Fri, 28 Jul 2023 00:09:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1ACF80163;
	Fri, 28 Jul 2023 00:09:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86E4BF8019B; Fri, 28 Jul 2023 00:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB253F800D2
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 00:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB253F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=fE74tUBj
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d1c693a29a0so1352898276.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690495775; x=1691100575;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k4cN8fzY539FysYzQlSA0Pbs/oY5p0DEsZqLCjbwVvw=;
        b=fE74tUBj82E0tSa/0hBOCShqg7o01vF5y2SbmNJ/juHndnAg1YyQmejY/pw6orggQN
         ytb3Tzb063ewn66GTGD+efAdkYGfs4WPpu7H130YDhEbKK142c+EUjrDNvBdygYTR7Kh
         Cp/1++qI2LkJPyYq2Eg9jUbnkUI8257/3SWou5EpGsXM6+ws9j5KNwFdRsHYKtfAi1W7
         F68Mi+8DAmp7aJC8NGkqxNDy5TmgFsbM3Om90MD5TQ3w1/zPiJz3ES+hFSGi20w9OwOl
         bRr8yn1DpzQqRscRfWZBI4YtPs9FaZSWvqGPYgHdB01Sm9K4zaR1aHpu68QSa+Fe33Hg
         oNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690495775; x=1691100575;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4cN8fzY539FysYzQlSA0Pbs/oY5p0DEsZqLCjbwVvw=;
        b=gdf8k5u5JIOgIHLEZXhqkZzyS4jkecSSK81LBG3wq5XXVuW1uV6QOHPWiWh0FIexAS
         jv8xfDfEDMX6BBpd4xGnm9bZIW3kKfIxmfkwc8d9e66ZV+IdQaiUPx+Yb9NP6xGVLypt
         P7Q3dzTRF58EKTCOBbzlZERDvrmaG3TVVOSnjKHDs+SScYNmGcqVGfCuo3ZNfn6YXnce
         lgLbyI3qBS5Tt/BL9kXKQfmF69J4ereBk/xeuD5TgSFfqG5WbCzD+HkzkLodXYWp/O+0
         UC8N+yNAkLQbRhFUCAanQ5Z/yC2Ok3oF3K0ENJ/XTELeNfMLkb+G6jayALncgzxZ96CE
         bRQQ==
X-Gm-Message-State: ABy/qLZWqmZttD0DjIkDONbkY+6cAyFeWMnZK4dtaC9pfP1luU7xr73E
	C22lnqqA25jxPKW+TLIIlmf8FVtsU9oWtRgG7A==
X-Google-Smtp-Source: 
 APBJJlGukc9SZ2I7uyCQYm11/HQDHfMQPVp2DWNDs8mAqGReE456fsavrd53NHvvDfPo0YNTJ/yH8S9Sb7Il8EZ2bg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:abf2:0:b0:d07:f1ed:521a with SMTP
 id v105-20020a25abf2000000b00d07f1ed521amr3818ybi.4.1690495774661; Thu, 27
 Jul 2023 15:09:34 -0700 (PDT)
Date: Thu, 27 Jul 2023 22:09:29 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABjrwmQC/x3MQQqEMAxG4atI1gZ+6zCiVxEXrY1jNlUaFEG8u
 2WW3+K9m0yyitFQ3ZTlVNMtFTR1RfPq009YYzE5uBad69i2I0U+LHCYowPAHyC0+ML3S0+l27M
 sev2f4/Q8L8MihdBjAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690495773; l=2722;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=oD0r9GQJcI4a0oPPFKD+f4eCazsB8WXRECfFQ/3Qn80=;
 b=RMEEkMB9gj5yDuIGuIqJVfiAW714ytVo21T7+/g2zrDgaM+Trm12x329hvrQ6qpkXQkBKdNp7
 h1YTuOzeph4DYE6Y7PJqPk4FGt00qNiQKla88lXSQoet8fLsPbVG5Uu
X-Mailer: b4 0.12.3
Message-ID: <20230727-sound-usb-bcd2000-v1-1-0dc73684b2f0@google.com>
Subject: [PATCH] ALSA: bcd2000: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: JPNJW45AVVDIABF3ZBWFCFFA3NYHBH7U
X-Message-ID-Hash: JPNJW45AVVDIABF3ZBWFCFFA3NYHBH7U
X-MailFrom: 
 3HuvCZAsKCi0SdbcRWbcRccPXXPUN.LXVJUbJ-MNeNUJUbJ-YaXSNLc.XaP@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPNJW45AVVDIABF3ZBWFCFFA3NYHBH7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ always the case for `strncpy`!

It should be noted that, in this case, the destination buffer has a
length strictly greater than the source string. Moreover, the source
string is NUL-terminated (and so is the destination) which means there
was no real bug happening here. Nonetheless, this patch would get us one
step closer to eliminating the `strncpy` API in the kernel, as its use
is too ambiguous. We need to favor less ambiguous replacements such as:
strscpy, strscpy_pad, strtomem and strtomem_pad (amongst others).

Technically, my patch yields subtly different behavior. The original
implementation with `strncpy` would fill the entire destination buffer
with null bytes [3] while `strscpy` will leave the junk, uninitialized
bytes trailing after the _mandatory_ NUL-termination. So, if somehow
`card->driver` or `card->shortname` require this NUL-padding behavior
then `strscpy_pad` should be used. My interpretation, though, is that
the aforementioned fields are just fine as NUL-terminated strings.
Please correct my assumptions if needed and I'll send in a v2.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
[3]: https://linux.die.net/man/3/strncpy

Link: https://github.com/KSPP/linux/issues/90
Link: https://lore.kernel.org/r/20230727-sound-xen-v1-1-89dd161351f1@google.com (related ALSA patch)
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/usb/bcd2000/bcd2000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
index 7aec0a95c609..392b4d8e9e76 100644
--- a/sound/usb/bcd2000/bcd2000.c
+++ b/sound/usb/bcd2000/bcd2000.c
@@ -395,8 +395,8 @@ static int bcd2000_probe(struct usb_interface *interface,
 
 	snd_card_set_dev(card, &interface->dev);
 
-	strncpy(card->driver, "snd-bcd2000", sizeof(card->driver));
-	strncpy(card->shortname, "BCD2000", sizeof(card->shortname));
+	strscpy(card->driver, "snd-bcd2000", sizeof(card->driver));
+	strscpy(card->shortname, "BCD2000", sizeof(card->shortname));
 	usb_make_path(bcd2k->dev, usb_path, sizeof(usb_path));
 	snprintf(bcd2k->card->longname, sizeof(bcd2k->card->longname),
 		    "Behringer BCD2000 at %s",

---
base-commit: 57012c57536f8814dec92e74197ee96c3498d24e
change-id: 20230727-sound-usb-bcd2000-400b3060a9f9

Best regards,
--
Justin Stitt <justinstitt@google.com>

