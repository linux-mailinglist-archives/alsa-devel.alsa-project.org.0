Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282C16256B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 12:21:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89CC1694;
	Tue, 18 Feb 2020 12:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89CC1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582024872;
	bh=5muUfoPY1a9YANBRhF/Si7BMnVDOp3s8Ozsr5CAjWqk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cp9dAFfHeRUIQ1HrAagPs4wkKJxtpN3x+/D7soHOGO2CeTtYQ8gAa+M4AxJDypNdA
	 ybwyZVqPyFkl3J6BErPBI79DEiPOxuo2XAT9cJDIxPX9Dila72CB3vRPP4LTbQbUfV
	 eRcgDVeHWCH/sASRhGrjocbe9tnOJu7GpPkRE9ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB812F8027B;
	Tue, 18 Feb 2020 12:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD159F8014C; Tue, 18 Feb 2020 12:17:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9906F8014A
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 12:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9906F8014A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2B54AD2A;
 Tue, 18 Feb 2020 11:17:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: snprintf() usage fixes
Date: Tue, 18 Feb 2020 12:17:34 +0100
Message-Id: <20200218111737.14193-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
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

this is a series of patches I spotted during debugging other code.
Intel skl and ASoC PCM core invokes succeeding calls of snprintf()
with the incorrect expectation of the return value, which may lead to
a buffer overflow.

The first patch is yet another bug I found during working on this, and
it's rather a real bug that can be seen clearly.


Takashi

===

Takashi Iwai (3):
  ASoC: intel: skl: Fix pin debug prints
  ASoC: intel: skl: Fix possible buffer overflow in debug outputs
  ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs output

 sound/soc/intel/skylake/skl-debug.c | 32 +++++++++++++++++---------------
 sound/soc/soc-pcm.c                 | 16 ++++++++--------
 2 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.16.4

