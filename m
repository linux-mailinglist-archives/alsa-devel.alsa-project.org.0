Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8F54E2A1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 15:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BE31ADC;
	Thu, 16 Jun 2022 15:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BE31ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655387813;
	bh=H07h6eHPETOhmWyZeoC46nmOYEAlOCtHdfTY/8O4WoQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B5vr5xPVZ8mIyhMiSwnE/iDapz3U2pNyqCFW9SYNqk3xHuBt53BZc3DKRVBWumvhB
	 0I0MV/gLCm2+bTqO0t81hH3QbsHicHsdxYt+oGXUJ+72goKlCQsAk+yKYd8QuQTpVR
	 O8mA1ySDw47jhZDteUNZA1RYPq32q7NhmOZYUuws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC9FF804E0;
	Thu, 16 Jun 2022 15:56:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 772F3F804D0; Thu, 16 Jun 2022 15:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 571FAF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 15:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 571FAF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BehuJv74"
Received: by mail-pg1-x52b.google.com with SMTP id w29so1305777pgl.8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 06:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p++bIs2HneM4Mmo2YjeBS7JYAqLzkFDGH55M3o+NIxg=;
 b=BehuJv74CLjkgQwQW2YTJI7GYHpWAyt46Adp9YWqP2Ino810KUqBU3m1LAkJP2RoeF
 +eA+u8d7kVSzDosz5vq7VxcNcZTX5YfEAdbw3WwaqZk6zp6IGjSa69Y0nIzpcs7oQ7T1
 5P9k5mgEtdwx7+92E2Hd+8E/s1CExYyHRLZ7rC2g7YdASXXLLCb/7P762HZgHrjLA75R
 xG5TtUiW3VtMrQd6uFAmQG8Y4p1sUGlhBWUz7hIEqmjYZkezA6cSjVo4NTIG9NzxS6uo
 9KvtSOoyXEs4n5UZOYuuYOrIE0Y0joFHJlTY2q8mQG0IgbCAF5+0MpkutS140mIBOqqJ
 kXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p++bIs2HneM4Mmo2YjeBS7JYAqLzkFDGH55M3o+NIxg=;
 b=a1eiTmHJ8YlokpP+rE062c9MMoj1LjJ+9MpzjXYFRyO3cXYNxkHgPucXZZlDJ6CdQ0
 46whg/Gveh8u0DLWvxaO+B49nqHqCZ1jQYNLa0Gzh1sOVKJ65VKlo9SY/CHjJ8VLHMFx
 Ma7CPZd2ngqW1zvhdB6inbZyjLGpa3sPjbkJ+WIKVnZAKOQSrBbjS6oRN45PMofVlIjU
 FSyLZJkrhGN8iTDM3DgQQN4y5O4QIposTHbxDB+HtoL9sxzCmlHooQnliJavFJuB0blH
 uUtvugxMiAg9LiG/zNtE2SXQ3JpxP/3h55XHPUtV4CQxHyozI/ZFJkmKblbnwcYwlB9H
 Tp+g==
X-Gm-Message-State: AJIora+bH9NzxtEv4TxMEEhj8JX8QvjP8a8UhS62ixCwbR1R134NbmTx
 Kh3XSGM3juLbDCahLooFOWPF2A==
X-Google-Smtp-Source: AGRyM1vXMhY+ZrUKaR7yePLi9tk4x6RLg+QaJ2jT5cqYNFanziG3iv5eJoN4umJFjqajEOEp+YtBpQ==
X-Received: by 2002:a63:356:0:b0:3fd:7477:63f0 with SMTP id
 83-20020a630356000000b003fd747763f0mr4613366pgd.601.1655387752971; 
 Thu, 16 Jun 2022 06:55:52 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056a00198200b0051b9ecb53e6sm1773063pfl.105.2022.06.16.06.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 06:55:52 -0700 (PDT)
Message-ID: <ea767ff8-9fa0-7a2f-af52-e0d05adafb03@linaro.org>
Date: Thu, 16 Jun 2022 06:55:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/4] dt-bindings: dsp: mediatek: Add mt8186 dsp document
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616073042.13229-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On 16/06/2022 00:30, Tinghan Shen wrote:
> This patch adds mt8186 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers, clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
