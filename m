Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447855BD6F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09701655;
	Tue, 28 Jun 2022 04:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09701655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656383026;
	bh=JLS2vc7eT3IroK7sfnXoArGiiUkK3Td1ggulnMuXfEg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCIXx84zbjIcjgvS2WGyavwAhyHlGqUkN6VeBs33WREMtugw+pEFF7tpqZQZ2Zu4+
	 EAjF5FbaIeS89Qa8arz/t/YSR1xyuNfBBd3LiLKulKxEG+LT+k8SYg2gX/hFj5SCyS
	 2k4K1MBOIJnDGnlGVAPrvdERfY/tJpXTpqFTtCes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BD25F80115;
	Tue, 28 Jun 2022 04:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78624F8025B; Tue, 28 Jun 2022 04:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EB56F80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EB56F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bwQKNwQr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86125617D2;
 Tue, 28 Jun 2022 02:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDDAC341CC;
 Tue, 28 Jun 2022 02:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382970;
 bh=JLS2vc7eT3IroK7sfnXoArGiiUkK3Td1ggulnMuXfEg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bwQKNwQrDpguPbtZ8wSi3TTo/oPtfVl6FpTN8WDnloU0rki6vKUti5wPtiGV9GRCr
 cod8yz8S2e6p0Xh6UhtLxWr1l01tjgyWdtxX1VVnJ9Mb/SAnonKT2TkDI2ySG0pL2l
 tJeokpC5mS/+Wmfs8Vxt0Rj6M218Biwh6yhW2e3eUY1Zqll57ziDyuTefXV9RTAAug
 GRN7Xx0EXAlEUi7nijeSsTifRcLptyMwVWYEqprUvv0LVKR6yDzyJRr81DOX0imP+S
 LQ8kC0Zl/V1flEUV3N6j66M0uDwsApSkzKc2ZM6rwwIktINfvDm9UXc2n9ma+SgNWa
 j7ekp2UsV4vqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/34] ALSA: usb-audio: US16x08: Move overflow
 check before array access
Date: Mon, 27 Jun 2022 22:22:11 -0400
Message-Id: <20220628022241.595835-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
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
index bd63a9ce6a70..71f6186edcdd 100644
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

