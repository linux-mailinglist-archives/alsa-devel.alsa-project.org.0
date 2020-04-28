Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ABD1BD04C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 01:02:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7236D168E;
	Wed, 29 Apr 2020 01:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7236D168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588114943;
	bh=ptMsBXsLktg0BB0cDNWWrjgVIk7Cne5Ji3wdSsjFFbg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tIDJA94rxHa4G190qPOoKNcg4ABCQi+TZUiNlE/AhFUv7HB5bikaMHQBIoivE/g+b
	 3MinrvGppN2q5sAonJcp1FiwJT61qyfqatZTTOtDi/FNKzi0rTILoJj+cyf88qPu52
	 XMMDggBGn+Fa0OEoNMc+OmMgKN3zdJMIYmd+emsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D123F800D2;
	Wed, 29 Apr 2020 01:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E88ADF801DB; Wed, 29 Apr 2020 01:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1903FF800D2;
 Wed, 29 Apr 2020 01:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1903FF800D2
IronPort-SDR: 6yCvm8WFz+zCz7UDVGeibI2SefeB27h9CutreC//I2+XrCeeRf0mWreCA9w419YHOqapopR2eU
 OiExNksT2iYg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 16:00:23 -0700
IronPort-SDR: XdQu1T4O+w7tdYK2qGoB/pje7lUhIhCK+zaZQPZtijPvA6alH1AnAEYXmwSywMks5ISfrR8SCX
 JAGfDdavyxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
 d="scan'208,223";a="247840359"
Received: from mdioury-mobl.amr.corp.intel.com (HELO [10.251.153.102])
 ([10.251.153.102])
 by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2020 16:00:20 -0700
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
References: <20200428212752.2901778-1-arnd@arndb.de>
 <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
 <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
 <f91c9a68-7641-beb8-a23e-bd1b9b8d0acb@linux.intel.com>
Message-ID: <b784c008-7094-05cb-6200-6b246ff39bb8@linux.intel.com>
Date: Tue, 28 Apr 2020 18:00:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f91c9a68-7641-beb8-a23e-bd1b9b8d0acb@linux.intel.com>
Content-Type: multipart/mixed; boundary="------------83E0C404AAA0BEDB5B37198B"
Content-Language: en-US
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

This is a multi-part message in MIME format.
--------------83E0C404AAA0BEDB5B37198B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



>>> Thanks Arnd, do you mind sharing your config?
>>
>> https://pastebin.com/HRX5xi3R
> 
> will give it a try, thanks!
> 
>>> We noticed last week that
>>> there's a depend/select confusion might be simpler to fix, see
>>> https://github.com/thesofproject/linux/pull/2047/commits
>>>
>>> If I look at the first line I see a IMX_DSP=n which looks exactly like
>>> what we wanted to fix.
>>
>> Yes, I think that fix addresses the build warning as well, but looking
>> more closely I don't think it's what you want: If you do this on
>> a config that has the IMX_DSP disabled, it would appear to the
>> user that you have enabled the drivers, but the actual code is still
>> disabled.
> 
> Are you sure? we added a select IMX_DSP, so not sure how it can be 
> disabled?

I just tested Arnd's config with the patch we came up with for SOF 
(attached) and it makes the unmet dependency go away and builds fine. 
the problem is really using select IMX_DSP if it can be disabled by 
something else. My proposal looks simpler but I will agree it's not 
necessarily super elegant to move the dependency on IMX_BOX into SOF, so 
no sustained objection from me on Arnd's proposal.

Daniel, this is your part of SOF, please chime in.

Thanks
-Pierre



--------------83E0C404AAA0BEDB5B37198B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ASoC-SOF-imx-fix-depends-select-IMX_DSP-confusion.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ASoC-SOF-imx-fix-depends-select-IMX_DSP-confusion.patch"

From 208e61ae18d3a4aa93ffa73db01c4e3c24a4979f Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 22 Apr 2020 06:21:56 -0500
Subject: [PATCH] ASoC: SOF: imx: fix depends/select IMX_DSP confusion

The two IMX targets don't use depends/select in a consistent way and
there's a potential for an unmet dependency. Move the dependency check
to a higher level and select IMX_DSP to avoid builtin/module issues.

Fixes: afb93d716533dd ("ASoC: SOF: imx: Add i.MX8M HW support")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index f76660e91382..a11ecc1d56db 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -21,7 +21,7 @@ config SND_SOC_SOF_IMX_OF
 
 config SND_SOC_SOF_IMX8_SUPPORT
 	bool "SOF support for i.MX8"
-	depends on IMX_SCU
+	depends on IMX_SCU && IMX_MBOX
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8 platforms
 	  Say Y if you have such a device.
@@ -29,7 +29,6 @@ config SND_SOC_SOF_IMX8_SUPPORT
 
 config SND_SOC_SOF_IMX8
 	tristate
-	depends on IMX_SCU
 	select IMX_DSP
 	help
 	  This option is not user-selectable but automagically handled by
@@ -37,6 +36,7 @@ config SND_SOC_SOF_IMX8
 
 config SND_SOC_SOF_IMX8M_SUPPORT
 	bool "SOF support for i.MX8M"
+	depends on IMX_MBOX
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8M platforms
 	  Say Y if you have such a device.
@@ -44,7 +44,7 @@ config SND_SOC_SOF_IMX8M_SUPPORT
 
 config SND_SOC_SOF_IMX8M
 	tristate
-	depends on IMX_DSP
+	select IMX_DSP
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
-- 
2.20.1


--------------83E0C404AAA0BEDB5B37198B--
