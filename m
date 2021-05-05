Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D693C374326
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69EAF1751;
	Wed,  5 May 2021 18:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69EAF1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233769;
	bh=L40hcuFjXBEMwH8EYrimSoIFlROA8Eps/UJXGasiQKI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2a5uVg3e84fGTDm9oVsYY803W+YsesIzXwlI2aYHMCJrihBtGz+k2XFRcoV/Y2HR
	 OScr4qu8Ibhzo8vmxoR7f8/fdBK5wBSZJZ/vPi3I3JQsm/XuJHbht5ojr1/W3ME47Y
	 tOoNWM+lNOK7yrbNVVx6buLaLAUX34BZb6FPM31A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC85EF8028D;
	Wed,  5 May 2021 18:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A8BF8062D; Wed,  5 May 2021 18:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68857F8032C
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68857F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kmaQ4jsZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2208861993;
 Wed,  5 May 2021 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232750;
 bh=L40hcuFjXBEMwH8EYrimSoIFlROA8Eps/UJXGasiQKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kmaQ4jsZa46MouDYprhL4oPdd31Ef9LG/brg2JIAyl0QhALMXUpJzq7ELZYM44nrj
 qKt81WfPyEH6NsSc2Zr09fGJn5ExNVZ1LykklOz9AL3pYCV9KnH7x2PFHPSKdzczs7
 mUQoEvMUELfspq8hDPlBgbZmgbn/GgJaWXgcWlpCtYsPHsi6Ik7isrHX2xUtUQBhyM
 nFp8Xx0NF7GR69HTQ+eueyeag5jz6ZAHgQF1BP5/y7MA/yl4bBkk9OZEdKv7WWttoJ
 67aackvFHU4eso0TTmSWmQwcN7wPxuW33qgkaqiuhJfkXYJ0dLUieSJt50Z08WsNvN
 4umDgROzDIQVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/46] ALSA: bebob: enable to deliver MIDI
 messages for multiple ports
Date: Wed,  5 May 2021 12:38:20 -0400
Message-Id: <20210505163856.3463279-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163856.3463279-1-sashal@kernel.org>
References: <20210505163856.3463279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit d2b6f15bc18ac8fbce25398290774c21f5b2cd44 ]

Current implementation of bebob driver doesn't correctly handle the case
that the device has multiple MIDI ports. The cause is the number of MIDI
conformant data channels is passed to AM824 data block processing layer.

This commit fixes the bug.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20210321032831.340278-4-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/bebob/bebob_stream.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index ce07ea0d4e71..3935e90c8e8f 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -534,20 +534,22 @@ int snd_bebob_stream_init_duplex(struct snd_bebob *bebob)
 static int keep_resources(struct snd_bebob *bebob, struct amdtp_stream *stream,
 			  unsigned int rate, unsigned int index)
 {
-	struct snd_bebob_stream_formation *formation;
+	unsigned int pcm_channels;
+	unsigned int midi_ports;
 	struct cmp_connection *conn;
 	int err;
 
 	if (stream == &bebob->tx_stream) {
-		formation = bebob->tx_stream_formations + index;
+		pcm_channels = bebob->tx_stream_formations[index].pcm;
+		midi_ports = bebob->midi_input_ports;
 		conn = &bebob->out_conn;
 	} else {
-		formation = bebob->rx_stream_formations + index;
+		pcm_channels = bebob->rx_stream_formations[index].pcm;
+		midi_ports = bebob->midi_output_ports;
 		conn = &bebob->in_conn;
 	}
 
-	err = amdtp_am824_set_parameters(stream, rate, formation->pcm,
-					 formation->midi, false);
+	err = amdtp_am824_set_parameters(stream, rate, pcm_channels, midi_ports, false);
 	if (err < 0)
 		return err;
 
-- 
2.30.2

