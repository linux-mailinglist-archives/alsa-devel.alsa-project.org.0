Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A3640BC2
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 18:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D90182D;
	Fri,  2 Dec 2022 18:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D90182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670000869;
	bh=AHzdPB9dRs3eR2tuIgd/3OpEJi2TgqIcYuU5Fv5Kk6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=km9ELjJPqVH8SrBkhXJoHR4T4bO+gp60w13icS6GUGCBt1E+3EivB4kgaegQ8JQ3T
	 FSWSUJwqpNLne9gaUdb6jcen7KKfl8un+W1etnRjrxZykr5t2bURUkYrE8baUKwlPx
	 s4cjLK54CC98E0o4tjoX6OOOH0TeycaQ+FFHRC5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76002F804B3;
	Fri,  2 Dec 2022 18:06:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F83CF80310; Fri,  2 Dec 2022 18:06:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CCAF800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 18:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CCAF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HGiMw5fS"
Received: by mail-wr1-x42d.google.com with SMTP id m14so8729567wrh.7
 for <alsa-devel@alsa-project.org>; Fri, 02 Dec 2022 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DuvKie3Dx2KIgWNRcmW0oxZHrl+MI0NaSKfULcEr3I8=;
 b=HGiMw5fSSEK86bo28QTWOXXexS72VOF3eIa05RufmYXooCYpg+Vsf6Vh8X2wyN4Bs6
 MwzYUA2h49FXlk/FBIwVypsBzk6Zmg+sNlhKc6uCTC2bkeLHIy7Q13Su77LuR+7oHXf7
 3Bnl4CAcYGyEZHQRDd45DPzuJL/x6EUMFWfvUZ3SRz568gLzMWSPBCN7LreLVFM9S9TH
 cYW33nSiIdXolIbHhVax7b9LExJ7PLp64lG9vTWX7Sum5tbUdpCFmYOGXMRQgDJU4iPA
 AKEEt+DBoQTm0mBOIwr388Yr+hLAHiJCG87lAc1leji7PDLlTZXwBKKkm4ENGU6vFZrK
 xv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DuvKie3Dx2KIgWNRcmW0oxZHrl+MI0NaSKfULcEr3I8=;
 b=otFMfz3CibBdOEhv15VnRNGK9ZgrUxypRvkcksEoS/FxejwdkaG6OIcnAy0lumbETC
 KIDIxk+K0tHXV+jws1vtNXz6b82puia2IVlqCwm5WKrV0JBQpjknbHufKCG5baRkRnVJ
 cIEpdrbEB4KskF/nWcX7Z+AxAltDWJnO31vzfAkbZM+MYrk2rFxmbeVD2ZBS/weOlbEX
 ORlcDOVgRzM1r5qKn8mssePNMNw1bxpYSum/6twRc+blApLF5xqFTwvj84Ma5O+18uGI
 nuv+Kf1mSAhvaAq5OB9MJ+7TyzhXcjylaHBSPNUHjf+H5aaEL0S9OALDrOAH/Gu0oneF
 LETA==
X-Gm-Message-State: ANoB5pnNHmEZuuoFb/wnjfGULqYtaV7TcitSusCptDG/UaYNySXjFuWq
 Q+cUcOxj5TbdK3ZDwlCNVM0=
X-Google-Smtp-Source: AA0mqf70wTOVwdJGdTTAZ0nkrF5y+kMmAztOCT121fxYREi9ws+qOBLZYyWqLUG5xCbHTrUzVmuz7w==
X-Received: by 2002:adf:a319:0:b0:242:45fe:740 with SMTP id
 c25-20020adfa319000000b0024245fe0740mr2219428wrb.408.1670000806808; 
 Fri, 02 Dec 2022 09:06:46 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q1-20020a05600000c100b002422fddcc94sm6849665wrx.96.2022.12.02.09.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 09:06:45 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: wcd938x: Make read-only array minCode_param
 static const
Date: Fri,  2 Dec 2022 17:06:44 +0000
Message-Id: <20221202170644.1814720-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate the read-only array minCode_param on the stack but
instead make it static const. Also makes the object code a little
smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/wcd938x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index aca06a4026f3..fcac763b04d1 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3128,8 +3128,8 @@ static inline void wcd938x_mbhc_get_result_params(struct wcd938x_priv *wcd938x,
 	s16 c1;
 	s32 x1, d1;
 	int32_t denom;
-	int minCode_param[] = {
-			3277, 1639, 820, 410, 205, 103, 52, 26
+	static const int minCode_param[] = {
+		3277, 1639, 820, 410, 205, 103, 52, 26
 	};
 
 	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MBHC_ZDET, 0x20, 0x20);
-- 
2.38.1

