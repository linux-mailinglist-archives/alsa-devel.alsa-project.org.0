Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD93A0CD
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B54C16AD;
	Sat,  8 Jun 2019 18:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B54C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012884;
	bh=DI827wQoAaJAemR313KEcvcyk67tXzQjFWyKS5yDrf8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0Jed6ICv20thY6IJd2bzRA5Er9Z0g/lypg0p9HC77TXqY9FKE0+6fwR/jpNGw12y
	 rvShS92ob5yHZylwgOaWNPQZGsIERReUKLWScQy7hOyPecddAotjc8K/F4Qx4JVi4G
	 ROjbqwA4kfZ3hHXf9ZAHXkalVJMOIafURlPLUqG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF23F89792;
	Sat,  8 Jun 2019 18:40:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 563A0F896DD; Fri,  7 Jun 2019 18:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E8FAF896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 18:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E8FAF896CE
Received: from [IPv6:2a00:5f00:102:0:6dae:eb08:2e0f:5281] (unknown
 [IPv6:2a00:5f00:102:0:6dae:eb08:2e0f:5281])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gtucker)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0AA1D28530C;
 Fri,  7 Jun 2019 17:31:16 +0100 (BST)
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <5cef9f66.1c69fb81.39f30.21e8@mx.google.com>
 <s5hr28gszvj.wl-tiwai@suse.de>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <8ca25787-fc03-7942-0705-3ec7d88862a6@collabora.com>
Date: Fri, 7 Jun 2019 17:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hr28gszvj.wl-tiwai@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: alsa-devel@alsa-project.org, "kernelci.org bot" <bot@kernelci.org>,
 tomeu.vizoso@collabora.com, khilman@baylibre.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 matthew.hart@linaro.org, mgalka@collabora.com, enric.balletbo@collabora.com
Subject: Re: [alsa-devel] next/master boot bisection: next-20190528 on
 sun8i-h3-libretech-all-h3-cc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/05/2019 16:53, Takashi Iwai wrote:
> On Thu, 30 May 2019 11:16:22 +0200,
> kernelci.org bot wrote:
>>
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> * This automated bisection report was sent to you on the basis  *
>> * that you may be involved with the breaking commit it has      *
>> * found.  No manual investigation has been done to verify it,   *
>> * and the root cause of the problem may be somewhere else.      *
>> * Hope this helps!                                              *
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>
>> next/master boot bisection: next-20190528 on sun8i-h3-libretech-all-h3-cc
>>
>> Summary:
>>   Start:      531b0a360899 Add linux-next specific files for 20190528
>>   Details:    https://kernelci.org/boot/id/5cece0fd59b5144bc47a362b
>>   Plain log:  https://storage.kernelci.org//next/master/next-20190528/arm/sunxi_defconfig/gcc-8/lab-baylibre/boot-sun8i-h3-libretech-all-h3-cc.txt
>>   HTML log:   https://storage.kernelci.org//next/master/next-20190528/arm/sunxi_defconfig/gcc-8/lab-baylibre/boot-sun8i-h3-libretech-all-h3-cc.html
>>   Result:     34ac3c3eb8f0 ASoC: core: lock client_mutex while removing link components
>>
>> Checks:
>>   revert:     PASS
>>   verify:     PASS
>>
>> Parameters:
>>   Tree:       next
>>   URL:        git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>   Branch:     master
>>   Target:     sun8i-h3-libretech-all-h3-cc
>>   CPU arch:   arm
>>   Lab:        lab-baylibre
>>   Compiler:   gcc-8
>>   Config:     sunxi_defconfig
>>   Test suite: boot
>>
>> Breaking commit found:
>>
>> -------------------------------------------------------------------------------
>> commit 34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb
>> Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Date:   Thu May 23 10:12:01 2019 -0700
>>
>>     ASoC: core: lock client_mutex while removing link components
>>     
>>     Removing link components results in topology unloading. So,
>>     acquire the client_mutex before removing components in
>>     soc_remove_link_components. This will prevent the lockdep warning
>>     seen when dai links are removed during topology removal.
>>     
>>     Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>     Signed-off-by: Mark Brown <broonie@kernel.org>
>>
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 2403bec2fccf..7c9415987ac7 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -1005,12 +1005,14 @@ static void soc_remove_link_components(struct snd_soc_card *card,
>>  	struct snd_soc_component *component;
>>  	struct snd_soc_rtdcom_list *rtdcom;
>>  
>> +	mutex_lock(&client_mutex);
>>  	for_each_rtdcom(rtd, rtdcom) {
>>  		component = rtdcom->component;
>>  
>>  		if (component->driver->remove_order == order)
>>  			soc_remove_component(component);
>>  	}
>> +	mutex_unlock(&client_mutex);
>>  }
> 
> Indeed this dead-locks in the error path of
> snd_soc_instantiate_card():
> 
> snd_soc_instantiate_card() ->
>   mutex_lock(&client_mutex);
>   ....
>   -> soc_cleanup_card_resources();
>     -> soc_remove_dai_links();
>       -> soc_remove_link_components();
>          mutex_lock(&client_mutex);
> 
> 
> Ranjani, which code path your patch tries to address?  Maybe better to
> wrap client_mutex() in the caller side like snd_soc_unbind_card()?

