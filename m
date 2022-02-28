Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B84C6E2C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 14:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D4561727;
	Mon, 28 Feb 2022 14:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D4561727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646054962;
	bh=v6ER1rvOKAkv8UimHHfAWAtdqi+SdNPYmxKvey8BiHE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPB6xfNRSQ2g2XYpQ7hpu2LwmrRbhC0AWHp0WHnwOI+QsVbDoTcGCcoYq8q6uxe+x
	 4H3Q89bn9ReRRTIoQqhHWnDqRBq339dr2Yqhtry7XRvKS6+5j2Bq6wO9fuTJLolxd8
	 4OebSLK1dAR5E8gGVx2sEU/H9E1WkMuofjQqXCS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CECA3F80154;
	Mon, 28 Feb 2022 14:28:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4F86F8013C; Mon, 28 Feb 2022 14:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99270F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99270F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="m+T5oz4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646054891; x=1677590891;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=deW8q7Xp/sEx0AYDJJAkcuqEYxWadRQiD9AFWZ3aPSY=;
 b=m+T5oz4eW7loRUjDPsC9xxmRNHl563MNlt3etsXkkwKYDVcR9hsKSYzu
 apb549GIYhsC19GnhlcAxERrB9ZBD7M8ZsyKgZSPYz/YILRQmCRtO4y1L
 SDqPbbo/j8XP0OpwcjSoXjmxXRHxGFTu9kZwi7wCFVtCRZzkrGkoxBP+E M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Feb 2022 05:28:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 05:28:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 28 Feb 2022 05:28:04 -0800
Received: from [10.216.54.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 28 Feb
 2022 05:27:58 -0800
Message-ID: <2de96a40-82c1-7ff2-a293-295267058fd3@quicinc.com>
Date: Mon, 28 Feb 2022 18:57:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: qcom: soundwire: Add support for controlling audio
 CGCR from HLOS
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1646035750-25635-1-git-send-email-quic_srivasam@quicinc.com>
 <YhzMeoNW7/OUJrMa@sirena.org.uk>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YhzMeoNW7/OUJrMa@sirena.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, judyhsiao@chromium.org, Venkata
 Prasad Potturu <quic_potturu@quicinc.com>, linux-kernel@vger.kernel.org
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


On 2/28/2022 6:52 PM, Mark Brown wrote:
Thanks for Your Time Brown!!!
> On Mon, Feb 28, 2022 at 01:39:10PM +0530, Srinivasa Rao Mandadapu wrote:
>
>> +	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
>> +	if (IS_ERR(ctrl->audio_cgcr))
>> +		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> Doesn't this need a DT binding update?

DT binding included in another patch which was sent recently. As this 
patch depends on clock driver patches didn't  mention the below dependence.

https://patchwork.kernel.org/project/alsa-devel/list/?series=618579
