Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2914F0885
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 11:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E079175A;
	Sun,  3 Apr 2022 11:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E079175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648976486;
	bh=+MRl4rjdWzvUS2WdlS62P5OnEWVQOdoGiz49cpOtwgg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IDx6Z1z2gC+vIUrf1eW5oDU783xysypgFAwhble4Kx9DGuyFYwGF/959AefqB7H4C
	 o7QT4vPJ259qRyDhNigSaawZGjTYcXP0RT79Vl7BHni7mXYetrTpbm9+FkGRXNQdoK
	 e/wEg3Gau3CqbI3rMlysd6ErHFZkqSGm4vZChkVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81204F8051B;
	Sun,  3 Apr 2022 10:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AAB0F80100; Sun,  3 Apr 2022 10:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38CC0F8012A
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 10:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38CC0F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e/UxQhRf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAF8560FEA;
 Sun,  3 Apr 2022 08:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227A8C340F3;
 Sun,  3 Apr 2022 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648976371;
 bh=+MRl4rjdWzvUS2WdlS62P5OnEWVQOdoGiz49cpOtwgg=;
 h=From:To:Cc:Subject:Date:From;
 b=e/UxQhRf7BDgVVBto0RfrPHS5nJwc3nj5bm9X+9H/bcsRhxwHuQIfmdfMd3B9Ap84
 td9OWJ8SFL9YLEGhDfgdv9NyQe3ecY3Sz2KUplVel5FFjb1lEWIt4Efumncx8W+1bs
 OSLr7NmMWm7jAdVGUPfBmT7B9XbTURf5MB/grhSLmhd0iqzhwQBQpEqgsbnlkDJSgD
 05P1AFDMmMCn7u+T3sq09iPWikzNVjzPtd60q0a2J0G3tY9mXtZoW3URJ+ov28yMEY
 r0ClxWttx+wA5uh+PkMRY0ffCVzu7ReGo+ddZES9RkI7VP+u+Mb3EPfnz+zxunVMj1
 mhskVBBOEQ1qw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1naw52-00D6f1-GH; Sun, 03 Apr 2022 10:59:28 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH RFC 0/2] Make headphone work on Huawei Matebook D15
Date: Sun,  3 Apr 2022 10:59:23 +0200
Message-Id: <cover.1648975926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

The headphone output at Huawei Matebook D15 is controlled by a separate
GPIO than the speaker. So, the es8336 boards logic need to handle two events:
one for the speaker switch and another one for the headphone.

Please notice that this is my first real incursion at SOC/SOF. While this is working
fine, I'm still struggling with some troubles with pipewire, which I believe are
due to UCM support, as, sometimes when pavucontrol starts, the playback stucks.
Also, sometimes the mixers won't change when jack plug/unplug is detected.

So, more debug is needed, and probably the UCM will also need to be closer to
the definitions that are used at ucm2/codecs/es8316/, as es8336 is a variant of
it.

Anyway, let me submit this as as RFC, in order to get some feedback if this is
going at the right way to support the headphone switch event.

Mauro Carvalho Chehab (2):
  ASoC: Intel: sof_es8336: support a separate gpio to control headphone
  ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a headphone gpio

 sound/soc/intel/boards/sof_es8336.c | 84 ++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 19 deletions(-)

-- 
2.35.1


