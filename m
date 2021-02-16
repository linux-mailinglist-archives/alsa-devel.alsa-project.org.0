Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7131D25B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 22:51:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE3F1846;
	Tue, 16 Feb 2021 22:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE3F1846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613512267;
	bh=rMh2yQssa1ZuVWx6wKjT2Z1bLN0ix5jYGrVZQzok9u4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XENq3ReiQVsQ6/dHAdaCj5XuFPuc5jaFO2IqZy3ZWfNhiKcXWE36XSQw6dn0iFHR2
	 ofSW/TYxoopegTlyTP6c2YH6AjXxLj9zrv9lZI3sAHZTLwCPSyx93pCpUavjVgNJLp
	 Gjs7rZ5uD53Q8ZYAS3+Ibxi5L/UI0yYQQx7/xoBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BCF5F80059;
	Tue, 16 Feb 2021 22:49:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AA47F8015A; Tue, 16 Feb 2021 22:49:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_141,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA2CF800AE
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 22:49:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA2CF800AE
IronPort-SDR: ZkAhTOYP2+ZwdaOGD6lkysKkSh8Qcc6V89ClDFmM1z2EWUNkWWE1hcVJEyhJROeS6gw6zpvrXl
 2OFvu7hKMtyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182250791"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="182250791"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 13:49:22 -0800
IronPort-SDR: idvmN0o0Gm/hkCk+K6uAnGrm7eO1+yFDhAPwsuknGLy3E2uTJYtll5Q6W4O2DhHBf+f1436gD0
 Rqkusp2IMkTg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="424867341"
Received: from agsarwar-mobl1.amr.corp.intel.com (HELO [10.209.13.197])
 ([10.209.13.197])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 13:49:21 -0800
Subject: Re: [PATCH 0/4] ASoC: Intel: bytcr_rt5640: Add quirks for 4 more
 tablet / 2-in-1 models
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210216213555.36555-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aa350a8d-863f-45bf-9ed4-8d26f0342959@linux.intel.com>
Date: Tue, 16 Feb 2021 15:49:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216213555.36555-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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



On 2/16/21 3:35 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series adding quirks with device-specific settings for
> 4 more tablet / 2-in-1 models.

Some of those 2014 devices will soon be collector items ;-)

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (4):
>    ASoC: Intel: bytcr_rt5640: Add quirk for the Estar Beauty HD MID 7316R tablet
>    ASoC: Intel: bytcr_rt5640: Add quirk for the Voyo Winpad A15 tablet
>    ASoC: Intel: bytcr_rt5651: Add quirk for the Jumper EZpad 7 tablet
>    ASoC: Intel: bytcr_rt5640: Add quirk for the Acer One S1002 tablet
> 
>   sound/soc/intel/boards/bytcr_rt5640.c | 37 +++++++++++++++++++++++++++
>   sound/soc/intel/boards/bytcr_rt5651.c | 13 ++++++++++
>   2 files changed, 50 insertions(+)
> 
