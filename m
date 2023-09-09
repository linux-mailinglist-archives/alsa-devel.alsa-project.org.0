Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C81DC7997BA
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 13:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE6E200;
	Sat,  9 Sep 2023 13:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE6E200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694260071;
	bh=owLaK7aMoAJXGh2YMAaiTqAr4HkncIGmD/I6Brqs7eo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WYTx8wTx31ob/S0k9J/o7ILV2sA8eBvtN/7Cx3xKOW59nVuBehXNZSyq2kz7vtKME
	 C7d65t1yq+AUuoAEAAt7rF5rFtKt+Szk+BLW0INPP6NGuQz1wfmMU6IzN3GWa3Uwie
	 qzvBx3tFJMrmfs3uvoN74thfyYRSQdsxnsIlxXNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40C36F80236; Sat,  9 Sep 2023 13:47:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B2FF8047D;
	Sat,  9 Sep 2023 13:47:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19174F80494; Sat,  9 Sep 2023 13:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D39A8F800F5
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 13:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D39A8F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=horus.com header.i=@horus.com header.a=rsa-sha256
 header.s=20180324 header.b=Fbn8SwsM
Received: from [192.168.1.22] (62-116-56-22.adsl.highway.telekom.at
 [62.116.56.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id 6B7D9640E6;
	Sat,  9 Sep 2023 13:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1694260003;
	bh=OtwsuRPxNJ3Hd3wlJeJDFu1xaUrQLnuoExX6JRunDEM=;
	h=From:To:Cc:Subject:Date:From;
	b=Fbn8SwsMkPn8CjlvozfPWIaMYnKMrb/j3A2FH94IuxWcEqpzeTIUJPJREf6fLZnGF
	 TZQQ2gH4Ehx2Kpfo2pcUALM8EBNiwMnE7b2pK/KxPGIUqtCRP7NdvK47vMu2hE01uw
	 tmboyt5V/B7QapSDo2QS8jVh0JqowOLcMBsvDvDk=
Received: by camel3.lan (Postfix, from userid 1000)
	id E44CC540586; Sat,  9 Sep 2023 13:46:42 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Matthias Reichl <hias@horus.com>
Subject: [PATCH] ASoC: hdmi-codec: Fix broken channel map reporting
Date: Sat,  9 Sep 2023 13:46:33 +0200
Message-Id: <20230909114633.3193-1-hias@horus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KBPYEZMAMTB77PCXW5V5VACB3NMN2LBC
X-Message-ID-Hash: KBPYEZMAMTB77PCXW5V5VACB3NMN2LBC
X-MailFrom: hias@horus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBPYEZMAMTB77PCXW5V5VACB3NMN2LBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 4e0871333661 ("ASoC: hdmi-codec: fix channel info for
compressed formats") accidentally changed hcp->chmap_idx from
ca_id, the CEA channel allocation ID, to idx, the index to
the table of channel mappings ordered by preference.

This resulted in wrong channel maps being reported to userspace,
eg for 5.1 "FL,FR,LFE,FC" was reported instead of the expected
"FL,FR,LFE,FC,RL,RR":

~ # speaker-test -c 6 -t sine
...
 0 - Front Left
 3 - Front Center
 1 - Front Right
 2 - LFE
 4 - Unknown
 5 - Unknown

~ # amixer cget iface=PCM,name='Playback Channel Map' | grep ': values'
  : values=3,4,8,7,0,0,0,0

Revert this incorrect change so that channel maps are properly
reported again.

Fixes: 4e0871333661 ("ASoC: hdmi-codec: fix channel info for compressed formats")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Reichl <hias@horus.com>
---
 sound/soc/codecs/hdmi-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13689e718d36f..c8e48225598f8 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -531,7 +531,7 @@ static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
 	hp->sample_rate = sample_rate;
 	hp->channels = channels;
 
-	hcp->chmap_idx = idx;
+	hcp->chmap_idx = ca_id;
 
 	return 0;
 }
-- 
2.39.2

