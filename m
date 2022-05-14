Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA6D527F44
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA4C16CC;
	Mon, 16 May 2022 10:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA4C16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688545;
	bh=9CKskoo3OCV2g88InOoTDVCPrVDc9ACNA6yb1CYDP1E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEhjovd+V05czAX0EXDNJeNMyfswsCO7hDBAnowsdM64PywM9Nn3GpMptrBBCGudi
	 6B8vGXBt97xr/gKK2cYinSuKJYr+l6jU9vrEUIlEPN03dnmuLhrbKZxqh01nYlSwpd
	 I5E3WOVHkBxWHEvg1z6xJoTOVwwg+TY+is416PyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 762E1F80578;
	Mon, 16 May 2022 10:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3763F80163; Sat, 14 May 2022 04:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2027CF80083
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 04:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2027CF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rqpo30UM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4149EB8324C;
 Sat, 14 May 2022 02:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283BEC385AA;
 Sat, 14 May 2022 02:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652496595;
 bh=9CKskoo3OCV2g88InOoTDVCPrVDc9ACNA6yb1CYDP1E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rqpo30UM7Mksv/+SEikLMdE/k9FpTaABAeO/slUMX1ZLA/ar1n820UsuVPNCwclII
 rvpQaZshhfTKzXP+EKZI5zp6vr2KXbwskUzNDgoMeutxCfJ0GyB38bqu6KK4gLMvKH
 e0WHXRKjEpwKvub67LCZYaxCkeIhCl/g9/1fFsmMdLC++Q9AsoFrUhQDsti4tQKEq1
 WxpapIMnzQeoeLBdJqdAnD2TQ52zF5m+RNI3wLDbR+msyS4YOAMyjbNnYo81jddfN4
 +Z5/ghmovWS2+M/W8ov27dPcv3ak08TYNOSJtrVVyGJtJcKtOcqZZm1zeK/4MolXAp
 p9rUlCApnhkaQ==
Message-ID: <c8875143-87b7-9ece-8613-b8d90acb4526@kernel.org>
Date: Fri, 13 May 2022 19:49:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 11/15] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, kernel test robot <lkp@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220509085821.3852259-12-cezary.rojewski@intel.com>
 <202205091954.7hT2TBhd-lkp@intel.com>
 <bb6e1945-df7e-f339-ea69-05248d480af3@linux.intel.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <bb6e1945-df7e-f339-ea69-05248d480af3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:52 +0200
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>,
 kbuild-all@lists.01.org, cujomalainey@chromium.org, lma@semihalf.com
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



