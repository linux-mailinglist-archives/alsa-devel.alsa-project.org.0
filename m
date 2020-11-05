Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FAE2A91BB
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:46:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4497916AE;
	Fri,  6 Nov 2020 09:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4497916AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652397;
	bh=wZFY2gDOL7d1xIozmeZaaG4vSi5kL3ZDsc11ysCDakk=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFFQmGIvlBK1q26+92SxYhhbV8dttMQo04ufkVHv3IKEZql7ygAO2E55eD2g4RDTP
	 2CyQ7FzfeVdMvN02p+7b0XRjQAsN8GfxAoualfpRuwdQLhDe8n5k3gVEHUyH0pBj1N
	 BkwnGGNOug9W6ahPIZHLq0+7E58PBH2AG+fTOIVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 323B1F804E0;
	Fri,  6 Nov 2020 09:43:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEB2BF80171; Thu,  5 Nov 2020 14:48:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF73F80150;
 Thu,  5 Nov 2020 14:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF73F80150
Received: from ip4d145e30.dynamic.kabel-deutschland.de ([77.20.94.48]
 helo=[192.168.66.101]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1kafcw-0004jl-Bi; Thu, 05 Nov 2020 14:48:34 +0100
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20201026234905.1022767-1-sashal@kernel.org>
 <20201026234905.1022767-39-sashal@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Build error with 5.9.5 in sound/soc/sof/intel/hda-codec.c (was:
 [PATCH AUTOSEL 5.9 039/147] ASoC: SOF: fix a runtime pm issue in SOF when
 HDMI codec doesn't work)
Message-ID: <f254331d-7ae2-e26f-3e1b-33a870349126@leemhuis.info>
Date: Thu, 5 Nov 2020 14:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026234905.1022767-39-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1604584129;4287bb41;
X-HE-SMSGID: 1kafcw-0004jl-Bi
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:14 +0100
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Lo! I just tried to compile 5.9.5 and ran into a build error with below 
patch. I only did a quick look (I have to leave the keyboard soon), but 
seems the patch quoted below that was added to 5.9.5 depends on 
11ec0edc6408 (git.kernel.org/linus/11ec0edc6408) which wasn't backported.

The build error can be found here:
https://kojipkgs.fedoraproject.org//work/tasks/8246/54978246/build.log

Relevant part:

+ make -s 'HOSTCFLAGS=-O2 -flto=auto -ffat-lto-objects -fexceptions -g 
-grecord-gcc-switches -pipe -Wall -Werror=format-security 
-Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS 
-specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong 
-specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -fcommon -m64 
-mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection' 
'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,now 
-specs=/usr/lib/rpm/redhat/redhat-hardened-ld ' ARCH=x86_64 'KCFLAGS= ' 
WITH_GCOV=0 -j48 modules
sound/soc/sof/intel/hda-codec.c: In function 'hda_codec_probe':
sound/soc/sof/intel/hda-codec.c:177:4: error: label 'error' used but not 
defined
   177 |    goto error;
       |    ^~~~
make[4]: *** [scripts/Makefile.build:283: 
sound/soc/sof/intel/hda-codec.o] Error 1
make[3]: *** [scripts/Makefile.build:500: sound/soc/sof/intel] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:500: sound/soc/sof] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [scripts/Makefile.build:500: sound/soc] Error 2
make: *** [Makefile:1784: sound] Error 2
make: *** Waiting for unfinished jobs....
+ exit 1

Looks like the compiler is right from a quick look at
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/soc/sof/intel/hda-codec.c?h=linux-5.9.y&id=43836fdc9e318a11233cf19c5ee7ffb04e8e5d8f

But as I said, I lack the time for a closer look.

Ciao, Thorsten

Am 27.10.20 um 00:47 schrieb Sasha Levin:
> From: Rander Wang <rander.wang@intel.com>
> 
> [ Upstream commit 6c63c954e1c52f1262f986f36d95f557c6f8fa94 ]
> 
> When hda_codec_probe() doesn't initialize audio component, we disable
> the codec and keep going. However,the resources are not released. The
> child_count of SOF device is increased in snd_hdac_ext_bus_device_init
> but is not decrease in error case, so SOF can't get suspended.
> 
> snd_hdac_ext_bus_device_exit will be invoked in HDA framework if it
> gets a error. Now copy this behavior to release resources and decrease
> SOF device child_count to release SOF device.
> 
> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Link: https://lore.kernel.org/r/20200825235040.1586478-3-ranjani.sridharan@linux.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   sound/soc/sof/intel/hda-codec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> index 2c5c451fa19d7..c475955c6eeba 100644
> --- a/sound/soc/sof/intel/hda-codec.c
> +++ b/sound/soc/sof/intel/hda-codec.c
> @@ -151,7 +151,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
>   		if (!hdev->bus->audio_component) {
>   			dev_dbg(sdev->dev,
>   				"iDisp hw present but no driver\n");
> -			return -ENOENT;
> +			goto error;
>   		}
>   		hda_priv->need_display_power = true;
>   	}
> @@ -174,7 +174,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
>   		 * other return codes without modification
>   		 */
>   		if (ret == 0)
> -			ret = -ENOENT;
> +			goto error;
>   	}
>   
>   	return ret;
> 

