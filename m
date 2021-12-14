Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2F4743E3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 14:52:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7EAE1B0F;
	Tue, 14 Dec 2021 14:51:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7EAE1B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639489969;
	bh=aGh8jo1gJVlHvEL633koLqeHJiJokNadpN+OQ5CckVw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xkh+iOZzYjwBRt4vg8Cvf6pO8jgg2fPiwm/ZyOUo7G9Y7K2C6uDOb7oFjcs7d1yEE
	 M+D0lxEPDCdkSmWS1sITJqqVaAPebOHsQt4AippkoNIQWV35mvbKKRVOLxHXgg0dLA
	 33qaP6LAu7TOlvwubA5OoIOpEvz0tYpiKMFlHZ5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A633F8016A;
	Tue, 14 Dec 2021 14:51:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97431F80246; Tue, 14 Dec 2021 14:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EC64F8013C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 14:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC64F8013C
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325255195"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="325255195"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 05:51:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="604287738"
Received: from rtwoods-mobl.amr.corp.intel.com (HELO [10.213.169.152])
 ([10.213.169.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 05:51:22 -0800
Subject: Re: linux-next: Tree for Dec 13 (SND_AMD_ACP_CONFIG)
To: Randy Dunlap <rdunlap@infradead.org>, broonie@kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211214030215.3181149-1-broonie@kernel.org>
 <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <15c3b6fe-b159-6cee-be67-11f2f2dd0d04@linux.intel.com>
Date: Tue, 14 Dec 2021 07:51:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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



> on i386 or x86_64:
> 
> when # CONFIG_ACPI is not set,
> so SND_SOC_ACPI is not set:
> 
> WARNING: unmet direct dependencies detected for SND_AMD_ACP_CONFIG
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_ACPI [=n]
>   Selected by [y]:
>   - SND_SOC_AMD_ACP_COMMON [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && X86 [=y] && PCI [=y]
> 
> 
> Full randconfig file is attached

It's probably triggered by my recent change to fix another problem.

d9b994cd7641 ASoC: AMD: acp-config: fix missing dependency on SND_SOC_ACPI

I didn't realize SND_AMD_ACP_CONFIG was selected by other configs.
Moving to a select seems to fix the issue reported by Randy, not sure if
it's the right thing to do though.


diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index bcfeb3fc2592..7a9e45094f37 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -98,7 +98,7 @@ config SND_SOC_AMD_YC_MACH

 config SND_AMD_ACP_CONFIG
        tristate "AMD ACP configuration selection"
-       depends on SND_SOC_ACPI
+       select SND_SOC_ACPI if ACPI
        help
         This option adds an auto detection to determine which ACP
         driver modules to use


