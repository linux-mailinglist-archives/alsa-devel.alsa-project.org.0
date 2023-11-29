Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898507FDF9F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 19:46:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB188E75;
	Wed, 29 Nov 2023 19:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB188E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701283604;
	bh=cKJeFNkIQAf+/tiMMgC+hJ3Nk+Hnaj6HJWSuL5lnedo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fZJ4q+f2Y0Sw+D7Xmyaezt0FbNeVz1L0D/MvXM6TtcrxfE624bIrxUJ6Iok5ZF/Nh
	 wPWK9gY9VXJ0pGe4JiGpb3GLSMnVee1kPaWFGC9h32lh/lC4xUWLQ7kTL2YHdbpV1b
	 3g4s1yecAkY42RJQIsyIjNzg9ZJTu6c0jCzisd+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57093F805B5; Wed, 29 Nov 2023 19:46:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF88FF805B4;
	Wed, 29 Nov 2023 19:46:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63AD8F801D5; Wed, 29 Nov 2023 19:45:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BD9CF800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 19:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD9CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A08Sl2xl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701283548; x=1732819548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cKJeFNkIQAf+/tiMMgC+hJ3Nk+Hnaj6HJWSuL5lnedo=;
  b=A08Sl2xlyeomWLqQjsd6URT99FhlsvG6peedt1FYhWwYiI26KBjZ2x/p
   9ma8852wsX4rJ/v2lwhLIfzw5nfNHYKVUb4EFLeIKxedXrgaU2KG0GFi+
   k61pn1jy+KTIlFsoJXVROmsI0iN6W8DguiGkvEhuIzUEXyQVj+Nc7OEpo
   +6cXuHXg+3i3r92N38li33OySaOoHAh3NUxBImLZGIaE/aGNVguRGVJYm
   9LVqWH9DpR2GrwlrubOY7cElOGQTfrkGwzYGS6m/wq9HyW4ns9KDl9pIO
   T1RcdnBCqA+xQwdnP5VShBnLEOc3htLwK6EhEmbakZA1y8/MRSKyFlc5Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383602810"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600";
   d="scan'208";a="383602810"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942421675"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600";
   d="scan'208";a="942421675"
Received: from caw1-mobl1.amr.corp.intel.com (HELO [10.255.229.136])
 ([10.255.229.136])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:45:43 -0800
Message-ID: <3d36d707-86f7-44fe-a613-64e264bb53cd@linux.intel.com>
Date: Wed, 29 Nov 2023 11:07:20 -0600
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
 <e43db38a-206d-4ea5-8813-23e1f918dd65@linux.intel.com>
 <ab0fc6e0-a358-42e7-92e5-77ceea53a546@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ab0fc6e0-a358-42e7-92e5-77ceea53a546@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YXUBDJARG3LFH4UUKWK6K65YOSJPXISU
X-Message-ID-Hash: YXUBDJARG3LFH4UUKWK6K65YOSJPXISU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXUBDJARG3LFH4UUKWK6K65YOSJPXISU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/29/23 10:43, Krzysztof Kozlowski wrote:
> On 28/11/2023 16:35, Pierre-Louis Bossart wrote:
>>>  static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>>>  						    struct sdw_msg *msg)
>>>  {
>>> @@ -1078,6 +1090,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>>>  };
>>>  
>>>  static const struct sdw_master_ops qcom_swrm_ops = {
>>> +	.read_prop = qcom_swrm_read_prop,
>>
>> nit-pick: read_prop() literally means "read platform properties".
>>
>> The functionality implemented in this callback looks more like an
>> initialization done in a probe, no?
> 
> Yes, but multi_link is being set by sdw_bus_master_add() just before
> calling read_prop(). It looks a bit odd, because "bus" comes from the
> caller and is probably zero-ed already. Therefore I assumed the code did
> it on purpose - ignored multi_link set before sdw_bus_master_add(),

On the Intel side, there's a bit of luck here.

The caller intel_link_probe() does not set the multi-link property, but
it's set in intel_link_startup() *AFTER* reading the properties - but we
don't have any properties related to multi-link, only the ability to
discard specific links.

>>>  	.xfer_msg = qcom_swrm_xfer_msg,
>>>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>>>  	.post_bank_switch = qcom_swrm_post_bank_switch,
>>> @@ -1196,6 +1209,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>>>  
>>>  	mutex_lock(&ctrl->port_lock);
>>>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>>
>> just realizing this now, are you sure the 'port_lock' is the proper
>> means to protecting the stream->master_list? I don't see this used
>> anywhere else in stream.c. I think you need to use bus_lock.
> 
> This is from ctrl, internal driver structure:
> 
> struct qcom_swrm_ctrl *ctrl

My point what that all other instances where list_for_each_entry() is
used on stream->master list rely on the bus_lock.

You may be fine in this specific case with a QCOM-specific lock, not
sure if there's any risk. At any rate that is not introduced by this
patch, so for now

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
