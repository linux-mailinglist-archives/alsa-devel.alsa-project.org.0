Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C267E690D20
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 16:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AE9E73;
	Thu,  9 Feb 2023 16:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AE9E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675957026;
	bh=DBmQQVUz0xBm9mAUPi6p/C1WlTafVt50h5IaYJ0eVDA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AQrEzFeSdxbhzsxo7ZqejYjbU1T17e1bzK8Vwr4l4W/e3XqbURExAP99nMNgGdPFw
	 W1+Oru3/4qrCld0zSooHSKlwzr0hD+TupJ24YpUc6eF40hNeDKo0QQ2MuHMSkxg8dG
	 6b69tuM8lxFsT9gepa9YPmjypJhc1dPm1QfItQAE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 677C9F80525;
	Thu,  9 Feb 2023 16:35:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D5F6F80526; Thu,  9 Feb 2023 16:35:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3DEDF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 16:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3DEDF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OehQXI/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675956909; x=1707492909;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DBmQQVUz0xBm9mAUPi6p/C1WlTafVt50h5IaYJ0eVDA=;
  b=OehQXI/KRMdLMX4+IvYX5EbzAok5dtBKK6mR8Fa0ACcsgCMhb4ftlwpt
   /oweVV3I31JkNCs+FajEoponnoM5rRFwkLiTfN5njdG6rrg7dMx8Pomgm
   RaikhsyJlcwFE3OieIRsc30zmjuH7CzAyumdCUg3ctRY17hb/4E8kA9wz
   /c+g9kdB2CJeWnqZ67Bepy1Z80rbM0/S+a3NlBmPd5WShso+uJe1mjRtZ
   UoBVdS18VKz3pVn1qI0/EakdZdIfMfJWbFMZvULMqGWQqE8scgW4PdxRZ
   ybWlQQKeKhdzQIctYMEb3wy/5a5rDvO22DHvjYrRIKwmzIiW0n9+1M2mX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309782440"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="309782440"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:35:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776528833"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="776528833"
Received: from fpastor-mobl4.amr.corp.intel.com (HELO [10.212.74.130])
 ([10.212.74.130])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:35:04 -0800
Message-ID: <dbec6aab-6456-72b3-39b6-3490dfdf083c@linux.intel.com>
Date: Thu, 9 Feb 2023 09:23:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] soundwire: qcom: wait for fifo to be empty before
 suspend
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
 <20230209131336.18252-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230209131336.18252-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HX4CHHN6GDO3AC54SEPJR7CHHJFBANAP
X-Message-ID-Hash: HX4CHHN6GDO3AC54SEPJR7CHHJFBANAP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HX4CHHN6GDO3AC54SEPJR7CHHJFBANAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/9/23 07:13, Srinivas Kandagatla wrote:
> Wait for Fifo to be empty before going to suspend or before bank
> switch happens. Just to make sure that all the reads/writes are done.

For the suspend case that seems like a valid approach, but for bank
switch don't we already have a bus->msg_lock mutex that will prevent the
bank switch command from being sent before the other commands are handled?

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b2363839624c..465b2a2ef0d5 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -325,6 +325,32 @@ static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
>  	return 0;
>  }
>  
> +static bool swrm_wait_for_wr_fifo_done(struct qcom_swrm_ctrl *swrm)
> +{
> +	u32 fifo_outstanding_cmds, value;
> +	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
> +
> +	/* Check for fifo overflow during write */
> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +	fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
> +
> +	if (fifo_outstanding_cmds) {
> +		while (fifo_retry_count) {
> +			usleep_range(500, 510);
> +			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +			fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
> +			fifo_retry_count--;
> +			if (fifo_outstanding_cmds == 0)
> +				return true;
> +		}
> +	} else {
> +		return true;
> +	}
> +
> +
> +	return false;
> +}
> +
>  static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>  				     u8 dev_addr, u16 reg_addr)
>  {
> @@ -356,6 +382,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>  		usleep_range(150, 155);
>  
>  	if (cmd_id == SWR_BROADCAST_CMD_ID) {
> +		swrm_wait_for_wr_fifo_done(swrm);
>  		/*
>  		 * sleep for 10ms for MSM soundwire variant to allow broadcast
>  		 * command to complete.
> @@ -1122,6 +1149,7 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
>  {
>  	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
>  
> +	swrm_wait_for_wr_fifo_done(ctrl);
>  	sdw_release_stream(ctrl->sruntime[dai->id]);
>  	ctrl->sruntime[dai->id] = NULL;
>  	pm_runtime_mark_last_busy(ctrl->dev);
> @@ -1558,6 +1586,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>  	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>  	int ret;
>  
> +	swrm_wait_for_wr_fifo_done(ctrl);
>  	if (!ctrl->clock_stop_not_supported) {
>  		/* Mask bus clash interrupt */
>  		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
