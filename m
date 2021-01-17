Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E802F951B
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 21:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22511760;
	Sun, 17 Jan 2021 21:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22511760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610914949;
	bh=FwJJJY8SKGLlH48plbv9wWvxiNEdnSjX7VMae4m+BCI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtitAyFoYjWSRB+VQzeX8Y7LSN8TbG/oPHIA5HR0MlDLVsZqDacGm5jDG22We33Xn
	 zGfBRX9UdNaCgpzvlKrBhgq8j8vxhkTdCtz49M8eJtlsVwlLWGzePjGr7nkVGdR4yQ
	 C/9545AOsjvnaKVDNSXmGtmzp1kTiza9bJfazXG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DEF3F80255;
	Sun, 17 Jan 2021 21:20:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD23FF80257; Sun, 17 Jan 2021 21:20:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC429F800C0
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 21:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC429F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Nx7hxire"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610914842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8PoxYkRiuA8dJ81iu1GAMIR7YCbWodAr580vw1QV28=;
 b=Nx7hxirekVB+V6DtxVELHeMwv8B9Ueu8+FmYx8l7IcdCCENNkUozM9oPdCB+Z26GXlYzK7
 hZmfs82o9MBTs+M1fmq09qshtIUmrNWbWvPMmZrtNpYd2TZWR4+13kcFhMyhIErkuK+7wW
 EN2DS+Sr/Jgm34vUq2FY7U8JA97Al0A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-tMpqpuT4MFO-_E5x7lYcrQ-1; Sun, 17 Jan 2021 15:20:39 -0500
X-MC-Unique: tMpqpuT4MFO-_E5x7lYcrQ-1
Received: by mail-ed1-f69.google.com with SMTP id a24so1553342eda.14
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 12:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N8PoxYkRiuA8dJ81iu1GAMIR7YCbWodAr580vw1QV28=;
 b=ZX++6QKsnX0MQvbPak3orPE1BbQzyGaLS20tAn9s3G61lB2o4minrBUizIfSMnWZT7
 4O0iaCgOE9CqC78shQ0Yrx2wjRAF0LUUhmwV0eizXiCdC83Jr8n5RUDKDw3TbqWG0LKq
 R+WMJaoMlhGAAF+laLCnxMUvCWtiga+qsszX5rq78igBNuM/5uwnUALmBqHYX1OyD8rB
 3bISO+jCFcId2Ts3tYigqONpH/K1tyDU0K5l2xIIfkxEbdWAcQ48QS+VAPl0owjYAOab
 AjP08paI/+BUz7hexVhDNdkZbhlyLARRHdje1UaJ1Fle69IdbPMRku6GRuFr3ktH2GG/
 oywQ==
X-Gm-Message-State: AOAM5336X2NutGm8jrULlyeIXB9+6JVR7XVciafCu98wK++1FuvH0Z5R
 YphsX+aKOZ1NPQ03AagKu2d+wpSEKiDgwH9TLnUe5RCMGFMjciWqMOxu02layz++A6pmjTLXurD
 kdqPBgeC/dAlnNpBtCluOWBI=
X-Received: by 2002:a05:6402:1751:: with SMTP id
 v17mr4057071edx.289.1610914838098; 
 Sun, 17 Jan 2021 12:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAXjZ3Bj8lWcXqv/XSxMFQ5P2aT9ggI60+OwJUnwo+UCkBEURJle6Q9dejCJk6gIiXhOnDnQ==
X-Received: by 2002:a05:6402:1751:: with SMTP id
 v17mr4057058edx.289.1610914837949; 
 Sun, 17 Jan 2021 12:20:37 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id gt18sm7199324ejb.104.2021.01.17.12.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 12:20:37 -0800 (PST)
Subject: Re: [PATCH v2 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: kernel test robot <lkp@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210117154717.77969-4-hdegoede@redhat.com>
 <202101180352.D075IBWE-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <128c932f-d2b6-c9f6-dc67-585244a39d7a@redhat.com>
Date: Sun, 17 Jan 2021 21:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <202101180352.D075IBWE-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 Christian Hartmann <cornogle@googlemail.com>, patches@opensource.cirrus.com,
 clang-built-linux@googlegroups.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

On 1/17/21 8:06 PM, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on lee-mfd/for-mfd-next]
> [also build test ERROR on asoc/for-next v5.11-rc3 next-20210115]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/MFD-ASoC-Add-support-for-Intel-Bay-Trail-boards-with-WM5102-codec/20210117-235249
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> config: arm-randconfig-r021-20210118 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bfd75bdf3fd62d4f5e7028d4122f9ffa517f2a09)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/0day-ci/linux/commit/ff3c43e0ca3dd07a3b671ee3be84b9c607dff305
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Hans-de-Goede/MFD-ASoC-Add-support-for-Intel-Bay-Trail-boards-with-WM5102-codec/20210117-235249
>         git checkout ff3c43e0ca3dd07a3b671ee3be84b9c607dff305
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/mfd/arizona-spi.c:194:7: error: assigning to 'int' from incompatible type 'void'
>                    ret = arizona_spi_acpi_probe(arizona);>                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.

UGh, the test-robot gave the same errors for v1 of this patch-set; and I checked,
but I could not find the problem. Since there was some time between v1 and v2
I assumed that I had already fixed this in my local tree, but I now see that
this is caused by a bug in the #else block of the
#ifdef CONFIG_ACPI
#else
#endif

in this patch. I will submit a v3 of this patch-set fixing this.

Regards,

Hans

