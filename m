Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4CE9429AE
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533A32D14;
	Wed, 31 Jul 2024 10:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533A32D14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416045;
	bh=PhC0RI97md9k9y8LsetvWy1lS6M7fW5lB/J+ZQOYu8k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k1cTQTh//DmvqAcEflQFpMWfMSTnvEiRwPXGUjNoC6l2A1ORto95GOTNW+9rE9p4d
	 IEb/aZTDlA/fYsBmYbmLlqCVg2j739/DTYc570fScT/kP7DxznLoTwa0GVR2b/6bsZ
	 3n7EgQ0oAq/JS04+KqMFqdI2l61I+vIFRrzGkSt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96D94F80C57; Wed, 31 Jul 2024 10:50:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C63A3F80C75;
	Wed, 31 Jul 2024 10:50:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBAA1F8026A; Mon, 29 Jul 2024 15:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38E7AF802DB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 15:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38E7AF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=sCzzbvb1
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A7C1E10000E;
	Mon, 29 Jul 2024 16:29:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A7C1E10000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1722259771;
	bh=RJNDbeEsGw2i19N8O8rkd1KwYIh3I0C9iW1DtmgVgjg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=sCzzbvb1lqCHcR9HPwF82MfcoKaTrvXXG+W6ZL3BcfuhQRtYaNGf8ei+EA2b49Kyy
	 WoNCQeSDrI+UW+FOD0Yim0h1Gu2Cakipijw3kmBDXhch+r/qAfABYutN7p1tDjySHL
	 ggqVfU6t9gxeKVatlt892B4WuSRG3ZnZhr9pPcXL8Wo+p/HSyKuyDimxsxYXtHH8U5
	 d5uVZsUvYt4g5i/CR7WlLk/OiBqbPv7T5bMN92/Xuy8mHlkJ6aZMFd6rZGINyxmKwr
	 TJ1HQIKeEWIbPX33QDsgOg3u+XeeSb5qtPj/Q9KQ3iH9c8ZeQdHYLDDrBmDjafXfWV
	 sahQNcRihn8+w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 29 Jul 2024 16:29:31 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jul 2024 16:29:30 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <kernel@sberdevices.ru>, <oxffffaa@gmail.com>,
	<avkrasnov@salutedevices.com>
Subject: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Date: Mon, 29 Jul 2024 16:16:52 +0300
Message-ID: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186773 [Jul 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24
 186c4d603b899ccfd4883d230c53f273b80e467f,
 {Tracking_from_domain_doesnt_match_to},
 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2,
 FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/07/29 12:26:00 #26174422
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: avkrasnov@salutedevices.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6QXI7NH3SJDQFX6FH4ZUHS5UXCUZ5JVN
X-Message-ID-Hash: 6QXI7NH3SJDQFX6FH4ZUHS5UXCUZ5JVN
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QXI7NH3SJDQFX6FH4ZUHS5UXCUZ5JVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Raw spinlock is needed here, because with enabled PREEMPT_RT,
spinlock_t become preemptible, but this regmap lock could be
acquired in IRQ handler. Found by lockdep:

[ ] =============================
[ ] [ BUG: Invalid wait context ]
[ ] 6.9.9-sdkernel #1 Tainted: G O
[ ] -----------------------------
[ ] aplay/413 is trying to lock:
[ ] ffff000003930018 (axg_fifo:356:(&axg_fifo_regmap_cfg)->lock){....}-{3:3},c
[ ] other info that might help us debug this:
[ ] context-{2:2}
[ ] no locks held by aplay/413.
[ ] stack backtrace:
[ ] CPU: 0 PID: 413 Comm: aplay Tainted: G           O       6.9.9-kernel #1
[ ] Hardware name: SberDevices SberBoom Mini (DT)
[ ] Call trace:
[ ]  dump_backtrace+0x98/0xf0
[ ]  show_stack+0x18/0x24
[ ]  dump_stack_lvl+0x90/0xd0
[ ]  dump_stack+0x18/0x24
[ ]  __lock_acquire+0x9dc/0x1f10
[ ]  lock_acquire.part.0+0xe8/0x228
[ ]  lock_acquire+0x68/0x84
[ ]  _raw_spin_lock_irqsave+0x60/0x88
[ ]  regmap_lock_spinlock+0x18/0x2c
[ ]  regmap_read+0x3c/0x78
[ ]  axg_fifo_pcm_irq_block+0x4c/0xc8
[ ]  __handle_irq_event_percpu+0xa4/0x2f8
[ ]  handle_irq_event+0x4c/0xbc
[ ]  handle_fasteoi_irq+0xa4/0x23c
[ ]  generic_handle_domain_irq+0x2c/0x44
[ ]  gic_handle_irq+0x40/0xc4
[ ]  call_on_irq_stack+0x24/0x4c
[ ]  do_interrupt_handler+0x80/0x84
[ ]  el0_interrupt+0x5c/0x124
[ ]  __el0_irq_handler_common+0x18/0x24
[ ]  el0t_32_irq_handler+0x10/0x1c
[ ]  el0t_32_irq+0x194/0x198

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 sound/soc/meson/axg-fifo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index ecb3eb7a9723d..a22298f74b35a 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -328,6 +328,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= FIFO_CTRL2,
+	.use_raw_spinlock = true,
 };
 
 int axg_fifo_probe(struct platform_device *pdev)
-- 
2.30.1

