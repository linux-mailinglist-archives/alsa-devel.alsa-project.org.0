Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB74757405
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 08:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18EE3A4E;
	Tue, 18 Jul 2023 08:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18EE3A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689661551;
	bh=jT+HRnxIbfYHS1SDaGKG5oivh5HKLuhwXO/n+1dSXQo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fbch5qi8ro3BuLqCMYaml2qEIICSaIjM7HcQaC+1XEvNrATpvqWfdpocejHlfbxDn
	 ukevl6G2s2vHo4KdPMOIL5Jwx/hkgHyTzaPkv95IAbFtgctpCtc4+qM52CyaFEl+Rk
	 iIDMKmryhmJwEgxe30BpmBlyC6WujR6Rdn2O68YY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F936F80520; Tue, 18 Jul 2023 08:25:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D50F8027B;
	Tue, 18 Jul 2023 08:24:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1737F804DA; Mon, 17 Jul 2023 21:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A01D0F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 21:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01D0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=Wg3Y4Ifd
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so7763801e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1689622696; x=1692214696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPjGa2gVly2nkBzUKiQge11g2a89IAwqmPmDHU14Mk0=;
        b=Wg3Y4IfdQPSIExSHgXxXdxlyE672ZA8B/KPe7TShBB7Ws8yniOaByJb9Fjbrth7Orv
         tBW3DPWjFS5zGWvza1YCnjaHbpHQ3F9PcOGM5PdDZ2bbIUqpPQqF73a4N5B0st8dUV9P
         AGldt+FdqHC5/bgc2IH1WUsnGjAHwO4P3d+adq4F95nQuDVdl1gvcz3iaWTnZUJ/nBtJ
         tnTWd7VXcwrwKYKGv63ovyfxfojMlO9Xa2m8IcFo0wTQvLYlBj0jaHAu/dl9yJ0ONpgA
         NAgpkh6w0k11/sxIVsdSVAMkUlYXz92yDVtyjUnEbAlIE0lC/Y/XyrQPQ7b4SL33pGyO
         bBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622696; x=1692214696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPjGa2gVly2nkBzUKiQge11g2a89IAwqmPmDHU14Mk0=;
        b=V8MgKosiiEoT8DVZl7HEVNLOk+ONtsVHI47cmXswvp/lqtpwd9FKSSIgikDoG3gX8U
         yuAWN8OjpQyS4a+JgteT21p2ai/ni6uqR6wGUS+YyQLa0B1lU42YB6QcQ1Iyu+i5Cn+7
         7NqL2frO4dL7eK9aj8kKtEOhBXuokpRr5wm1MTzMuXRM/2Pv8bY9ofF24L+AmFnJKHnR
         xxvpZg6pcgYW9Qiyn/g9hWfzZuUi+7G0AbVLwWfvzQhwMClVHOwAQgYrLLYKDqLR35ml
         bdyuorJDaxRwUcITgorMsGdvPKgARwfDiHQxj8MZN9vogpBRLIlfcE+TMKRVmN+EmfAH
         33uA==
X-Gm-Message-State: ABy/qLarF29JtsE7Tj1XYyn9IcpKZ7iFSSxvZagr0mfKzF5CpyxUkucx
	1Rp63M3OEVkojvNueqjV4bneFQ==
X-Google-Smtp-Source: 
 APBJJlEgbFznuYvooVVZcUGY1DNIvZC+77QEU5cwW/3zydBC+6zt83fsgT826hjxohNcIwNAkSzK9Q==
X-Received: by 2002:a05:6512:28c:b0:4f8:714e:27a8 with SMTP id
 j12-20020a056512028c00b004f8714e27a8mr8300437lfp.0.1689622696220;
        Mon, 17 Jul 2023 12:38:16 -0700 (PDT)
Received: from dmaluka.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 e5-20020ac25465000000b004fb75943ab3sm53124lfn.258.2023.07.17.12.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 12:38:15 -0700 (PDT)
From: Dmytro Maluka <dmy@semihalf.com>
To: Support Opensource <support.opensource@diasemi.com>,
	DLG Support Opensource <DLG-Support.Opensource@lm.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Dmytro Maluka <dmy@semihalf.com>
