Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03F665694
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 09:54:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB966216;
	Wed, 11 Jan 2023 09:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB966216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673427298;
	bh=CPH6JUquCvKYJ2lHY7t/4WVjpIjEvDbc3nSWcNlZfDo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R+8rIWizVLjJAy/q4rPBJmQIpq8K3fbrODSOkeZBlj1hVSeE67DW9VuUfuNf2pvNw
	 HxBevGJP98vayaaKMuboTUAOXWxobYfaOpxxuWK8owUSa8+64AmJCiwd1Z2kNU3diw
	 N3ksNvBhk7IiWaBP+96brTo6BIuyKnCTWXU/hnZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99191F8019B;
	Wed, 11 Jan 2023 09:53:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E4CF803DC; Wed, 11 Jan 2023 09:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48070F8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 09:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48070F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XHHHDrQh
Received: by mail-wr1-x42d.google.com with SMTP id j7so9297071wrn.9
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 00:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q7ZKXxds+m1ToRjFrL/N+aqre1KgGndrtfTN0CIit8s=;
 b=XHHHDrQhKlGvPWmc4XNnEMGxL98utCEbip/4LCI7ljniEym7IpDxUK8BxJ+7p5NdCr
 4BOpTEMGIVYn7IkwE8mgzFcGqFg1zSecStlMS+PktmW8m33h4gAm+RZUtrefkE6Vx2xf
 Jcg+NiTYrourEiRHiJArQCdj6W7BWafOq7hXvEMM5/qUS35Jm3Rqlkq3rdPlbYEFFNBz
 lZlf/JqEhvL18r7/2/CuShLPEjQJg5sDuCo/MKJJbg6fdJZu7mDdufy4gGcZkkD1RQY4
 bJnQA3fHLd9aA6qiurp3X5RAdNMmaJXv/ipWIDgC/PPbGbPoAgdL9z90gOMEuVCnlr5L
 A9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7ZKXxds+m1ToRjFrL/N+aqre1KgGndrtfTN0CIit8s=;
 b=FWT8MUNLA5IDEsNoCeho13IejIWPspQHsfermXx9J/SIUS7qPYcaxFyI3+hAcrY6GF
 gawV/uXVH8jUcOTmjRG9Utxd6JQV/Jh+ZhBhZFPcb+1K07vjJwyPhrRkitiQUrdkysLl
 lx9jUrSv5Mas4zQujVVBHHKELUI7aJ1KkT8Oh25Q9pifBpmZVk0h6tqqYy0qXraekvy+
 7X3zQ81EK68bCNczFtSNrowc/hJIrwlHap2L0/C4v7FbssIu+l8XOfG2fJIGJtSyAZ+k
 z11Vx+SzadeQaGPoZlHf4yn++YvCRMLZIFQuuKXKsXVIf2UMcT5tK7ZDhTD7iJQKFwCM
 b/tQ==
X-Gm-Message-State: AFqh2krzSqFdBxyMrxuXuLoDdwDKCPpTvzGX6D7EvFiTPlzJ2VsXHRVw
 1mqcSN5tZoMJuQfUqoiX5541LA==
X-Google-Smtp-Source: AMrXdXtSvUw/ROl85qcQG2OnoAkmXrr7Fjq3EFgsOO+Fd8GkN3u1UpW6ueKal3JQWBwXt4G8jDGyrA==
X-Received: by 2002:a5d:6e8c:0:b0:26b:e7e1:ad03 with SMTP id
 k12-20020a5d6e8c000000b0026be7e1ad03mr44564208wrz.55.1673427231254; 
 Wed, 11 Jan 2023 00:53:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b00236883f2f5csm13442872wrj.94.2023.01.11.00.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 00:53:50 -0800 (PST)
Message-ID: <1301a59a-9085-c7f5-bc1c-ce09766806a1@linaro.org>
Date: Wed, 11 Jan 2023 09:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file, data
 type file and Kconfig Makefile
To: wangweidong.a@awinic.com, lkp@intel.com
References: <202301100233.QuEJ8pyu-lkp@intel.com>
 <20230111020233.4306-1-wangweidong.a@awinic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111020233.4306-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, steve@sk2.org, llvm@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 yangxiaohua@everest-semi.com, daniel.beer@igorinstitute.com,
 pierre-louis.bossart@linux.intel.com, povik+lin@cutebit.org,
 flatmax@flatmax.com, devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 zhaolei@awinic.com, james.schulman@cirrus.com, rf@opensource.cirrus.com,
 robh+dt@kernel.org, oe-kbuild-all@lists.linux.dev, jonathan.albrieux@gmail.com,
 tiwai@suse.com, liweilei@awinic.com, lgirdwood@gmail.com,
 yijiangtao@awinic.com, broonie@kernel.org, 13691752556@139.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/01/2023 03:02, wangweidong.a@awinic.com wrote:
> On 09/01/2023 03:00, kernel test robot wrote:
>> Hi,
> 
>> Thank you for the patch! Yet something to improve:
> 
>> [auto build test ERROR on 1f5abbd77e2c1787e74b7c2caffac97def78ba52]
> 
>> url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-codecs-Add-i2c-and-codec-registration-for-aw883xx-and-their-associated-operation-functions/20230106-113130
>> base:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
>> patch link:    https://lore.kernel.org/r/20230106032835.141918-5-wangweidong.a%40awinic.com
>> patch subject: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file, data type file and Kconfig Makefile
>> config: arm64-randconfig-r034-20230109
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
>> reproduce (this is a W=1 build):
>>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>        chmod +x ~/bin/make.cross
>>        # install arm64 cross compiling tool for clang build
>>        # apt-get install binutils-aarch64-linux-gnu
>>        # https://github.com/intel-lab-lkp/linux/commit/63bed80c0eacb29f78eb53987b34863bafd48cee
>>        git remote add linux-review https://github.com/intel-lab-lkp/linux
>>        git fetch --no-tags linux-review wangweidong-a-awinic-com/ASoC-codecs-Add-i2c-and-codec-registration-for-aw883xx-and-their-associated-operation-functions/20230106-113130
>>        git checkout 63bed80c0eacb29f78eb53987b34863bafd48cee
>>        # save the config file
>>        mkdir build_dir && cp config build_dir/.config
>>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
> 
>> All errors (new ones prefixed by >>):
> 
>>>> ld.lld: error: undefined symbol: crc8_populate_lsb
>>   >>> referenced by aw883xx_bin_parse.c:1049 (sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:1049)
>>   >>>               vmlinux.o:(aw883xx_dev_load_acf_check)
>> --
>>>> ld.lld: error: undefined symbol: crc8
>>   >>> referenced by aw883xx_bin_parse.c:963 (sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:963)
>>   >>>               vmlinux.o:(aw883xx_dev_load_acf_check)
>>   >>> referenced by aw883xx_bin_parse.c:1022 (sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:1022)
>>   >>>               vmlinux.o:(aw883xx_dev_load_acf_check)
>>   >>> did you mean: crc4
>>   >>> defined in: vmlinux.o
> 
> This looks like a false positive. crc8_populate_lsb is defined in the lib/crc8.c file.
> I also could not reproduce it with GCC.

kernel test robot almost does not report false positives, at least not
in such obvious cases. Chances you get here false positive are so small
(although possible), that it is much, much more likely your code needs
fixing.

Best regards,
Krzysztof

