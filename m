Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B061846D1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE2C41800;
	Fri, 13 Mar 2020 13:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE2C41800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584102398;
	bh=z5d9KfOkzEwQXAeUrQxuObXz1fWFWbNDkRA2EB3E6wY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPsuSdnGXA1CGMm15N2uA4Y/7YcSIY9LlNbFlVEB7BeoZCQuDdjtgROXBuLLisk0E
	 Ctve6Icg8Y1xHhBTQ6TTAJkaxOgMQJ+bt1eTOOSfIWJm88g55XDZ+h+8UdCPD0Q+ki
	 o6m/dQ85Kgwesbcw3df+RPIYAf7ekD17bIaz7Jyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C5B6F801A3;
	Fri, 13 Mar 2020 13:24:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAAFDF801EB; Fri, 13 Mar 2020 13:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A934FF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A934FF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YQ7+qLr1"
Received: from localhost (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C40B120724;
 Fri, 13 Mar 2020 12:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584102288;
 bh=z5d9KfOkzEwQXAeUrQxuObXz1fWFWbNDkRA2EB3E6wY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YQ7+qLr19uqvmNmDEYZOwnu2r+KeNW39kNjj15vIS9QJO1TZLBAwg/xdBF8nbRH0j
 v80nSXeTv7Sb0eUDEfo50h3jTnSwKZ3JljBUAmiHCuvVEB1oW2E64hM3CKEinZkzpN
 h1ifmrzk6kkCJY2VHIMhrz0l47Vxx2xR5UxSOtR0=
Date: Fri, 13 Mar 2020 17:54:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 07/16] soundwire: cadence: mask Slave interrupt before
 stopping clock
Message-ID: <20200313122444.GH4885@vkoul-mobl>
References: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
 <20200311184128.4212-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311184128.4212-8-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 11-03-20, 13:41, Pierre-Louis Bossart wrote:
> Intel QA reported a very rare case, possibly hardware-dependent, where
> a Slave can become UNATTACHED during a clock stop sequence, which
> leads to timeouts and failed suspend sequences.
> 
> This patch suppresses the handling of all Slave events while this
> transition happens. The two cases that matter are:
> 
> a) alerts: if the Slave wants to signal an alert condition, it can do
> so using the in-band wake, so there's almost no impact with this
> patch.
> 
> b) sync loss or imp-def reset: in those cases, bringing back the Slave
> to functional state requires a complete re-enumeration. It's better to
> just ignore this case and restart cleanly, rather than attempt a
> 'clean' suspend.
> 
> Validation results show the timeouts no longer visible with this patch.
> 
> GitHub issue: https://github.com/thesofproject/linux/issues/1678
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 02f18ce6b7e7..a4ba57f44c1f 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -865,6 +865,24 @@ int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
>  }
>  EXPORT_SYMBOL(sdw_cdns_exit_reset);
>  
> +/**
> + * sdw_cdns_enable_slave_interrupt() - Enable SDW slave interrupts
> + * @cdns: Cadence instance
> + * @state: boolean for true/false
> + */
> +static void cdns_enable_slave_interrupts(struct sdw_cdns *cdns, bool state)

Do you want to rename this as cdns_configure_slave_interrupts, with
argument as enable/disable... ? 

-- 
~Vinod
