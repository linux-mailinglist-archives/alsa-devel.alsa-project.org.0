Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DC1D267C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 07:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AE8F166A;
	Thu, 14 May 2020 07:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AE8F166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589432922;
	bh=x1rZ9emTUTb7VZT0A2MBseQTRK+HDU7Aw+gyHXfarN8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HKZpy9hNRJ26pBTj+LSLneDRisbautZH7cIoMppBsgtb5upU7lzWw+T1A9effweS8
	 xh8LvzCxcs9MJeuwBamncZzTsq+6rFOgC3yisOBNUVxLc8c+Pqr4iiIHPDOty1ELuk
	 S+IkA0c0vRvFbAMvD3uhFwK8Xc2PV+ifr65VknYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 946B3F80101;
	Thu, 14 May 2020 07:07:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D01F80158; Thu, 14 May 2020 07:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FAKE_REPLY_C,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C18EF80101
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 07:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C18EF80101
IronPort-SDR: 5Lbnwm32X7HJuN0gYNLUrye8y9xd197GBjICyyuX7P845xiNjLFfDKOzaoOV7AOpxmrwpMVZCa
 eTw8lYeQa1RQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 22:06:38 -0700
IronPort-SDR: Ld+CK9qNKosZQtvOxFuPzaJLTXHIq9sceY/xp801FUfLYHhooPczvWclV/CkbxPUCDSgORoR5H
 NK9w0KYpbfpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="464192388"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.140])
 by fmsmga005.fm.intel.com with ESMTP; 13 May 2020 22:06:35 -0700
Date: Thu, 14 May 2020 13:16:35 +0800
From: kbuild test robot <lkp@intel.com>
To: Yongbo Zhang <giraffesnn123@gmail.com>, broonie@kernel.org,
 lgirdwood@gmail.com
Subject: Re: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <20200514051635.GA24840@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511100415.12502-1-giraffesnn123@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Chen Li <licheng0822@thundersoft.com>, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Yongbo Zhang <giraffesnn123@gmail.com>
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

Hi Yongbo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[also build test WARNING on v5.7-rc5 next-20200511]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Yongbo-Zhang/ASoC-rsnd-add-interrupt-support-for-SSI-BUSIF-buffer/20200511-184903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   sound/soc/sh/rcar/ssi.c:596:1: sparse: sparse: mixing declarations and code
   include/sound/pcm_params.h:377:0: sparse: sparse: Expected } at end of function
   include/sound/pcm_params.h:377:0: sparse: sparse: got end-of-input
>> sound/soc/sh/rcar/ssi.c:798:56: sparse: sparse: not enough arguments for function rsnd_mod_write

# https://github.com/0day-ci/linux/commit/23aaae15fe2b41fd05caf5e0773d41021bc03e27
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 23aaae15fe2b41fd05caf5e0773d41021bc03e27
vim +798 sound/soc/sh/rcar/ssi.c

