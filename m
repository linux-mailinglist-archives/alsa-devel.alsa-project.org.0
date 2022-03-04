Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415C4CD974
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:49:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153CE1F13;
	Fri,  4 Mar 2022 17:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153CE1F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646412560;
	bh=YCNLQ3eme71gVy6Ftb97jrI1BX/A1fiORCPLznZg5LU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UsYU1rgO54aL8v5ccDUAzeVdonF2MOFn6+1tHls1SK2/xb8uowVIfRYeoB7HjeZuh
	 iaGVdxAkzHvTk+c9SDTW5MlLrn1WcDW4Z7JvZ0HjChY5JITpSDzLiz8+I7gIKYtk2G
	 ugprjgxT8D6PztBDv67GLeR9iCmQcFdqNSjjyxXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93BAAF801F5;
	Fri,  4 Mar 2022 17:48:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E952CF800F2; Fri,  4 Mar 2022 17:48:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6905AF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6905AF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aUfVMU9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646412484; x=1677948484;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YCNLQ3eme71gVy6Ftb97jrI1BX/A1fiORCPLznZg5LU=;
 b=aUfVMU9hzveb5j7naUhukN545fTQXbXVEPuzmyMmYXmrlZ1vVc/C42bC
 7eqJ92cFMMIq3k+XVNO9xdlohEUj7IZQ27G1W72clWoMmD/htC+XiYcz8
 Q2FwokI8U3MVFhlHZARuQYDV9R3P4Vwe1hTZGnEkBXZf6UcWxU6IMs7zK
 gTS66GTZbaGdscj58MdU3MnLcFz36LcIxawb2NhR6BSwc6Bd439ZwXRCm
 9WYeMj5nygXyLBsn5PidY94i/DzHSMNx5EIWn3dH+OWpGQoWaSMScY41A
 T90xHGingOsgjV1NfkJ32jfHmG61d120fhG9ul/mBTQ7pMZwt8TmgZllb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="253944456"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="253944456"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:47:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="779682564"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:47:43 -0800
Message-ID: <0afcd1f47073d84b2871a4dc2cb12754ff0d1a7e.camel@linux.intel.com>
Subject: Re: [PATCH v3 13/17] ASoC: Intel: avs: Dynamic firmware resources
 management
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:47:43 -0800
In-Reply-To: <20220304145755.2844173-14-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-14-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Wrap elementary DSP-core operations and resource control into more
> complex handlers. This is done to reduce the number of invocations of
> wrapped operations throughout the driver as order of operations
> matters -
> most flows involve register manipulation and IPCs combined.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/avs.h |  10 +++
>  sound/soc/intel/avs/dsp.c | 170
> ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 180 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> index 02d7591d0eac..0034c075fa64 100644
> --- a/sound/soc/intel/avs/avs.h
> +++ b/sound/soc/intel/avs/avs.h
> @@ -89,6 +89,7 @@ struct avs_dev {
>  	struct mutex modres_mutex;
>  	struct ida ppl_ida;
>  	struct list_head fw_list;
> +	int *core_refs;

Is this a per core ref_count? a comment or explicitly calling it
core_ref_count would help.

Thanks,Ranjani

