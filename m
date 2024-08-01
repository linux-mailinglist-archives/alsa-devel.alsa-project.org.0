Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E59447A4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 293883837;
	Thu,  1 Aug 2024 11:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 293883837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503631;
	bh=SOc8glK77E54IHi0aYmi1becvJHvdKsCHlBtpj4BVg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6CpMnJ3ibT06Hu2J/1QtaSKxWg6oMlHhgu5Pp0U19UI/DY9nIGyONViewXaDYKzG
	 uMKJOsjabfzOFEU/fDibZgnDySnmKxXFSfNLbxKKsB/T5Wjg68lcpv8mp4MnfFPsXp
	 lEHd4NUvjkBMfJ2UCIuzK6oQJ+3LZCC4DVIiMDtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8169F805CA; Thu,  1 Aug 2024 11:12:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAACF8061D;
	Thu,  1 Aug 2024 11:12:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BEDF805ED; Thu,  1 Aug 2024 11:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EB79F8026A
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB79F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wh7uOwHD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503525; x=1754039525;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SOc8glK77E54IHi0aYmi1becvJHvdKsCHlBtpj4BVg4=;
  b=Wh7uOwHD5DuH8ijtx+I6yFNTKh727xNslGcOBOeuDvD2JaTNJeBR1M0b
   a2Us+gQR5YUnqi+UnsADuekBgySABcUK+A74OwBWJ4qrhx0Zr5+lh2fKu
   derbbSOg/NncwtO8JWhkjDvzB9fDZOAQw9Pd7JrjcPlVrNBwTOFXotMNY
   EU53hXjP69F0dndiqkB7bNszR5MRvdy/G0hg4YUmjMXqKQuuw/HrQmaRL
   vaS+sbeQcAjl0udUmUQefHdKTuT8dAW7hSGDqu3m9KAst4df18RHNSp1y
   kFB9zuSrUY8ek19DE26RHCXHpKTFtVw/NiJA6ftYu75nVaI/irfAIQg3Z
   A==;
X-CSE-ConnectionGUID: XCZVL8+JS9GtrULL8dwoTQ==
X-CSE-MsgGUID: cysgIKq5TauDra6znarRCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383563"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:50 -0700
X-CSE-ConnectionGUID: 5bTR/KBmSv+7VMJZROiJzw==
X-CSE-MsgGUID: W4mT9NNxSUOjFGSViYJGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59089923"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:36 -0700
Message-ID: <abc9f2b9-06c6-4df7-8db8-c2c6e8aaee59@linux.intel.com>
Date: Thu, 1 Aug 2024 10:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 16/34] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-17-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-17-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3RH6HBAJ7VU2NAYUCP4O437Y2ETBIHFG
X-Message-ID-Hash: 3RH6HBAJ7VU2NAYUCP4O437Y2ETBIHFG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RH6HBAJ7VU2NAYUCP4O437Y2ETBIHFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 03:17, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 948007955934..452d7e8b9b30 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -366,7 +366,7 @@
>  #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>  #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>  
> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000

Surprising that 1s is not enough to resume a bus, and conversely is 3s
enough then if the overhead is so significant?
It looks like either too much or too little...

>  #define AFE_CMD_RESP_AVAIL	0
>  #define AFE_CMD_RESP_NONE	1
>  #define AFE_CLK_TOKEN		1024

