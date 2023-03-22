Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427676C567A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:06:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71365F17;
	Wed, 22 Mar 2023 21:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71365F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515606;
	bh=ist7WuapNg5kr7wsA8uxyE/FnPgbh4z43JdsF8oAOD0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DwGbM5qyE8WaF41elSWTkfUhIuxWxcePOGPJ46JQtwDaAKcQC0jj/LND7fAKJVZyO
	 M0kr0bDkpxbl2SPrprf0qcvwp0Ht2ZOz2qRUX3830uTzI66+VrEMxRDsqskgsTbapc
	 pmHzGUUqqxr4tMJe9lABoaOiTs/X/+JbZ/rMdKTE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5CEBF80557;
	Wed, 22 Mar 2023 21:02:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C51F8055C; Wed, 22 Mar 2023 21:02:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBFD7F80529
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 21:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBFD7F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EAJGcuFr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9F6B622B8;
	Wed, 22 Mar 2023 20:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C022C433EF;
	Wed, 22 Mar 2023 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515342;
	bh=ist7WuapNg5kr7wsA8uxyE/FnPgbh4z43JdsF8oAOD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EAJGcuFrijJ9Yyk2NvkgYKw/ScJYNccQsT25Xn5XuieHNaX4nUWFD4be7fGSbP3pq
	 ADVeGYqJh3Bj6VNPOQeaAYl1jELDqEh1JmWpAlhY+mKhFYtCIczq2Chwx2b5nKtV+U
	 nMdKbInLYhkJgEXB814d/4kFnSaxpCgY6lJaIFWZhN2kW8+qFl7kKua/zjgOugVK3o
	 Yi47HIOFrM6H7RWwBOK1soukmb9w2kg77pX4mUnlY8wJvQ5umTEgTnA/nuQTUtPyfb
	 qEG69sORaALmD4jDhgK9CY4zv5URUct+hdlBQoQGHVMTEPE/6jX8LBu1iClMzX2nz6
	 CzO5Xeiam9ILQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/12] ALSA: hda/ca0132: fixup buffer overrun at
 tuning_ctl_set()
Date: Wed, 22 Mar 2023 16:01:58 -0400
Message-Id: <20230322200207.1997367-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200207.1997367-1-sashal@kernel.org>
References: <20230322200207.1997367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UDTCGIJBBSOPXWFXDJQFXLLQQ3YODOCR
X-Message-ID-Hash: UDTCGIJBBSOPXWFXDJQFXLLQQ3YODOCR
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 tiwai@suse.com, ye.xingchen@zte.com.cn, dev@xianwang.io,
 gremlin@altlinux.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDTCGIJBBSOPXWFXDJQFXLLQQ3YODOCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 98e5eb110095ec77cb6d775051d181edbf9cd3cf ]

tuning_ctl_set() might have buffer overrun at (X) if it didn't break
from loop by matching (A).

	static int tuning_ctl_set(...)
	{
		for (i = 0; i < TUNING_CTLS_COUNT; i++)
(A)			if (nid == ca0132_tuning_ctls[i].nid)
				break;

		snd_hda_power_up(...);
(X)		dspio_set_param(..., ca0132_tuning_ctls[i].mid, ...);
		snd_hda_power_down(...);                ^

		return 1;
	}

We will get below error by cppcheck

	sound/pci/hda/patch_ca0132.c:4229:2: note: After for loop, i has value 12
	 for (i = 0; i < TUNING_CTLS_COUNT; i++)
	 ^
	sound/pci/hda/patch_ca0132.c:4234:43: note: Array index out of bounds
	 dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
	                                           ^
This patch cares non match case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87sfe9eap7.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_ca0132.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 24c2638cde376..6057084da4cf8 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4108,8 +4108,10 @@ static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 
 	for (i = 0; i < TUNING_CTLS_COUNT; i++)
 		if (nid == ca0132_tuning_ctls[i].nid)
-			break;
+			goto found;
 
+	return -EINVAL;
+found:
 	snd_hda_power_up(codec);
 	dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
 			ca0132_tuning_ctls[i].req,
-- 
2.39.2