615fb6c7b13b7f Kuninori Morimoto 2016-02-18  733  
d8d9b9730cd62c Kuninori Morimoto 2017-12-11  734  static bool rsnd_ssi_pio_interrupt(struct rsnd_mod *mod,
d8d9b9730cd62c Kuninori Morimoto 2017-12-11  735  				   struct rsnd_dai_stream *io);
bfc0cfe6b7acb1 Kuninori Morimoto 2015-06-15  736  static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
bfc0cfe6b7acb1 Kuninori Morimoto 2015-06-15  737  				 struct rsnd_dai_stream *io)
ae5c322303fff5 Kuninori Morimoto 2013-07-21  738  {
690602fcd85385 Kuninori Morimoto 2015-01-15  739  	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
2b62786951ca38 Kuninori Morimoto 2018-02-13  740  	struct device *dev = rsnd_priv_to_dev(priv);
765ae7c8dda7d0 Kuninori Morimoto 2015-01-15  741  	int is_dma = rsnd_ssi_is_dma_mode(mod);
02299d9875bab5 Kuninori Morimoto 2015-05-21  742  	u32 status;
75defee0f1b3fc Kuninori Morimoto 2015-06-15  743  	bool elapsed = false;
6a25c8da00284f Kuninori Morimoto 2016-01-26  744  	bool stop = false;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  745  	int is_tdm, is_tdm_split;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  746  
23aaae15fe2b41 Yongbo Zhang      2020-05-11  747  	is_tdm		= rsnd_runtime_is_tdm(io);
23aaae15fe2b41 Yongbo Zhang      2020-05-11  748  	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
02299d9875bab5 Kuninori Morimoto 2015-05-21  749  
02299d9875bab5 Kuninori Morimoto 2015-05-21  750  	spin_lock(&priv->lock);
ae5c322303fff5 Kuninori Morimoto 2013-07-21  751  
02299d9875bab5 Kuninori Morimoto 2015-05-21  752  	/* ignore all cases if not working */
d5bbe7de563ccc Kuninori Morimoto 2015-06-15  753  	if (!rsnd_io_is_working(io))
02299d9875bab5 Kuninori Morimoto 2015-05-21  754  		goto rsnd_ssi_interrupt_out;
02299d9875bab5 Kuninori Morimoto 2015-05-21  755  
6a25c8da00284f Kuninori Morimoto 2016-01-26  756  	status = rsnd_ssi_status_get(mod);
4e7d606cd52aa8 Kuninori Morimoto 2014-11-27  757  
4e7d606cd52aa8 Kuninori Morimoto 2014-11-27  758  	/* PIO only */
d8d9b9730cd62c Kuninori Morimoto 2017-12-11  759  	if (!is_dma && (status & DIRQ))
d8d9b9730cd62c Kuninori Morimoto 2017-12-11  760  		elapsed = rsnd_ssi_pio_interrupt(mod, io);
ae5c322303fff5 Kuninori Morimoto 2013-07-21  761  
12927a8f802642 Kuninori Morimoto 2015-06-15  762  	/* DMA only */
2b62786951ca38 Kuninori Morimoto 2018-02-13  763  	if (is_dma && (status & (UIRQ | OIRQ))) {
c0ea089dbad47a Kuninori Morimoto 2018-10-30  764  		rsnd_dbg_irq_status(dev, "%s err status : 0x%08x\n",
c0ea089dbad47a Kuninori Morimoto 2018-10-30  765  			rsnd_mod_name(mod), status);
2b62786951ca38 Kuninori Morimoto 2018-02-13  766  
6a25c8da00284f Kuninori Morimoto 2016-01-26  767  		stop = true;
2b62786951ca38 Kuninori Morimoto 2018-02-13  768  	}
69e32a58bde674 Kuninori Morimoto 2015-10-26  769  
23aaae15fe2b41 Yongbo Zhang      2020-05-11  770  	status = 0;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  771  
23aaae15fe2b41 Yongbo Zhang      2020-05-11  772  	if (is_tdm || is_tdm_split) {
23aaae15fe2b41 Yongbo Zhang      2020-05-11  773  		switch (id) {
23aaae15fe2b41 Yongbo Zhang      2020-05-11  774  		case 0:
23aaae15fe2b41 Yongbo Zhang      2020-05-11  775  		case 1:
23aaae15fe2b41 Yongbo Zhang      2020-05-11  776  		case 2:
23aaae15fe2b41 Yongbo Zhang      2020-05-11  777  		case 3:
23aaae15fe2b41 Yongbo Zhang      2020-05-11  778  		case 4:
23aaae15fe2b41 Yongbo Zhang      2020-05-11  779  			for (i = 0; i < 4; i++) {
23aaae15fe2b41 Yongbo Zhang      2020-05-11  780  				status = rsnd_mod_read(mod,
23aaae15fe2b41 Yongbo Zhang      2020-05-11  781  						       SSI_SYS_STATUS(i * 2));
23aaae15fe2b41 Yongbo Zhang      2020-05-11  782  				status &= 0xf << (id * 4);
23aaae15fe2b41 Yongbo Zhang      2020-05-11  783  
23aaae15fe2b41 Yongbo Zhang      2020-05-11  784  				if (status) {
23aaae15fe2b41 Yongbo Zhang      2020-05-11  785  					rsnd_dbg_irq_status(dev,
23aaae15fe2b41 Yongbo Zhang      2020-05-11  786  						"%s err status : 0x%08x\n",
23aaae15fe2b41 Yongbo Zhang      2020-05-11  787  						rsnd_mod_name(mod), status);
23aaae15fe2b41 Yongbo Zhang      2020-05-11  788  					rsnd_mod_write(mod,
23aaae15fe2b41 Yongbo Zhang      2020-05-11  789  						       SSI_SYS_STATUS(i * 2),
23aaae15fe2b41 Yongbo Zhang      2020-05-11  790  						       0xf << (id * 4));
23aaae15fe2b41 Yongbo Zhang      2020-05-11  791  					stop = true;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  792  					break;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  793  				}
23aaae15fe2b41 Yongbo Zhang      2020-05-11  794  			}
23aaae15fe2b41 Yongbo Zhang      2020-05-11  795  			break;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  796  		case 9:
23aaae15fe2b41 Yongbo Zhang      2020-05-11  797  			for (i = 0; i < 4; i++) {
23aaae15fe2b41 Yongbo Zhang      2020-05-11 @798  				status = rsnd_mod_write(mod,
23aaae15fe2b41 Yongbo Zhang      2020-05-11  799  						SSI_SYS_STATUS((i * 2) + 1));
23aaae15fe2b41 Yongbo Zhang      2020-05-11  800  				status &= 0xf << 4;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  801  
23aaae15fe2b41 Yongbo Zhang      2020-05-11  802  				if (status) {
23aaae15fe2b41 Yongbo Zhang      2020-05-11  803  					rsnd_dbg_irq_status(dev,
23aaae15fe2b41 Yongbo Zhang      2020-05-11  804  						"%s err status : 0x%08x\n",
23aaae15fe2b41 Yongbo Zhang      2020-05-11  805  						rsnd_mod_name(mod), status);
23aaae15fe2b41 Yongbo Zhang      2020-05-11  806  					rsnd_mod_write(mod,
23aaae15fe2b41 Yongbo Zhang      2020-05-11  807  						SSI_SYS_STATUS((i * 2) + 1),
23aaae15fe2b41 Yongbo Zhang      2020-05-11  808  						0xf << 4);
23aaae15fe2b41 Yongbo Zhang      2020-05-11  809  					stop = true;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  810  					break;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  811  				}
23aaae15fe2b41 Yongbo Zhang      2020-05-11  812  			}
23aaae15fe2b41 Yongbo Zhang      2020-05-11  813  			break;
23aaae15fe2b41 Yongbo Zhang      2020-05-11  814  		}
23aaae15fe2b41 Yongbo Zhang      2020-05-11  815  	}
23aaae15fe2b41 Yongbo Zhang      2020-05-11  816  
5342dff2326393 Kuninori Morimoto 2015-11-26  817  	rsnd_ssi_status_clear(mod);
02299d9875bab5 Kuninori Morimoto 2015-05-21  818  rsnd_ssi_interrupt_out:
02299d9875bab5 Kuninori Morimoto 2015-05-21  819  	spin_unlock(&priv->lock);
02299d9875bab5 Kuninori Morimoto 2015-05-21  820  
75defee0f1b3fc Kuninori Morimoto 2015-06-15  821  	if (elapsed)
75defee0f1b3fc Kuninori Morimoto 2015-06-15  822  		rsnd_dai_period_elapsed(io);
6a25c8da00284f Kuninori Morimoto 2016-01-26  823  
6a25c8da00284f Kuninori Morimoto 2016-01-26  824  	if (stop)
6a25c8da00284f Kuninori Morimoto 2016-01-26  825  		snd_pcm_stop_xrun(io->substream);
6a25c8da00284f Kuninori Morimoto 2016-01-26  826  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

