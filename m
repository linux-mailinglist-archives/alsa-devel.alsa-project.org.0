Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69D55BD9D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0FAC1672;
	Tue, 28 Jun 2022 04:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0FAC1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656383240;
	bh=ilvURhaxj9mgUg4uRt4O2KV1o5dU0YnE3UMEOl0buAE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zczkrxjd894DFr6MVPhQg6X5mRh/5MF0nuJybUDL1rdoAXUrmcde8VEJDJTUSJuPt
	 D3zvxR7cOhVtbUBNvzkd3zxZZpLF9JYl9iXcuIcsiSp60dfap1wD8VE1stT9G0qV4E
	 ESXjc9yERYtntawLFfx2y+XHTr2o/vZVfW4wEfqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AA8EF804F2;
	Tue, 28 Jun 2022 04:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE00F80115; Tue, 28 Jun 2022 04:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC08BF80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC08BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tnkKtXh5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 270D9617CA;
 Tue, 28 Jun 2022 02:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F112DC385A5;
 Tue, 28 Jun 2022 02:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383182;
 bh=ilvURhaxj9mgUg4uRt4O2KV1o5dU0YnE3UMEOl0buAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tnkKtXh51UVZEpTkEv+7i2aB892a+iHBVksDjHU6HalaZzrR7Sf24zIIfOS9sfQt3
 Hqm6BAjqo5LxLifTKVtBjQjKOKWq6vHvArWtaoJlo1U+FSiG7Gm5D/0UvQ43il4zZo
 +QcALTJju95i+06ORx7McPZUjGlXbbmjrXtrHlUC+nmnbOHMGIxhjzaJlJea6Va2Nm
 a9CUnxYu27EZCPh6K/vYQ8OFZnk1lQvcFWZbSP3k8vmGbzsgwZouhAWiPOND5zdQF2
 74fyToGZjurbcL0q4qxJHtfbqwU+InXUfhzfu3hyaOWc/ggmf5Z4xabKvJoa9fuXhd
 LXM95Vo74i9Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 03/17] ALSA: usb-audio: US16x08: Move overflow
 check before array access
Date: Mon, 27 Jun 2022 22:26:01 -0400
Message-Id: <20220628022615.596977-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022615.596977-1-sashal@kernel.org>
References: <20220628022615.596977-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Daniil Dementev <d.dementev@ispras.ru>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
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

From: Daniil Dementev <d.dementev@ispras.ru>

[ Upstream commit 3ddbe35d9a2ebd4924d458e0246b4ba6c13bb456 ]

Buffer overflow could occur in the loop "while", due to accessing an
array element before checking the index.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Daniil Dementev <d.dementev@ispras.ru>
Reviewed-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Link: https://lore.kernel.org/r/20220610165732.2904-1-d.dementev@ispras.ru
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_us16x08.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 7db3032e723a..5e3b7fd43fc2 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -647,10 +647,10 @@ static int snd_get_meter_comp_index(struct snd_us16x08_meter_store *store)
 		}
 	} else {
 		/* skip channels with no compressor active */
-		while (!store->comp_store->val[
+		while (store->comp_index <= SND_US16X08_MAX_CHANNELS
+			&& !store->comp_store->val[
 			COMP_STORE_IDX(SND_US16X08_ID_COMP_SWITCH)]
-			[store->comp_index - 1]
-			&& store->comp_index <= SND_US16X08_MAX_CHANNELS) {
+			[store->comp_index - 1]) {
 			store->comp_index++;
 		}
 		ret = store->comp_index++;
-- 
2.35.1

