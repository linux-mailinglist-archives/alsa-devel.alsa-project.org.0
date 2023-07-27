Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AC765E80
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 23:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB36A828;
	Thu, 27 Jul 2023 23:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB36A828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690494883;
	bh=2DV18A5LAIbHOz8+4mF5Dz/H6ijYF+f0DqJHiw+O6Z8=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ai58jAiH5RRk2CI2OZ11D30d06cOCoil7f5KJ8ugcGp56rKH/87VYaCE4H8nuRkSR
	 Z1qNCZr4ZCy3VV26fcy7RvpBe91nn4JsOxQvSh0fryeoC4OuZnPZG6q/dk7ONJ4D5Q
	 2iNEBJylWOO1cm8SYmyCtFH58tG/t5av1DQDhNbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E23B2F80310; Thu, 27 Jul 2023 23:53:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F8CEF80163;
	Thu, 27 Jul 2023 23:53:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07E98F8019B; Thu, 27 Jul 2023 23:53:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DDDEF800D2
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 23:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DDDEF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=YRH0Rand
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d1ef7a6abacso1239371276.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690494814; x=1691099614;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+IrV9GMRSdZPt30c7KcILm3qep9zKx/623+6CGNnSZI=;
        b=YRH0RandNbmWOsNbix1juf2j32ITK9Uvj67kgr3R72979X637zKHH8KZguOPLopzPy
         fjkQbcWwTfMo1Hqb4p+zc/kFemN21RJ6rTyJtcMQ/oEKwjHKIFtmzqeJZgnBmRq/79FF
         Q1T9puk7xzNEdjIV/igXmV4UFIlev2+Onajgaupn8iFIWwD+LDMaU7Rqh6Y/qZ8WNZcQ
         EbYgsmXlOOtwiPgFmIy/5TsvUTsSImKFRVPRiBPAtXKPd4wWKkCURJYYWadAtcEjnXsQ
         ZCgI9IcqtCntKz8lcvSlVTtTRikw2cRxyKs3v6SBQpDYBNM+kCas8jJKyEbxblWbQEXw
         lu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690494814; x=1691099614;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IrV9GMRSdZPt30c7KcILm3qep9zKx/623+6CGNnSZI=;
        b=G85OY3GZ9DyKVlodFFuyjnmg0EdkRVv6rn4VIQ539e1xHJG8kgIvak4vH2PSa72jn1
         1GFzoODJOX952pB9DQ44CW8oXGiwT2URfNpr7/UrIDen4upu481eeCMF7VRYbRhmLod7
         A9Kvq7SKlNDwGrZRGyrNTiHBYwC/ByuZBPlX/LexGJZ4OF3hD9FL7Sm9nZ9bFVk+3A+Y
         10JtXnZLiHqvB3Dya5ctdeAy9SUMmiMCPcBm/UVg63MrKtI1xVu9zCG2FMkBYWgnK7Jk
         ZNpa3Nm6fcEaW8Ht8YsuuZ4k4r7RNeBI+MbSxBbSYtQmadqyEsq/Z+Cjdcz6mZ5kfp8j
         WuzA==
X-Gm-Message-State: ABy/qLZSIOKzQZYJhky5D5YZ0zbKijIhanMl+UhtFhhj52pjAmoYwoV/
	wpS3Nl9hRgCFSS1ZoVQaYjZgPgO5CdPQVcu/zQ==
X-Google-Smtp-Source: 
 APBJJlHXF3DAQ7oQ2+0tdvzkYP1VoY7GsOUMjOE+/Vdzmdw/tfkvYZ+dZ1a3XDRmAV0OnKJAbEafFAFp/DwKM5StMA==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:ab13:0:b0:cfe:74cf:e61a with SMTP
 id u19-20020a25ab13000000b00cfe74cfe61amr4397ybi.6.1690494813865; Thu, 27 Jul
 2023 14:53:33 -0700 (PDT)
Date: Thu, 27 Jul 2023 21:53:24 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFPnwmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDcyNz3eL80rwU3YrUPF1jS4tkS0sj8yTjFAsloPqCotS0zAqwWdGxtbU
 AfC3LdVsAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690494812; l=3106;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=2DV18A5LAIbHOz8+4mF5Dz/H6ijYF+f0DqJHiw+O6Z8=;
 b=vopO06Wm0zYSnDpTC9r5I+EsMsCZYRVtZWxLb5Dfivdpz4dFnQc4/MROOoOi/9uBOTysUrbZO
 B8mJVXUSQDcCy59jXa+eGsPlPBt2oonSrkqDfkKPfBHRnmLmfyW1zgm
X-Mailer: b4 0.12.3
Message-ID: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
Subject: [PATCH] ALSA: xen-front: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: SLNOJR4VNIDVRVDUQXL2UL6J46Z4ND4U
X-Message-ID-Hash: SLNOJR4VNIDVRVDUQXL2UL6J46Z4ND4U
X-MailFrom: 
 3XefCZAsKCmQLWUVKPUVKVVIQQING.EQOCNUC-FGXGNCNUC-RTQLGEV.QTI@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLNOJR4VNIDVRVDUQXL2UL6J46Z4ND4U/>
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
`pcm->name` or `card->driver/shortname/longname` require this
NUL-padding behavior then `strscpy_pad` should be used. My
interpretation, though, is that the aforementioned fields are just fine
as NUL-terminated strings. Please correct my assumptions if needed and
I'll send in a v2.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
[3]: https://linux.die.net/man/3/strncpy

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/xen/xen_snd_front_alsa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index db917453a473..7a3dfce97c15 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -783,7 +783,7 @@ static int new_pcm_instance(struct xen_snd_front_card_info *card_info,
 	pcm->info_flags = 0;
 	/* we want to handle all PCM operations in non-atomic context */
 	pcm->nonatomic = true;
-	strncpy(pcm->name, "Virtual card PCM", sizeof(pcm->name));
+	strscpy(pcm->name, "Virtual card PCM", sizeof(pcm->name));
 
 	if (instance_cfg->num_streams_pb)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -835,9 +835,9 @@ int xen_snd_front_alsa_init(struct xen_snd_front_info *front_info)
 			goto fail;
 	}
 
-	strncpy(card->driver, XENSND_DRIVER_NAME, sizeof(card->driver));
-	strncpy(card->shortname, cfg->name_short, sizeof(card->shortname));
-	strncpy(card->longname, cfg->name_long, sizeof(card->longname));
+	strscpy(card->driver, XENSND_DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->shortname, cfg->name_short, sizeof(card->shortname));
+	strscpy(card->longname, cfg->name_long, sizeof(card->longname));
 
 	ret = snd_card_register(card);
 	if (ret < 0)

---
base-commit: 57012c57536f8814dec92e74197ee96c3498d24e
change-id: 20230727-sound-xen-398c9927b3d8

Best regards,
--
Justin Stitt <justinstitt@google.com>

