Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A455BD42
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66DF61640;
	Tue, 28 Jun 2022 04:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66DF61640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656382805;
	bh=Xkb0VAVnJd5IRM7nock+vyU/sDGgNuk4ZOFBIVhKWjs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjKGDT2/YSh0rgubbziujRFc5SygNRuFKF1FGWZ21/YPMWV9tNc0k6SdgM7qZvgZz
	 SRhe6QNDxTShybd0ckJ1slSsHnxHjaiuUrf2cw9sCWd9aoDOEI8pj9orch86pXtbDs
	 6FOflYfWCZtS0ZWhd1eGa6iSJJACfRiasqwNZV4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD994F80107;
	Tue, 28 Jun 2022 04:19:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A65EF80167; Tue, 28 Jun 2022 04:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72421F80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72421F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ao6Kdh3G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1EF6BCE1BD3;
 Tue, 28 Jun 2022 02:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD8C34115;
 Tue, 28 Jun 2022 02:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382732;
 bh=Xkb0VAVnJd5IRM7nock+vyU/sDGgNuk4ZOFBIVhKWjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ao6Kdh3GTqFnHAAFrdCLZyB2Fm8GgiveBTV0WVj+rS0+3cfzUnBulMg1zRBhUso1v
 jDUdnsFXYHJYMFU7RdpFz4BvXqBhPhyoy7o77GHoMAEgXxJTGJxHDAB+dPrFWffNWS
 y1rj7yXnGY7FO3FHfqAAoTwzmYRTLawDkOspeNXod7vdCE7ir6kh2RW+Y7oZNQ58LZ
 TF1WEHm2tdt7WLTxdinumZRWV3PZUYuniDkHx1pmvySbcK9oSC9AkAdthFDhgGWjSJ
 VKttOFFnxUwMnAsG/R4kenC7bY1Z8oDnmxYXew7ojCC/k5MMSdnnYQFxcep+Enh/ta
 S0m6oRmcMX5ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 06/53] ALSA: usb-audio: US16x08: Move overflow
 check before array access
Date: Mon, 27 Jun 2022 22:17:52 -0400
Message-Id: <20220628021839.594423-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
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
index b7b6f3834ed5..6eb7d93b358d 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -637,10 +637,10 @@ static int snd_get_meter_comp_index(struct snd_us16x08_meter_store *store)
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

