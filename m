Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0EA78DA8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Apr 2025 14:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B253460200;
	Wed,  2 Apr 2025 14:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B253460200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743595236;
	bh=v2+xbhBFEQkillvuHFmwHN+5rpOg2yvJAvJeDxIa1UU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RItqyWE1bfupkyJ2iq1RfZAmnz66QsId03iJlBSSKv90CMbmQCJ8grLE8xPpOPo+J
	 rwcgfaRGqTEe6YAPDDNo1503y1N9Oj9PHmKr94x7r1F8lp755rQZbYsPQB03Ghj9Mv
	 wMHKtc9TRAMSqwaGvgWNEoLpY7f868ov3IMDkNCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48218F805BB; Wed,  2 Apr 2025 14:00:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D23F805B4;
	Wed,  2 Apr 2025 14:00:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45272F80301; Wed,  2 Apr 2025 13:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 520ADF800D2
	for <alsa-devel@alsa-project.org>; Wed,  2 Apr 2025 13:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 520ADF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vDO9jC+K
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E45EA44317;
	Wed,  2 Apr 2025 11:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF13C4CEE9;
	Wed,  2 Apr 2025 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743595191;
	bh=v2+xbhBFEQkillvuHFmwHN+5rpOg2yvJAvJeDxIa1UU=;
	h=From:To:Cc:Subject:Date:From;
	b=vDO9jC+K7ygyzU/WsxXURAAxnrBJlrMlGgJXlkp4uqQ/dI+HmNyVFkbmr0Jo5L+zv
	 5wOB/VS55t5Vy8Mge/bo7iL63/21ztZfi56rLNdh4DfdnK1gUm6O2KA2AVeCfA9Q/L
	 NUPsZ5aAF2N4+3GuBgBgG+QU0A1Hknjau0gtegZzlmViyY0XlYDmdx1bFG37vFD1Eg
	 U8lNhNtEoAmrgsVX+mjtZVooSbG2LwSpL04urpAF92t8jrGuu5b07sn5jnABW9OAG+
	 m10OGjd5sHtUDYsvYlAY/e9+6h34jW1uou88tNTSRjuEsXZu7Hive1IpKclKgcQnx0
	 7qOOyUAcXQCjw==
Message-ID: <fb75f883b177ba9e2505680fb1c45b9d.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-merge-window
Date: Wed, 02 Apr 2025 12:59:36 +0100
Message-ID-Hash: A3Z4FAZVOOMNUGTVC3N5F7GKOWPOSFQG
X-Message-ID-Hash: A3Z4FAZVOOMNUGTVC3N5F7GKOWPOSFQG
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3Z4FAZVOOMNUGTVC3N5F7GKOWPOSFQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 9ef52d529bb75071e03cf85078f724d69c4abe89:

  ASoC: SDCA: Correct handling of selected mode DisCo property (2025-03-21 15:45:25 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-merge-window

for you to fetch changes up to 93d34608fd162f725172e780b1c60cc93a920719:

  ASoC: imx-card: Add NULL check in imx_card_probe() (2025-04-01 17:01:10 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A relatively large set of fixes that came in since the release, mostly
for Qualcomm platforms.  The biggest block of fixes is the set from
Srini which fixes various quality and glitching issues on AudioReach
systems.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path

Christophe JAILLET (1):
      ASoC: codecs: rt5665: Fix some error handling paths in rt5665_probe()

Dan Carpenter (1):
      ASoC: sma1307: Fix error handling in sma1307_setting_loaded()

Henry Martin (1):
      ASoC: imx-card: Add NULL check in imx_card_probe()

Krzysztof Kozlowski (2):
      ASoC: codecs: wsa883x: Correct VI sense channel mask
      ASoC: codecs: wsa884x: Correct VI sense channel mask

Mark Brown (2):
      ASoC: codecs: wsa88xx: Correct VI sense channel mask
      ASoC: q6apm: fix under runs and fragment sizes

Peter Ujfalusi (1):
      ASoC: SOF: hda/ptl: Move mic privacy change notification sending to a work

Richard Fitzgerald (1):
      firmware: cs_dsp: Ensure cs_dsp_load[_coeff]() returns 0 on success

Srinivas Kandagatla (5):
      ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
      ASoC: q6apm: add q6apm_get_hw_pointer helper
      ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
      ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
      ASoC: q6apm-dai: make use of q6apm_get_hw_pointer

 drivers/firmware/cirrus/cs_dsp.c |  2 ++
 sound/soc/codecs/rt5665.c        | 24 +++-------------
 sound/soc/codecs/sma1307.c       | 11 ++------
 sound/soc/codecs/wsa883x.c       |  2 +-
 sound/soc/codecs/wsa884x.c       |  2 +-
 sound/soc/fsl/imx-card.c         |  4 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c | 60 +++++++++++++++++++++-------------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 19 +++++++++----
 sound/soc/sof/intel/hda-dsp.c    |  8 ++++++
 sound/soc/sof/intel/hda.c        |  4 +++
 sound/soc/sof/intel/hda.h        |  8 ++++++
 sound/soc/sof/intel/ptl.c        | 33 +++++++++++++++++++---
 14 files changed, 128 insertions(+), 70 deletions(-)
