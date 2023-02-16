Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD1699543
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6EBDDF4;
	Thu, 16 Feb 2023 14:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6EBDDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676553106;
	bh=nt6PfmKJY/TnSossDKDW+Qu24jU1OwjXVNwTUXTp85Y=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BClZZUhJSyNW3OoqApQOhpaI8lMc39+XHeCfUj2/scu1ez1DnBap0O5qE2ABadRV5
	 OYJZboWPE27XC2HlmQKObvAaGkR04DjgidMKuyDuyy0BgKnjVoZWxGny343SfvSnzc
	 +rCMlx4HOm5IX+0eZM2e3MoqKkweYyLA07CeQCuI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23ED9F800E4;
	Thu, 16 Feb 2023 14:10:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADBB1F80171; Thu, 16 Feb 2023 14:10:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97B9DF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97B9DF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jx/GWyAJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6A5DFB8279F;
	Thu, 16 Feb 2023 13:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59183C433D2;
	Thu, 16 Feb 2023 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676553039;
	bh=nt6PfmKJY/TnSossDKDW+Qu24jU1OwjXVNwTUXTp85Y=;
	h=From:To:Cc:Subject:Date:From;
	b=jx/GWyAJ+OiU9BWg+AlMkiNi8ZpLHhTg5h1MEAYZkRViet69nUd8EMShWo73TbaDP
	 Pm2GzFhtEe2vGfUHliNVi1O1cSmcwXEconyigNA2UV89vDMFn5+RS0rMvmrjdchHn7
	 dRNR1ckIcS4CkfMCbo6YFiR/oP/gok1yegV4zecyFv7zeyRiC/rQnVDfsT+5Qnp+zK
	 ZjRPPO0nhsIlegUlNjaWg41QDEQ7stgDyNX8FezDkxzA2syJY3Ge089DP0B0ulaISe
	 sM0fj3IqSPe1uabibx3aMjAA6cbeEKuYSTvzwRzjuzIMtjdjrkR63AmtdixALLjU4x
	 QW9MjRo+9UNyw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.2-rc8
Date: Thu, 16 Feb 2023 13:10:30 +0000
Message-Id: <20230216131038.59183C433D2@smtp.kernel.org>
Message-ID-Hash: XIMQWWKWE7DBR6PKOLWIS7ZY6WI6N6NK
X-Message-ID-Hash: XIMQWWKWE7DBR6PKOLWIS7ZY6WI6N6NK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIMQWWKWE7DBR6PKOLWIS7ZY6WI6N6NK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c173ee5b2fa6195066674d66d1d7e191010fb1ff:

  ASoC: topology: Return -ENOMEM on memory allocation failure (2023-02-07 14:06:26 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.2-rc8

for you to fetch changes up to 5afc7eefe41645259da84898fc55f6f46cb4de47:

  ASoC: SOF: ops: refine parameters order in function snd_sof_dsp_update8 (2023-02-08 11:51:45 +0000)

----------------------------------------------------------------
ASoC: Fix for v6.2

One non-urgent fix for v6.2, this could possibly wait till the
merge window.

----------------------------------------------------------------
Rander Wang (1):
      ASoC: SOF: ops: refine parameters order in function snd_sof_dsp_update8

 sound/soc/sof/ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
