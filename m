Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61D3C31C1
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E9A1788;
	Sat, 10 Jul 2021 04:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E9A1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885370;
	bh=U3XyAJ4TRtQBnQOuHtoGHvzGvSgBkJEg6w1xIsCvSHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQAr1WYylQZY8bX5eLVI+shuziMjulyXJKXdMPhfI0Wza9AYZiU3Fay+QunjILUV9
	 Ba1yVUVUXdxQbsS7qeB6aCzlwlyDIVJjo2N12xcmFvyiB3Cyl8tNc2fmT+xp7iLSGc
	 hNhpqUyE5OalfNVwHOH11g55PqO9ytMWxhMenoeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB445F80635;
	Sat, 10 Jul 2021 04:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 236DDF80635; Sat, 10 Jul 2021 04:32:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C578FF805A0
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C578FF805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZLf2yHXO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABC48613E4;
 Sat, 10 Jul 2021 02:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884354;
 bh=U3XyAJ4TRtQBnQOuHtoGHvzGvSgBkJEg6w1xIsCvSHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZLf2yHXO3+AeNx+z0Vjta93t+r14m659XYX4XWPuqjjvOUSqicZe7FRZ3kTAGaBF8
 +8wxVbtL42au3Xge/P487XL/OBocn2SSK2RoJitJFeJXxKekeVj03qUkpTlcWw9XOl
 Hx0s1A4002AwlqhXRaqutbGlOeGoUJrZtAM2olLAoE2kDGeYMHN4MqP2jqeNwUmkmm
 bAgh4AuPhsUf8py7yLaH8JvAaDPl98f043aNbj6w7hloTNqAByl5JA10af1dtAMssd
 BDZWDIj1NEf5LtdRPHUkM1cGFbdTl/7+iEFY3g14IP1V3LYanRACozRBCYjyjFqj/9
 K9CA5gfNsL+LA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 24/39] ALSA: ppc: fix error return code in
 snd_pmac_probe()
Date: Fri,  9 Jul 2021 22:31:49 -0400
Message-Id: <20210710023204.3171428-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023204.3171428-1-sashal@kernel.org>
References: <20210710023204.3171428-1-sashal@kernel.org>
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
index 33c6be9fb388..7c70ba5e2540 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -90,7 +90,11 @@ static int snd_pmac_probe(struct platform_device *devptr)
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

