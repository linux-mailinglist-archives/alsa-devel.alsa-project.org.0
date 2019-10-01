Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C192C4110
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 21:33:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAAF1675;
	Tue,  1 Oct 2019 21:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAAF1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569958426;
	bh=kR5YFpNo7osAla2dIfn/SVYPfRoINkP5YC+Fxa+BFhk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mDqysDgpFHl5RamJWaTZcMprrfG/U1bpjU/exn9kcCK0oT0FHTEqd5R8V6KWbgsjf
	 Q+F2xwh9BpHBwJjTJC6GG1LhoiWXSJlCiA+oycDYvrl3/ybbzjTDUmpbU9+6xerp+a
	 8On+ftS0ol6qBzO/t80cMIQbDMQUrBqu1gEUTybA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EFF4F80519;
	Tue,  1 Oct 2019 21:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9249BF80506; Tue,  1 Oct 2019 21:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52E27F80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 21:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E27F80482
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 12:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="391310409"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 01 Oct 2019 12:31:49 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iFNsC-000BKl-Qp; Wed, 02 Oct 2019 03:31:48 +0800
Date: Wed, 2 Oct 2019 03:31:29 +0800
From: kbuild test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <201910020327.KMKxpO1S%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kbuild-all@01.org
Subject: [alsa-devel] [asoc:for-5.5 29/32]
 sound/core/pcm_dmaengine.c:429:50: sparse: sparse: restricted
 snd_pcm_format_t degrades to integer
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5
head:   1a476abc723e644248dba975b71122fcf878703b
commit: e957204e732bc2916a241dc61dd7dd14e9a98350 [29/32] ASoC: pcm_dmaengine: Extract snd_dmaengine_pcm_refine_runtime_hwparams
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-37-gd466a02-dirty
        git checkout e957204e732bc2916a241dc61dd7dd14e9a98350
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/core/pcm_dmaengine.c:429:50: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/pcm_dmaengine.c:429:55: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/pcm_dmaengine.c:429:79: sparse: sparse: restricted snd_pcm_format_t degrades to integer

vim +429 sound/core/pcm_dmaengine.c

   371	
   372	/**
   373	 * snd_dmaengine_pcm_refine_runtime_hwparams - Refine runtime hw params
   374	 * @substream: PCM substream
   375	 * @dma_data: DAI DMA data
   376	 * @hw: PCM hw params
   377	 * @chan: DMA channel to use for data transfers
   378	 *
   379	 * Returns 0 on success, a negative error code otherwise.
   380	 *
   381	 * This function will query DMA capability, then refine the pcm hardware
   382	 * parameters.
   383	 */
   384	int snd_dmaengine_pcm_refine_runtime_hwparams(
   385		struct snd_pcm_substream *substream,
   386		struct snd_dmaengine_dai_dma_data *dma_data,
   387		struct snd_pcm_hardware *hw,
   388		struct dma_chan *chan)
   389	{
   390		struct dma_slave_caps dma_caps;
   391		u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
   392				  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
   393				  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
   394		snd_pcm_format_t i;
   395		int ret = 0;
   396	
   397		if (!hw || !chan || !dma_data)
   398			return -EINVAL;
   399	
   400		ret = dma_get_slave_caps(chan, &dma_caps);
   401		if (ret == 0) {
   402			if (dma_caps.cmd_pause && dma_caps.cmd_resume)
   403				hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
   404			if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
   405				hw->info |= SNDRV_PCM_INFO_BATCH;
   406	
   407			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
   408				addr_widths = dma_caps.dst_addr_widths;
   409			else
   410				addr_widths = dma_caps.src_addr_widths;
   411		}
   412	
   413		/*
   414		 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
   415		 * hw.formats set to 0, meaning no restrictions are in place.
   416		 * In this case it's the responsibility of the DAI driver to
   417		 * provide the supported format information.
   418		 */
   419		if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
   420			/*
   421			 * Prepare formats mask for valid/allowed sample types. If the
   422			 * dma does not have support for the given physical word size,
   423			 * it needs to be masked out so user space can not use the
   424			 * format which produces corrupted audio.
   425			 * In case the dma driver does not implement the slave_caps the
   426			 * default assumption is that it supports 1, 2 and 4 bytes
   427			 * widths.
   428			 */
 > 429			for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
   430				int bits = snd_pcm_format_physical_width(i);
   431	
   432				/*
   433				 * Enable only samples with DMA supported physical
   434				 * widths
   435				 */
   436				switch (bits) {
   437				case 8:
   438				case 16:
   439				case 24:
   440				case 32:
   441				case 64:
   442					if (addr_widths & (1 << (bits / 8)))
   443						hw->formats |= pcm_format_to_bits(i);
   444					break;
   445				default:
   446					/* Unsupported types */
   447					break;
   448				}
   449			}
   450	
   451		return ret;
   452	}
   453	EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_refine_runtime_hwparams);
   454	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
