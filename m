Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32C4C76BB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 19:05:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44D91852;
	Mon, 28 Feb 2022 19:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44D91852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646071553;
	bh=ZuN7R19CpZ+tD0mbMD2B2m+TnP6BZbW0fRvaZAvNAhQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQeLCk/7ZO5OZ8CWJSUSRjYoDuapZlE8gBnyvpxGjNzc0pX6ZMBvfriW0CSTsKDrR
	 3aUFhVkTbiofSk/QsbKPogJ/jNOPadMP6t5hyL1mQLN9wXgrhXTKrrZgz+LKisBmSc
	 qlhf7vAa9Ry5TpSq0zOBhReL307i+jJ7ke56ZSVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C5CF8015B;
	Mon, 28 Feb 2022 19:04:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D891F8015B; Mon, 28 Feb 2022 19:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2948CF8013C
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 19:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2948CF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IwD2cUfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646071483; x=1677607483;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZuN7R19CpZ+tD0mbMD2B2m+TnP6BZbW0fRvaZAvNAhQ=;
 b=IwD2cUfdBuQ9hO3EJzccL+noSS2DwKoNF+KZWdonAKHdH2YWv3+dvcN1
 bi8vGpZ++SCspSZghKBt5bVPByG0mnt1OxPHQWAXbAr4SHsTVeE95YlIf
 3VZRxw4CLNHYo96ybxs5ZEPoAgRgHcsqQfVj7x1l0kxgcJJHak9kOIuGF
 Af0j5bFXWjAC6wTBdQkiuN+hHd/vEYVbDkIb91UCWfpf25Yk0D68X8h+I
 btED/OjWEKZtKdw2bFrwxQ2RC1pB3XcZm6AxwtuU8JdxrOsH1lnDoTQTh
 1qVN82ZH9+Jx27qtOIqq9uzE306vFN6SuV7P34hhg3HUfP+EjTNOzLaw4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232919505"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232919505"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:04:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="510184833"
Received: from ensymall-mobl.amr.corp.intel.com (HELO [10.212.116.28])
 ([10.212.116.28])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:04:34 -0800
Message-ID: <00972101-2526-334e-c2ea-02558b93f5bf@linux.intel.com>
Date: Mon, 28 Feb 2022 11:23:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220228153343.2263412-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220228153343.2263412-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


> Changes v2 -> v1:
> Almost all updates here are thanks to feedback from Pierre.

Can I ask for a bit of mercy on reviewers and specifically my time? I
sent my comments on Friday, I haven't had time to look at the answers
and there's a new version already?

> - several comments and few kernel-docs have been added in areas which
>   felt more or less unclear
> - avs_ipc_wait_busy_completion() now spins up to 'repeats_left' number
>   of times before giving up
> - 'adsp_ba' field of struct avs_dev has been renamed to 'dsp_ba'
> - 'dops' field of struct avs_spec has been renamed to 'dsp_ops'
> - IPC abstraction has been simplified: SKL_ADSP_REG_HIP* regs are used
>   directly
> - fixed allnoconfig with AVS enabled compilation issues
> - fixed code loading error paths: previously requested firmware is now
>   released before function return to the caller
> - code and function arguments tied to D0IX support have been removed
>   from this patchset and will be part of followup series adding that
>   feature instead
> - enriched dev_err() messages in avs_dsp_get_core() and
>   avs_dsp_put_core()
> - numerous wording fixes used in power/reset/stall DSP operations
