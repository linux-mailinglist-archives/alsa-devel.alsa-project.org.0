Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3014F75C5ED
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 13:34:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D7C1F6;
	Fri, 21 Jul 2023 13:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D7C1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689939290;
	bh=CgP7XFYudIRUfF8wSd8qKahDYm0g7JaTcDAF/BBMutY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SfwX8vHopgoaIGUvRiKBLDYP4bKLkqnl9v3XDcG2VTzWmUuOMrWtu5m943LH7rIeH
	 uGp0DbgR6QpqSeIs3Eug442EnjOJBhY79GcroYr/6Zb+7V6/ZPuL4UcVjA76NT61Kt
	 VykFRgHhhqQiRvd7TfRti0yjdGR509fAG2OKyxno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6BC1F80494; Fri, 21 Jul 2023 13:33:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C22CF8032D;
	Fri, 21 Jul 2023 13:33:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C96F8047D; Fri, 21 Jul 2023 13:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6691BF8027B;
	Fri, 21 Jul 2023 13:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6691BF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WGFJupkc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689939233; x=1721475233;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CgP7XFYudIRUfF8wSd8qKahDYm0g7JaTcDAF/BBMutY=;
  b=WGFJupkcmgCo+Iq53aQydD1BxphF95N4uGzt8xQsYXwmtN3TEza0MMTQ
   V5mXzj5b+aYe8FQ2dDnIp4H7RpdBq5yOrke9yYH4RXErllRe1qeSBsmck
   Uo2C6y5cswHYuZNSsxdqJP9y83d8JoEFGkB91V6TQ8LNF8IZ57jBDlKPr
   B3QdOuMJShN/IYj2F2kgr/WzMvW/NnIhPvjN52E9wYgdjEGR2uvXPz26g
   cK9YsV9goLDjQlfDhCKIG0lRzXYM9TBub6v6g9b2r3Eo02G8b7SuN+37y
   SoVRyn43ehiJYrOj+wA8XvC8rSE/qB71qYVwjsjUVaP8IpoTlDg5YxVPk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370602520"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="370602520"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="675008378"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="675008378"
Received: from dhardfel-mobl1.ger.corp.intel.com (HELO [10.251.223.78])
 ([10.251.223.78])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:33:33 -0700
Message-ID: <98af3d56-0efe-8b35-246e-0fa28cf6966b@linux.intel.com>
Date: Fri, 21 Jul 2023 14:34:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] ALSA: hda/intel: Fix error handling in azx_probe()
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-2-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230719164141.228073-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CVTWPAILRR7J3233VL4C5UV3UWOPSGFE
X-Message-ID-Hash: CVTWPAILRR7J3233VL4C5UV3UWOPSGFE
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVTWPAILRR7J3233VL4C5UV3UWOPSGFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 19/07/2023 19:41, Maarten Lankhorst wrote:
> Add missing pci_set_drv to NULL call on error.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index ef831770ca7da..0d2d6bc6c75ef 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2188,6 +2188,7 @@ static int azx_probe(struct pci_dev *pci,
>  	return 0;
>  
>  out_free:
> +	pci_set_drvdata(pci, NULL);
The original patch added this:
f4c482a4d0b3 ("ALSA: hda - Fix yet another race of vga_switcheroo registration")

but got removed later by:
20a24225d8f9 ("ALSA: PCI: Remove superfluous pci_set_drvdata(pci, NULL) at remove")

and partially added back (to azx_remove) by:
e81478bbe7a1 ("ALSA: hda: fix general protection fault in azx_runtime_idle")

I guess, it should do not harm to add it back...

>  	snd_card_free(card);
>  	return err;
>  }

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
