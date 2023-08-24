Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5D7879D7
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC16B83E;
	Thu, 24 Aug 2023 23:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC16B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692910996;
	bh=6T2scqYit3D9spXNYhaJ1FM2bv2gPNeQev13zZjEi60=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hTQx9LFw6hb5koxii0WB3rGVFzCmR33yXI3sRd/b6OqryqYQ6bMJroXstX6UKe7Zc
	 40Mkuuqao/fz2BCefPTtffot7zgyu/Wwo8rZ3m8VrZTZ6/Wvqx3kvl+gsy4BTof15e
	 3x+C2FMRgMpVqwcv/LglTGWKWCcRdObqrlxgMdBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AEE9F8025F; Thu, 24 Aug 2023 23:01:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3E9F8023B;
	Thu, 24 Aug 2023 23:01:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63555F804DA; Thu, 24 Aug 2023 23:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6123F80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6123F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=a8pNy9Xq
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id C780E16C004E;
	Fri, 25 Aug 2023 00:01:39 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2wbuo6xYTas; Fri, 25 Aug 2023 00:01:38 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1692910898; bh=6T2scqYit3D9spXNYhaJ1FM2bv2gPNeQev13zZjEi60=;
	h=From:To:Cc:Subject:Date:From;
	b=a8pNy9XqdK1KCXgqErE1o2Z08p2cOvKnAJZuW2VBoN3XsxXu6RDaQegxzWAdbbSIO
	 D4Waqh5jo1DfhmzzTSmzaTflI0X13PaZpB74XAgGn7BBnFTzAiurKUErezUqDXrDZo
	 vIJLrJBmNFg6YwkiIdQVJfQ7itX6sRFkiFtv/6+E=
To: Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v2 0/4] ASoC: amd: acp: Add sound support for a line of HUAWEI
 laptops
Date: Fri, 25 Aug 2023 00:01:31 +0300
Message-ID: <20230824210135.19303-1-posteuca@mutex.one>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G4EL5LZHJ2JIMPFR3ISQDJAJKXDGU4PH
X-Message-ID-Hash: G4EL5LZHJ2JIMPFR3ISQDJAJKXDGU4PH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4EL5LZHJ2JIMPFR3ISQDJAJKXDGU4PH/>
List-Archive: <>
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

Changes in v2:

- Removed patch 4: "ASoC: amd: acp: Improve support for speaker
  power events". May be resubmitted separately.
- Split the first commit that enabled support for S32 LE format and
  the MCLK div by 2 option into two separate commits.
- Removed the MCLK div by 2 DT property that was previously enabled by
  the machine driver. Now it's enabled by the CODEC driver if the MCLK
  frequency is equal or greater than 48Mhz.
- Used normal conditional statements.
- Removed constraint rates from the machine driver, the CODEC should be
  able to set them.
- Moved the DAI format configuration.
- Uncoupled the speaker and headphone GPIOs. Now they can be handled
  independently

Marian Postevca (4):
  ASoC: es8316: Enable support for S32 LE format
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
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 449 ++++++++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h |  12 +
 sound/soc/codecs/es8316.c                     |  22 +-
 sound/soc/codecs/es8316.h                     |   3 +
 10 files changed, 724 insertions(+), 15 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
 create mode 100644 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.h

-- 
2.41.0

