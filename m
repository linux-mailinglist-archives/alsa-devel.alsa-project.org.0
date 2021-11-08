Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F005447EA0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 12:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9B611C;
	Mon,  8 Nov 2021 12:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9B611C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636369984;
	bh=7jjDd9CBG4/LM9amMERhrdw6zgQgalfZow+o2TL+xNc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u6LOo6G97+vgEqFPbar131TtvPR+IsSMClZTkfC5Hm1tx8b/Lj2DteBmzcXwWYWTi
	 ZpPxDHtFKG0k72vvf/achQnS0k6SIKnohdIrGg8LSz8MaLOAksv0v7UZxVkRSinqZ+
	 KUqjH5bI45fxZwOJZzKrBRv6dqoMcntNzC7q/6nE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F926F804BC;
	Mon,  8 Nov 2021 12:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79EAAF8049E; Mon,  8 Nov 2021 12:11:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22B44F801D8;
 Mon,  8 Nov 2021 12:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B44F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZEAOGc3d"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D44C61360;
 Mon,  8 Nov 2021 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636369898;
 bh=7jjDd9CBG4/LM9amMERhrdw6zgQgalfZow+o2TL+xNc=;
 h=From:To:Cc:Subject:Date:From;
 b=ZEAOGc3d4l/towaigTVgofn/UkzylCCIJ+PhIFhCQ3xphTcn1FlajJ0XOeScD0Fyw
 lXNNInOyttPKnW/iVWxjcocDkiwdM9pPv8xJABz1ksoLMlF6g6mGC3pXaiwnEwc1UT
 zmQKV6b66LgBfc+T6dk77dvV1HuvKeCFo5m6AckiAWLzCwz8kOOQs1m24DcXr/5SRF
 XR9WkoJP/sNM0Lm9MRAkpV7knrwo/6ygiH7IZrlZSobStZgOOaYS2rF6zQSXgMgLw/
 4Sx8TEZVczKCP4O9PVmxH6c3NQdkZAkxHg/cfnlHTjVM+9L6Xw5bG0aNLGveO9brR9
 91OPC9ACS3psw==
From: Arnd Bergmann <arnd@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] ASoC: SOF: build compression interface into snd_sof.ko
Date: Mon,  8 Nov 2021 12:11:14 +0100
Message-Id: <20211108111132.3800548-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Bud Liviu-Alexandru <budliviu@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

From: Arnd Bergmann <arnd@arndb.de>

With CONFIG_SND_SOC_SOF_COMPRESS=m, the compression code is
not built into a the main SOF driver when that is built-in:

x86_64-linux-ld: sound/soc/sof/ipc.o: in function `ipc_stream_message':
ipc.c:(.text+0x5a2): undefined reference to `snd_sof_compr_fragment_elapsed'
x86_64-linux-ld: sound/soc/sof/topology.o: in function `sof_dai_load':
topology.c:(.text+0x32d1): undefined reference to `snd_sof_compr_init_elapsed_work'
x86_64-linux-ld: topology.c:(.text+0x32e1): undefined reference to `snd_sof_compr_init_elapsed_work'

Make this a 'bool' symbol so it just decides whether the
code gets built at all.

Fixes: 858f7a5c45ca ("ASoC: SOF: Introduce fragment elapsed notification API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 6bb4db87af03..041c54639c4d 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -47,7 +47,7 @@ config SND_SOC_SOF_OF
 	  Say Y if you need this option. If unsure select "N".
 
 config SND_SOC_SOF_COMPRESS
-	tristate
+	bool
 	select SND_SOC_COMPRESS
 
 config SND_SOC_SOF_DEBUG_PROBES
-- 
2.29.2

