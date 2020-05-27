Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A51E50D2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 00:00:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E375717D4;
	Wed, 27 May 2020 23:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E375717D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590616826;
	bh=JBeTUKI3wmtjK4sltywOn0ZqwscTvJc6WCSk7BsGLXY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENX0OP1GA8lmICZoI4ABc/Bd0L841qG1alOqVvEBKvd/jF7o7v6kjkEu3Xx4PmVRp
	 +KB9UrmtpTSEoqiy0+UpDUs7S6Q3XUW3D2Efm3zzQyO1XwYfdOLcVnACN/zgrw3jnc
	 uBwL/Sue3cblJ/hL3IsILwwwqnjZdyIyzCof4aoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C10AF8026F;
	Wed, 27 May 2020 23:58:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F60DF8021E; Wed, 27 May 2020 23:58:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2007EF80149
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 23:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2007EF80149
IronPort-SDR: pCDxBonnd+phyMFTc099saqtMe55USDG1ILTRJEM2A5gRtalNkUOB+pgQ8w6AZt0d0YIKoS4Fw
 Db8ZgVtFhwIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 14:57:49 -0700
IronPort-SDR: Dn6Nms0lbpwzDVjf1y1V182yGLNUKnB/z6J3wwYmISMjOh/yb/HE810zjdkcIVv0NMWoedQxOu
 gUXTc13nIEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; d="scan'208";a="376161975"
Received: from truongmi-mobl1.amr.corp.intel.com (HELO [10.255.229.101])
 ([10.255.229.101])
 by fmsmga001.fm.intel.com with ESMTP; 27 May 2020 14:57:48 -0700
Subject: Re: [PATCH] ASoC: rt5682: split i2c driver into separate module
To: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20200527193730.930412-1-arnd@arndb.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d4b437f7-f078-3b56-b405-82a31e2ef00d@linux.intel.com>
Date: Wed, 27 May 2020 16:57:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527193730.930412-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Akshu Agrawal <akshu.agrawal@amd.com>
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



On 5/27/20 2:34 PM, Arnd Bergmann wrote:
> With SND_SOC_AMD_RV_RT5682_MACH using the i2c version of the
> driver, we can easily get a build failure when I2C is built-in
> but soundwire is not:
> 
>   WARNING: unmet direct dependencies detected for SND_SOC_RT5682
>     Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (I2C [=y] || SOUNDWIRE [=m]) && (SOUNDWIRE [=m] || !SOUNDWIRE [=m]) && (I2C [=y] || !I2C [=y])
>     Selected by [y]:
>     - SND_SOC_AMD_RV_RT5682_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP3x [=y] && I2C [=y] && CROS_EC [=y]
>     Selected by [m]:
>     - SND_SOC_RT5682_SDW [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=m] && (I2C [=y] || !I2C [=y])
> 
> Rework the driver to have three separate modules, with the
> main driver just dealing with the common bits and the actual
> initialization as part of i2c and sdw specific modules.
> 
> The conversion is fairly mechanical to keep it easy to review,
> i.e. it moves code around with the minimal required renaming
> and changes.
> 
> Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
> Fixes: fd443a20c2f0 ("ASoC: rt5682: fix I2C/Soundwire dependencies")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks for this cleanup.
