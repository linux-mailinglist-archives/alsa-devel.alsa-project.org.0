Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01167CA56
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 12:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16AA4828;
	Thu, 26 Jan 2023 12:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16AA4828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674734195;
	bh=RW/1a8sYhBwIrTM8yXUWUmwOiDpdnm5AcV0o58n5OW8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bkghTb/+A1iubUahKhLz3N+18JqZQL+TMrxognvo9vS6PrITeqekFA+zqGN/Agtmi
	 JsapgEvFYJDNluBiAOfSURiCN8M8G1LjWiI6yQmWjy1XMBo9zUOChL3Uf0wJdjdNG3
	 DvaAnUtD2j7s4QTtkq/38SRW/QP8pX8L24Wgawq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 341A3F802DF;
	Thu, 26 Jan 2023 12:55:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AA5F8027D; Thu, 26 Jan 2023 12:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F589F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 12:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F589F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pTbd3ZJC
Received: by mail-wr1-x436.google.com with SMTP id y1so1528456wru.2
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 03:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5yP0BywDAnuuMbf+32a07Q6Ygejqs/wXSQRU+sh7FeI=;
 b=pTbd3ZJCw9QkBCVFBLLz7s12GMYqKUxPMsNWFVb0xVjETIqqg8a1SYtG7M4T4xtcYS
 EX8QJFOwqFCbF4E0kcBu3fdLUhbzHs0lYk5o1fHs+2wGBXTGxCp2pdy0MSwr3bfpOCtt
 iwwNN6tBZMLMDlXKZCOoy3whFNnGfh7ZWa0iJirmFc/FIPjpnrWEDYvBvv+OuU+LEfuw
 UFIOhyHGt4JmN3eq8hs9GR66BgK6PTw7RPxqWg0sp2hQBLBJgBvuidoojbaupcegM6Ha
 SJiLu8o8nzc+t2IC3ay3yYkX9x5EE2oy9l0eZ9hFy2QnDtBG9skdx+/M0a2JuSZ4u3u6
 GAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yP0BywDAnuuMbf+32a07Q6Ygejqs/wXSQRU+sh7FeI=;
 b=bLP5JbYbN4P2xWxYEclcB1V755F1DqLhM44aC9gpgGZkPAb1Ndd7oLTWixqrRPSvwM
 ZnKOMBW0t0m5auUpNzAVI7VJtWYCzAkAHhQ3ULeZxBwKzDkwYMLJ8aNltLgAUCQ0HE8H
 5WoTxGRC5K82qnCt3BlCNaR+MsBd8SN3e2CF3L3sSDDtCaOejiQ+E0NZVtlqXZAeZjMk
 RapaRQkqGuA8LifW0ESFOP6Hiw3LEKPbHyNmQk6ICn1e6a3S2RiHEkZ42+MCI6sCbr+J
 nk5AT7IefAt4b3WbXdoHymQ5ygBlQqaWlv15KK4TYfpoXz/0tfNC8ebvSp/cUFsMsZN5
 PM6Q==
X-Gm-Message-State: AO0yUKXEwkkDWTKrhOPK+Gd6QwDAQBPzF5TwxxhnlzuLlAn1HQ8LSIo0
 t+d7Oc231PPNZhmCPwK0Tj0vjQ==
X-Google-Smtp-Source: AK7set9qt9nTQzZdQh3JcvKhICbeSSBvdsDbg5AZQS8AybL0RpuPHM+dTgnRZcLj2lVpBsg2yesVVA==
X-Received: by 2002:a5d:480b:0:b0:2bf:c748:b8bd with SMTP id
 l11-20020a5d480b000000b002bfc748b8bdmr1588634wrq.53.1674734126483; 
 Thu, 26 Jan 2023 03:55:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfaa84000000b002bfbf4c3f9fsm1149608wrc.17.2023.01.26.03.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 03:55:26 -0800 (PST)
Message-ID: <62207c21-38f2-eb37-ea1d-2f6eef2202ff@linaro.org>
Date: Thu, 26 Jan 2023 12:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 08/22] ASoC: dt-bindings: Add USB_RX port
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-9-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126031424.14582-9-quic_wcheng@quicinc.com>
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
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26/01/2023 04:14, Wesley Cheng wrote:
> Q6DSP supports handling of USB playback audio data if USB audio offloading
> is enabled.  Add a new definition for the USB_RX AFE port, which is
> referenced when the AFE port is started.

Subject prefix:
ASoC: dt-bindings: qcom,q6dsp-lpass-ports:

because you are not adding USB_RX port to all bindings in ASoC.

With subject fixes:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

