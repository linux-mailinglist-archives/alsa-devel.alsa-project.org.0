Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FDA70C543
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 20:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E2A84A;
	Mon, 22 May 2023 20:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E2A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684780502;
	bh=m2u1Fynpu0Q6HiRGvTPXsGDwoeAMSJbQ90gprxvwMVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ArBJ4i4nozzWcLFaRmTaN5ptqsZRFT7qzQ6mnv02HNJnat0Ls3oDlKJJVRrQGeJAr
	 LdrSPNxK7kAqph96UOHgtfUyGels7AXYiFuH4SDSTP3Kae9HnPNkkKl/dBL5JzfAKE
	 sPiKxnAD6J35YIme8Pv0X3kpZk4W7e+CfLbw2TFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF836F805AC; Mon, 22 May 2023 20:33:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6676FF805A9;
	Mon, 22 May 2023 20:33:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38F85F80557; Mon, 22 May 2023 20:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9893CF80425
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 20:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9893CF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DONIhgCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684780334; x=1716316334;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m2u1Fynpu0Q6HiRGvTPXsGDwoeAMSJbQ90gprxvwMVE=;
  b=DONIhgCAfUwq1tPO8Y8p31auec35lzY4ZBh1bDNdw5hxHA3r7E4XsTGT
   oRMWGwdu0szhnOc+hP2zU0J7MUljLpUvQ8bBNBuZf7m+nLRmlrrqq4BjW
   S3nqrNPnGre9aeAdtjmxFwHTsUgatGj47zX1CcyvM0zK1MiiMWTZwon/2
   qv3Fyy80kaIkdo1S3ap5h+rRLV7sJBbzhwd9DOV7B2Cb9nk2aUPpFigk6
   /W/Jr6RqXP7XdDBFjTpDTA6ZtcpfcbVICWWwdpuwSn5DSy4/FkbDoXEhB
   xRgBJYlxA6V3EXYMGgAVc8Z5s0tI43n64mSZgkoOYPZszIPHaaH+qRu8s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="356235154"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="356235154"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697740840"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="697740840"
Received: from ljgreene-mobl.amr.corp.intel.com (HELO [10.209.124.121])
 ([10.209.124.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:48 -0700
Message-ID: <42774a4f-ae1e-7d25-6b01-67f5af8400a4@linux.intel.com>
Date: Mon, 22 May 2023 11:39:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 4/9] ASoC: amd: ps: add SoundWire dma driver dma ops
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-5-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230522133122.166841-5-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O3J4LPWI5YHA2RZ5GSMJM4FF3WD6NSL5
X-Message-ID-Hash: O3J4LPWI5YHA2RZ5GSMJM4FF3WD6NSL5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3J4LPWI5YHA2RZ5GSMJM4FF3WD6NSL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +union acp_sdw_dma_count {
> +	struct {
> +	u32 low;
> +	u32 high;
> +	} bcount;

indentation seems off?

> +	u64 bytescount;
> +};
> +
> +struct sdw_dma_ring_buf_reg {
> +	u32 reg_dma_size;
> +	u32 reg_fifo_addr;
> +	u32 reg_fifo_size;
> +	u32 reg_ring_buf_size;
> +	u32 reg_ring_buf_addr;
> +	u32 water_mark_size_reg;
> +	u32 pos_low_reg;
> +	u32 pos_high_reg;
>  };
>\
> +static void acp63_config_dma(struct acp_sdw_dma_stream *stream, void __iomem *acp_base,
> +			     u32 stream_id)
> +{
> +	u16 page_idx;
> +	u32 low, high, val;
> +	u32 sdw_dma_pte_offset;
> +	dma_addr_t addr;
> +
> +	addr = stream->dma_addr;
> +	sdw_dma_pte_offset = SDW_PTE_OFFSET(stream->instance);
> +	val = sdw_dma_pte_offset + (stream_id * 256);

what is this 256 magic value? use a defined or << 8 ?
> +
> +	/* Group Enable */
> +	writel(ACP_SDW_SRAM_PTE_OFFSET | BIT(31), acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_2);
> +	writel(PAGE_SIZE_4K_ENABLE, acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2);
> +	for (page_idx = 0; page_idx < stream->num_pages; page_idx++) {
> +		/* Load the low address of page int ACP SRAM through SRBM */
> +		low = lower_32_bits(addr);
> +		high = upper_32_bits(addr);
> +
> +		writel(low, acp_base + ACP_SCRATCH_REG_0 + val);
> +		high |= BIT(31);
> +		writel(high, acp_base + ACP_SCRATCH_REG_0 + val + 4);
> +		val += 8;
> +		addr += PAGE_SIZE;
> +	}
> +	writel(0x1, acp_base + ACPAXI2AXI_ATU_CTRL);
> +}
