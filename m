Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60133799A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:40:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F4C189E;
	Thu, 11 Mar 2021 17:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F4C189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615480814;
	bh=HBh12FlfaA59sYqhMjh7v2UHdJQxmxr010fd+32mBe0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKrCGiidGqlYPRW5mAYbBKJFMGm7gBOmBhK2twmlsCxIir2baiZa6Bwe3Juu8tVAH
	 j2VhLmtgaxXpfmjzhaz8YAwTZ9oAh1Gilg/jIEipa1f+ZD/UOVgDfCQzm4tOeMEvOW
	 vJmluFc9xghD3lt8QVzSTDn9TxvrLkVdi6QhDIiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A999F8019B;
	Thu, 11 Mar 2021 17:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAA1F8019B; Thu, 11 Mar 2021 17:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E7E2F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7E2F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kj+VIfWt"
Received: by mail-lj1-x232.google.com with SMTP id a1so2968448ljp.2
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Wt6zu2wDU+WwjQUEX/ei8d5oKJH8V2SZGPKoU3it0E=;
 b=kj+VIfWtbIujvBFYLp6uMIimJvYo+cgt80RnEprvoIxikrzdReayksKM77nlrCO+gC
 YLzaMUQovkfFX2mXDQNbWrwFphUfwka9xg8MOSXS9VWHNH7rGmiDXcOjBCBMqr8uzTIm
 S+RjaWei0Ju61OB1UE5DYmeS5BDfG7tD+qb0NYndN5vVkWEB34FeOi8pldyqF0zvcYoP
 YFZCfh4whH79A4AqiFAFLoF8xwP7JlXOJFZ0HEiPyPFcqNQzZm4Nac4clu2tESD1W1+U
 c0DIP44B1ldRBbbLfK5QvWaR7swAAEztGa5goXrC4s3nauihgCei33dKEo7SrxUBxgNe
 zeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Wt6zu2wDU+WwjQUEX/ei8d5oKJH8V2SZGPKoU3it0E=;
 b=Wcojb7BEjWI19zNli0cCWmdwk/YGGy0CXMAg330aVylBlg2f77eHZ3hkiY7p3WwoFf
 Ykl+6JwwtDt4riNlFyP5E2PSvL1Ietq51fy4ccve8lq6Cr0YLacON0CDR0eevpVTjcSR
 bmDpfsIP1oPlGfe6BFp6vGsmsGLnsYBDesfuzNoDhjen5mHNERt3/PqwSfHYUSxFWmhZ
 PxdDeffZTGZQT5NvdU3MNmikqrK4ckUPOf208sMyejn9Cntcg6KEIShlmmpLqM/PNKCF
 fPn/7j+ImDt5koREZQwfhNkClCS6ae8BVjdffvRNrQU0dX3OIse0d0L2ZlF+pnKtUvyy
 FVuw==
X-Gm-Message-State: AOAM533Yfxkqq/G55baihW3iUGvjTfX/AiuS29+HdXBK78z1Ur6cSA1O
 qdH2gIfjhSMOsLAKtlLdhRI=
X-Google-Smtp-Source: ABdhPJwUBUe/Vd9bBYXVc+QD6912OcFAfO4NSVmbmRPYVIuhur32BgseSTAxD/4z87njIOgdD0fPRQ==
X-Received: by 2002:a2e:6e17:: with SMTP id j23mr5206586ljc.209.1615480744254; 
 Thu, 11 Mar 2021 08:39:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id u11sm954944lfm.78.2021.03.11.08.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 08:39:03 -0800 (PST)
Subject: Re: [PATCH v2 4/5] reset: Add reset_control_bulk API
To: kernel test robot <lkp@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
References: <20210311151554.23982-5-digetx@gmail.com>
 <202103120011.594e28Pm-lkp@intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a56fce61-4601-2563-abe8-e08a855244df@gmail.com>
Date: Thu, 11 Mar 2021 19:39:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <202103120011.594e28Pm-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kbuild-all@lists.01.org
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

11.03.2021 19:32, kernel test robot пишет:
> Hi Dmitry,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on pza/reset/next]
> [also build test WARNING on asoc/for-next linus/master v5.12-rc2 next-20210311]
> [cannot apply to tegra/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Add-missing-reset-controls-to-NVIDIA-Tegra-ASoC-drivers/20210311-231938
> base:   https://git.pengutronix.de/git/pza/linux reset/next
> config: m68k-defconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/082cad3274c4566ac97502fd137479791c318300
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Add-missing-reset-controls-to-NVIDIA-Tegra-ASoC-drivers/20210311-231938
>         git checkout 082cad3274c4566ac97502fd137479791c318300
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/net/phy/mdio_bus.c:30:
>    include/linux/reset.h: In function 'reset_control_bulk_get_exclusive':
>>> include/linux/reset.h:215:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      215 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_exclusive_released':
>    include/linux/reset.h:257:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      257 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_optional_exclusive_released':
>    include/linux/reset.h:278:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      278 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_shared':
>    include/linux/reset.h:323:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      323 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_optional_exclusive':
>    include/linux/reset.h:360:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      360 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_optional_shared':
>    include/linux/reset.h:397:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      397 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_exclusive':
>    include/linux/reset.h:522:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      522 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_exclusive_released':
>    include/linux/reset.h:561:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      561 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_exclusive_released':
>    include/linux/reset.h:600:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      600 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_shared':
>    include/linux/reset.h:635:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      635 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_exclusive':
>    include/linux/reset.h:673:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      673 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_shared':
>    include/linux/reset.h:711:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      711 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +215 include/linux/reset.h
> 
>    200	
>    201	/**
>    202	 * reset_control_bulk_get_exclusive - Lookup and obtain exclusive references to
>    203	 *                                    multiple reset controllers.
>    204	 * @dev: device to be reset by the controller
>    205	 * @num_rstcs: number of entries in rstcs array
>    206	 * @rstcs: array of struct reset_control_bulk_data with reset line names set
>    207	 *
>    208	 * Fills the rstcs array with pointers to exclusive reset controls and
>    209	 * returns 0, or an IS_ERR() condition containing errno.
>    210	 */
>    211	static inline int __must_check
>    212	reset_control_bulk_get_exclusive(struct device *dev, int num_rstcs,
>    213					 struct reset_control_bulk_data *rstcs)
>    214	{
>  > 215		return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
>    216	}
>    217	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

I missed to check the !CONFIG_RESET_CONTROLLER case, will make a v3.
