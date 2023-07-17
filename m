Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26C757407
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 08:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF61DFA;
	Tue, 18 Jul 2023 08:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF61DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689661603;
	bh=IImFXttQY2Rw8q8SKFP7CyUFqLmZz9d6WNBvhWGXTQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NT12P/sJGHajQq+A3sanOVlc4dnphCdpMSZkZKkaaCsE8I0QrnzWMeOX2rAtf9X2m
	 in7/amiI2vYX0U1TVSJOHcxm8qsE/6nIQ0bnoesQe15qJDzGDU6VR4daswQhXZRcyB
	 iCwIKtm4sJd5VAdh9C2wKnZdblAppKJHhkKNTyiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46518F80567; Tue, 18 Jul 2023 08:25:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC190F8055B;
	Tue, 18 Jul 2023 08:25:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 852F2F8047D; Mon, 17 Jul 2023 21:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39ABEF8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 21:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39ABEF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=SXlAzV3t
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so7763848e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1689622699; x=1692214699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0jx6KDLfrX0Uj2uqeAAYsN7zB5TQ1Hj76wJYAksz0s=;
        b=SXlAzV3tbaSQ6pNe0nZHU/rEvYdEXgPHQJctTCRlEfb/0NE9pSyD9zDF/VkZJL2i4/
         eQ3sYSGI+4dqA4+g95uJuENy9nwxOOyokDFM58PvZ+4WAMNjIx5nolWcpO+F++L6sOEZ
         Y6iA3CgI4pl35+37ysCrwfiP6RkmtmKRolT2EaoATJHeT8r4YLbYmN1eIex3HwZqrm6T
         labJ3mUnxRTBqjczKBwHI3qoz6PdQhoYMKn+l2tWbuHuhj4Mkv3UK+cT7RHvi0Kh4p+u
         eXexdLt6OdcH1Iz3EB8R+4IVD0KU2GstELMILGAOUKzOwaLDJ4tUeT6alWHDl3IkvbMB
         w//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622699; x=1692214699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0jx6KDLfrX0Uj2uqeAAYsN7zB5TQ1Hj76wJYAksz0s=;
        b=ELT+uT7A5KsjGR/QK41ZvXBjuuTsX/qA+SBEq1Ufs+XzNj3DPYzXvaafdw5FT4fS+V
         HWTgQhkyEQfk0p+cmzCKEjXV58P9uwDgBvBVvJL7E/RyrHvRt9LTNWMS9rzRxecyaAv7
         bG5gViKoR81Iu9aRWHyakYzRPQ36PzEWmXgAdAuuFXnLcFVjNr0Eojb+tReLm9W4QZqX
         MsS/4kN9VKgGAhbD+6tzEZpQM1Tw4mPx6uyNhvyfvu7sFSC0GM4u8U76mIoEh/44kr0s
         KpRvRXJYos7iGaPzRabWYfcvnjT1ZDZuEU3mMnbWEMgwTAXN3kzQKGMVY6zEImObEiln
         pIPQ==
X-Gm-Message-State: ABy/qLYOsqyl83UiI3os6a/HJk2ozoOmpjMTAQxEmgPpdyK99QCaq1Iv
	czIKFqo/E6kvfruIYf0NSfSt7g==
X-Google-Smtp-Source: 
 APBJJlEtjryDAdE+QG1MLzFBSi5+Jxhgb3m6oKz8AiiWmVh0moF12fgKoo9kSySXXvqOeme9Zu71zQ==
X-Received: by 2002:ac2:51ae:0:b0:4f9:607a:6508 with SMTP id
 f14-20020ac251ae000000b004f9607a6508mr8024325lfk.50.1689622698911;
        Mon, 17 Jul 2023 12:38:18 -0700 (PDT)
Received: from dmaluka.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 e5-20020ac25465000000b004fb75943ab3sm53124lfn.258.2023.07.17.12.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 12:38:18 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: da7219: Flush pending AAD IRQ when suspending
Date: Mon, 17 Jul 2023 21:37:36 +0200
Message-ID: <20230717193737.161784-2-dmy@semihalf.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
In-Reply-To: <20230717193737.161784-1-dmy@semihalf.com>
References: <20230717193737.161784-1-dmy@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dmy@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7RJHFKCCLXZPBGUTTQ4Z3FFNFQE3TLPC
X-Message-ID-Hash: 7RJHFKCCLXZPBGUTTQ4Z3FFNFQE3TLPC
X-Mailman-Approved-At: Tue, 18 Jul 2023 06:23:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RJHFKCCLXZPBGUTTQ4Z3FFNFQE3TLPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

da7219_aad_suspend() disables jack detection, which should prevent
generating new interrupts by DA7219 while suspended. However, there is a
theoretical possibility that there is a pending interrupt generated just
before suspending DA7219 and not handled yet, so the IRQ handler may
still run after DA7219 is suspended. To prevent that, wait until the
pending IRQ handling is done.

This patch arose as an attempt to fix the following I2C failure
occurring sometimes during system suspend or resume:

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

which indicates that the AAD IRQ handler is unexpectedly running when
DA7219 is suspended, and as a result, is trying to read data from DA7219
over I2C and is hitting the I2C driver "Transfer while suspended"
failure.

However, with this patch the above failure is still reproducible. So
this patch does not fix any real observed issue so far, but at least is
useful for confirming that the above issue is not caused by a pending
IRQ but rather looks like a DA7219 hardware issue with an IRQ
unexpectedly generated after jack detection is already disabled.

Signed-off-by: Dmytro Maluka <dmy@semihalf.com>
---
 sound/soc/codecs/da7219-aad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index c65256bd526d..202715b7bbea 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -944,6 +944,8 @@ void da7219_aad_suspend(struct snd_soc_component *component)
 			}
 		}
 	}
+
+	synchronize_irq(da7219_aad->irq);
 }
 
 void da7219_aad_resume(struct snd_soc_component *component)
-- 
2.41.0.255.g8b1d071c50-goog

