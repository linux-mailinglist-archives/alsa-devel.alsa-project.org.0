Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8050650BA02
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 16:24:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C41717DD;
	Fri, 22 Apr 2022 16:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C41717DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650637442;
	bh=PNxGIUKv6A/sfXfz2zbrvG335aLiVSWnVcFx7NtVMFk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j78uI88kEulKpduW4Q8ACF42ZYlt0tlc5f2/xB862NRyDLd9FliDQFF3ofid/7qzT
	 zYIg03Vr6SZrCnXDnrggYCNpQLQR98L3IbTswbHCa2iZZMD2lOTmkzVhP87q6uHWJK
	 SFN3ETwfR1GfGQ7wfuvwWlXPMQkarZibBjYaiBbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B60ECF800D1;
	Fri, 22 Apr 2022 16:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6FAAF80245; Fri, 22 Apr 2022 16:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2113AF800D1
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 16:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2113AF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f1T6hn2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650637376; x=1682173376;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PNxGIUKv6A/sfXfz2zbrvG335aLiVSWnVcFx7NtVMFk=;
 b=f1T6hn2d0yxp2dn55hfg4e/N3dVaa0PPg5Cin6nBsLY6KvPRsFz/PQUK
 HppP1CKjN+zjwBZYVKdTf4fAdCd+vdWstX4WfOK/PPQRyMYW8laaZ3qJg
 heHpRJ9LfV7XuDCLre8aX+U6Q3Eh+TEjYjclV+d3/IDEaa9lHaZcLAaKo
 TUxnIEBTgT/Q6lP3xtMmzhN4OsIw+RX3sjV4U4MVNpAq/HYiMuYOwNDEK
 NhfUVI3yHNUvHklQhjILS/QuJmwjo0wAzcKrBQsFwcAKHkib8BZwwgCo5
 v/cJ9tCHJ8RBRFCGnzdMTC6rQqWMSfPGMAsFQmgcZB+2pIvUtnyd0pdFS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244614138"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="244614138"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 07:22:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="806008004"
Received: from jbarbe2x-mobl.amr.corp.intel.com (HELO [10.252.134.44])
 ([10.252.134.44])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 07:22:50 -0700
Message-ID: <594043b4-5399-a187-7542-c9ef68bbf45a@linux.intel.com>
Date: Fri, 22 Apr 2022 09:22:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: bump SOF_ABI_MINOR
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 4/21/22 11:26, Pierre-Louis Bossart wrote:
> Commit a0f84dfb3f6d9 ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")
> did not update the SOF_ABI_MINOR, bump to version 20 before new
> changes are added.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  include/uapi/sound/sof/abi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
> index e052653a6e4cc..42227d4cb92c5 100644
> --- a/include/uapi/sound/sof/abi.h
> +++ b/include/uapi/sound/sof/abi.h
> @@ -26,7 +26,7 @@
>  
>  /* SOF ABI version major, minor and patch numbers */
>  #define SOF_ABI_MAJOR 3
> -#define SOF_ABI_MINOR 19
> +#define SOF_ABI_MINOR 20
>  #define SOF_ABI_PATCH 1

Please don't merge this, the ABI_PATCH level should have been reset as well.
Need new glasses. I will send a v2.

>  
>  /* SOF ABI version number. Format within 32bit word is MMmmmppp */
