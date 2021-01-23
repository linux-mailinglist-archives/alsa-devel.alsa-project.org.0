Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FFE30173D
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 18:32:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C1A1871;
	Sat, 23 Jan 2021 18:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C1A1871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611423133;
	bh=SijsJP6XJDLyDad0Q+qEK6H9AacK/MX9V42CKBdylI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIzgAtsyj3GUpqT51jDeW8oVtzaLFZX1yN84EhZ6no3LzIglRGRBFCw/8V1nZWsc9
	 9gcnxtsrkou1Hu2uY78p+3GyPJLVPIXWKCfY6GesuWoUBCsK6oJ0ZzV0p67ey2e4DP
	 p2mAgBSql7Onn77OMFmka+Pc/9veXo8xPsJQORrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0E0F80255;
	Sat, 23 Jan 2021 18:30:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91287F80257; Sat, 23 Jan 2021 18:30:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B434F8015B
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 18:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B434F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q2u7KgC2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A65122B2C;
 Sat, 23 Jan 2021 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611423002;
 bh=SijsJP6XJDLyDad0Q+qEK6H9AacK/MX9V42CKBdylI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q2u7KgC2op0dGZ3WO8eRaOoijTsNKexbNmbYvC1eLBoZd5lc5QFMJ1zQfc6CVBZXX
 7JFTKG/7knqMy8FQmCnMD86RaKzM5jdnN+9wCcvl8ntgyV/wp38CKS8sUaM3HgO9wR
 bsqKmAIhEpwgm3lo3x7h8n/b08JA8nEfx6rv5I0fDKUV7nyXcp93ELf9TP3lZsxHoC
 yL19S1m67U99DLf7S8mQSe/JLfm7CEKRqgYXGjSyc622DMF6J1ldHtvYl5cYi/Y/iK
 TgTtdFtYn0OwXBsnHnriYMK5+eDuK+UwDzFOhJB/kkqiPTpM2BYZOds82v/le7cK+h
 d1rgktc3OIeLA==
Received: by earth.universe (Postfix, from userid 1000)
 id 4D6153C0C95; Sat, 23 Jan 2021 18:30:00 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Pavel Machek <pavel@ucw.cz>, Merlijn Wajer <merlijn@wizzup.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCHv1] ASoC: cpcap: fix microphone timeslot mask
Date: Sat, 23 Jan 2021 18:29:45 +0100
Message-Id: <20210123172945.3958622-1-sre@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YAqOSg2z24NpjKDh@mwanda>
References: <YAqOSg2z24NpjKDh@mwanda>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

The correct mask is 0x1f8 (Bit 3-8), but due to missing BIT() 0xf (Bit
0-3) was set instead. This means setting of CPCAP_BIT_MIC1_RX_TIMESLOT0
(Bit 3) still worked (part of both masks). On the other hand the code
does not properly clear the other MIC timeslot bits. I think this
is not a problem, since they are probably initialized to 0 and not
touched by the driver anywhere else. But the mask also contains some
wrong bits, that will be cleared. Bit 0 (CPCAP_BIT_SMB_CDC) should be
safe, since the driver enforces it to be 0 anyways.

Bit 1-2 are CPCAP_BIT_FS_INV and CPCAP_BIT_CLK_INV. This means enabling
audio recording forces the codec into SND_SOC_DAIFMT_NB_NF mode, which
is obviously bad.

The bug probably remained undetected, because there are not many use
cases for routing microphone to the CPU on platforms using cpcap and
user base is small. I do remember having some issues with bad sound
quality when testing voice recording back when I wrote the driver.
It probably was this bug.

Fixes: f6cdf2d3445d ("ASoC: cpcap: new codec")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Hi,

This is compile tested only, since I currently do not have
my Droid 4 ready for running some tests. Maybe Tony, Pavel or
Merlijn can give it a go using e.g. arecord.

Thanks,

-- Sebastian
---
 sound/soc/codecs/cpcap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index e266d993ab2a..05bbacd0d174 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1273,12 +1273,12 @@ static int cpcap_voice_hw_params(struct snd_pcm_substream *substream,
 
 	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
 		mask = 0x0000;
-		mask |= CPCAP_BIT_MIC1_RX_TIMESLOT0;
-		mask |= CPCAP_BIT_MIC1_RX_TIMESLOT1;
-		mask |= CPCAP_BIT_MIC1_RX_TIMESLOT2;
-		mask |= CPCAP_BIT_MIC2_TIMESLOT0;
-		mask |= CPCAP_BIT_MIC2_TIMESLOT1;
-		mask |= CPCAP_BIT_MIC2_TIMESLOT2;
+		mask |= BIT(CPCAP_BIT_MIC1_RX_TIMESLOT0);
+		mask |= BIT(CPCAP_BIT_MIC1_RX_TIMESLOT1);
+		mask |= BIT(CPCAP_BIT_MIC1_RX_TIMESLOT2);
+		mask |= BIT(CPCAP_BIT_MIC2_TIMESLOT0);
+		mask |= BIT(CPCAP_BIT_MIC2_TIMESLOT1);
+		mask |= BIT(CPCAP_BIT_MIC2_TIMESLOT2);
 		val = 0x0000;
 		if (channels >= 2)
 			val = BIT(CPCAP_BIT_MIC1_RX_TIMESLOT0);
-- 
2.29.2

