Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C957B523483
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 15:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24BDB1A96;
	Wed, 11 May 2022 15:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24BDB1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652276567;
	bh=sUjTSKjAEazXj+mYR4EwJzpXOcfo9GyLRvzora/HNzs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oox5kuN3aeO7A6CBA9RU9/43xhT5FwJP4se2GdY22MpBoX+pKgGrKP6KfS5/cZjJD
	 OeuSrv4xrGuzMeyWUNSUCZlF+Lk4q4u72EijqWa9UTraAcfsOBhkiDoD4lX5UUSj6T
	 Mdz5Q+bLt1WFKVJVZa2wyvzdHXWTQwavf2i9PQ8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF79F8011C;
	Wed, 11 May 2022 15:41:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AEAAF804CA; Wed, 11 May 2022 15:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A72E7F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 15:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72E7F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bRK6F755"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3524CB823DE;
 Wed, 11 May 2022 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A151C34113;
 Wed, 11 May 2022 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652276509;
 bh=sUjTSKjAEazXj+mYR4EwJzpXOcfo9GyLRvzora/HNzs=;
 h=From:To:Cc:Subject:Date:From;
 b=bRK6F755WNzKgscteU7NcBOcs0luJg7bdzVp4tK6gMfXTWORISljuGnH5ZQ/0is53
 dwXTSsggtLoLrkmNl2lRIm+pVuYShX717GSeQOKrr8uMauG0CmvpmbjEr70Ewj6ri2
 0FHVhxryONyQsc9VE5fuZdQlL25TuDTL/nW190U49yGtxJZcftDRcQisLkFYnm4WnI
 ou57MzL8BgLM4B+xxFZjn3OSxJ77kXGOad3tRRrhACdfuawq8xhXhGC6sQbhAhoW0g
 Jz+4hljcaOpfQcsKKZsnNTkrgMO0t2jUcM/h0IMmZmeVEZ+9YOMqK05B2r2PCr+hV7
 YsSzz7H4GLj5w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: ops: Fix bounds check for _sx controls
Date: Wed, 11 May 2022 14:41:36 +0100
Message-Id: <20220511134137.169575-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; h=from:subject;
 bh=sUjTSKjAEazXj+mYR4EwJzpXOcfo9GyLRvzora/HNzs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBie7uGQhxVpDx+e8J0VsAlWNBzpmuF5dgtxdsjcy+H
 Ty6sjyKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnu7hgAKCRAk1otyXVSH0APWB/
 9DOYeh9xsCG2S/F9AOUg3qkZk5c7wZAsTNpJnEU6fhrZL+768CZEzfHsZ1V5n14NRiHhLaunbjKlYk
 cwVv08Fxw3E2QNax4ZmgwVZpbLTcDDfWoYNkzW32RwAnxqUFnzFTnd9855hFpuqexgtSpueC9vTZZD
 NsXx1qSoSi+18iEFG8un/ntO8+uAqv6BZo0N2pD5R3mMyS88rtWb7pS7UjkICYhBLVIYxDLlEsykAw
 T5swuhP+Lao0o2xHsWAsvm21gKtdofYuKjdX6a9+cegpP/ZFIdKLJUshJsNisOf/zcQnPD/0i5h7a/
 pBMwGFk9PZkkVcA1lMpYnC1pubebDF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

For _sx controls the semantics of the max field is not the usual one, max
is the number of steps rather than the maximum value. This means that our
check in snd_soc_put_volsw_sx() needs to just check against the maximum
value.

Fixes: 4f1e50d6a9cf9c1b ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index e693070f51fe..1ac7e2ce31a1 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -435,7 +435,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && val > mc->platform_max)
 		return -EINVAL;
-	if (val > max - min)
+	if (val > max)
 		return -EINVAL;
 	val_mask = mask << shift;
 	val = (val + min) & mask;
-- 
2.30.2

