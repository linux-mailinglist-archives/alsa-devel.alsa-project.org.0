Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E872CBF0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 18:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEA76C1;
	Mon, 12 Jun 2023 18:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEA76C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686589154;
	bh=YIGvFiBNE3NCF0ZwQgckoo2K32v08RKeLs7L8rmrvD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MgmYKKPEZE71/7XNut06I48hjDumYuGwfuw0vreTQZYNbpjen21Jqsj+OkvL1J3i2
	 TVsuRZ0fNX9teWIbQSfoGnARyQhKazXtOGX9HgNxzUX+fkA3zAGpCeFIO6Tgz8XiKs
	 ilbt4Mk9sIVVMbMH4eKwRKOnn893WVMlfVJ3Yz/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53BF1F80533; Mon, 12 Jun 2023 18:58:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA151F80132;
	Mon, 12 Jun 2023 18:58:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8EFAF80149; Mon, 12 Jun 2023 18:58:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E130CF800ED;
	Mon, 12 Jun 2023 18:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E130CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IWCr9RNf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686589092; x=1718125092;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YIGvFiBNE3NCF0ZwQgckoo2K32v08RKeLs7L8rmrvD8=;
  b=IWCr9RNfss+06HuQqy+WxuqESwhzcOaeUXbn+32jZpU4rRlA6nkvLFo/
   4SN3QBcgCXXEuXj2qXksCK3XfY/QJ3SJ5lL9+3U7p0cxhQbl0nibsTxu9
   S+xQO75fZEa0+UxHgYtMnxrScNeT2KRdd6QX2lZiY7TTn4QGdCedN92PN
   AI77NFtftsJi9VVMBy+FVUJ+IbhNV1QU+6fR+LvI5jExBhtDORXJby0yG
   HLDLwhE4LBsyVwPQTVNeh1sV0valnllGgnvCEuFh8wcqF/+CwnW7kXBfH
   rmQiNiIRSk2/LciBElzTFq8W5oxtnx+o1i76C5PKFu4pMYuemGWyRElLI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338464651"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400";
   d="scan'208";a="338464651"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 09:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705467168"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400";
   d="scan'208";a="705467168"
Received: from atulpuri-mobl1.amr.corp.intel.com (HELO [10.212.234.150])
 ([10.212.234.150])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 09:58:02 -0700
Message-ID: <f0783f2a-03fd-f893-9470-ed9d7805e2f9@linux.intel.com>
Date: Mon, 12 Jun 2023 11:58:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Improve unlocking of a mutex in
 sof_ipc4_widget_free()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Jyri Sarha <jyri.sarha@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr,
 Dan Carpenter <error27@gmail.com>
References: <20230322181830.574635-1-jyri.sarha@linux.intel.com>
 <3a7476b6-2ae9-494e-1840-0915ddf47c2f@web.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3a7476b6-2ae9-494e-1840-0915ddf47c2f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6GQUJGNWM3XYJ3DJSIYHS56NF72HWBQL
X-Message-ID-Hash: 6GQUJGNWM3XYJ3DJSIYHS56NF72HWBQL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GQUJGNWM3XYJ3DJSIYHS56NF72HWBQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/10/23 06:36, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Jun 2023 12:40:09 +0200
> 
> Add a jump target so that a call of the function “mutex_unlock”
> is stored only once in this function implementation.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  sound/soc/sof/ipc4-topology.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index a4e1a70b607d..f0fd1dfa384e 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -2300,8 +2300,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
>  		if (pipeline->use_chain_dma) {
>  			dev_warn(sdev->dev, "use_chain_dma set for scheduler %s",
>  				 swidget->widget->name);
> -			mutex_unlock(&ipc4_data->pipeline_state_mutex);
> -			return 0;
> +			goto unlock;
>  		}
> 
>  		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
> @@ -2326,7 +2325,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
>  		if (!pipeline->use_chain_dma)
>  			ida_free(&fw_module->m_ida, swidget->instance_id);
>  	}
> -
> +unlock:
>  	mutex_unlock(&ipc4_data->pipeline_state_mutex);
> 
>  	return ret;

The change looks good but I am wondering if we need to print a dev_warn
log which is already done on the sof_ipc4_widget_setup() path.

This seems redundant. Ranjani, can we simplify?