On 5/9/22 18:08, Amadeusz Sławiński wrote:
> On 5/9/2022 1:58 PM, kernel test robot wrote:
>> Hi Cezary,
>>
>> I love your patch! Perhaps something to improve:
>>
>> [auto build test WARNING on broonie-sound/for-next]
>> [also build test WARNING on next-20220506]
>> [cannot apply to tiwai-sound/for-next v5.18-rc6]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url: 
>> https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656
>> base: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 
>> for-next
>> config: arc-allyesconfig 
>> (https://download.01.org/0day-ci/archive/20220509/202205091954.7hT2TBhd-lkp@intel.com/config)
>> compiler: arceb-elf-gcc (GCC) 11.3.0
>> reproduce (this is a W=1 build):
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # 
>> https://github.com/intel-lab-lkp/linux/commit/2ef25400a7aee5a8e75c2ccdb5618be31c9f6809
>>          git remote add linux-review 
>> https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review 
>> Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656
>>          git checkout 2ef25400a7aee5a8e75c2ccdb5618be31c9f6809
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 
>> make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash sound/soc/intel/avs/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>     In file included from include/linux/device.h:15,
>>                      from include/linux/acpi.h:15,
>>                      from sound/soc/intel/avs/board_selection.c:9:
>>     sound/soc/intel/avs/board_selection.c: In function 
>> 'avs_register_i2s_board':
>>>> sound/soc/intel/avs/board_selection.c:328:36: warning: format '%ld' 
>>>> expects argument of type 'long int', but argument 5 has type 'int' 
>>>> [-Wformat=]
>>       328 |                 dev_err(adev->dev, "Platform supports %d 
>> SSPs but board %s requires SSP%ld\n",
>>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/dev_printk.h:110:30: note: in definition of macro 
>> 'dev_printk_index_wrap'
>>       110 |                 _p_func(dev, fmt, 
>> ##__VA_ARGS__);                       \
>>           |                              ^~~
>>     include/linux/dev_printk.h:144:56: note: in expansion of macro 
>> 'dev_fmt'
>>       144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, 
>> dev_fmt(fmt), ##__VA_ARGS__)
>> |                                                        ^~~~~~~
>>     sound/soc/intel/avs/board_selection.c:328:17: note: in expansion 
>> of macro 'dev_err'
>>       328 |                 dev_err(adev->dev, "Platform supports %d 
>> SSPs but board %s requires SSP%ld\n",
>>           |                 ^~~~~~~
>>     sound/soc/intel/avs/board_selection.c:328:90: note: format string 
>> is defined here
>>       328 |                 dev_err(adev->dev, "Platform supports %d 
>> SSPs but board %s requires SSP%ld\n",
>> | ~~^
>> | |
>> | long int
>> | %d
>>
>>
>> vim +328 sound/soc/intel/avs/board_selection.c
>>
>>     318
>>     319    static int avs_register_i2s_board(struct avs_dev *adev, 
>> struct snd_soc_acpi_mach *mach)
>>     320    {
>>     321        struct platform_device *board;
>>     322        int num_ssps;
>>     323        char *name;
>>     324        int ret;
>>     325
>>     326        num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
>>     327        if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
>>   > 328            dev_err(adev->dev, "Platform supports %d SSPs but 
>> board %s requires SSP%ld\n",
>>     329                num_ssps, mach->drv_name, 
>> __fls(mach->mach_params.i2s_link_mask));
>>     330            return -ENODEV;
>>     331        }
>>     332
>>     333        name = devm_kasprintf(adev->dev, GFP_KERNEL, 
>> "%s.%d-platform", mach->drv_name,
>>     334 mach->mach_params.i2s_link_mask);
>>     335        if (!name)
>>     336            return -ENOMEM;
>>     337
>>     338        ret = avs_i2s_platform_register(adev, name, 
>> mach->mach_params.i2s_link_mask, mach->pdata);
>>     339        if (ret < 0)
>>     340            return ret;
>>     341
>>     342        mach->mach_params.platform = name;
>>     343
>>     344        board = platform_device_register_data(NULL, 
>> mach->drv_name, mach->mach_params.i2s_link_mask,
>>     345                              (const void *)mach, sizeof(*mach));
>>     346        if (IS_ERR(board)) {
>>     347            dev_err(adev->dev, "ssp board register failed\n");
>>     348            return PTR_ERR(board);
>>     349        }
>>     350
>>     351        ret = devm_add_action(adev->dev, 
>> board_pdev_unregister, board);
>>     352        if (ret < 0) {
>>     353            platform_device_unregister(board);
>>     354            return ret;
>>     355        }
>>     356
>>     357        return 0;
>>     358    }
>>     359
>>
>
> Kernel test robot warns us about __fls and it is right, as __fls 
> depending on architecture returns either unsigned int or unsigned long.
> But I would say that this seems questionable, as I would expect 
> consistent return value between arches, especially for functions where 
> we operate on bits and probably don't want inconsistent results.
>
> Generic asm header [1] seems to suggest that it should accept unsigned 
> long as parameter and return unsigned long. It seems however that arc 
> accepts unsigned long as argument and returns int, while m68k uses int 
> for argument and return value...
>
> Adding relevant architecture maintainers to CC.
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/asm-generic/bitops/__fls.h

In generic code __fls() returns long, while fls() return int, which is 
weird as well. Anyhow for this error, ARC indeed needs fixing.
Do u want to send a patch ?

Thx,
-Vineet

