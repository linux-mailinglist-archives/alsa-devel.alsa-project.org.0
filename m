Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4067D8967
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 22:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0C3585D;
	Thu, 26 Oct 2023 22:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0C3585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698350692;
	bh=+uMJoNr1drMyaV4vwEoxpe+493cdkpAVp/nhiLRli/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bGtUIbrr1pr5cCmNvAbPKf3vkcQzfbudEGkXLyrZ1sv3dkcMsCE4p2UKRrH0kloFQ
	 L/Rt7xDDGSY+E8SN/6QyWf/ravPcygZOR1iyWk99uorhyn9crx6fjcFk2LUG8aujLg
	 rP1EMkdzwVH+nPP4Bw9bJIlyw8gPFklA2YvJghuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94BC7F80152; Thu, 26 Oct 2023 22:04:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6921FF80165;
	Thu, 26 Oct 2023 22:04:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42D0CF8019B; Thu, 26 Oct 2023 22:03:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A98AF8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 22:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A98AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AuYiHXgK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698350630; x=1729886630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+uMJoNr1drMyaV4vwEoxpe+493cdkpAVp/nhiLRli/U=;
  b=AuYiHXgKFr44hGuH5H2rwbbjFn937GcCswKAfHW2MaKNWN256dH8Cn2e
   ovoghC0IOTdvffe7ICqqVvq7zrVEBOy7rdVPdT89z+Qv9P1G45XTXnXs4
   OFLs7UGLTCb5JHtam0LZ9eGK7gOKxVbftTl5s+m7/rZc99l5kAH/I5lpM
   Wun/0aBvifOkVjKUcqQ2iQMU+0XAPzKlJpyBFHhcvRpFsQ/kkmchUOuog
   nBcWe4SeDPQEtpSWi+8QHD+xTN5A6Nzls9fKxBexagqGoYWXVaf8iR9eB
   4yT1MeHtp0DSnIzAlwbmPZDaRUINkOZhS8r0zWg+icammA6ywHdpnZ7CT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9180847"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200";
   d="scan'208";a="9180847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 13:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="709194246"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200";
   d="scan'208";a="709194246"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2023 13:03:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw6Zt-000A6N-2p;
	Thu, 26 Oct 2023 20:03:37 +0000
Date: Fri, 27 Oct 2023 04:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eberhard Stoll <estl@gmx.net>, Han Xu <han.xu@nxp.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 4/4] spi: spi-fsl-qspi: Add support for rx data sample
 point adjustment
Message-ID: <202310270332.mcbckKCr-lkp@intel.com>
References: <20231026152316.2729575-5-estl@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026152316.2729575-5-estl@gmx.net>
Message-ID-Hash: YOUI27Q4HKI467DWWG3V56N5KE4S44RJ
X-Message-ID-Hash: YOUI27Q4HKI467DWWG3V56N5KE4S44RJ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOUI27Q4HKI467DWWG3V56N5KE4S44RJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Eberhard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1]

url:    https://github.com/intel-lab-lkp/linux/commits/Eberhard-Stoll/spi-Add-parameter-for-clock-to-rx-delay/20231026-232547
base:   05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
patch link:    https://lore.kernel.org/r/20231026152316.2729575-5-estl%40gmx.net
patch subject: [PATCH 4/4] spi: spi-fsl-qspi: Add support for rx data sample point adjustment
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270332.mcbckKCr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270332.mcbckKCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270332.mcbckKCr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-fsl-qspi.c: In function 'fsl_qspi_select_mem':
>> drivers/spi/spi-fsl-qspi.c:558:38: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
     558 |         if (chip->rx_sample_delay_ns != spi->rx_sample_delay_ns |
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +558 drivers/spi/spi-fsl-qspi.c

   550	
   551	static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi)
   552	{
   553		unsigned long rate = spi->max_speed_hz;
   554		int ret;
   555		struct fsl_qspi_chip_data *chip = spi_get_ctldata(spi);
   556		const char *sampling_ident = sampling_mode[0];
   557	
 > 558		if (chip->rx_sample_delay_ns != spi->rx_sample_delay_ns |
   559		    chip->rate != rate) {
   560			chip->rx_sample_delay_ns = spi->rx_sample_delay_ns;
   561			chip->rate = rate;
   562	
   563			chip->smpr_sampling =
   564				(2 * spi->rx_sample_delay_ns * (rate >> 10)) / (1000000000 >> 10);
   565			dev_dbg(q->dev, "smpr_sampling = %u (delay %u ns)\n",
   566				chip->smpr_sampling, spi->rx_sample_delay_ns);
   567	
   568			if (chip->smpr_sampling > 3) {
   569				dev_err(q->dev, "rx sample delay for device %s exceeds hw capabilities! Clamp value to maximum setting.\n",
   570					dev_name(&spi->dev));
   571				chip->smpr_sampling = 3;
   572				sampling_ident = "(I2 clamped to max)";
   573			} else {
   574				sampling_ident = sampling_mode[chip->smpr_sampling];
   575			}
   576	
   577			chip->smpr_sampling <<= 5;
   578			dev_info(q->dev, "sampling point %s at %lu kHz used for device %s\n",
   579				 sampling_ident, rate / 1000, dev_name(&spi->dev));
   580			fsl_qspi_update_smpr_sampling(q, chip->smpr_sampling);
   581		}
   582	
   583		if (q->selected == spi_get_chipselect(spi, 0))
   584			return;
   585	
   586		fsl_qspi_update_smpr_sampling(q, chip->smpr_sampling);
   587	
   588		if (needs_4x_clock(q))
   589			rate *= 4;
   590	
   591		fsl_qspi_clk_disable_unprep(q);
   592	
   593		ret = clk_set_rate(q->clk, rate);
   594		if (ret)
   595			return;
   596	
   597		ret = fsl_qspi_clk_prep_enable(q);
   598		if (ret)
   599			return;
   600	
   601		q->selected = spi_get_chipselect(spi, 0);
   602	
   603		fsl_qspi_invalidate(q);
   604	}
   605	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
