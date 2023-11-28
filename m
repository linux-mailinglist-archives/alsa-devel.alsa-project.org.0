Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BB7FC0B4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9701C836;
	Tue, 28 Nov 2023 18:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9701C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701194109;
	bh=qIrihs3bgqghpQQf+Q4tySVJ/cFlr64il/GtOmU5bi4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LRoo6TejwPo/BN2k3ZP5WCec7HMqbInzguMduGtGpjRKRRTUZxkQ53m5ogR9zacIU
	 6jA1n1Y9jHFhQYfhKW7mUTTu5R3ugXXH7jTHLfvIXCFI9IAZ8Pl6FZyE9FA8Fbo7pC
	 Xeg9ek/S2TopPoXJjFEP+aPm9sitvHu0tQEcdj/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62408F805D4; Tue, 28 Nov 2023 18:54:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4453CF805E6;
	Tue, 28 Nov 2023 18:54:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DA2FF805A9; Tue, 28 Nov 2023 18:54:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CBD8F80104
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBD8F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z5TXnyoF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194042; x=1732730042;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qIrihs3bgqghpQQf+Q4tySVJ/cFlr64il/GtOmU5bi4=;
  b=Z5TXnyoFbMB7KG14mea7mRYUlIEc0OxdUeqr5G/x1qEoSF2UbFUknvD3
   cGntYD/h7i+oxCwye0Mvp/4VTGA3gFEYrFX2slbgEdGpqkV93Yt95xIC9
   V2DTDPCKQwkYQySp26tw47iGSU1cVXqIuSqv/iHsRWZRC6IWGx4bik/SN
   c5h7mjjIk2buNnBGPwYzFRK1sN7ieU+onySXgESkBQPR76None84aKnnT
   ewRPwHK2G+76Hs1fYoANv1SIK74gNrUj5zaIYnvmOSUEIsCYdRIup54Y0
   SFDE2sLbPsX0TU/FXjqbJpmq3A/5ayfIgkFjSLWcyALBj5anD6Q+Y4vQg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127086"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="424127086"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715306"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="834715306"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208])
 ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:53:56 -0800
Message-ID: <e43db38a-206d-4ea5-8813-23e1f918dd65@linux.intel.com>
Date: Tue, 28 Nov 2023 09:35:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: allow multi-link on newer devices
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
References: <20231128150049.412236-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231128150049.412236-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5YIIS5M4CNVNRED5EYGMFN5C6GAIXCGC
X-Message-ID-Hash: 5YIIS5M4CNVNRED5EYGMFN5C6GAIXCGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YIIS5M4CNVNRED5EYGMFN5C6GAIXCGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/28/23 09:00, Krzysztof Kozlowski wrote:
> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
> over two Soundwire controllers, thus they need a multi-link Soundwire
> stream runtime.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is an entirely different approach than my previous try here:
> https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
> ---
>  drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 412b8e663a0a..57943724f0eb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -920,6 +920,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int qcom_swrm_read_prop(struct sdw_bus *bus)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +
> +	if (ctrl->version >= SWRM_VERSION_2_0_0) {
> +		bus->multi_link = true;
> +		bus->hw_sync_min_links = 3;
> +	}
> +
> +	return 0;
> +}
> +
>  static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>  						    struct sdw_msg *msg)
>  {
> @@ -1078,6 +1090,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>  };
>  
>  static const struct sdw_master_ops qcom_swrm_ops = {
> +	.read_prop = qcom_swrm_read_prop,

nit-pick: read_prop() literally means "read platform properties".

The functionality implemented in this callback looks more like an
initialization done in a probe, no?

>  	.xfer_msg = qcom_swrm_xfer_msg,
>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>  	.post_bank_switch = qcom_swrm_post_bank_switch,
> @@ -1196,6 +1209,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  
>  	mutex_lock(&ctrl->port_lock);
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {

just realizing this now, are you sure the 'port_lock' is the proper
means to protecting the stream->master_list? I don't see this used
anywhere else in stream.c. I think you need to use bus_lock.


> +		/*
> +		 * For streams with multiple masters:
> +		 * Allocate ports only for devices connected to this master.
> +		 * Such devices will have ports allocated by their own master
> +		 * and its qcom_swrm_stream_alloc_ports() call.
> +		 */
> +		if (ctrl->bus.id != m_rt->bus->id)
> +			continue;
> +
>  		if (m_rt->direction == SDW_DATA_DIR_RX) {
>  			maxport = ctrl->num_dout_ports;
>  			port_mask = &ctrl->dout_port_mask;
