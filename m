Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7B70E01E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D14320C;
	Tue, 23 May 2023 17:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D14320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684854894;
	bh=6T9XHnTWoSc7qaR9ksGN8PqCFcVFpFzIRQ1LrWaIMbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UTKikr7SAvlMVq0bcp4nk7Qyr/8bKjnSst9mbVKgt7IL7/GDiyF82j3p3oJ/J0xH6
	 tNlz5L+jlAaCWJGwuUMp+V7LUll08Qn13YKNg9MrLfncBECOlwmd20tAEK06hH/gXR
	 y/9D1XcM8F/EkjXHDyDw45daJl5K7nVbs0dz1LKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29FCEF8057C; Tue, 23 May 2023 17:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB2CF8057C;
	Tue, 23 May 2023 17:12:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD9FDF80567; Tue, 23 May 2023 17:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBEADF80548
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEADF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SHHtcMfh
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id C2404C000C;
	Tue, 23 May 2023 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684854762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaB/0wDo6caLF16LcGUil+N2SlVgAqTWL0MVlJHk1e0=;
	b=SHHtcMfh8AILZzywUiY+JuAsqPsBNtIXcI99+1kFaoQx5tj45NNugTxMOGHKc9hsTpwRQt
	rekNusNg0UOA9IZBQjhpH6EnJljUKPtYlMsujlxrj9Pdi8NLBEzE5+3kImsVnYjIwY8hwH
	tFx7JS/y8wGDFj3ki1R0Gg3gk8tqZ1KTbXxxm6netGuSSOd1LxYP/puO8boVlj/KFEbNEQ
	tTcDj0Xb17GTmOJX/tWtfSzWYp1vX4LV6zx3Vs64lntAwgGStP3ZRyP489WiO7pyKuVLbV
	/rnhF87CmiYy8fNos+Ria3POWqavMpiBPD1d7l1w4hcgPh9m46SMxDrE/jy1vg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 3/9] iio: inkern: Check error explicitly in
 iio_channel_read_max()
Date: Tue, 23 May 2023 17:12:17 +0200
Message-Id: <20230523151223.109551-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523151223.109551-1-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7MX5FLMI7OKS75GFS3M6MMXHRSXWVDKE
X-Message-ID-Hash: 7MX5FLMI7OKS75GFS3M6MMXHRSXWVDKE
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MX5FLMI7OKS75GFS3M6MMXHRSXWVDKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current implementation returns the error code as part of the
default switch case.
This can lead to returning an incorrect positive value in case of
iio_avail_type enum entries evolution.

In order to avoid this case, be more strict in error checking.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/iio/inkern.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 872fd5c24147..f738db9a0c04 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -858,6 +858,9 @@ static int iio_channel_read_max(struct iio_channel *chan,
 		val2 = &unused;
 
 	ret = iio_channel_read_avail(chan, &vals, type, &length, info);
+	if (ret < 0)
+		return ret;
+
 	switch (ret) {
 	case IIO_AVAIL_RANGE:
 		switch (*type) {
@@ -888,7 +891,7 @@ static int iio_channel_read_max(struct iio_channel *chan,
 		return 0;
 
 	default:
-		return ret;
+		return -EINVAL;
 	}
 }
 
-- 
2.40.1

