Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC4977E57
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD60516B7;
	Fri, 13 Sep 2024 13:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD60516B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226168;
	bh=mhxuXK5oDGsGAu3XHYbYrKUrBOU8HZeBBb4negYcy78=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EhEjsGpi4MeaXLwtWN+ds3fglTFjSmGz0QhVPenU/mn+Mi50LfdL8vk07uRHCpFhY
	 qtLUC+3B/rHexWHxCsgovsz2Aq4b6eDd13bh7/coczEV5m2sWYMz4wDmY8ICAyoi/o
	 q91qhryDN/SpVBX+bUYaL40TN5E51BsfRYv2+pVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DE50F80651; Fri, 13 Sep 2024 13:13:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 811A2F80814;
	Fri, 13 Sep 2024 13:13:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9800AF801F5; Wed, 11 Sep 2024 16:37:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 91160F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 16:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91160F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=UOOIYef9
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 413E210000A;
	Wed, 11 Sep 2024 17:37:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 413E210000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1726065465;
	bh=0dnO4ujw+BJRKMFo8HSTMVWw4DKX/FH3odzibY6SRUU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UOOIYef9Ea7pItfRX8SY/YX5hW0eCKocGsAguBcE7UTwsGMvb+SoGYpjqDHF0Dr6N
	 5N7Nqp+L6i+9mQLE/uX/IdK3KxT5EKOKnO38X/wcmD2jgseFDiAFXBElasgNay6tPJ
	 wSVC4+nZPAfHIXHB+m1Q3BmJsky6X7MsIRn0gU/YD26PtPZGkST8HraejoFmB7t13J
	 HicSEiitim/pGuWwJYZzigS+bHN1rgE5w80V8h2n9wwCebtRtj7de0nKjxOVKZJqkC
	 ERGITL2vfK8PIS2QzstmxquMzTS9zYcJz175h6Sddn4gOudrFVY0ymfHkdIJGfNFms
	 Sai1VkOk3MwBA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 11 Sep 2024 17:37:45 +0300 (MSK)
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, "Kevin
 Hilman" <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <kernel@sberdevices.ru>, <oxffffaa@gmail.com>,
	<avkrasnov@salutedevices.com>, <Stable@vger.kernel.org>
Subject: [PATCH v1] ASoC: meson: axg-card: fix 'use-after-free'
Date: Wed, 11 Sep 2024 17:24:25 +0300
Message-ID: <20240911142425.598631-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.161.232]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187687 [Sep 11 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 32 0.3.32
 766319f57b3d5e49f2c79a76e7d7087b621090df,
 {Tracking_from_domain_doesnt_match_to},
 salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1,
 FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/09/11 13:00:00 #26553614
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: avkrasnov@salutedevices.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X3VGSD3BUPVWJFSD7M3HYJ4QOMDD4PL7
X-Message-ID-Hash: X3VGSD3BUPVWJFSD7M3HYJ4QOMDD4PL7
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3VGSD3BUPVWJFSD7M3HYJ4QOMDD4PL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Buffer 'card->dai_link' is reallocated in 'meson_card_reallocate_links()',
so move 'pad' pointer initialization after this function when memory is
already reallocated.

Kasan bug report:

==================================================================
BUG: KASAN: slab-use-after-free in axg_card_add_link+0x76c/0x9bc
Read of size 8 at addr ffff000000e8b260 by task modprobe/356

CPU: 0 PID: 356 Comm: modprobe Tainted: G O 6.9.12-sdkernel #1
Call trace:
 dump_backtrace+0x94/0xec
 show_stack+0x18/0x24
 dump_stack_lvl+0x78/0x90
 print_report+0xfc/0x5c0
 kasan_report+0xb8/0xfc
 __asan_load8+0x9c/0xb8
 axg_card_add_link+0x76c/0x9bc [snd_soc_meson_axg_sound_card]
 meson_card_probe+0x344/0x3b8 [snd_soc_meson_card_utils]
 platform_probe+0x8c/0xf4
 really_probe+0x110/0x39c
 __driver_probe_device+0xb8/0x18c
 driver_probe_device+0x108/0x1d8
 __driver_attach+0xd0/0x25c
 bus_for_each_dev+0xe0/0x154
 driver_attach+0x34/0x44
 bus_add_driver+0x134/0x294
 driver_register+0xa8/0x1e8
 __platform_driver_register+0x44/0x54
 axg_card_pdrv_init+0x20/0x1000 [snd_soc_meson_axg_sound_card]
 do_one_initcall+0xdc/0x25c
 do_init_module+0x10c/0x334
 load_module+0x24c4/0x26cc
 init_module_from_file+0xd4/0x128
 __arm64_sys_finit_module+0x1f4/0x41c
 invoke_syscall+0x60/0x188
 el0_svc_common.constprop.0+0x78/0x13c
 do_el0_svc+0x30/0x40
 el0_svc+0x38/0x78
 el0t_64_sync_handler+0x100/0x12c
 el0t_64_sync+0x190/0x194

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 sound/soc/meson/axg-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e8..eb0302f207407 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -104,7 +104,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 				     int *index)
 {
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai_link *pad = &card->dai_link[*index];
+	struct snd_soc_dai_link *pad;
 	struct snd_soc_dai_link *lb;
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
@@ -114,6 +114,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	if (ret)
 		return ret;
 
+	pad = &card->dai_link[*index];
 	lb = &card->dai_link[*index + 1];
 
 	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
-- 
2.30.1

