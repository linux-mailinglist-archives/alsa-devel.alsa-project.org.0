Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EEC65E138
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 01:01:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45256DC7A;
	Thu,  5 Jan 2023 01:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45256DC7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672876862;
	bh=5oJu9RcpF0Fz6JcRHF4cNVph8pynM8F7sOctJiWYBYE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S7W+/4FbAttUKuWaOBJrbkxq6HawQ1kzocVNk4Ef84Mf1HrJWumMkz+owCOUKwE4/
	 bToIVOu9zw91BzOJUITTwIdIzkR5M334ZrzyOSq0clqQ6mbPBznqwBYm18wqGLyltO
	 Cc7jrX8+pgl0ytrLi4Yww90/qzdXO8DAGmGsvZD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68F13F8053A;
	Thu,  5 Jan 2023 00:59:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D7A1F80240; Thu,  5 Jan 2023 00:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01612F8024E
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 00:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01612F8024E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QBQFjlKe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672876764; x=1704412764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5oJu9RcpF0Fz6JcRHF4cNVph8pynM8F7sOctJiWYBYE=;
 b=QBQFjlKekcsDlAvSR2B/c88noUZRySHpfLEPS96rUM035uOueGlNyeaZ
 UsKZWV5psKIdi6NppuboTVWJ6TrtPrb/f18CFpVqD/OgvrL8SkIZXq4Vt
 oqBv5BPEe9a3RtABIAr7TK/2yL3a97Mc2isK+OqLy9b6SQGPRRK63dhcM
 0B9IuqV3qda/itenpY6n9b9vG+1iY6j1gKVYA26B5owtD5TMJFJKmLD6L
 sZjxhXj2gRrkOfGHwgaNKZnFs/pzURwG/Bl+tWfw5rF5K4VCFIYMc3D45
 H1v+AZDmMDcBKnYTqBuVTa7ZpIR7ILrtTfPbGzZdiiM1LlRw2ZDuQPgk3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="323306080"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; d="scan'208";a="323306080"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:58:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="900745339"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; d="scan'208";a="900745339"
Received: from kvthalli-mobl1.amr.corp.intel.com (HELO [10.212.102.90])
 ([10.212.102.90])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:58:49 -0800
Message-ID: <e29060b1-df65-c0d1-5777-023879a5863e@linux.intel.com>
Date: Wed, 4 Jan 2023 17:41:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221223233200.26089-4-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
> +			int connected)
> +{
> +	struct snd_soc_dapm_context *dapm;
> +	struct q6usb_port_data *data;
> +
> +	if (!usb->component)
> +		return 0;
> +
> +	dapm = snd_soc_component_get_dapm(usb->component);
> +	data = dev_get_drvdata(usb->component->dev);
> +
> +	if (connected) {
> +		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
> +		/* We only track the latest USB headset plugged in */

that answers to my earlier question on how to deal with multiple
devices, but is this a desirable policy? This could lead to a lot of
confusion. If there are restrictions to a single device, then it might
be more interesting for userspace or the user to indicate which USB
device gets to use USB offload and all others use legacy.

> +		data->active_idx = card_idx;
> +	} else {
> +		snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
> +	}
> +	snd_soc_dapm_sync(dapm);
> +
> +	return 0;
> +}

