Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E148258CA3F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965BA84C;
	Mon,  8 Aug 2022 16:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965BA84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659968126;
	bh=hzdSlYkEs4yiARVdPVq8IgbRQfL2rmS7xsV/zBGzUAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0e1rWXGoGu+AtyqHMIwUHy8lfV+SomulnipJsvXzF7KW9WCacMQEYqZM+S+SqDUs
	 kctCuV22RpYUQs4n9cI/ch8jhCNWb402VbWknNSCezGFlXZ4YQUKHFGhMCN1/AGLLM
	 A42zQ2gt0GXTwncaiJtvr05+xB1GjrKlqQf2JerA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E63EF80430;
	Mon,  8 Aug 2022 16:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4E5F804E5; Mon,  8 Aug 2022 16:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RDNS_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1367BF800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 16:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1367BF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="i9JupiQV"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1659968029; bh=Fm6Vba/6+QU/ozbeHX3SBdqTd1u/vXS5xt2ra8/hbQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=i9JupiQV2QeN9T4EKz8VtX70/98gICqnMnKLpeKAgrbZX41+oFiF15k+2I+keXcwp
 0qvNxH5gkC1WByC6ghMhR9U+d7FhzocQnl7u07xBz0pepFYu/9xuf2p1nLd696073/
 MPrvpBye7PmZYdCJuZqxTYKDEtvRxgn6aHCu/bqU=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/4] ASoC: tas2770: Allow mono streams
Date: Mon,  8 Aug 2022 16:12:44 +0200
Message-Id: <20220808141246.5749-3-povik+lin@cutebit.org>
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 asahi@lists.linux.dev,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

The part is a mono speaker amp, but it can do downmix and switch between
left and right channel, so the right channel range is 1 to 2.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 10b64d5ba756..db446db88df5 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -507,7 +507,7 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 		.id = 0,
 		.playback = {
 			.stream_name    = "ASI1 Playback",
-			.channels_min   = 2,
+			.channels_min   = 1,
 			.channels_max   = 2,
 			.rates      = TAS2770_RATES,
 			.formats    = TAS2770_FORMATS,
-- 
2.33.0

