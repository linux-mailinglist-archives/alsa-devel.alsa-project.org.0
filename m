Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC96660C4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:40:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAEF3764C;
	Wed, 11 Jan 2023 17:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAEF3764C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455199;
	bh=K+VKmwPyPd2Djkcizz3wC2h8rnKbiFkFV9EkJSM5gmk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BAPf9KDqhOEdXETYHRf7u78ZDwbbCfAKT5rtgQmLCw2im2hATIv97SCIEQtmovOxH
	 y03qYBzuzZvM4nD9PmDxKWMtssUk89ql+knDE5G0HMWaPCEHnEbvFzy67n3zLWg/+S
	 vqGrJYu19HQZcGr2UF50z23XCar4SoKngNBnErqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A850F8058C;
	Wed, 11 Jan 2023 17:36:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 098E0F805AE; Wed, 11 Jan 2023 17:36:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1A73F805AA
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A73F805AA
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dEmVYq1l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454981; x=1704990981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K+VKmwPyPd2Djkcizz3wC2h8rnKbiFkFV9EkJSM5gmk=;
 b=dEmVYq1lBo1kUs/osktBSRupSWMjHD1GCySFXN8nekbfyaMqPOgA0Q3S
 BRqFKqq7LYuQpbEQse2MfcFEDiZSZcjnrEZUssQrezw4PPpviNGwy4fdT
 S6OmaMB9wCI8rIU1qvE+Alp3T4yg/VDwSSl2Q3giuzPRPuJfFpV+DXGTp
 jVPL4GKNUJkF4ep/nPtzKQ1KmAY0UYYT+uoX9w8UJ+Zlzmip6fw4hXhC4
 atKfx4lFq+rlIFoJIWAfLaKy4sVZRXDtksj2UCb3HoB0mSJq/BKoXC0Uj
 THy9hsd2oSGIa3znyetJCyY+U0xVdPaUsq9mZWZPBQv+W4ee8o6PUgvgT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324704253"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324704253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408791"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408791"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:41 -0800
Message-ID: <612c78ea-335e-a196-247c-9e8f3442c3e5@linux.intel.com>
Date: Wed, 11 Jan 2023 09:54:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 16/19] soundwire: amd: handle wake enable interrupt
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-17-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-17-Vijendar.Mukunda@amd.com>
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/11/23 03:02, Vijendar Mukunda wrote:
> Add wake enable interrupt support for both the soundwire controller

SoundWire.

> instances.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>  drivers/soundwire/amd_master.c    | 9 +++++++++
>  drivers/soundwire/amd_master.h    | 1 +
>  include/linux/soundwire/sdw_amd.h | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_master.c b/drivers/soundwire/amd_master.c
> index 290c59ab7760..2fd77a673c22 100644
> --- a/drivers/soundwire/amd_master.c
> +++ b/drivers/soundwire/amd_master.c
> @@ -1219,6 +1219,13 @@ static void amd_sdwc_update_slave_status_work(struct work_struct *work)
>  	u32 sw_status_change_mask_0to7_reg;
>  	u32 sw_status_change_mask_8to11_reg;
>  
> +	if (ctrl->wake_event) {
> +		pm_runtime_resume(ctrl->dev);
> +		acp_reg_writel(0x00, ctrl->mmio + ACP_SW_WAKE_EN);
> +		ctrl->wake_event = false;
> +		return;
> +	}

this is surprising.

A wake event typically happens when the bus is in clock-stop mode.
You cannot deal with wake events while dealing with the peripheral
status update, because you can only get that status when the manager is
up-and-running. There's a conceptual miss here, no?

If the wake comes from the PCI side, then it's the same comment: why
would the wake be handled while updating the peripheral status.

What am I missing?

