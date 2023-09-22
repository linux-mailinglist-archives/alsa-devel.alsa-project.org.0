Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DA7AB874
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 19:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07D4E0F;
	Fri, 22 Sep 2023 19:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07D4E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695405223;
	bh=HuMddFYgVndPh/PHwPakmOFy8JD6xsoP6JcApWcCcuU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=heU6jSe7BKHjxl1fQg3uxBK6kM1zoqpbBEv4nHS115aU4vw06lvny6jxOXUI7PJIM
	 2tkFbu1oiQp/6bqyc6rb+7zE2b8RRt8eBh0LbZIJpYCUvGGLP4uervNWyPwAvu6FlF
	 lvu2ZMozc/bly9o+Z5KYjrIeC7yGpRuGtjRjJbg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DB06F80563; Fri, 22 Sep 2023 19:52:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FCDCF8055A;
	Fri, 22 Sep 2023 19:52:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF683F8055C; Fri, 22 Sep 2023 19:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A298DF80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 19:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A298DF80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=N5dJr85Q
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27496d4e13bso1777437a91.1
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Sep 2023 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405049; x=1696009849;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4NIQNCYJbnDD0lgKwFFor/ygcTIyNapGv2KUfTJ4d4=;
        b=N5dJr85QQcYQ5/xZFQWqZqsjtEM93/S2XMBbkLFGC8FdFa8B1LmMiJFSLFY29f0gPb
         phs/ydGrajNfNH+Mbw9Rlr1Ug3ROKYccVCRKONA8LqW7mXGW4LAIs8vs2lD//D3IEHcf
         EQ4NR1+ZPb8XksHTfOkXvc12EiU4+0QbzStr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405049; x=1696009849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4NIQNCYJbnDD0lgKwFFor/ygcTIyNapGv2KUfTJ4d4=;
        b=EZW0t22VJTV/fABvt0fGB5kUTMcSjAf/Ox3+DO53oIcFEGgoyqiUS77RR7uMuH+QE+
         GIltPLb2VGc4RtQ5onpk4BX08uF/ZkeLxV7WThTcQxcKBZSKlnLb11Vh9jg5t/Yrt624
         QsTrj++0LuBtnin61nRhUX03qOQyTHYKQrLBAmV24zlXvrnv3VumyWfYEGs6IxmpdSc7
         pjjUv3lirya/Llnd9t+OgNUWjPzyTBtlQGFPA879PzinU4hnBbWyTHcCBdRNGzwhHW1G
         qmYpVqqUYyCb/ZeobbeL6peOWwTpPKX0tnwF5z2lJdyrVeAEOgAYJMLAKC5hKoY+p24m
         FKrA==
X-Gm-Message-State: AOJu0Yy2C5AoqwknhZL9kokbnqOWJGtfAjokQYg3CdhlO4LbIByDlnDf
	iXLHuyA8sDKX2A8Gx3xD88fBgqEdngojgdKH09I=
X-Google-Smtp-Source: 
 AGHT+IEJ3CwBJxHBD2S/iRbuv7h3J2P2idJlpvbN/PHvMygWYxAkP3UQVJBARQ54CmTyH8OyoBgDuA==
X-Received: by 2002:a17:90b:3a8d:b0:274:8ef2:b251 with SMTP id
 om13-20020a17090b3a8d00b002748ef2b251mr422960pjb.3.1695405048769;
        Fri, 22 Sep 2023 10:50:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b001bdbe6c86a9sm3776862plb.225.2023.09.22.10.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:48 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <keescook@chromium.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: Annotate struct snd_usx2y_urb_seq with
 __counted_by
Date: Fri, 22 Sep 2023 10:50:47 -0700
Message-Id: <20230922175046.work.766-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=keescook@chromium.org;
 h=from:subject:message-id; bh=HuMddFYgVndPh/PHwPakmOFy8JD6xsoP6JcApWcCcuU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdP3P/EpFy9NJv+1rIpzaY3g8AIW3vya14cPa
 ztrzZA921GJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T9wAKCRCJcvTf3G3A
 Ju4hEACjuUA3Cclq1k0WCnCTsZmN3Tm80FjCZ7ifVnctsIbqyFhFbiTbVnjnDmO7JtEkL1cvWTQ
 xHEXi8laitjmNKaBHHfu2ypu1K8iYnShM0cMUgmgbbUfNsOda9o+3zd5I/P46MZ6UxBv61qGB/9
 QF7uh5ORDm717e+wZRNy0W/tiCgFcuYgk7D5zf1PWjxxhPTeEgKnOsvR0Bb6GNg/kJwb8h8Gajd
 Fd3qjAW+hhzATiOhKR6jy49tdtK+UjSKjQ/nWguI4CDUNxxuxPrwFKggQ70hYDq1OBGWxbB0JdV
 8HaDQ3DhV6K9s8ixCvSo7/fk4fgPmgDX/iOQDw1E3Hw2zqZEz/NPYD/krvJjEMW3u0Y67zA5skR
 6VfdwxqbB/JdcJzfHas/Ta7pnmVimqc33zCL3AfXYoaNfG/HEgkOh28LWC3s8Wbacw9xQJRiYZX
 c82DKjSa75L6+UuneQdqQkQNS0AF7e1vXihoM07z3R9OUrhZ6qIjTxcHumTEqidVCpnZ+SMtZMs
 8N5biPzcYek87DYprIaESzg+vozpm/gY3yCTjY97bttJu1+6XyrgRKzd+HzPU7O5NguA6EbVURx
 kJUyBIAAJ8wAnWE0FViQaWfHgUGxfxyWoKd3Cq/NE36UOD+hKW1YsNpaTPyxENYPX3oVB8DvWCl
 MKaM/7M RUQvz/lQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YIERIZIZVTPQIW2MQRATHJMHEUMUTEEE
X-Message-ID-Hash: YIERIZIZVTPQIW2MQRATHJMHEUMUTEEE
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIERIZIZVTPQIW2MQRATHJMHEUMUTEEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct snd_usx2y_urb_seq.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/usb/usx2y/usbusx2y.h      | 2 +-
 sound/usb/usx2y/usbusx2yaudio.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 8d82f5cc2fe1..391fd7b4ed5e 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -18,7 +18,7 @@ struct snd_usx2y_async_seq {
 struct snd_usx2y_urb_seq {
 	int	submitted;
 	int	len;
-	struct urb	*urb[];
+	struct urb	*urb[] __counted_by(len);
 };
 
 #include "usx2yhwdeppcm.h"
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index 5197599e7aa6..ca7888495a9f 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -681,6 +681,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 			err = -ENOMEM;
 			goto cleanup;
 		}
+		us->len = NOOF_SETRATE_URBS;
 		usbdata = kmalloc_array(NOOF_SETRATE_URBS, sizeof(int),
 					GFP_KERNEL);
 		if (!usbdata) {
@@ -702,7 +703,6 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 		if (err < 0)
 			goto cleanup;
 		us->submitted =	0;
-		us->len =	NOOF_SETRATE_URBS;
 		usx2y->us04 =	us;
 		wait_event_timeout(usx2y->in04_wait_queue, !us->len, HZ);
 		usx2y->us04 =	NULL;
-- 
2.34.1

