Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B348BC2C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 16:55:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB49A1672;
	Tue, 13 Aug 2019 16:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB49A1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565708113;
	bh=gJHl8x4cYYo/nFNG1dykVKc45cx8SJXo8GL5BYCrjrA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YXagU4VKHHfFO4O/oUvt3QWSW5F78tISxDSzNi7mo5Yr6BAWuceIOLtd1kJEoZFvH
	 sMDkEPsZWKcfApjkL3FJJfHTcNSy6m3UCD87dqy/5ivX8U8sa1dRIJ+KIFyeD+pex5
	 WQe22dVKm+31kaCJ+56GpBffIRYeBJ8WMk0GLqic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD86CF8049A;
	Tue, 13 Aug 2019 16:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58FA9F804CA; Tue, 13 Aug 2019 16:53:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 759A5F8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 16:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 759A5F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 07:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="170418266"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2019 07:53:09 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
 by linux.intel.com (Postfix) with ESMTP id 3C297580238;
 Tue, 13 Aug 2019 07:53:08 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7e462330-a357-698a-b259-5ff136963a57@linux.intel.com>
Date: Tue, 13 Aug 2019 09:34:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813083550.5877-2-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 1/5] soundwire: Add compute_params
	callback
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 8/13/19 3:35 AM, Srinivas Kandagatla wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> This callback allows masters to compute the bus parameters required.

This looks like a partial use of the patch ('soundwire: Add Intel 
resource management algorithm')? see comments below

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/stream.c    | 10 ++++++++++
>   include/linux/soundwire/sdw.h |  2 ++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index a0476755a459..60bc2fe42928 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1483,6 +1483,16 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
>   		bus->params.bandwidth += m_rt->stream->params.rate *
>   			m_rt->ch_count * m_rt->stream->params.bps;
>   
> +		/* Compute params */
> +		if (bus->compute_params) {
> +			ret = bus->compute_params(bus);
> +			if (ret < 0) {
> +				dev_err(bus->dev, "Compute params failed: %d",
> +					ret);
> +				return ret;
> +			}
> +		}
> +

This would need to be duplicated for deprepare (as was done in the Intel 
patch).

>   		/* Program params */
>   		ret = sdw_program_params(bus);
>   		if (ret < 0) {
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index bea46bd8b6ce..aac68e879fae 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -718,6 +718,7 @@ struct sdw_master_ops {
>    * Bit set implies used number, bit clear implies unused number.
>    * @bus_lock: bus lock
>    * @msg_lock: message lock
> + * @compute_params: points to Bus resource management implementation
>    * @ops: Master callback ops
>    * @port_ops: Master port callback ops
>    * @params: Current bus parameters
> @@ -739,6 +740,7 @@ struct sdw_bus {
>   	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
>   	struct mutex bus_lock;
>   	struct mutex msg_lock;
> +	int (*compute_params)(struct sdw_bus *bus);

not sure I understand how it's set? We have a default in the Intel patch.

>   	const struct sdw_master_ops *ops;
>   	const struct sdw_master_port_ops *port_ops;
>   	struct sdw_bus_params params;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
