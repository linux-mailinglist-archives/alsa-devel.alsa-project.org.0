Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4A6C55F4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:02:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A270AED4;
	Wed, 22 Mar 2023 21:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A270AED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515342;
	bh=CFwtfCdZMp1Q7KUyl+NWYHlyWJeMW6k/3fiBLWkeoz8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JynCVslIqBydDfd3SI6tFp4NVb1VA89zd5bRy3Qm5B1znCerH8BGMoRpa6Mv8l+rk
	 WSzXjA0tuiD6w66tclpfgYnmKrAveBhbuSaISJc9OR/mzT6mSen9s9xtlywyo7benh
	 mE6rRupWxm9r/5oOLJBVPFLqD6Bz54TzcHk6p9dg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD448F805C4;
	Wed, 22 Mar 2023 20:59:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A578F8053B; Wed, 22 Mar 2023 20:59:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 093C1F80529
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 093C1F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JOzlvo1d
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF83A622BF;
	Wed, 22 Mar 2023 19:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E204CC4339C;
	Wed, 22 Mar 2023 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515140;
	bh=CFwtfCdZMp1Q7KUyl+NWYHlyWJeMW6k/3fiBLWkeoz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOzlvo1dV04n98vJBirwGY8bJRTMFnlm42FK3d4mTZTalxRUk95P+QcwIbIlslPXV
	 DEgR89rf1BUxbNTg/yIVrLAt20XKASBZbhJPNWw/iKn5Pw/SUwJS2IRguM19OVz6bi
	 LXIHUXfOn44vXzRUiYCKuE6qtmsGMbiVZgIMUPiJIa3h8GGtrK/wz0Ohxv/3D0Ih8o
	 Hla4XR1nUx41Tqwd/iUfP3Qk9yCdm/OTMG5pgdjr8wYH5wDO67XhWkmiSnN5cXYc1F
	 3cvrcUkElXD/DWkiMNHajKhtm2d/Rz4jCpA8cBLpYt5IoxtUSX0gTji5PCePEaUsVQ
	 J48rSNAEYyWAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 31/45] ALSA: hda/ca0132: fixup buffer overrun at
 tuning_ctl_set()
Date: Wed, 22 Mar 2023 15:56:25 -0400
Message-Id: <20230322195639.1995821-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2KEJJMMLOEWHGKEDR6OLLCFH6DQJX5Z4
X-Message-ID-Hash: 2KEJJMMLOEWHGKEDR6OLLCFH6DQJX5Z4
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 tiwai@suse.com, dev@xianwang.io, ye.xingchen@zte.com.cn,
 gremlin@altlinux.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KEJJMMLOEWHGKEDR6OLLCFH6DQJX5Z4/>
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
index acde4cd58785e..099722ebaed83 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4228,8 +4228,10 @@ static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 
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

