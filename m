Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370192014C1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 18:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E951684;
	Fri, 19 Jun 2020 18:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E951684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592583621;
	bh=pTbEMXhwsTdeD6ghvEdM6msdDqjBkimy2GBYTX3WE3M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CxZSmQWLnkAhVrYfX+1GY+6odIQuPsjBFwC88DJNE1peFUIXBMMn1pBXd7Cvxjq9+
	 54a5XTSZko1Bux/MuMt1dc6VT+TDZj7TKUPbEpTELQiqeeddqaLVv3YVLR1C2idHrz
	 sVSfnx6awhdoY43/drFKAbuaCFfuc6EFkBKFD8Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFCE7F800EF;
	Fri, 19 Jun 2020 18:18:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FD52F8028A; Fri, 19 Jun 2020 18:18:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3BCF800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 18:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3BCF800EF
IronPort-SDR: 6sfokLTcTY/UDlKs/ku4uB6M6N8dkTVuM9j4RJcD4pid8g64/Y58yffVHcqWFp4ybjARoKdZ2O
 gkF4aHj0SwyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="122734129"
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="122734129"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:18:30 -0700
IronPort-SDR: ZPn+sQrS3xQi+iXrTB+gfnRA8AalPx+1noM0YyA21HwCgONXv/WnAFbVTiOcscGTLkwMixmGsV
 PJG4MhCd6/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="318155770"
Received: from lewest-mobl1.amr.corp.intel.com (HELO [10.255.230.148])
 ([10.255.230.148])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jun 2020 09:18:30 -0700
Subject: Re: [PATCH 1/3] ALSA: compress: document the compress audio state
 machine
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200619045449.3966868-1-vkoul@kernel.org>
 <20200619045449.3966868-2-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8e322574-14bc-aaaa-5fdb-751cb8b97fff@linux.intel.com>
Date: Fri, 19 Jun 2020 09:22:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619045449.3966868-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org
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


> +
> +                                        +----------+
> +                                        |          |
> +                                        |   OPEN   |
> +                                        |          |
> +                                        +----------+
> +                                             |
> +                                             |
> +                                             | compr_set_params()
> +                                             |
> +                                             V
> +                                        +----------+
> +                compr_drain_notify()    |          |
> +              +------------------------>|   SETUP  |
> +              |                         |          |
> +              |                         +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_write()
> +              |                              |
> +              |                              V
> +              |                         +----------+
> +              |                         |          |
> +              |                         |  PREPARE |
> +              |                         |          |
> +              |                         +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_start()
> +              |                              |
> +              |                              V
> +        +----------+                    +----------+     compr_pause()      +----------+
> +        |          |                    |          |----------------------->|          |
> +        |  DRAIN   |<-------------------|  RUNNING |                        |  PAUSE   |
> +        |          |                    |          |<-----------------------|          |
> +        +----------+                    +----------+     compr_resume()     +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_free()
> +              |                              |
> +              |                              V
> +              |                         +----------+
> +              |     compr_free()        |          |
> +              +------------------------>|          |
> +                                        |   STOP   |
> +                                        |          |
> +                                        +----------+


The STOP state doesn't seem quite right to me, sorry.

the direction of the DRAIN-STOP comp_free() arrow seems wrong? Of if it 
is correct, then something's missing to exit the STOP state so that the 
stream can be opened again.

