Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC794CD91B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:27:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8341B2C;
	Fri,  4 Mar 2022 17:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8341B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646411270;
	bh=WDo6Pg/+B0rxmuevopGEoJ5ODA8RryFv4OgtIE+rDcI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLQ+RaWfk55rL7460aeUx/SvNm3yMf1v6EIfSj4WjtxicD3fr6eIolkmzgXaJr/qk
	 7I7mn5gGU5RaS9GzrDN2GwiD3aY1RU4NECIgeV13YMKYXmGlfJkTjk8UzNz/8UAOJu
	 8YHLNO57oAv3Jq9fRmbryLwyZGdjjlTxGG5k5j3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5040CF801F5;
	Fri,  4 Mar 2022 17:26:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30F22F800F0; Fri,  4 Mar 2022 17:26:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C71F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C71F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qnj8ZXXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646411194; x=1677947194;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WDo6Pg/+B0rxmuevopGEoJ5ODA8RryFv4OgtIE+rDcI=;
 b=Qnj8ZXXAGEWUsKDfojZsyYUSb5RCae1dcZaek5QdIKrT3QkW81LMcG5+
 hsP+6LHr73O9ZIbSevW/tGctb0J3vNnx+9o64qRhKSuMc9OU+vmY/T2/p
 cpnQ3phBjaCsbPkspA+jSqbuzW+RDHddGtu4jPoYj70xhxGxxCFWH4AnI
 AycWFRPvTXLzByY7EH8M3SzO31rGU68QqZc5K2uDr6JvQLuzu1m1fohnf
 12pHXLTPltseQInPQ9g0lT8DHRbUYKY3OMzBJdH4JEtznB76XNoJeJEKu
 a5wCZovHUcjE8+iNDMKbqrh11odHoaD2Y0MdTgVI1FUVpUE242Bpwx3cN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340438959"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="340438959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:26:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="686915782"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:26:29 -0800
Message-ID: <9e9f98514cc1c2106659126ff77ed385ebe2157f.camel@linux.intel.com>
Subject: Re: [PATCH v3 09/17] ASoC: Intel: avs: Add ROM requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:26:29 -0800
In-Reply-To: <20220304145755.2844173-10-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-10-cezary.rojewski@intel.com>
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
> ROM requests are messages initiated by Host to alter firmware early
> boot
> process. They specify whether the next boot should be a fresh start
> or if
> IMR can be used to speed things up.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/messages.c | 18 ++++++++++++++++++
>  sound/soc/intel/avs/messages.h | 14 ++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/messages.c
> b/sound/soc/intel/avs/messages.c
> index e8f441b28d71..f7d00e541323 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -12,6 +12,24 @@
>  
>  #define AVS_CL_TIMEOUT_MS	5000
>  
> +int avs_ipc_set_boot_config(struct avs_dev *adev, u32 dma_id, u32
> purge)
Does purge set to true indicate a fresh boot and a false indicate IMR
restore? A description would help.
Thanks,Ranjani

