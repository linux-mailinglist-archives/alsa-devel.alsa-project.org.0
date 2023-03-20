Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD5C6C22DF
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 21:36:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A41C1E1;
	Mon, 20 Mar 2023 21:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A41C1E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679344588;
	bh=R7uiQ1feQw6p3sdCJIwiFXfTPysR2lDfUQ/O3lrdZTw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=orro0/UiguIavJRG8qBSq/2unpw2WjVpbeoXs0kAc9e+Ye8o/huR48XS0PyXBFhrF
	 kNuMXCzFsJPnDli7vkpioeY6PmMPjU4dDobdvoSQ8dNDsj5crth0akIR32Vg9wyA+k
	 vaHInpsXj/nfP8OpJyak+cJF4d6/eHTKpCBg1c7I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE670F802E8;
	Mon, 20 Mar 2023 21:35:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0017CF804FE; Mon, 20 Mar 2023 21:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0D7AF800C9
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 21:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D7AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=bdzw+2ut
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id A146716C004D;
	Mon, 20 Mar 2023 22:35:24 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRUwbhaV26Ey; Mon, 20 Mar 2023 22:35:23 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1679344523; bh=R7uiQ1feQw6p3sdCJIwiFXfTPysR2lDfUQ/O3lrdZTw=;
	h=From:To:Cc:Subject:Date:From;
	b=bdzw+2utFb32iI1er0u+KgqIInBFKvoPWd/wyp2dCnSRGxjb9WxxZ2LWzfOjv2cDv
	 YBzeZOlva+NYHs+3Mi/kHa84pu7q32G/A69xDJlgkmxhMemM40T/5NAx+IrSWJG7st
	 s7bem0Zlr5GE/I0ozN9zG8rVlpMaQtsIzcKmLYsQ=
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/4] ASoC: amd: acp: Add sound support for a line of HUAWEI
 laptops
Date: Mon, 20 Mar 2023 22:35:15 +0200
Message-Id: <20230320203519.20137-1-posteuca@mutex.one>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XYKKSWC6GGZEEUNCVKILHSHBIBNFBL7O
X-Message-ID-Hash: XYKKSWC6GGZEEUNCVKILHSHBIBNFBL7O
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Marian Postevca <posteuca@mutex.one>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYKKSWC6GGZEEUNCVKILHSHBIBNFBL7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds support for a line of HUAWEI laptops with
AMD CPUs that connect using the ACP3x module to a ES8336 codec.

The codec driver must be extended to support the S32 LE format
and the MCLK div by 2 option. MCLK div by 2 is needed for one specific
SKU which uses a 48Mhz MCLK which seems to be too high of a frequency
for the codec and must be divided by 2.

The acp legacy driver must also be extended by using callbacks so that
the more complicated handling for this specific codec can be moved
outside the more generic ACP code.

The last patch tries to avoid anoying pop sounds when the speaker/headphones
are enabled/disabled by delaying the handling of the GPIOs and using a mutex
to avoid race conditions between the speaker power event callback and the
trigger callback.

Marian Postevca (4):
  ASoC: es8316: Enable support for S32 LE format and MCLK div by 2
  ASoC: amd: acp: Add support for splitting the codec specific code from
    the ACP driver
  ASoC: amd: acp: Add machine driver that enables sound for systems with
    a ES8336 codec
  ASoC: amd: acp: Improve support for speaker power events

 sound/soc/amd/acp-config.c                    |  70 ++
 sound/soc/amd/acp/Makefile                    |   2 +-
 sound/soc/amd/acp/acp-legacy-mach.c           | 105 ++-
 sound/soc/amd/acp/acp-mach-common.c           |   8 +
 sound/soc/amd/acp/acp-mach.h                  |  67 ++
 sound/soc/amd/acp/acp-renoir.c                |   4 +
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 615 ++++++++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h |  12 +
 sound/soc/codecs/es8316.c                     |  21 +-
 sound/soc/codecs/es8316.h                     |   3 +
 10 files changed, 886 insertions(+), 21 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h

-- 
2.39.1

