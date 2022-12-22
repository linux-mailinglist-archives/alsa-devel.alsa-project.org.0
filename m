Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E336540AB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 13:05:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C064097;
	Thu, 22 Dec 2022 13:04:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C064097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671710726;
	bh=0xMQfM8ggWvvJ1Y9Li6Qe2gvvvX6iQrpR95X9nFSVjA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Iwhqtmy90JJ9NwpZOX6rFE9j3kPp2FqeXE9f6S+8eLLFE+WOR5zaGBJWrBNgBhCM/
	 ch6NZ7Sg4V/22GOZSpfUhYKjdBNVVkiuVozqQ7PXM8XSdx59dO+nMrrTxnQqcB5fpM
	 cgi6lNt3/t7Nt9tudaZ0hQ6s+au2HvUXoJLyUrys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96CC3F8028D;
	Thu, 22 Dec 2022 13:04:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7AB0F80496; Thu, 22 Dec 2022 13:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDAC6F80022
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 13:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDAC6F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NU/xJ/gq
Received: by mail-lj1-x235.google.com with SMTP id v11so1651823ljk.12
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 04:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NZKYMOZIKxtwI9C5Y2DsLl9mvShg/E7HjBCtUKagoFs=;
 b=NU/xJ/gqpRxcFPSTXASvHZNTQPQImqNO0nE1XWDSUjaRHX0J8bJai/8tQDYnflTr3h
 mDwlz1YH/Y9rUvFdqn5KvvivcDz/eE+tVUL2U086HVKo0+8Bty90EtnrbwBHA1ZP7Psi
 uIu+pMXg4XzR1XZpARdpCm8XkQi56jlu6uC4M0XJei7G0I5P9ucBVWHyIh2TtcUHFKkw
 i8TPm2VD40sEt+8b9lCYkavuHDU/x/gHGWDdypkP65F+NkP29O7e6OGJnO/2RKBeMQP9
 IFdJPzXo0BhEvBYkZudzNFXi4HBQVk6tj3OFWLPUItUfM1vrtWMLZ0+agIf6FB7nG27X
 vfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NZKYMOZIKxtwI9C5Y2DsLl9mvShg/E7HjBCtUKagoFs=;
 b=QduYdMsZDzxYvIotEvH70rOmN5LWmL8GNnuBu3vROsBFZc211eEQbHZRg5r96QLx9N
 0PXFiG++so9/I82SxhxLAVy0mByx2sk0JMvWxnXnPfjQQarfW4I4iD5Mlocg2TrLgLLX
 pwOSNUrN0Z1HPWBfvJea9ufQOmI86E+vUI16oE+nSv7Yns4Z33Z5bSqvJuEKNbBvywqS
 vbOAVYZgaf9E6y1rsNuERME9pdo/qapumMPrTkc3kViw6pAxqEpMU1Bt0basRm7vRe82
 74V55Va6x/7ZQEesa2iBJfLgS4q4qMnfpC2JV769lwB32rW1UOo1/8/BIDfaetgLew3I
 ahZw==
X-Gm-Message-State: AFqh2kpwlDDbQZ2UjRuFpie1ZDxqQ5+YjgS7wfg+m+ieAJF2g6Uw02LA
 CROMWQqE3bVa+HPMmmZqlEnvGQ==
X-Google-Smtp-Source: AMrXdXsdaEtj4y1LKgPUfPuRDzm6FjbtRSzDQGmYrSdV99fosJd2YkpIi0ZnhHBqHX/WJacriLb3ew==
X-Received: by 2002:a2e:8652:0:b0:279:bd34:dcd7 with SMTP id
 i18-20020a2e8652000000b00279bd34dcd7mr1628383ljj.48.1671710669874; 
 Thu, 22 Dec 2022 04:04:29 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a2eb622000000b00279e93c9c25sm30608ljn.29.2022.12.22.04.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 04:04:29 -0800 (PST)
Message-ID: <c675a104-7ae6-59e0-f73a-aae4ef0eb05c@linaro.org>
Date: Thu, 22 Dec 2022 13:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] dt-bindings: dsp: mediatek: Add mt8188 dsp
 compatible
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
 Chunxu Li <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>,
 YC Hung <yc.hung@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
 <20221222072150.10627-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222072150.10627-2-tinghan.shen@mediatek.com>
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22/12/2022 08:21, Tinghan Shen wrote:
> Add support of the single-core HiFi5 audio DSP on MediaTek MT8188 SoC
> for pre- and post- audio processing.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

