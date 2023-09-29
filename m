Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA47B3ACD
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 21:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F055DDF1;
	Fri, 29 Sep 2023 21:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F055DDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696017140;
	bh=Tv4XSUJn0z8NKT9rcBBjVyqsONGabGcQaLLHK7CTgkM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZYSkvboskji9LFK8yI/jVCY5vcVUgGDbSeOnx26/Ju3R6dvr8iIz6yjOo2lLXFc4T
	 NwsxRV7n/gR27yACHUA2dBO21btPBjl4JeswzoWHvQgIqBbV/r5NQ4/wC6uOAZfbWj
	 Wmqho5qGYXIAavXUYHE2oLqmDN/4hM1IdHVQrsNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55A9EF80166; Fri, 29 Sep 2023 21:51:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83C33F80166;
	Fri, 29 Sep 2023 21:51:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C8DF801D5; Fri, 29 Sep 2023 21:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DF25F800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 21:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF25F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=horus.com header.i=@horus.com header.a=rsa-sha256
 header.s=20180324 header.b=K+lfAKKi
Received: from [192.168.1.22] (62-116-56-22.adsl.highway.telekom.at
 [62.116.56.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id 12B5F640D4;
	Fri, 29 Sep 2023 21:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1696017052;
	bh=A0f9xM+pAK1ZXmqDJMtxA0Dz7JH/H4w1NFDWJNmIZTs=;
	h=From:To:Cc:Subject:Date:From;
	b=K+lfAKKiNO5ezqR7ThCbMlNLnDkwH2O5ZhmbwpRJXeRpcyRRdBYI97iml3KbU9ZsY
	 lt/eZgB7D6vBQAC9tf2V0RZNy42l4DBdRyTGo4FRb5+4X/+SoZfBEQER1P/KLG1HMe
	 pMwnjV+VLN5B3yng7adDLfUwk8gJ0r4DUnKQLhl0=
Received: by camel3.lan (Postfix, from userid 1000)
	id 78226540650; Fri, 29 Sep 2023 21:50:51 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Matthias Reichl <hias@horus.com>
Subject: [PATCH v2] ASoC: hdmi-codec: Fix broken channel map reporting
Date: Fri, 29 Sep 2023 21:50:28 +0200
Message-Id: <20230929195027.97136-1-hias@horus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z43UB3K4U6UXKLGGVC2W3ELSZM5X74GR
X-Message-ID-Hash: Z43UB3K4U6UXKLGGVC2W3ELSZM5X74GR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z43UB3K4U6UXKLGGVC2W3ELSZM5X74GR/>
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

Switch this back to ca_id in case of PCM audio so the correct channel
map is reported again and set it to HDMI_CODEC_CHMAP_IDX_UNKNOWN in
case of non-PCM audio so the PCM channel map control returns "Unknown"
channels (value 0).

Fixes: 4e0871333661 ("ASoC: hdmi-codec: fix channel info for compressed formats")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Reichl <hias@horus.com>
---
Changes in v2:
  - Report unknown channel in case of non-pcm audio

 sound/soc/codecs/hdmi-codec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13689e718d36f..09eef6042aad6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -531,7 +531,10 @@ static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
 	hp->sample_rate = sample_rate;
 	hp->channels = channels;
 
-	hcp->chmap_idx = idx;
+	if (pcm_audio)
+		hcp->chmap_idx = ca_id;
+	else
+		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 
 	return 0;
 }
-- 
2.39.2

