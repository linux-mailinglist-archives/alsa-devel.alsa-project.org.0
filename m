Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4B79CD1B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939EEDEB;
	Tue, 12 Sep 2023 12:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939EEDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694513132;
	bh=kwzKTVk4Xj5eIKXgHHpO4g0ck/Itynnpd3/bgPBxrF4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cR09wHVWSKL3BZaigxp4aiy0RxxfTjEQ3+wViW8aB6WVXNPTzmPRkd2EI3nc39U/v
	 S6vA13/PMZ23w7JjCzqgmDWKh3/B8oqOWGHROAgEaXPNKNpiUlsw8K5K5rN61oNS7G
	 eo1VcBkSxN/1MKMC35DbBRMNszlQfGsn+KoYa7hw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 499CEF805D6; Tue, 12 Sep 2023 12:02:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93C31F805C3;
	Tue, 12 Sep 2023 12:02:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D244F80425; Tue, 12 Sep 2023 10:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EACAF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 10:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EACAF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=VJ0PMyRI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=UUNaZ
	GGbls46jLI+B/C/K14g49rwHi1RLoMHof9iMLo=; b=VJ0PMyRI8vrBIOjmk9aUO
	pKAA9Z+gBp3CWM7Kjkj6q4JS7kH2slEfkSQmtz7LihoWMSTPB8HPw9LYydxKbq0h
	KFEhhZ0hBrTZQFrJ7z2ic6vgF93nUIVkqiAIxD4aJAhlc1m76QvG49pn7zzXChHE
	Mi9QYhOxJNg4f9WOsCxUbs=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id
 _____wAnfEExJQBl10RRBw--.47327S4;
	Tue, 12 Sep 2023 16:45:46 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: perex@perex.cz,
	tiwai@suse.com,
	cujomalainey@chromium.org,
	maciej.szmigiero@oracle.com,
	clecigne@google.com,
	make_ruc2021@163.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control: do not access controls without possession of
 r_w lock
Date: Tue, 12 Sep 2023 16:45:30 +0800
Message-Id: <20230912084530.3307329-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnfEExJQBl10RRBw--.47327S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1ruFWrWw18tw48XF43Wrg_yoWftrbEgF
	48XF40kr4UuFyI9FnYy3WrJFWFkF1xAF1kK3Wftr13CFy3tr9IgF1UXFZ5ZryDuFs5ur18
	Jw18Kr4ava43tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKSoXUUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiVwnoC1etsTPt4gAAsK
X-MailFrom: make_ruc2021@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A2P3Y32T7HA6B2OGD2RZD7B7LGEEEVEP
X-Message-ID-Hash: A2P3Y32T7HA6B2OGD2RZD7B7LGEEEVEP
X-Mailman-Approved-At: Tue, 12 Sep 2023 10:02:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2P3Y32T7HA6B2OGD2RZD7B7LGEEEVEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

we should not access any of its memory when we don't ensure possession of
a read/write lock. Otherwise we risk a use after free access, which allows
local users to cause a denial of service and obtain sensitive information
from kernel memory.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 sound/core/control.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 59c8658966d4..98782cc68ee1 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -590,7 +590,8 @@ static int __snd_ctl_remove(struct snd_card *card,
 		remove_hash_entries(card, kcontrol);
 
 	card->controls_count -= kcontrol->count;
-	for (idx = 0; idx < kcontrol->count; idx++)
+	count = kcontrol->count;
+	for (idx = 0; idx < count; idx++)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
 	snd_ctl_free_one(kcontrol);
 	return 0;
-- 
2.37.2

