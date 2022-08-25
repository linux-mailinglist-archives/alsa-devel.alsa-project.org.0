Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DFE5A1BE8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 00:07:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E70950;
	Fri, 26 Aug 2022 00:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E70950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661465236;
	bh=Q5+Bi1B/SMTx6MvZqr40BzbPGKrMBPLeIBYyqLazQ/8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vElAKKBqtia8/egHcnCg8jdymq8GzQC1dM25SFh5aRRvKzm/fhnjg8EbyzgrhdgLg
	 Ws6nSsfX2Kb4rBtjGceqcvpb1WCvNNA+5A2cTCLV3SfkPaQuLpHNLxS1ZdZxk4MgA8
	 YRcgQ/NPPoXqe/dMoOU4bOseraigztCZTujITftY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98893F800BD;
	Fri, 26 Aug 2022 00:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9338DF8025A; Fri, 26 Aug 2022 00:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71536F800BD
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 00:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71536F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="gh6ftKJI"
Received: from localhost (unknown [188.27.54.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D20966601EB5;
 Thu, 25 Aug 2022 23:06:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661465168;
 bh=Q5+Bi1B/SMTx6MvZqr40BzbPGKrMBPLeIBYyqLazQ/8=;
 h=From:To:Cc:Subject:Date:From;
 b=gh6ftKJIVQLKO5dOmvcFnfcDOzXHWNzMS9IHXZj2byYLR8MxxEqTYAsGt7UmckXyl
 bNx2FSRFzzKbrfrDQPx6UsRpdJzjGrAmb/9nJaOD7OyndFWU9x8WtENvd0aq2JYNCU
 bPGGD1LMHXMtMYWqcN5i4vXfXi22vq0EBK+8kOSD3fhMnY+jvLDCWJcbmLIKl+Ziix
 K1i8wgWCxzjORxZbhRZfNBwhZcWkjOk8niA0b8YiCI3TO+V2Wn0igc3DyunWYxm2Rv
 u/Jv9Xoc1Sj8wL6TXlsie24cwPDe+Q6TpC9WzjpCN1VGketA87UoLR8asvOE78Hy1F
 kxoL511toqAlQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vlad Karpovich <Vlad.Karpovich@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: wm_adsp: Handle optional legacy support
Date: Fri, 26 Aug 2022 01:05:30 +0300
Message-Id: <20220825220530.1205141-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
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

The tracing capabilities for the speaker protection fw enabled via
commit c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker
protection FW") are not be available on all platforms, such as the
Valve's Steam Deck which is based on the Halo Core DSP.

As a consequence, whenever the firmware is loaded, a rather misleading
'Failed to parse legacy: -19' error message is written to the kernel
ring buffer:

[  288.977412] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware version: 3
[  288.978002] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: cs35l41-dsp1-spk-prot.wmfw: Fri 02 Apr 2021 21:03:50 W. Europe Daylight Time
[  289.094065] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware: 400a4 vendor: 0x2 v0.33.0, 2 algorithms
[  289.095073] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 0: ID cd v29.53.0 XM@94 YM@e
[  289.095665] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 1: ID f20b v0.0.1 XM@170 YM@0
[  289.096275] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Protection: C:\Users\ocanavan\Desktop\cirrusTune_july2021.bin
[  291.172383] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Failed to parse legacy: -19

Update wm_adsp_buffer_init() to print a more descriptive info message
when wm_adsp_buffer_parse_legacy() returns -ENODEV.

Fixes: c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker protection FW")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
 - Add a generic handling of the issue, not bound to a particular
   firmware, as suggested by Charles
 - Update commit message, including the subject, to reflect the changes

 sound/soc/codecs/wm_adsp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index cfaa45ede916..8a2e9771bb50 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1602,7 +1602,9 @@ static int wm_adsp_buffer_init(struct wm_adsp *dsp)
 	if (list_empty(&dsp->buffer_list)) {
 		/* Fall back to legacy support */
 		ret = wm_adsp_buffer_parse_legacy(dsp);
-		if (ret)
+		if (ret == -ENODEV)
+			adsp_info(dsp, "Legacy support not available\n");
+		else if (ret)
 			adsp_warn(dsp, "Failed to parse legacy: %d\n", ret);
 	}
 

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

