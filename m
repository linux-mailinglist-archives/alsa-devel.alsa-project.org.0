Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD86AE566
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 16:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F4614B4;
	Tue,  7 Mar 2023 16:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F4614B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678204343;
	bh=S2jQAjivcxngj4YUsJsisYUEXEAEB8jJd7V/HXufd2Q=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RcKLYIqMYoeGsBhhdxP3X8movOOM6BZQVqL7nkLej4Sd/JVV1jkpy+Vjyhg014Y/1
	 x1u5N1yZhVxIWd7Wmk5DmimAdg6qzR7dnQ0lWflebOaX5cJaynsakeHVygFEIPyuU/
	 XeWXqRkKVTBm5ErYNnvOeTDR0dKmw0sL0aymrsmE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85161F80236;
	Tue,  7 Mar 2023 16:51:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A35CFF8042F; Tue,  7 Mar 2023 16:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1C2AF800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 16:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1C2AF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ofWVW8v5
Received: by mail-ot1-x333.google.com with SMTP id
 r23-20020a05683001d700b00690eb18529fso7396815ota.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 07:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yaCugjNm/G2Z6PUshJITW/CcWRfLta4oMrbycqzUiTw=;
        b=ofWVW8v5IS/sfA2wpQoe3EPCDzB6NbRGvZfG/XP5+Rgr2hhIxEHlRTtgPHdftwvUmN
         V+4dLMf0bX3Qtj7+LeSTS1X576ZrS+iOxNml5NFce7UsaBKtgmOeXldVQwZrloheumYa
         1EnC/9u7bbFYEzYJluPMGfBAALrjxz5dZFVWlf6CgQ9LhKi8qBFy8ZKYIi886g9AZxN5
         9nQLu/EslJ3R0E+dCly00J/aWgyyhIX06tQgO2UYfML/MMtqNdpr2ArH7ySZ8BDEyn+a
         LUEqyjRwJ1XQ6sxvxt9xhIn/1hafWFK6DhzqLToSds8v3TVrWzS/N/9aTxREMpitQJ+F
         911w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaCugjNm/G2Z6PUshJITW/CcWRfLta4oMrbycqzUiTw=;
        b=xGkQhifpUteO17/bw4EssLRinO+n+bXSKoCaF/5V5kvUt97hKpDQvKwRwEeOok4x8K
         jKFLFQyaHSzp/vq8nL/CING0FQkE0DCnc7g9lkqgoSW/Vltiv0aanWBQYr7FSCROBFnF
         xFi2ihWJDB1ZHeDCGHRirwBRGgu1gwfr6wO260qK3MnO73rEQcEXmIWM69OLtWc/JVaC
         +G2j8l+10I9bUI2pWneq0FvjPWkNMQMPdf7IrTQrKyF5nIW5OOsnkUOCXdL0gqjsv3eb
         cEShLHTUlmaErdbTxB6oPSeyAZEuLS9yUW7nAwJNVvlb4iGr8AnOQzQNiKVoDjciB6iI
         4uYA==
X-Gm-Message-State: AO0yUKXqG5cfhxsM4QeinFJ6At0W+6V9zgobYzUiz3ojlvKVjfAHu8nd
	6q5y0in3FPoNrFoSOBXSTes=
X-Google-Smtp-Source: 
 AK7set+4tpOoPJzih4H3Nbev61S29Ht5G6Nq1DQL8Bcj7hhAxFBYuresSasJED2ckXYChGY6Tob/bQ==
X-Received: by 2002:a9d:17cd:0:b0:670:885e:f8ff with SMTP id
 j71-20020a9d17cd000000b00670885ef8ffmr6011313otj.8.1678204275839;
        Tue, 07 Mar 2023 07:51:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 b26-20020a9d479a000000b0068bcb44e7f5sm5417243otf.68.2023.03.07.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:51:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Support Opensource <support.opensource@diasemi.com>
Subject: [PATCH] ASoC: da7219: Initialize jack_det_mutex
Date: Tue,  7 Mar 2023 07:51:11 -0800
Message-Id: <20230307155111.1985522-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KRZRFFTNM3A2GLQ3S55CK6YHJX4FQJDL
X-Message-ID-Hash: KRZRFFTNM3A2GLQ3S55CK6YHJX4FQJDL
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 David Rau <David.Rau.opensource@dm.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRZRFFTNM3A2GLQ3S55CK6YHJX4FQJDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following traceback is reported if mutex debugging is enabled.

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 17 at kernel/locking/mutex.c:950 __mutex_lock_common+0x31c/0x11d4
Modules linked in:
CPU: 0 PID: 17 Comm: kworker/0:1 Not tainted 5.10.172-lockdep-21846-g849884cfca5a #1 fd2de466502012eb58bc8beb467f07d0b925611f
Hardware name: MediaTek kakadu rev0/rev1 board (DT)
Workqueue: events da7219_aad_jack_det_work
pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
pc : __mutex_lock_common+0x31c/0x11d4
lr : __mutex_lock_common+0x31c/0x11d4
sp : ffffff80c0317ae0
x29: ffffff80c0317b50 x28: ffffff80c0317b20
x27: 0000000000000000 x26: 0000000000000000
x25: 0000000000000000 x24: 0000000100000000
x23: ffffffd0121d296c x22: dfffffd000000000
x21: 0000000000000000 x20: 0000000000000000
x19: ffffff80c73d7190 x18: 1ffffff018050f52
x17: 0000000000000000 x16: 0000000000000000
x15: 0000000000000000 x14: 0000000000000000
x13: 0000000000000001 x12: 0000000000000001
x11: 0000000000000000 x10: 0000000000000000
x9 : 83f0d991da544b00 x8 : 83f0d991da544b00
x7 : 0000000000000000 x6 : 0000000000000001
x5 : ffffff80c03176a0 x4 : 0000000000000000
x3 : ffffffd01067fd78 x2 : 0000000100000000
x1 : ffffff80c030ba80 x0 : 0000000000000028
Call trace:
__mutex_lock_common+0x31c/0x11d4
mutex_lock_nested+0x98/0xac
da7219_aad_jack_det_work+0x54/0xf0
process_one_work+0x6cc/0x19dc
worker_thread+0x458/0xddc
kthread+0x2fc/0x370
ret_from_fork+0x10/0x30
irq event stamp: 579
hardirqs last enabled at (579): [<ffffffd012442b30>] exit_to_kernel_mode+0x108/0x138
hardirqs last disabled at (577): [<ffffffd010001144>] __do_softirq+0x53c/0x125c
softirqs last enabled at (578): [<ffffffd01009995c>] __irq_exit_rcu+0x264/0x4f4
softirqs last disabled at (573): [<ffffffd01009995c>] __irq_exit_rcu+0x264/0x4f4
---[ end trace 26da674636181c40 ]---

Initialize the mutex to fix the problem.

Cc: David Rau <David.Rau.opensource@dm.renesas.com>
Fixes: 7fde88eda855 ("ASoC: da7219: Improve the IRQ process to increase the stability")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 sound/soc/codecs/da7219-aad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 4a4f09f924bc..e3d398b8f54e 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -968,6 +968,8 @@ int da7219_aad_init(struct snd_soc_component *component)
 	INIT_WORK(&da7219_aad->hptest_work, da7219_aad_hptest_work);
 	INIT_WORK(&da7219_aad->jack_det_work, da7219_aad_jack_det_work);
 
+	mutex_init(&da7219_aad->jack_det_mutex);
+
 	ret = request_threaded_irq(da7219_aad->irq, da7219_aad_pre_irq_thread,
 				   da7219_aad_irq_thread,
 				   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-- 
2.39.2

