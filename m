Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FF749A4C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C03D83E;
	Thu,  6 Jul 2023 13:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C03D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641869;
	bh=u/fsW4kL/xdqoPoVNSugeq8CVbVZfF1mCrdfPtk5xCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cp1K9XZTJoGmbUGMK60GO9n17Q2+b9WxV2iAfU5ARST+z6qyRpXLvVY4s8+53YRGL
	 kuXv6eTBNlZ3pQ2XsxBrly7HaxN6SSlGiIJLo3yTFeEI2rbXgYa6m3LIevLq1RrDSc
	 lSa0S5fNNqmPULNpDMUjBjKmgSDDWt30Wiegu8iI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 163B8F80557; Thu,  6 Jul 2023 13:09:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77856F80549;
	Thu,  6 Jul 2023 13:09:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24820F80124; Thu,  6 Jul 2023 13:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62B91F80125
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B91F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pIHMjHfJ
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so639043e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688641757; x=1691233757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/oYYhSbhJmqOXl3WeZk4kX2/u8Tf8KLHQQBSEPCIVg=;
        b=pIHMjHfJduYZzkTHgIiil58NGHIKjRaQAWq7g35hKDw+F7gRBuswwn6A36meCd8uqv
         P4fTvWp+UdIpiOIoD1iJ571Q85qECK2W3XC8seJ1a3jageFMtPAYrBBVnODTPBV2MchE
         dt6JLZ79+Ei0jyqANQZcQ8/MjcDeshtNlMA19kZ/gZQvAieKUNpFCRK2QXSM+ivj27XK
         LfLYgyyM3fJcQuhQYdbSW6xQKrfvTSeLqmqRK0VkI1f1nhP7YT4BoZJAGuugu8ikrMzS
         46vY3KsXH+F/gLzQ3yZURGx3gvoIEwXLJafvCl2OB2Yrf+sT5+/uU6Oj/ak8WBBcwzPS
         uLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641757; x=1691233757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/oYYhSbhJmqOXl3WeZk4kX2/u8Tf8KLHQQBSEPCIVg=;
        b=H5GbRnzXkcWl1QYJpaVYh7dgNOWtKde2Y1B0/vUw1pDKS+lpOftkXx+ukHv2N1BxDa
         LXS4w5iT/nardhpH+TW/n/QFordRk2P6qFEDHSIRfzhKXJjge6SDOvAA8IEAjObkOk9J
         gvifm4i3U4rVLHqLUwhKKFw6+kT+pb0iMv2BRPnMUdP2Y+85q/RiQf40qstNyX02Vqpn
         sQPWjIa9BLkNXN8h3Mm3TPWAx1I7ohJgqAZ+opUOHnbmowBkMdmIzE2enrLWxVahB5Vj
         18Toc0vzLCSNwOLub0q5BLjXUyerO9Efw4Uax2i1teP4uPOZIv1gzbAIl98yzZby1Khc
         SU3Q==
X-Gm-Message-State: ABy/qLZX7SpC2WlQAABuVMB/bFwbsEVxrLPodj9i8Wja1/osxUmk2GjS
	mJKBbhwc+6sSrNGzeqVRyXggZg==
X-Google-Smtp-Source: 
 APBJJlEBSUaXKkpOKcgRuOXlYHiHk2CCdPExcN0HHxQqs225FP1lp/mzkXW7F/tV8pEK76T9qIDAAQ==
X-Received: by 2002:a05:6512:2005:b0:4f8:5b23:5287 with SMTP id
 a5-20020a056512200500b004f85b235287mr1568498lfb.62.1688641757036;
        Thu, 06 Jul 2023 04:09:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 u16-20020a05600c211000b003fbdd5d0758sm1781419wml.22.2023.07.06.04.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:09:16 -0700 (PDT)
Message-ID: <921f73f6-256c-74f6-78a5-f229c732d30b@linaro.org>
Date: Thu, 6 Jul 2023 12:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/8] ASoC: qdsp6: audioreach: fix topology probe deferral
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-3-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230705123018.30903-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OKJ2RM74ENS5U67AB4NYPB5VNQOC7VZC
X-Message-ID-Hash: OKJ2RM74ENS5U67AB4NYPB5VNQOC7VZC
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKJ2RM74ENS5U67AB4NYPB5VNQOC7VZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05/07/2023 13:30, Johan Hovold wrote:
> Propagate errors when failing to load the topology component so that
> probe deferrals can be handled.
> 
> Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
> Cc: stable@vger.kernel.org      # 5.17
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   sound/soc/qcom/qdsp6/topology.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index cccc59b570b9..130b22a34fb3 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1277,8 +1277,8 @@ int audioreach_tplg_init(struct snd_soc_component *component)
>   
>   	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
>   	if (ret < 0) {
> -		dev_err(dev, "tplg component load failed%d\n", ret);
> -		ret = -EINVAL;
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "tplg component load failed: %d\n", ret);
>   	}
>   
>   	release_firmware(fw);