Subject: [PATCH 0/2] ASoC: da7219: Patches related to a spurious AAD IRQ issue
Date: Mon, 17 Jul 2023 21:37:35 +0200
Message-ID: <20230717193737.161784-1-dmy@semihalf.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dmy@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B5YY2SHWFSQ4QSMTVQFSB3J6KQUQH63Y
X-Message-ID-Hash: B5YY2SHWFSQ4QSMTVQFSB3J6KQUQH63Y
X-Mailman-Approved-At: Tue, 18 Jul 2023 06:23:13 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5YY2SHWFSQ4QSMTVQFSB3J6KQUQH63Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series includes 2 patches related to (but not fixing) the following
I2C failure which occurs sometimes during system suspend or resume and
indicates a problem with a spurious DA7219 interrupt:

[  355.876211] i2c_designware i2c_designware.3: Transfer while suspended
[  355.876245] WARNING: CPU: 2 PID: 3576 at drivers/i2c/busses/i2c-designware-master.c:570 i2c_dw_xfer+0x411/0x440
...
[  355.876462] Call Trace:
[  355.876468]  <TASK>
[  355.876475]  ? update_load_avg+0x1b3/0x615
[  355.876484]  __i2c_transfer+0x101/0x1d8
[  355.876494]  i2c_transfer+0x74/0x10d
[  355.876504]  regmap_i2c_read+0x6a/0x9c
[  355.876513]  _regmap_raw_read+0x179/0x223
[  355.876521]  regmap_raw_read+0x1e1/0x28e
[  355.876527]  regmap_bulk_read+0x17d/0x1ba
[  355.876532]  ? __wake_up+0xed/0x1bb
[  355.876542]  da7219_aad_irq_thread+0x54/0x2c9 [snd_soc_da7219 5fb8ebb2179cf2fea29af090f3145d68ed8e2184]
[  355.876556]  irq_thread+0x13c/0x231
[  355.876563]  ? irq_forced_thread_fn+0x5f/0x5f
[  355.876570]  ? irq_thread_fn+0x4d/0x4d
[  355.876576]  kthread+0x13a/0x152
[  355.876581]  ? synchronize_irq+0xc3/0xc3
[  355.876587]  ? kthread_blkcg+0x31/0x31
[  355.876592]  ret_from_fork+0x1f/0x30
[  355.876601]  </TASK>

This log shows that DA7219 AAD interrupt handler da7219_aad_irq_thread()
is unexpectedly running when DA7219 is suspended and should not generate
interrupts. As a result, the IRQ handler is trying to read AAD IRQ event
status over I2C and is hitting the I2C driver "Transfer while suspended"
failure.

Patch #1 adds synchronize_irq() when suspending DA7219, to prevent the
IRQ handler from running after suspending if there is a pending IRQ
generated before suspending. With this patch the above failure is still
reproducible, so this patch does not fix any real observed issue so far,
but at least is useful for confirming that the above issue is not caused
by a pending IRQ but rather looks like a DA7219 hardware issue with an
unexpectedly generated IRQ.

Patch #2 does not fix the above issue either, but it prevents its
potentially harmful side effects. With the existing code, if the issue
occurs and the IRQ handler fails to read the AAD IRQ events status over
I2C, it does not check that and tries to use the garbage uninitialized
value of the events status, potentially reporting bogus events. This
patch fixes that by adding missing error checking.

In fact I'm sending these patches not only to submit them for review but
also to ask Renesas folks for any hints on a possible cause of the
described DA7219 issue (AAD interrupts spuriously firing after jack
detection is already disabled) or how to debug it further.

Dmytro Maluka (2):
  ASoC: da7219: Flush pending AAD IRQ when suspending
  ASoC: da7219: Check for failure reading AAD IRQ events

 sound/soc/codecs/da7219-aad.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.41.0.255.g8b1d071c50-goog

