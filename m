Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 915EB4C3034
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 16:46:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2374D1AA1;
	Thu, 24 Feb 2022 16:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2374D1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645717582;
	bh=9+DVXx/isU6uWI6/XyBC0Lnisob2NuO5FXAXMzKIKQQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sd7KXi6mpCPhyEZRsX9woGUaOKPMO/FALVvmdZvPKaK2H8wfmqSPBINO9Fx/NKszr
	 WxntL9Bl5ysUf2l/0QEK3zE1hqODn5rLA6MyHjNEVfHKaZiRYKKMi9K8KgN2wg4MXb
	 za8HQfriL4FH27WaGL469P7COW8PxxuT2eUqAdTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2F9F80430;
	Thu, 24 Feb 2022 16:45:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFC90F804CF; Thu, 24 Feb 2022 16:45:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 763D7F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 16:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 763D7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U0YuBhKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645717512; x=1677253512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9+DVXx/isU6uWI6/XyBC0Lnisob2NuO5FXAXMzKIKQQ=;
 b=U0YuBhKQKH6TuU6U89qnsnM+tqU5xFzafL9pCu+zBotaBLCdx1cPP5EA
 NfN0X4vwDz3jVjJAcHojXahW2p+DJhV5OjU9C2lPq0rXs8IPBXbUkbmnt
 4ocuBrflOsFzVOzPnfXrL8Eo3QvLvaqu/CT9VSAvH0w8He38pQG14Hwh5
 sfFGlOnnHG9PcjF4Dy8rqlPtMyQRVTOn4qtiEIG1eimVCpmHKqeElZboR
 5YOQSYHO2nei77kncKwC98lYNgOwSoSWVuq6AsbSC7rx4p+Y1mYlbQ/XA
 pemBo3RhnIY1yMeoF+2kgYx6MEdKlxIq2qf9N5VauFwZPtnEJdrzSE04L A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="276890957"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="276890957"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:45:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="533178468"
Received: from ronakmeh-mobl1.amr.corp.intel.com (HELO [10.212.97.131])
 ([10.212.97.131])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:45:04 -0800
Message-ID: <522ab282-ecc2-4186-2d77-f6241e255109@linux.intel.com>
Date: Thu, 24 Feb 2022 09:29:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/16] ASoC: codecs: wsa881x: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
 <20220224111718.6264-15-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220224111718.6264-15-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, quic_srivasam@quicinc.com
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



On 2/24/22 05:17, Srinivas Kandagatla wrote:
> WSA881x codecs can not cope up with clk stop and requires a full reset after suspend.
> WSA SoundWire Controller connected to this instances do a full soft reset on suspend.

is it the manager or peripheral that cannot cope with clock stop?

> @@ -1124,6 +1136,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>  	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>  	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +	pdev->prop.simple_clk_stop_capable = true;

here it's pretty clear the peripheral is capable of supporting clock
stop, no?

Something's not clear between the commit message and the code.
