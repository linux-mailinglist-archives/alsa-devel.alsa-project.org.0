Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A88973CBEE
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jun 2023 18:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5694E822;
	Sat, 24 Jun 2023 18:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5694E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687625677;
	bh=vJWXnsXrmJaeNzBvJhAkWkF+ldPtMa4T7PgkD8TABGM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L7YQSaDAwoigEVJI+itgfDG1dT6e6rEeEJaPM3N2Emhkz3nEZAGc27FeYx2tMgkFM
	 jsxo0bAdf0z4Y76oL+nVWM5QOpbQwz1lKAyHKo3JGK1QQQBH1otQFx1NIUVxbjcpSY
	 9C5VeHqAB0QCCj7WbsZ9E4ujAZhggz+7tlP1H28s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE5CF8003A; Sat, 24 Jun 2023 18:53:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C361F801D5;
	Sat, 24 Jun 2023 18:53:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCADFF80141; Sat, 24 Jun 2023 18:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 166C9F80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 18:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 166C9F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=horus.com header.i=@horus.com header.a=rsa-sha256
 header.s=20180324 header.b=CyKtLNmV
Received: from [192.168.1.22] (193-81-115-8.adsl.highway.telekom.at
 [193.81.115.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id 5C0CE640B9;
	Sat, 24 Jun 2023 18:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1687625556;
	bh=WtkqfvRALn1bU+9oyk67tSfwogR+x0hk//0QW6Ye3lc=;
	h=From:To:Cc:Subject:Date:From;
	b=CyKtLNmVn7OgpUcXinRA7sKPvKmk80wk/j+yYdnysvYVXysd8qyPplADzEdgU2Qse
	 nv91Xo/rWj5dACyq9YH/flA6/cyG9e8tbiHaIZon8SkpYBuKsMVZsIEO+EyV8Nqxdc
	 Fu2jTJcRkZgXkmkzktgx25ELQ9r9RPWZbwTcYft8=
Received: by camel3.lan (Postfix, from userid 1000)
	id 047F8540544; Sat, 24 Jun 2023 18:52:35 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Matthias Reichl <hias@horus.com>,
	Dom Cobley <popcornmix@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: hdmi-codec: fix channel info for compressed formats
Date: Sat, 24 Jun 2023 18:52:32 +0200
Message-Id: <20230624165232.5751-1-hias@horus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZWSVQUFDMNT3MPJSCJMOMOHX5K5PDK43
X-Message-ID-Hash: ZWSVQUFDMNT3MPJSCJMOMOHX5K5PDK43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWSVQUFDMNT3MPJSCJMOMOHX5K5PDK43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to CTA 861 the channel/speaker allocation info in the
audio infoframe only applies to uncompressed (PCM) audio streams.

The channel count info should indicate the number of channels
in the transmitted audio, which usually won't match the number of
channels used to transmit the compressed bitstream.

Some devices (eg some Sony TVs) will refuse to decode compressed
audio if these values are not set correctly.

To fix this we can simply set the channel count to 0 (which means
"refer to stream header") and set the channel/speaker allocation to 0
as well (which would mean stereo FL/FR for PCM, a safe value all sinks
will support) when transmitting compressed audio.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 sound/soc/codecs/hdmi-codec.c | 36 +++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 6d980fbc42077..d21f69f053422 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -495,31 +495,43 @@ static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
 					struct hdmi_codec_params *hp)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	int idx;
-
-	/* Select a channel allocation that matches with ELD and pcm channels */
-	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, channels);
-	if (idx < 0) {
-		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
-			idx);
-		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
-		return idx;
+	int idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
+	u8 ca_id = 0;
+	bool pcm_audio = !(hcp->iec_status[0] & IEC958_AES0_NONAUDIO);
+
+	if (pcm_audio) {
+		/* Select a channel allocation that matches with ELD and pcm channels */
+		idx = hdmi_codec_get_ch_alloc_table_idx(hcp, channels);
+
+		if (idx < 0) {
+			dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
+				idx);
+			hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
+			return idx;
+		}
+
+		ca_id = hdmi_codec_channel_alloc[idx].ca_id;
 	}
 
 	memset(hp, 0, sizeof(*hp));
 
 	hdmi_audio_infoframe_init(&hp->cea);
-	hp->cea.channels = channels;
+
+	if (pcm_audio)
+		hp->cea.channels = channels;
+	else
+		hp->cea.channels = 0;
+
 	hp->cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
 	hp->cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
 	hp->cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
-	hp->cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
+	hp->cea.channel_allocation = ca_id;
 
 	hp->sample_width = sample_width;
 	hp->sample_rate = sample_rate;
 	hp->channels = channels;
 
-	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
+	hcp->chmap_idx = idx;
 
 	return 0;
 }
-- 
2.39.2

