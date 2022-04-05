Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DD4F3CED
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0B118AE;
	Tue,  5 Apr 2022 19:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0B118AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649180104;
	bh=xNIgDv3tAxt+JijYYxs5mDw4LO9oYMf6VWgmKn7pa7M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6HHZ7BETnL5bNqwRs06m9rYNlpJjxcUPr3cmY2J6Vu0gh0uetp1OPYOkgtGOXo2l
	 gtu4FwXyLlJBuMgRIjWMQtBMi4h3MiQhQxRtyjFp2gHlucmrjzQT1+almIvza1j/Dl
	 /NSDemVhepg6zGTlwzOTTGRR/IN3Lo8QCgSpaFkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E31A6F800D2;
	Tue,  5 Apr 2022 19:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F200F8016A; Tue,  5 Apr 2022 19:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EB93F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB93F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ELo0xsUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649180042; x=1680716042;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xNIgDv3tAxt+JijYYxs5mDw4LO9oYMf6VWgmKn7pa7M=;
 b=ELo0xsUUB2F6uXW0pU15ylo/gB4Z+gkD9l7OaduIGpO23hp6DaS1fAAL
 /U+Sy9O2dpc5JZ8D+9mZ5wWdWeLRNukwhx8f/Y5t2SVAnTZyO/F4dwGNe
 aWfppio01wC/Jju8Uvd8wiIPMtDpBPrkK7bFsZo5xafoIUh0gULq7OFfV
 Fi74VX1xW9DlXmNB7HN7jQYzCL6M7LC8jOjhxoIEfcSoJH7qTagCxWw8m
 nFaAtdoHIVigcKQHxluCflHA7pnHKo49VBIKiQkrMVWuBGj5T4moXhKVG
 AQMhXSLf+kp1h3WOmO4uSqdVtCcZVbGEG/Ra9tVqQK7y/RAk+vKKgNZ1W Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="260514197"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="260514197"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:33:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="651984104"
Received: from ctveazey-mobl2.amr.corp.intel.com (HELO [10.255.230.126])
 ([10.255.230.126])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:33:41 -0700
Message-ID: <6eaa459d-b2a9-fc1e-e16d-01b28028462b@linux.intel.com>
Date: Tue, 5 Apr 2022 12:33:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] ASoC: Intel: sof_es8336: support a separate gpio
 to control headphone
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, alsa-devel@alsa-project.org
References: <cover.1649177516.git.mchehab@kernel.org>
 <535454c0c598a8454487fe29b164527370e2db81.1649177516.git.mchehab@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <535454c0c598a8454487fe29b164527370e2db81.1649177516.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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


> -static const struct acpi_gpio_params speakers_enable_gpio0 = { 0, 0, true };
> +static const struct acpi_gpio_params enable_gpio0 = { 0, 0, true };
> +static const struct acpi_gpio_params enable_gpio1 = { 1, 0, true };
> +
>   static const struct acpi_gpio_mapping acpi_speakers_enable_gpio0[] = {
> -	{ "speakers-enable-gpios", &speakers_enable_gpio0, 1 },
> +	{ "speakers-enable-gpios", &enable_gpio0, 1 },
>   	{ }
>   };
>   
> -static const struct acpi_gpio_params speakers_enable_gpio1 = { 1, 0, true };
>   static const struct acpi_gpio_mapping acpi_speakers_enable_gpio1[] = {
> -	{ "speakers-enable-gpios", &speakers_enable_gpio1, 1 },
> +	{ "speakers-enable-gpios", &enable_gpio1, 1 },
> +};

nit-pick: these changes could be applied to the previous patch.

the rest of the code looks fine, thanks Mauro!
