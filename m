Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AA78CF59
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 00:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79998827;
	Wed, 30 Aug 2023 00:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79998827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693346549;
	bh=X0Dq/ie15C6kVMLCIxX5m01gOxRCdkYlZEPaPGAgA1E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q7xpbdanjHB/obI2ByFqHAzzEx+wJhvI/j0RhJuIwNkk7l1nwpeiC+BqVL1lOgSfk
	 92nXNz2EPIx3ggQdJPHFx9AK/b7FIHZDm2fRMtFANaPpO0IhbFaUU240EjpyMsRZxX
	 +a+dDSkMJlNKIPL5CI/1VXOA4h+kmuZXahwQcYIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D2DEF8025F; Wed, 30 Aug 2023 00:01:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F1BDF80155;
	Wed, 30 Aug 2023 00:01:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2303F80249; Wed, 30 Aug 2023 00:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A34AF80074
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 00:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A34AF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=j+hoXvCC
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 008FB16C004E;
	Wed, 30 Aug 2023 01:01:24 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NX2psMeZRXTw; Wed, 30 Aug 2023 01:01:22 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1693346481; bh=X0Dq/ie15C6kVMLCIxX5m01gOxRCdkYlZEPaPGAgA1E=;
	h=From:To:Cc:Subject:Date:From;
	b=j+hoXvCCAgvZlLcWUb0EXP4ITtDd+RcQT46WU6ogpWvS0SCtbQFP4G3GnBpxGf5zl
	 N2RpYqtzjXqUdPU+jN8f1uzlgynxzXf5AxJ7TXZ8gOwOR7/qbrP9FkPMYssRvY+8tT
	 zHsB2iydu+vf42YSBGYj8eyl61fLJu3xxI+EHRzQ=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v3 0/5] ASoC: amd: acp: Add sound support for a line of HUAWEI
 laptops
Date: Wed, 30 Aug 2023 01:01:11 +0300
Message-ID: <20230829220116.1159-1-posteuca@mutex.one>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CCJXUL3XS3TSS6Y4T7MDTF2PTH3YCY5
X-Message-ID-Hash: 6CCJXUL3XS3TSS6Y4T7MDTF2PTH3YCY5
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CCJXUL3XS3TSS6Y4T7MDTF2PTH3YCY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds support for a line of HUAWEI laptops with
AMD CPUs that connect using the ACP3x module to a ES8336 CODEC.

The CODEC driver must be extended to support the S32 LE format
and the MCLK div by 2 option. MCLK div by 2 is needed for one specific
SKU, which uses a 48Mhz MCLK, which seems to be too high of a frequency
for the CODEC and must be divided by 2.

The acp legacy driver must also be extended by using callbacks so that
the more complicated handling of this specific CODEC can be moved
outside the more generic ACP code.

Changes in v3:

- Modified commit message for patch 1: ASoC: es8316: Enable support for
   S32 LE format. The commit message implied that S32 LE format is the
   only one that is supported by the machine driver. The AMD ACP
   supports a wide variety of formats that are also supported by the
   CODEC. Now the purpose of the patch is to enable one additional
   format that is supported by the CODEC chip.

- Added new patch: Replace NR_SUPPORTED_MCLK_LRCK_RATIOS with ARRAY_SIZE()
   No need to have a special define when we can use ARRAY_SIZE() directly.

- Reworked the MCLK div by 2 option. Now the CODEC driver will first
   try to use halved frequency by checking if it can generate
   suitable clocking. If it can not, then the full MCLK will be used.
   In this way we can also support unknown SKU that have a too high
   MCLK frequency.

- Moved generic ACP code from patch 5, that introduces the new machine
   driver, to patch 4, that introduces ACP legacy callback mechanism.

- Removed the forced S32 LE format in the new machine driver.

Marian Postevca (5):
  ASoC: es8316: Enable support for S32 LE format
  ASoC: es8316: Replace NR_SUPPORTED_MCLK_LRCK_RATIOS with ARRAY_SIZE()
  ASoC: es8316: Enable support for MCLK div by 2
  ASoC: amd: acp: Add support for splitting the codec specific code from
    the ACP driver
  ASoC: amd: acp: Add machine driver that enables sound for systems with
    a ES8336 codec

 sound/soc/amd/acp-config.c                    |  70 +++
 sound/soc/amd/acp/Makefile                    |   2 +-
 sound/soc/amd/acp/acp-legacy-mach.c           | 102 +++-
 sound/soc/amd/acp/acp-mach-common.c           |   8 +
 sound/soc/amd/acp/acp-mach.h                  |  67 +++
 sound/soc/amd/acp/acp-renoir.c                |   4 +
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 443 ++++++++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h |  12 +
 sound/soc/codecs/es8316.c                     |  52 +-
 sound/soc/codecs/es8316.h                     |   3 +
 10 files changed, 736 insertions(+), 27 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h

-- 
2.41.0

