Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490B3A7B40
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:55:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5016516AE;
	Tue, 15 Jun 2021 11:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5016516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623750895;
	bh=bUNwX1FajaMxAUMKMggh0isexF78T/Cn0JQZeudD4vk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jg++ZCJFdgZ3OcLp9Jk5bYPP5IDKft3+ZpgdCJI7YK8fZNzX7tc/ubW/h/S8DTNpy
	 MboXhI1E3FMmrVfxK03R1I1m2+Hh3Lbp1W1Kd1AoLLFatS27AL0mcDV7ssAU+kkMZ/
	 wsmLD7X0CJ3gbrlKc0UiFScX7hVnBqkAkgQ3W0Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6044F804E2;
	Tue, 15 Jun 2021 11:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86DE5F8025A; Tue, 15 Jun 2021 11:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 783EDF8016C
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 11:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 783EDF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="KNXnX17o"
Received: from localhost (dslb-084-062-104-230.084.062.pools.vodafone-ip.de
 [84.62.104.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: ch@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6645C8164D;
 Tue, 15 Jun 2021 11:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623750632;
 bh=LgXfwdM5YNIBTNOc5lUEZso0FP2+9BZUwQgnJU99CqE=;
 h=From:To:Cc:Subject:Date:From;
 b=KNXnX17oFvqmBUe0vvHAe8RIOCOK+nQxqDEIB3fNkPlryT0AIKDNdUWwnT1iXutWR
 WzvCvR6SYOqtKOUZ2izEPeR4prkIci1NBMlWDKPhFM0rB3HltWIiFKI3aCxFGhrPAR
 0z8JiEQHWkxmSFDlpuWS8PscnuS33oAZbR15H6NbRC1HamPGINQ4sqIoTolpZMkUwW
 WSbnrNDIEEJKQz0zFDD9NeFVcm6zogiW5XKzFlIDz0bGAlWUidmkn9myCtALAKZhxT
 T+AxSZzTCMway4W7PkOrpYzJCyhavq8eTI1R/AyUnbKWOP7NBCLUlWiOp5wyCUXuNn
 6CnTIe9j0dPzQ==
From: Claudius Heine <ch@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>
Subject: [PATCH 0/3] ASoC: tlv320aic32x4: Add support for TAS2505
Date: Tue, 15 Jun 2021 11:49:29 +0200
Message-Id: <20210615094933.3076392-1-ch@denx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 15 Jun 2021 11:51:53 +0200
Cc: Claudius Heine <ch@denx.de>
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

Hi,

this is an early patchset that provides support for the TAS2505 by the
tlv320aic32x4 driver.

Playback with aplay and the right mixer settings seems to be working, but some
mixer settings either cause distortions or popping. Any input on how to prevent
that is welcome.

Also with this change TAS2505 is compiled in unconditionally whenever
SND_SOC_TLV320AIC32X4_I2C is enabled. Maybe an additional option for the TAS2505
should be added, but then we probably also need a setting to provide only
support for the TAS2505 and not the TLV320AIC32X4. Not sure how to set that up
in the best way.

This is my first time working with the sound subsystem, so expect stupidity and
obvious mistakes.

regards,
Claudius

Claudius Heine (3):
  ASoC: tlv320aic32x4: prepare driver for different device variants
  ASoC: tlv320aic32x4: add support for TAS2505
  ASoC: tlv320aic32x4: dt-bindings: add TAS2505 to compatible

 .../bindings/sound/tlv320aic32x4.txt          |   1 +
 sound/soc/codecs/tlv320aic32x4-i2c.c          |  22 ++-
 sound/soc/codecs/tlv320aic32x4-spi.c          |  23 ++-
 sound/soc/codecs/tlv320aic32x4.c              | 173 +++++++++++++++++-
 sound/soc/codecs/tlv320aic32x4.h              |  10 +
 5 files changed, 219 insertions(+), 10 deletions(-)


base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
-- 
2.32.0

