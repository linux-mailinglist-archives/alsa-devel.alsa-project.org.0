Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3F3C2FBF
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AF61691;
	Sat, 10 Jul 2021 04:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AF61691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884257;
	bh=H65BQimBAwbH5n7kbcYzCOuiT8nnBa5h2f5AOhcpIMw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1fADsGQTq69ht6eHZt2EtCAeHaJLiQ+eHZyijypPpMV8SzYbhdxHWHik0b0r1SXY
	 6BwFQukUhzbDjDECKIf1ME7DOfwKufu3aU8oZuflqDfmftr7bhp8jv6m0bwddxG07g
	 XVd/iVMQoAKxvVqaYKPgJ2dLQrUmdl6+US5SMLL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A22F8053B;
	Sat, 10 Jul 2021 04:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34755F80563; Sat, 10 Jul 2021 04:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A40F80563
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A40F80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RQlozIuj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F62D613D6;
 Sat, 10 Jul 2021 02:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883804;
 bh=H65BQimBAwbH5n7kbcYzCOuiT8nnBa5h2f5AOhcpIMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RQlozIujoDD1Q/+9t6qErabHd1cZ2AkgfqZIlITX3FOgi0xxi1MR924p6zvpTlwBy
 SN5BpU89vcapoQzXoKbDYTxOVNKbaUFfjwKPLV4+FB3oXSO8BjhDEN8laHcNPQluSh
 rX/7r6cEa/CawR1Mf33W0iaKqHDPF4s0LCmvIui0SZ8sJFpkHDhu4ADaBMZTA9S3hk
 tqL4UNSeGBTasbWG4TW/fufR8G5FSMOgHRjZUET5EPOjM9xJgjb+rvHCrt38388Z98
 TwaogTeIgriobPuUg0O3QORAEnj/IPH1o0flL+1zvs3x7Q/Y1T1T2h5WI6G1F3hKxM
 j/cAxWe853+KQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 067/104] ALSA: ppc: fix error return code in
 snd_pmac_probe()
Date: Fri,  9 Jul 2021 22:21:19 -0400
Message-Id: <20210710022156.3168825-67-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Hulk Robot <hulkci@huawei.com>,
 Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit 80b9c1be567c3c6bbe0d4b290af578e630485b5d ]

If snd_pmac_tumbler_init() or snd_pmac_tumbler_post_init() fails,
snd_pmac_probe() need return error code.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Link: https://lore.kernel.org/r/20210616021121.1991502-1-yangyingliang@huawei.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/ppc/powermac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index 9fb51ebafde1..8088f77d5a74 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -76,7 +76,11 @@ static int snd_pmac_probe(struct platform_device *devptr)
 		sprintf(card->shortname, "PowerMac %s", name_ext);
 		sprintf(card->longname, "%s (Dev %d) Sub-frame %d",
 			card->shortname, chip->device_id, chip->subframe);
-		if ( snd_pmac_tumbler_init(chip) < 0 || snd_pmac_tumbler_post_init() < 0)
+		err = snd_pmac_tumbler_init(chip);
+		if (err < 0)
+			goto __error;
+		err = snd_pmac_tumbler_post_init();
+		if (err < 0)
 			goto __error;
 		break;
 	case PMAC_AWACS:
-- 
2.30.2

