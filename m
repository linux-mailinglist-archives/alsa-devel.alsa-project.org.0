Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7E62C1C0
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 16:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0A7D1696;
	Wed, 16 Nov 2022 16:05:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0A7D1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668611151;
	bh=Lc2im2WNuflvec4Il7akKcrjVAyNll8uTfelvJ8MY/I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZ+8RNZDn9XGLhH6VbyZs7tE9N/TO1kvkGoxQbYxG7KhxE+vnTY+D+W0DXvwGhNbY
	 FdPKet5n2okS1k8xdrDWsAv2vumow9qNHO1NkAAhG/OMBPzkDFfSDQbuJ6oipuCi2b
	 zpIcJZYg9MkNmpP8BY6jAcW77VeVwx5JhffMLoh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A1AF800B5;
	Wed, 16 Nov 2022 16:04:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CEBCF80163; Wed, 16 Nov 2022 16:04:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64304F800B8;
 Wed, 16 Nov 2022 16:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64304F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mqjpXwNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668611094; x=1700147094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Lc2im2WNuflvec4Il7akKcrjVAyNll8uTfelvJ8MY/I=;
 b=mqjpXwNJsSoVPZfyK9WnrcdiC/bxKhn0RjX6DO+UHosZ33eHG6Es3JjI
 lkqpDYUH2H2iqcOe50tioQRt++B3BGC8cGB+OPIkjr38gJ9n7A4YVMmkQ
 p/FIYxaDMCRMxpwz7lCfgtiNwOssqnuhd4N5sW3wZLe+kssZ8L4oSl9/t
 oSa+IaSo5WXqb6Ds1T09X32NTxWd7G3+vBTmoATMeDHEnQY1b9OFuz6SN
 0EIxoZ0vUkYkdUeGDeT3pKCD7pwkIX7jzB/dRTrBrRNequIPMOWSMRYMx
 SuTvIcoiIPPWOn3Zkt/fXHixmuqX9zQEbdhQ2bCObQ1L1jrAf0z/IFk2U Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314379387"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="314379387"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:04:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="639385030"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="639385030"
Received: from msureshb-mobl3.amr.corp.intel.com (HELO [10.212.45.114])
 ([10.212.45.114])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:04:10 -0800
Message-ID: <a8bc9284-c0c2-79aa-fee6-40101fc34f96@linux.intel.com>
Date: Wed, 16 Nov 2022 09:04:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Sound-open-firmware] [PATCH 3/4] ASoC: SOF: Adding amd HS
 functionality to the sof core
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
 <20220913144319.1055302-4-Vsujithkumar.Reddy@amd.com>
 <36a45c7a-820a-7675-d740-c0e83ae2c417@collabora.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <36a45c7a-820a-7675-d740-c0e83ae2c417@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Basavaraj.Hiregoudar@amd.com, Chen-Yu Tsai <wenst@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 YC Hung <yc.hung@mediatek.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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


>> diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
>> index 21d98f31a9ca..83fd81c82e4c 100644
>> --- a/include/sound/sof/dai.h
>> +++ b/include/sound/sof/dai.h
>> @@ -84,6 +84,7 @@ enum sof_ipc_dai_type {
>>       SOF_DAI_AMD_BT,            /**< AMD ACP BT*/
>>       SOF_DAI_AMD_SP,            /**< AMD ACP SP */
>>       SOF_DAI_AMD_DMIC,        /**< AMD ACP DMIC */
>> +    SOF_DAI_AMD_HS,            /**< Amd HS */
>>       SOF_DAI_MEDIATEK_AFE,        /**< Mediatek AFE */
> 
> Adding SOF_DAI_AMD_HS before SOF_DAI_MEDIATEK_AFE desynced this enumeration
> so the DAI type is now 11 and not 10 anymore, leading to a failure in
> firmware
> at IPC3 helper function `dai_get()`, as when `dai_find_type()` is
> called, the
> DAI type that the firmware expects doesn't match with the one that gets
> sent
> in the request message from the kernel.
> 
> As a local test, I tried moving SOF_DAI_AMD_HS after
> SOF_DAI_MEDIATEK_AFE and
> this has restored full functionality on my MT8195 platform (Tomato
> Chromebook).
> 
> If SOF is supposed to guarantee backwards compatibility (and I believe
> it is),
> this commit breaks that.
> 
> I would be tempted to send a commit that moves SOF_DAI_AMD_HS to the
> end, but
> that would break the already compiled firmware for AMD platforms, so I
> am not
> sure how to proceed.

D'oh. Yes this breaks backwards-compatibility and this is a clear
mistake. I think your suggestion to add the AMD_HS at the end is the
only practical solution indeed - this would need to be done for both
kernel and SOF version of dai.h.

