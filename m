Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C65424138
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9921B844;
	Wed,  6 Oct 2021 17:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9921B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633533754;
	bh=tz/tkkFFykmjWdt/xLZtQ3ZbxppV1BqnkZgRR2EhO1g=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/QMg9MpWKR/tZOgJC85YEjcAHTvWCCJ8+Ur8HZiBif51aEmkAkrcmmSyWZM/OmJd
	 zePQvBKoOOCT2s2tpzfX8zfVvqPxvx1tjWApm+lv5Pdnte0g3RbLbjvSPNShccktjl
	 DX+PBCJU/6hf1c+VMFIDO6+iqtpU2BQPCq8/tIxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1366F80249;
	Wed,  6 Oct 2021 17:21:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DB70F80240; Wed,  6 Oct 2021 17:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0237.hostedemail.com
 [216.40.44.237])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A686CF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A686CF8020D
Received: from omf11.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id A7DD0837F253;
 Wed,  6 Oct 2021 15:21:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf11.hostedemail.com (Postfix) with ESMTPA id 080E720A295; 
 Wed,  6 Oct 2021 15:21:02 +0000 (UTC)
Message-ID: <4b81a10dca78e286a9f806464b97111b5a15a91e.camel@perches.com>
Subject: Re: [PATCH v1 2/4] ASoC: Intel: bytcr_rt5640: Use temporary
 variable for struct device
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>,  alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Wed, 06 Oct 2021 08:21:01 -0700
In-Reply-To: <20211006150442.16503-2-andriy.shevchenko@linux.intel.com>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
 <20211006150442.16503-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 080E720A295
X-Stat-Signature: 8aekekj99zu1ctnfx1qokd454e7rys9e
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18qTXXPdHN1jxMBl/v3fsqtmjPbrTwJ6UI=
X-HE-Tag: 1633533662-251987
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
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

On Wed, 2021-10-06 at 18:04 +0300, Andy Shevchenko wrote:
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

trivia:

Some will complain about a lack of commit message.

> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
[]
> @@ -1536,7 +1536,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  		put_device(&adev->dev);
>  		byt_rt5640_dais[dai_index].codecs->name = byt_rt5640_codec_name;
>  	} else {
> -		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
> +		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
>  		return -ENXIO;
>  	}

And code that does

	if (foo) {
		[code...]
	} else {
		log_msg();
		return -ERR;
	}

should generally have its test reversed and use an unindented block.

	if (!foo) {
		log_msg();
		return -ERR;
	}
	[code...];


