Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A809B8A0CCE
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA1B211A;
	Thu, 11 Apr 2024 11:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA1B211A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712829024;
	bh=+e34Pb3pZ1eg94TgXhBzORR5jz/zvBqwI7txDmuccvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZAU2248K9c5WyIUHSBQxQ/0ZL+mlbDM0CRhaVRlW0I9VRuVjnGJgll/ZTbU1WlqvI
	 T/32XYXtLMIgR/7IDgSZpD4I2jP8GNA2tkuZxWyjUelfq9qMKNv37xG1Z9aRR5wQ4p
	 0zGfyv4pjLhfojb20fO6jXIz2bYWMWE6QaNkx+Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F498F805AC; Thu, 11 Apr 2024 11:49:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04828F805E2;
	Thu, 11 Apr 2024 11:49:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB46F8055C; Thu, 11 Apr 2024 11:49:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 061B8F80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 061B8F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GY1JBLEA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1AFA61FD6;
	Thu, 11 Apr 2024 09:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CE8C433C7;
	Thu, 11 Apr 2024 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712828971;
	bh=+e34Pb3pZ1eg94TgXhBzORR5jz/zvBqwI7txDmuccvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GY1JBLEAkpKc9458lEMO1wnDyXbJ3NMgZWQpxjRF+tJiMTivgCJercSi+X7UhfciK
	 1HRCEL+qXUG5IyERDDalInO6re3w0u4C10Lrtx4cIMKHKm/W1gkr0oBxQjrJ54ycp5
	 dZ/FDvZl2tQpTt7KrbM5OH5zqAwkcu/fWL4WZxgCGftTg4wTAt7wCwQd7P8ovgVQ8Y
	 eSHB4NZFpoavhIIcO21XCH+KXmysCThmyKRT4h0tc6BgN6zJ8Da+SOhRvEIW50LRmT
	 2ffaRMvmJoiDUxym72uWgKOhQ8BJZJKbLcsv6kqVAa8kK+xLwCXs/X9fYNfKHlC2Ca
	 6QMz2hXVtK7+Q==
Date: Thu, 11 Apr 2024 15:19:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] soundwire: qcom: allow multi-link on newer devices
Message-ID: <ZheyJ5PORudx9gsK@matsya>
References: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: KQNHRNR57WXKCB5FRYYJC73YJQMT4AEK
X-Message-ID-Hash: KQNHRNR57WXKCB5FRYYJC73YJQMT4AEK
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQNHRNR57WXKCB5FRYYJC73YJQMT4AEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05-04-24, 16:41, Krzysztof Kozlowski wrote:
> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
> over two Soundwire controllers, thus they need a multi-link Soundwire
> stream runtime.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Only rebase (slightly different context)

Applying /tmp/v2_20240405_krzysztof_kozlowski_soundwire_qcom_allow_multi_link_on_newer_devices.mbx
Applying: soundwire: qcom: allow multi-link on newer devices
error: drivers/soundwire/qcom.c: does not match index
Patch failed at 0001 soundwire: qcom: allow multi-link on newer devices

This fails as well :-(


> ---
>  drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index fb70afe64fcc..ce5cf3ecceb5 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -905,6 +905,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
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
> @@ -1056,6 +1068,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>  };
>  
>  static const struct sdw_master_ops qcom_swrm_ops = {
> +	.read_prop = qcom_swrm_read_prop,
>  	.xfer_msg = qcom_swrm_xfer_msg,
>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>  };
> @@ -1173,6 +1186,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  
>  	mutex_lock(&ctrl->port_lock);
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
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
> -- 
> 2.34.1

-- 
~Vinod