Is anyone looking into this issue?

It is still occurring in next-20190606, there was a bisection
today which landed on the same commit.  There just hasn't been
any new bisection reports because they have been temporarily
disabled while we fix some issues on kernelci.org.

Thanks,
Guillaume

>>  static void soc_remove_dai_links(struct snd_soc_card *card)
>> -------------------------------------------------------------------------------
>>
>>
>> Git bisection log:
>>
>> -------------------------------------------------------------------------------
>> git bisect start
>> # good: [cd6c84d8f0cdc911df435bb075ba22ce3c605b07] Linux 5.2-rc2
>> git bisect good cd6c84d8f0cdc911df435bb075ba22ce3c605b07
>> # bad: [531b0a360899269bd99a38ba9852a8ba46852bcd] Add linux-next specific files for 20190528
>> git bisect bad 531b0a360899269bd99a38ba9852a8ba46852bcd
>> # bad: [0b61d4c3b7d7938ef0014778c328e3f65c0d6d57] Merge remote-tracking branch 'crypto/master'
>> git bisect bad 0b61d4c3b7d7938ef0014778c328e3f65c0d6d57
>> # bad: [6179e21b065dc0f592cd3d9d3676bd64d4278025] Merge remote-tracking branch 'xtensa/xtensa-for-next'
>> git bisect bad 6179e21b065dc0f592cd3d9d3676bd64d4278025
>> # bad: [3e085f66fe7e93575f2a583a3d434415cef2d860] Merge remote-tracking branch 'amlogic/for-next'
>> git bisect bad 3e085f66fe7e93575f2a583a3d434415cef2d860
>> # bad: [b9afa223a3420432bc483d2b43429c88c6a5d0e0] Merge remote-tracking branch 'staging.current/staging-linus'
>> git bisect bad b9afa223a3420432bc483d2b43429c88c6a5d0e0
>> # good: [fc6557648e19dbd207dc815c6e09fc6452f01e63] Merge remote-tracking branch 'bpf/master'
>> git bisect good fc6557648e19dbd207dc815c6e09fc6452f01e63
>> # bad: [6c3f2a0e0f236f31b47d63ab7d3f4ec889821d0d] Merge remote-tracking branch 'spi-fixes/for-linus'
>> git bisect bad 6c3f2a0e0f236f31b47d63ab7d3f4ec889821d0d
>> # bad: [20a5f9c8649d74407aa657ce5b76cf8b0bbb17e3] Merge branch 'asoc-5.2' into asoc-linus
>> git bisect bad 20a5f9c8649d74407aa657ce5b76cf8b0bbb17e3
>> # good: [ad6eecbfc01c987e0253371f274c3872042e4350] ASoC: cs42xx8: Add regcache mask dirty
>> git bisect good ad6eecbfc01c987e0253371f274c3872042e4350
>> # good: [069d037aea98ffa64c26d4b1dc958fb8f39f5c2b] ASoC: simple-card: Fix configuration of DAI format
>> git bisect good 069d037aea98ffa64c26d4b1dc958fb8f39f5c2b
>> # good: [df9366131a452296d040a7a496d93108f1fc240c] ASoC: Intel: sof-rt5682: fix AMP quirk support
>> git bisect good df9366131a452296d040a7a496d93108f1fc240c
>> # bad: [34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb] ASoC: core: lock client_mutex while removing link components
>> git bisect bad 34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb
>> # good: [4819d06292c9b57eabdd6d1603e49a27baf183be] ASoC: simple-card: Restore original configuration of DAI format
>> git bisect good 4819d06292c9b57eabdd6d1603e49a27baf183be
>> # first bad commit: [34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb] ASoC: core: lock client_mutex while removing link components
>> -------------------------------------------------------------------------------
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
