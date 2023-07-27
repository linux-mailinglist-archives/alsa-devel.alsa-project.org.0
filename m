Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3239765F6B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 00:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDEA0820;
	Fri, 28 Jul 2023 00:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDEA0820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690496874;
	bh=xEnu5xQr3cyZZvwQfMubiCiEuFBVC3Uk0Y9589JdUxw=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WYCN9l4If4Wl0xXbaHT+LNnp+U72Q8H5fELg6JVwZ3qKHHwcxej+jxwtia2MHVmut
	 7mkB+0gYtZxn3a12WO/arVOi0FooV1tuZ2C/JiO1HY2q1aPPCaRr4B7CAgv9F+zJRO
	 bQQ+aKXqllJxz7vcShctVV3wEQZAsBBW1bVSb9co=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5FC0F802E8; Fri, 28 Jul 2023 00:27:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9051BF80163;
	Fri, 28 Jul 2023 00:27:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0D36F8019B; Fri, 28 Jul 2023 00:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc49.google.com (mail-oo1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ECB3F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 00:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECB3F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=f2CHy7m9
Received: by mail-oo1-xc49.google.com with SMTP id
 006d021491bc7-5662b3313e0so2418843eaf.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 15:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690496813; x=1691101613;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y8k3rjyBf0fojb2EPgR8sOqghPhE9G594McR+LDMAVU=;
        b=f2CHy7m95JntsuFYU+YXxcpxpKzj48cLg6BV5zIg0N0r1fxS4iNTJsJ17FgciHrkIO
         DLHDKDgrs51jDIhnpch6Y9tGr0J5VNDXSG1vbbmThfNJJMNgNwY13YNlM4nnRX2x1PqU
         y4r8zkIaBNnLpV971UudV5m3VB/4RtA+SJsmxmzmdZ/F0z8KhW2kVsZ96jrZ2TgmCB5Q
         Rlth99u4REj/G66Xr4KyIRf4bHgrjrAVfQnZZHHP81+tzaxKWng55PNsWCDNwPhtXcO3
         EEwDbA2U47Vaoy+bKao8sM7lTjFcqpBLppeaAEDlP/Rl2jDTl2J2eD7mTOIEmfO+UOAz
         pUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690496813; x=1691101613;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8k3rjyBf0fojb2EPgR8sOqghPhE9G594McR+LDMAVU=;
        b=MhtZh+RgudFf3aQm7ZgZNmssQjEIs11NwZ4vRj0YgYRSqkziRChYFzp3Dk+PPSaYQA
         r298s+wP2xKYFpZHqBbmjeu4F59z9gwoGSPruvFXbCHQYoJ/gWlaaU7cyrlPrUOBYsCD
         yKLCUCU6K6Mol642NOqFUudQcyxPb67BAMvp5qQdc7AJ1XoXC82BZupl3k2zd5IVGJHu
         CPiO94Yp7G6+BqB6h7QsOp+SmQVu0gFQDya8MLEoSBBm44yCuTU2BncMk0id5yrtuoHs
         I7EHMumq5+Qd5cMpuJEnXyfWa+GkcZzKJXjlUIrqWkKUHdvYj+YxQ4c1WqoEcg/n8Zn4
         6WoA==
X-Gm-Message-State: ABy/qLZWhIREjouKoL3fs3gPQU4wyeDKuMFIJAqZhDzHtJTXpQqr1NX1
	GEa+Av8cWk+yw2PPBEa831erxV8/DN2AoUgyHg==
X-Google-Smtp-Source: 
 APBJJlEBTUBehPEZg2R3Xd62gIsjVc6xsHEJaqFFsRtVLEpia0yBfJf6qBbvR8t5/rEX6B3ZnlKWSdJI2cgI6ejYLQ==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:5b0d:b0:1bb:785d:7436 with
 SMTP id ds13-20020a0568705b0d00b001bb785d7436mr961489oab.10.1690496812558;
 Thu, 27 Jul 2023 15:26:52 -0700 (PDT)
Date: Thu, 27 Jul 2023 22:26:41 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACDvwmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDcyNz3eL80rwUIJmsm1aco2uSlmxqamaZYm5umKoE1FNQlJqWWQE2Lzq
 2thYAMKv4Nl8AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690496811; l=2165;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=xEnu5xQr3cyZZvwQfMubiCiEuFBVC3Uk0Y9589JdUxw=;
 b=hmOqBlRYlYKaC3Yr5Zy8g3r9+9++L/pbK5ub/HORCIbyUCI0NGjnrADamWXFeaNB3CVKyg4I+
 L5n1tag1LikDFx+k0EHDanF323xxdNABjjW0T5SEFnG7vM0e2joX6sH
X-Mailer: b4 0.12.3
Message-ID: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
Subject: [PATCH] ASoC: fsl_micfil: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: PHZJIKKDA6EHXJWRCDJJOFZUZAT5TNE4
X-Message-ID-Hash: PHZJIKKDA6EHXJWRCDJJOFZUZAT5TNE4
X-MailFrom: 
 3LO_CZAsKCkMozxynsxynyylttlqj.htrfqxf-ij0jqfqxf-uwtojhy.twl@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHZJIKKDA6EHXJWRCDJJOFZUZAT5TNE4/>
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

In this case, though, there was great care taken to ensure that the
destination buffer would be NUL-terminated through the use of `len - 1`
ensuring that the previously zero-initialized buffer would not overwrite
the last NUL byte. This means that there's no bug here.

However, `strscpy` will add a mandatory NUL byte to the destination
buffer as promised by the following `strscpy` implementation [3]:
|       /* Hit buffer length without finding a NUL; force NUL-termination. */
|       if (res)
|               dest[res-1] = '\0';

This means we can lose the `- 1` which clears up whats happening here.
All the while, we get one step closer to eliminating the ambiguous
`strncpy` api in favor of its less ambiguous replacement like `strscpy`,
`strscpy_pad`, `strtomem` and `strtomem_pad` amongst others.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
[3]: https://elixir.bootlin.com/linux/v6.3/source/lib/string.c#L183

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/soc/fsl/fsl_micfil.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 3f08082a55be..fe28b27e50d0 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -1044,7 +1044,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	micfil->pdev = pdev;
-	strncpy(micfil->name, np->name, sizeof(micfil->name) - 1);
+	strscpy(micfil->name, np->name, sizeof(micfil->name));
 
 	micfil->soc = of_device_get_match_data(&pdev->dev);
 

---
base-commit: 57012c57536f8814dec92e74197ee96c3498d24e
change-id: 20230727-sound-soc-fsl-4fc5569d771e

Best regards,
--
Justin Stitt <justinstitt@google.com>

