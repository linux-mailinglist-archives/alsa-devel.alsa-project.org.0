Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7B55B5E5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 06:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C81C15CC;
	Mon, 27 Jun 2022 06:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C81C15CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656302478;
	bh=meaia4R8w6yImXJTi7qvPRgfmxIpwjKhb8F+heWwwDk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/H8CCznheL9EVNUGeJ9NRhAgS2kBdVes0KjpLr9M8dxJjBmyJDf8P0skpaIGdnrN
	 nb0ceCVrmWUOTgF6ryx4lcZdn5k62iYkcT+H0C1Degv2T7ulKmnEtD0f7wdPNKBW27
	 RKkXXu5yG6Z4jXPB90THELhtZRs9GBVfwivtYkXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85079F8028D;
	Mon, 27 Jun 2022 06:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9453F8028B; Mon, 27 Jun 2022 06:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA361F80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 06:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA361F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="BNpomk6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656302416; x=1687838416;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4Kar03BCEB4L24G5H6w4MX8UHJ3D7qBoro9yJwBflPk=;
 b=BNpomk6s114dUxBrRd04c4wxlBD/s9opoOtvH8ymL+1TlRGUk5sKxIOB
 4iS+iKsLlRiBE2sObYEIz4kgaCHT9mo1+Ulbex6Ega2QG3/DWvcq+GHiV
 9pWfJ8lf91MD1eaW4F43ybOdX7HdzXnDFAQMzkqCve0rAhtzSWZxboUe9 0=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 26 Jun 2022 21:00:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 21:00:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 26 Jun 2022 21:00:08 -0700
Received: from [10.216.28.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 26 Jun
 2022 21:00:03 -0700
Message-ID: <74337c92-0b23-b37a-861d-54996ae827a3@quicinc.com>
Date: Mon, 27 Jun 2022 09:29:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Update
 sc7280-audioreach-herobrine compatible name
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1655892799-29641-1-git-send-email-quic_srivasam@quicinc.com>
 <1655892799-29641-2-git-send-email-quic_srivasam@quicinc.com>
 <YrMPNpE+RWIZP372@sirena.org.uk>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YrMPNpE+RWIZP372@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


On 6/22/2022 6:16 PM, Mark Brown wrote:
Thanks for Your Time Mark Brown!!
> On Wed, Jun 22, 2022 at 03:43:18PM +0530, Srinivasa Rao Mandadapu wrote:
>> Update audioreach based compatible string for sc7280 based ADSP enabled
>> platforms.
>>     compatible:
>>       enum:
>>         - google,sc7280-herobrine
>> +      - google,sc7280-audioreach-herobrine
> Isn't the DSP firmware selection a purely software one?
Yes. It's purely software related. will discard this additional 
compatible string, and re-spin the patch.
