Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464841EC98
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 13:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2020916DC;
	Fri,  1 Oct 2021 13:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2020916DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633089113;
	bh=ipigCtRkqUL75m2LsB73y0+V99tBh1RdVLej7145hCc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iHaKLyQEg+pMl9/aBTf4TsP1VIWa370HwXzVvo9bh4J9P79be9y59fPeDUdcewK2u
	 kpON34vDU0GjZxOBcDNMqCvb+LarPo4eztrXE9rGWuvyYCEqdMqZ9alxdku/qI0Ab7
	 +KfbR4XaAGZabQIrXdFdCKrQ4K5FIhwUBrtwwNko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C22FDF8026D;
	Fri,  1 Oct 2021 13:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9343F80245; Fri,  1 Oct 2021 13:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65791F801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 13:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65791F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="223509443"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="223509443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 04:49:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="540047578"
Received: from pwhela2-mobl1.ger.corp.intel.com (HELO [10.213.160.166])
 ([10.213.160.166])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 04:49:54 -0700
Subject: Re: [PATCH] soundwire: qcom: add debugfs entry for soundwire register
 dump
To: Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20210907105636.3171-1-srinivas.kandagatla@linaro.org>
 <YVaMlSbmFnrQyb0u@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ada6763f-7821-6388-2c7a-3a771450c7bf@linux.intel.com>
Date: Fri, 1 Oct 2021 06:45:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVaMlSbmFnrQyb0u@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 9/30/21 11:20 PM, Vinod Koul wrote:
> HI Srini,
> 
> On 07-09-21, 11:56, Srinivas Kandagatla wrote:
>> +#ifdef CONFIG_DEBUG_FS
>> +static int swrm_reg_show(struct seq_file *s_file, void *data)
>> +{
>> +	struct qcom_swrm_ctrl *swrm = s_file->private;
>> +	int reg, reg_val;
>> +
>> +	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
>> +		swrm->reg_read(swrm, reg, &reg_val);
> 
> Why not use regmap_read here, that would avoid reading from the bus when
> we already have the values...

It's an indirect read based on regmap.

	ctrl->reg_read = qcom_swrm_ahb_reg_read;
	ctrl->reg_write = qcom_swrm_ahb_reg_write;

static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
				  u32 *val)
{
	struct regmap *wcd_regmap = ctrl->regmap;
	int ret;

	/* pg register + offset */
	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_RD_ADDR_0,
			  (u8 *)&reg, 4);
	if (ret < 0)
		return SDW_CMD_FAIL;

	ret = regmap_bulk_read(wcd_regmap, SWRM_AHB_BRIDGE_RD_DATA_0,
			       val, 4);
	if (ret < 0)
		return SDW_CMD_FAIL;

	return SDW_CMD_OK;
}

> Second make sure later when pm_runtime support is added, this take a
> reference ..

Yes indeed, the SoundWire regmap doesn't change the pm_runtime status.
