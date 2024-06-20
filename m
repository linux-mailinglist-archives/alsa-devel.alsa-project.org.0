Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E190FF52
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:49:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6148A4D;
	Thu, 20 Jun 2024 10:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6148A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718873341;
	bh=tYtDaVenY5VhTlX/bH/FbzM2s8oP7yy7scmWE/99cFY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rqaqINOl0/OKo1SXy5rt915L9gMD3KqZ+Ck5cBbIbDE48WmAWaVMh1VyuNwkpHxL3
	 NVjcgVW4gaWnp7oUtQxuIZ+4ItOAKZWklJs+QCwzQAzaBNtlLfyuskqXvfN3rxfRq1
	 NzvhST5qpOGdgRYdnP/BPvqvnL7D3HgbqFiAP+K0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA30EF805B6; Thu, 20 Jun 2024 10:48:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 614F4F805AE;
	Thu, 20 Jun 2024 10:48:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E859F8058C; Thu, 20 Jun 2024 10:43:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 056B8F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 056B8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FFr+/Gbn
Received: by mail.gandi.net (Postfix) with ESMTPA id 330E420002;
	Thu, 20 Jun 2024 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bcqP/4Bzw72Fti9Nz8gpJCdKx5nEIN7PgHfX5LT8OWo=;
	b=FFr+/GbnH9ugA6vdC2XhsIiie53JB2O3yt0rQvNGeMUg6zk4l5chVUH9dQD0HK7vVqVyQW
	CJuKRnK1foti8pk66vu8/eMEweBo6Mfg7aFpaPg6Q7UNAoFLWYcXJJrPIy6KGZoiQ13O0C
	Ch/jW7WE6LMqOi+rGfas7LsauYvJIu9U4otaSfL+GR7UOi4jFDFySQlOzVHZuVODUSxQrr
	/DrAYd/jVD45bHbi+5InmQs1QYLxBU4EpbHUxCQkLD0nnlXdgsDFyZ1R95XQCDS2jRXRjA
	a7IdT/cUeRjXFX1TKmYiEO9MXrbI2P0i4maX4vQKgIJiLdJcuUTR3tM5Z6GYTQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 00/10] Add support for non-interleaved mode in qmc_audio
Date: Thu, 20 Jun 2024 10:42:47 +0200
Message-ID: <20240620084300.397853-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: WDVPEC5GPVHULUI2Q7ZEJ22V7B7RIZ3K
X-Message-ID-Hash: WDVPEC5GPVHULUI2Q7ZEJ22V7B7RIZ3K
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDVPEC5GPVHULUI2Q7ZEJ22V7B7RIZ3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The qmc_audio driver supports only audio in interleaved mode.
Non-interleaved mode can be easily supported using several QMC channel
per DAI. In that case, data related to ch0 are sent to (received from)
the first QMC channel, data related to ch1 use the next QMC channel and
so on up to the last channel.

In terms of constraints and settings, the interleaved and
non-interleaved modes are slightly different.

In interleaved mode:
  - The sample size should fit in the number of time-slots available for
    the QMC channel.
  - The number of audio channels should fit in the number of time-slots
    (taking into account the sample size) available for the QMC channel.

In non-interleaved mode:
  - The number of audio channels is the number of available QMC
    channels.
  - Each QMC channel should have the same number of time-slots.
  - The sample size equals the number of time-slots of one QMC channel.

This series add support for the non-interleaved mode in the qmc_audio
driver and is composed of the following parts:
  - Patches 1 and 2: Fix some issues in the qmc_audio
  - Patches 3 to 6: Prepare qmc_audio for the non-interleaved mode
  - Patches 7 and 8: Extend the QMC driver API
  - Patches 9 and 10: The support for non-interleaved mode itself

Best regards,
Hervé

Herve Codina (10):
  ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
  ASoC: fsl: fsl_qmc_audio: Fix issues detected by checkpatch
  ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM pointer
    handling
  ASoC: fsl: fsl_qmc_audio: Identify the QMC channel involved in
    completion routines
  ASoC: fsl: fsl_qmc_audio: Introduce
    qmc_audio_pcm_{read,write}_submit()
  ASoC: fsl: fsl_qmc_audio: Introduce qmc_dai_constraints_interleaved()
  soc: fsl: cpm1: qmc: Introduce functions to get a channel from a
    phandle list
  soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
  dt-bindings: sound: fsl,qmc-audio: Add support for multiple QMC
    channels per DAI
  ASoC: fsl: fsl_qmc_audio: Add support for non-interleaved mode.

 .../bindings/sound/fsl,qmc-audio.yaml         |  41 +-
 drivers/soc/fsl/qe/qmc.c                      |  32 +-
 include/soc/fsl/qe/qmc.h                      |  27 +-
 sound/soc/fsl/fsl_qmc_audio.c                 | 590 +++++++++++++-----
 4 files changed, 505 insertions(+), 185 deletions(-)

-- 
2.45.0

