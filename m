Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C614C012C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:23:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D9617F7;
	Tue, 22 Feb 2022 19:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D9617F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554215;
	bh=w2NZ5MJSnd7wcE/pj3nI1cLPgEQafc8i3WJPZx91KX4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAitPZxu2IMbbZAZw+oZlIyMz8XirwrkwcwwKxc34ZdC5R1ALkByMVccz3SMXHFPp
	 ZuuMW4ndgyR6dHoDgWLYG7UtqSXEgUH1T57iKocYOOMUxM1Qe/UwY1ER2k+ZFSdBiX
	 hw/CCABswpAx4xu/MwSXbdiJhFaaLKl2S9XdPRMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 792D1F80311;
	Tue, 22 Feb 2022 19:22:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A94FF80238; Tue, 22 Feb 2022 19:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5EA0F801EC
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EA0F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Yr9Z9Cou"
Received: by mail-wr1-x431.google.com with SMTP id d17so189694wrc.9
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Lm5xUR/DeoScu2Jz9y/NvEglJoydN1Dlz6DnerF6En8=;
 b=Yr9Z9CouG7VqoWDydXm+zhbtMlkL21HITJFGmTwDaPEgKUvKCLoha8r0A1rln5zOZn
 ionS4p/SU9TGBy6kIe+2Z50ucKF6FzTr0yriehY8GgIE3CMyvxqVp6QtNcweT3HJTVP7
 9zn63dQLX02VQud1Wxlp8NfflxCb7a3g05/geTnxASCZJ7BR5p2Y+ros3Lo5gX5u8P5O
 BAywmOnDn/N9jVi22FFJCYlYBfsUyIqDRk217CUBVCaYHtqOcIaMMO5Aodf4PsAxMYcb
 rHWt53MiULJrFWH0w5peIGcrPlycKHFIPaHhBvtywNEfUpNZvp5aAMmPi4elfJuL1Eug
 PptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lm5xUR/DeoScu2Jz9y/NvEglJoydN1Dlz6DnerF6En8=;
 b=eYWGOH/lJlbGwUWcWrZ7oe40oWmZbVk06jIgt/jzZEcURjHXTtJ+NrF6vGpbL0kNJn
 GrWIzuroZhJjtdjZgh1G+qsoJDVH83Q6tcVxd7aMcPhL9pn0to0L5GCrJoUsyCglEiji
 0hSSHWmVn8aMzeInrtkumRvbt2R3FaNXaVA1sydredUUR8YcVes14iSFCVLlWIU0/bQw
 COwSbXPBEsYEOm5RMeqoag0fUQKedl41Y8153fQqixI2AhJV/uuCvO3hAa936MQKvyhO
 P5Arxv3k8zUGc23O5m3YiYMhhgfuoXRP7W1/R0EPe5PWLTGXeazVxHTq/jw3KlDCmkm3
 /P2Q==
X-Gm-Message-State: AOAM531EyhLlrW0x/M4CdMzJsI4Ut34PKzsheDKNBbs6OmEGNSMuxzwL
 V2SDE/cZrorDsCbcbl8D3D0Ahg==
X-Google-Smtp-Source: ABdhPJyvMCX00Qpb+LFRV2vRfzwlImSa39Q4EaeongsPm28O8Tsy9ZtLaMMPxWuPyHnkrkNmWz2mtA==
X-Received: by 2002:a5d:6d0d:0:b0:1e8:7b6a:38e7 with SMTP id
 e13-20020a5d6d0d000000b001e87b6a38e7mr20802901wrq.625.1645554125317; 
 Tue, 22 Feb 2022 10:22:05 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 f10-20020a05600c154a00b0037bbbc15ca7sm4790779wmg.36.2022.02.22.10.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:22:04 -0800 (PST)
Message-ID: <246dce08-b8c7-4c96-9dd9-0c3246d007ed@linaro.org>
Date: Tue, 22 Feb 2022 18:22:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/16] ASoC: codecs: wcd934x: fix return value of
 wcd934x_rx_hph_mode_put
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
 <20220222115933.9114-10-srinivas.kandagatla@linaro.org>
 <YhUjW6B8LmoEWLRx@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YhUjW6B8LmoEWLRx@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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



On 22/02/2022 17:54, Mark Brown wrote:
> On Tue, Feb 22, 2022 at 11:59:26AM +0000, Srinivas Kandagatla wrote:
>> wcd934x_rx_hph_mode_put currently returns zero eventhough it changes the value.
>> Fix this, so that change notifications are sent correctly.
> 
>> -	return 0;
>> +	return 1;
> 
> This now has the opposite issue where it will unconditionally flag a
> change even if none occurred, that's less bad but still an issue.  It
> should check to see if the value written is different to that already
> set and report that.
Thanks for spotting this, Yes, that is another issue, Will fix those in 
next spin.

--srini
