Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A379B7BB
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16487166D;
	Fri, 23 Aug 2019 22:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16487166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592599;
	bh=1TAsknPeaLqaAlA9UAmpNIpMOZHafhpvZpZexIlVIwo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMRalzZLEw2CCz4qdbRTelnJsCljtXEEQljmxfqGTJZ4WdtUwsIcfPh+K/7yOaMNH
	 fweY3WvJDHk7j6oRbJvwesv1mTppDuQSJ+aMXriYLqRlCS2HTQKRsABjsFktUXrNE/
	 wNskMeflsQjS+H635rScNrXWh0CVhbThzVJksM60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AEAEF80611;
	Fri, 23 Aug 2019 22:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 034A6F805E0; Fri, 23 Aug 2019 22:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D01A6F80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D01A6F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718205"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:08 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-19-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f19e82aa-87bd-75ee-2b56-f7130e73bc86@linux.intel.com>
Date: Fri, 23 Aug 2019 14:26:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-19-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 18/35] ASoC: Intel: Skylake: Remove window0
 sst_addr fields
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/22/19 2:04 PM, Cezary Rojewski wrote:
> w0_stat_sz and w0_up_sz are Skylake-specific fields and should not be
> part of common sst framework. The latter is also completely unused.
> Remove both while declaring global FW register-area size, shared for all
> SKL+ platforms.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/common/sst-dsp-priv.h | 2 --
>   sound/soc/intel/skylake/bxt-sst.c     | 2 --
>   sound/soc/intel/skylake/cnl-sst.c     | 2 --
>   sound/soc/intel/skylake/skl-debug.c   | 2 +-
>   sound/soc/intel/skylake/skl-sst-dsp.h | 1 +
>   sound/soc/intel/skylake/skl-sst.c     | 2 --
>   6 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
> index 0fe9bebcfb38..53dcd87bab44 100644
> --- a/sound/soc/intel/common/sst-dsp-priv.h
> +++ b/sound/soc/intel/common/sst-dsp-priv.h
> @@ -71,8 +71,6 @@ struct sst_addr {
>   	u32 dsp_dram_offset;
>   	u32 sram0_base;
>   	u32 sram1_base;
> -	u32 w0_stat_sz;
> -	u32 w0_up_sz;
>   	void __iomem *lpe;
>   	void __iomem *shim;
>   	void __iomem *pci_cfg;
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index c7961050c2ee..641d5cf4aeb1 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -565,8 +565,6 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>   	sst->addr.shim = mmio_base;
>   	sst->addr.sram0_base = BXT_ADSP_SRAM0_BASE;
>   	sst->addr.sram1_base = BXT_ADSP_SRAM1_BASE;
> -	sst->addr.w0_stat_sz = SKL_ADSP_W0_STAT_SZ;
> -	sst->addr.w0_up_sz = SKL_ADSP_W0_UP_SZ;
>   
>   	sst_dsp_mailbox_init(sst, (BXT_ADSP_SRAM0_BASE + SKL_ADSP_W0_STAT_SZ),
>   			SKL_ADSP_W0_UP_SZ, BXT_ADSP_SRAM1_BASE, SKL_ADSP_W1_SZ);

You are still using a SKL specific macro here...

> diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
> index 2f10076cc906..64971966af38 100644
> --- a/sound/soc/intel/skylake/cnl-sst.c
> +++ b/sound/soc/intel/skylake/cnl-sst.c
> @@ -442,8 +442,6 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>   	sst->addr.shim = mmio_base;
>   	sst->addr.sram0_base = CNL_ADSP_SRAM0_BASE;
>   	sst->addr.sram1_base = CNL_ADSP_SRAM1_BASE;
> -	sst->addr.w0_stat_sz = CNL_ADSP_W0_STAT_SZ;
> -	sst->addr.w0_up_sz = CNL_ADSP_W0_UP_SZ;
>   
>   	sst_dsp_mailbox_init(sst, (CNL_ADSP_SRAM0_BASE + CNL_ADSP_W0_STAT_SZ),
>   			     CNL_ADSP_W0_UP_SZ, CNL_ADSP_SRAM1_BASE,

...and here...

> diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
> index 212370bf704c..6781eac13232 100644
> --- a/sound/soc/intel/skylake/skl-debug.c
> +++ b/sound/soc/intel/skylake/skl-debug.c
> @@ -173,7 +173,7 @@ static ssize_t fw_softreg_read(struct file *file, char __user *user_buf,
>   {
>   	struct skl_debug *d = file->private_data;
>   	struct sst_dsp *sst = d->skl->dsp;
> -	size_t w0_stat_sz = sst->addr.w0_stat_sz;
> +	size_t w0_stat_sz = SKL_FW_REGS_SIZE;

but here it's a different macro?

>   	void __iomem *in_base = sst->mailbox.in_base;
>   	void __iomem *fw_reg_addr;
>   	unsigned int offset;
> diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
> index 9f2dae92c1c9..5a0cb7f3d57e 100644
> --- a/sound/soc/intel/skylake/skl-sst-dsp.h
> +++ b/sound/soc/intel/skylake/skl-sst-dsp.h
> @@ -63,6 +63,7 @@ struct skl_dev;
>   
>   #define SKL_ADSP_W1_SZ			0x1000
>   
> +#define SKL_FW_REGS_SIZE		PAGE_SIZE
>   #define SKL_FW_STS_MASK			0xf
>   
>   #define SKL_FW_INIT			0x1
> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index e9a7b2509b35..7e63c91cea54 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -535,8 +535,6 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>   	sst->addr.shim = mmio_base;
>   	sst->addr.sram0_base = SKL_ADSP_SRAM0_BASE;
>   	sst->addr.sram1_base = SKL_ADSP_SRAM1_BASE;
> -	sst->addr.w0_stat_sz = SKL_ADSP_W0_STAT_SZ;
> -	sst->addr.w0_up_sz = SKL_ADSP_W0_UP_SZ;
>   
>   	sst_dsp_mailbox_init(sst, (SKL_ADSP_SRAM0_BASE + SKL_ADSP_W0_STAT_SZ),
>   			SKL_ADSP_W0_UP_SZ, SKL_ADSP_SRAM1_BASE, SKL_ADSP_W1_SZ);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
