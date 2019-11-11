Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3001F790C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 17:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76ABB166D;
	Mon, 11 Nov 2019 17:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76ABB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573490637;
	bh=qykuYkr8M5BTPrsz1nlFO+Vw4gQjeU/CnUdgsEvN7f8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7IuQ/dkue5tcXzaxHushc3pF34jAZpju6Fpm5f3edbedPOY5n7cl1TRsWaXle8NY
	 JxyOvtzc5bRnRLOVtRNN//7Tm0vCQ/KrnYggfPHgkWz3hA4aJL+4vhI1pYSzX2y31+
	 cKV6IJ0DQVTq8AwOkmPTaboECubboI06QCjdc4DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA0DF805A0;
	Mon, 11 Nov 2019 17:41:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B5A4F805A0; Mon, 11 Nov 2019 17:41:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 777B0F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 17:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777B0F80275
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 08:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="193986443"
Received: from magalleg-mobl3.amr.corp.intel.com (HELO [10.251.146.103])
 ([10.251.146.103])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2019 08:41:18 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573483794-8921-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573483794-8921-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1e64b725-0f0f-0db6-677d-41a3ea564167@linux.intel.com>
Date: Mon, 11 Nov 2019 09:44:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573483794-8921-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/6] ASoC: amd:Create multiple
 I2S platform device Endpoint
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


> +		pdevinfo[2].name = "acp3x_i2s_playcap";
> +		pdevinfo[2].id = 1;
> +		pdevinfo[2].parent = &pci->dev;
> +		pdevinfo[2].num_res = 1;
> +		pdevinfo[2].res = &adata->res[2];
> +		for (i = 0; i < ACP3x_DEVS ; i++) {
> +			adata->pdev[i] =
> +				platform_device_register_full(&pdevinfo[i]);
> +			IS_ERR(adata->pdev[i]) {

how does this even compile?

> +				dev_err(&pci->dev, "cannot register %s device\n",
> +					pdevinfo[i].name);
> +				ret = -ENODEV;
> +				goto unmap_mmio;
> +			}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
