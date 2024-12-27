Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058DE9FD7AA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2024 21:28:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D26AF60370;
	Fri, 27 Dec 2024 21:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D26AF60370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735331331;
	bh=1iFDCQm++V+V6pkgjb+LTgznaht/lk9GRu1gf/8Fr00=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q0VPZYYkAxl/5qiZcaODuCu+U2P2jpCwLcMGsn07tpuayONr/K+mvQvl5ikNMGGiB
	 N4y520O76KwAWmMi/DoaMyCNeZud6Rt3nhi1DlDZMylbHMh/qC9QHsXiAKq2OibUOC
	 OmUx/h5uWajP56po2+zODc6Nv6sloRfQ+Yvu3VTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A879BF805BF; Fri, 27 Dec 2024 21:28:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A7CF805B0;
	Fri, 27 Dec 2024 21:28:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F8A6F8042F; Fri, 27 Dec 2024 21:27:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [37.27.84.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49414F800E4
	for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2024 21:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49414F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=fzou67c6
Received: from localhost (localhost [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id CB94D141055;
	Fri, 27 Dec 2024 20:27:53 +0000 (UTC)
X-Virus-Scanned: Scanned by mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bL70l0X6l5J; Fri, 27 Dec 2024 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1735331273; bh=1iFDCQm++V+V6pkgjb+LTgznaht/lk9GRu1gf/8Fr00=;
	h=From:To:Cc:Subject:Date:From;
	b=fzou67c6cXE5ZkV5ZM6uRLYNks+Hij4n/wLGAzWXOYRIwnr4W3n2Ka0OQerfeo0I5
	 UPsXVg7Fnj4vr3Ol6ch3vJESXvDTcJ1BNE3lAWTe+EXvis2bcTLfLAETwEWZqmy6I+
	 ADaenYY9YkvEe0QpgNuDUxyv1FtYTjLETqvpKa10YMtxlHt8fODFD3BZMuTA/Ith5r
	 QshxnUeT5JpVI01I0lSkInimaMJbKaK0v2TBYp1IF4csyt3jzJgpT8qC7uGTz7lbyc
	 +f1+NSCVTUWXz63XG+DuhvjaAvNadLWJhsDZjSEG7i1grwN78VD5xUKDmy6BjCf1jE
	 kXF0SgxjtF4qA==
Received: You can't see me ;-)
From: Marian Postevca <posteuca@mutex.one>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH RESEND] ASoC: codecs: es8316: Fix HW rate calculation for
 48Mhz MCLK
Date: Fri, 27 Dec 2024 22:27:51 +0200
Message-ID: <20241227202751.244954-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QBU64PSEK3D5PWBC4BAUFJ77PNKNPKGB
X-Message-ID-Hash: QBU64PSEK3D5PWBC4BAUFJ77PNKNPKGB
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBU64PSEK3D5PWBC4BAUFJ77PNKNPKGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For 48Mhz MCLK systems the calculation of the HW rate is broken,
and will not produce even one sane rate. Since es83xx supports
the option to halve MCLK, calculate also rates with MCLK/2.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/codecs/es8316.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 61729e5b50a8..f508df01145b 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -39,7 +39,9 @@ struct es8316_priv {
 	struct snd_soc_jack *jack;
 	int irq;
 	unsigned int sysclk;
-	unsigned int allowed_rates[ARRAY_SIZE(supported_mclk_lrck_ratios)];
+	/* ES83xx supports halving the MCLK so it supports twice as many rates
+	 */
+	unsigned int allowed_rates[ARRAY_SIZE(supported_mclk_lrck_ratios) * 2];
 	struct snd_pcm_hw_constraint_list sysclk_constraints;
 	bool jd_inverted;
 };
@@ -386,6 +388,12 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 
 		if (freq % ratio == 0)
 			es8316->allowed_rates[count++] = freq / ratio;
+
+		/* We also check if the halved MCLK produces a valid rate
+		 * since the codec supports halving the MCLK.
+		 */
+		if ((freq / ratio) % 2 == 0)
+			es8316->allowed_rates[count++] = freq / ratio / 2;
 	}
 
 	if (count) {
-- 
2.45.2

