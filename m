Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2414C2FFE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 16:38:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C61C81AC6;
	Thu, 24 Feb 2022 16:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C61C81AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645717128;
	bh=3fsQ5ASk5JzOl9Oihhbgf2HvtBFo/UuExocUAe8Q3UM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5YwdSE5ScyIdYmA5mPAWTG41wnF7hyLRQHAgPu9i8d9sHEyNrMKj/vLxYSKELn6m
	 DsPT/V9B5pYkCuEBnlr8mdR3XMErxuhFsMR0189kW8lulpwRaHNgL2HrSSoZJNbjRg
	 Yp3/R/U8H5ivpFPw6XdyN3x/CXo9PAcyGYSTaMe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D34F80118;
	Thu, 24 Feb 2022 16:36:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6E63F804FC; Thu, 24 Feb 2022 16:36:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 572DAF80169
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 16:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 572DAF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="QSygBXzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645717012; x=1677253012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6iOO/xvEAZwa7uM8e2lemBPhR3SH5fevH9P0Xv6tYoc=;
 b=QSygBXzkFYe4FBM7u47SpxXnT56qpBUFZ1TtkScadwnTKxr8z1SO3u8O
 xpP+V4ekrMSck75dFY+CMMSvVnwM7w+eQcQGJ5vhyeEFd7bWxUirFNoo4
 6UOKedCtgdOmDXlFBYWPp1DexIct+raxNeLPgqBn0HrShaH3lr4EV34Rb k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 24 Feb 2022 07:36:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:36:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 07:36:49 -0800
Received: from [10.216.20.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 07:36:43 -0800
Message-ID: <1d433167-7768-9d10-7e92-74bca4bc8d39@quicinc.com>
Date: Thu, 24 Feb 2022 21:06:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v15 6/10] ASoC: qcom: Add regmap config support for codec
 dma driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
 <1645630745-25051-7-git-send-email-quic_srivasam@quicinc.com>
 <Yhd26Cbe6ecbiVYH@sirena.org.uk>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <Yhd26Cbe6ecbiVYH@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 2/24/2022 5:45 PM, Mark Brown wrote:
Thanks for Your time Brown!!!
> On Wed, Feb 23, 2022 at 09:09:01PM +0530, Srinivasa Rao Mandadapu wrote:
>> Update regmap configuration for supporting headset playback and
>> capture and DMIC capture using codec dma interface
> This breaks an x86 allmodconfig build:
>
> /mnt/kernel/sound/soc/qcom/lpass-cpu.c:976:29: error: 'lpass_va_regmap_config' defined but not used [-Werror=unused-variable]
>    976 | static struct regmap_config lpass_va_regmap_config = {
>        |                             ^~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/sound/soc/qcom/lpass-cpu.c:966:29: error: 'lpass_rxtx_regmap_config' defined but not used [-Werror=unused-variable]
>    966 | static struct regmap_config lpass_rxtx_regmap_config = {
>        |                             ^~~~~~~~~~~~~~~~~~~~~~~~
Okay. Sent patch series with fix.
