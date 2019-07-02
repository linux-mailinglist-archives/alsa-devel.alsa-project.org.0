Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16265D868
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 01:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB02168C;
	Wed,  3 Jul 2019 01:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB02168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562110318;
	bh=p3qWs2JOjByjAI27dLjHAqhkE9JFi3kma1GY/v3J6uE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpVCSPVN8Bp3Ou4C+ujlSui+Si+HljrxZDpw/EAOqTAHGNGNQUOBzdShn1bdghDKM
	 BhU+jVDCsvfM4iEWhGx+b62hAQX9Im5dT2z9QhPxWjvZ29Lc8hsNIKhf1qwymbxgRR
	 CzHdH3v1yYiQ7px4zYhNtbtijjEy8lqYEXXs7AaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60118F800C5;
	Wed,  3 Jul 2019 01:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69477F800C9; Wed,  3 Jul 2019 01:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20EDCF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 01:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20EDCF800C5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 16:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,444,1557212400"; d="scan'208";a="315402826"
Received: from unknown (HELO ranjani-desktop) ([10.252.203.115])
 by orsmga004.jf.intel.com with ESMTP; 02 Jul 2019 16:30:03 -0700
Message-ID: <a233dfdbb973251d439197d13b69c867667d3f76.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
Date: Tue, 02 Jul 2019 16:29:57 -0700
In-Reply-To: <20190702121144.7809-1-yang.jie@linux.intel.com>
References: <20190702121144.7809-1-yang.jie@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: marcin.rajwa@intel.com, pierre-louis.bossart@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: SOF: ipc: update
 sof_ipc_stream_params
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

On Tue, 2019-07-02 at 20:11 +0800, Keyon Jie wrote:
> From: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> 
> The host period bytes needs to be passed to firmware.
> Currently this field is used as notification for host
> about period copy completion. Therefore we need to split these
> two informations.
Keyon/Marcin,

Could you please add a bit more context in the commit message on the
need to split these two fields ie.. what usecases need this?

Thanks,
Ranjani
> 
> Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> ---
>  include/sound/sof/stream.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
> index 643f175cb479..44acfa62fa69 100644
> --- a/include/sound/sof/stream.h
> +++ b/include/sound/sof/stream.h
> @@ -83,10 +83,10 @@ struct sof_ipc_stream_params {
>  	uint16_t sample_valid_bytes;
>  	uint16_t sample_container_bytes;
>  
> -	/* for notifying host period has completed - 0 means no period
> IRQ */
>  	uint32_t host_period_bytes;
> +	uint16_t no_period_irq; /* 1 means period IRQ mode OFF */
>  
> -	uint32_t reserved[2];
> +	uint16_t reserved[3];
>  	uint16_t chmap[SOF_IPC_MAX_CHANNELS];	/**< channel map -
> SOF_CHMAP_ */
>  } __packed;
>  

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
