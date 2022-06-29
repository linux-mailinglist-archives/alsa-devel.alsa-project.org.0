Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594156057E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 18:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2096A1640;
	Wed, 29 Jun 2022 18:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2096A1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656519102;
	bh=Y6vcKO0FJLSdz7y0miaQlj7T96Sgm9oUtSQ8xHR9CFQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fob9b9YDkklUF7W55D5pv6ohl1M12sXmMs3F/NM5UB5y+QmHeWjhLbgpQ9jsLPHq8
	 N8DSZg2FkPqrHyXkNTRIVZ8z1QSElrl7zq2TboWuQxAulWlpTGe1gxXqNiRQ/QlAOt
	 ZBSu3ZM2qSFkSQmR4rf4j6HZcsZ3djayTMyAH1ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D744F80158;
	Wed, 29 Jun 2022 18:10:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F650F80245; Wed, 29 Jun 2022 18:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D0A6F80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 18:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0A6F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jCn0Y3/L"
Received: by mail-wm1-x331.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso10256868wma.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 09:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SEMFcIPDfBALSSCWbUM/48N5X3O5aKQwjbMRjI8nqUw=;
 b=jCn0Y3/LYiFWVk9GT55lSaUeOkkZJ69Uj+iVfbUpmQfd2qKZbv/IzWnpw4IteXg5xS
 Xa7b/2J2MrkmWcSNoTnnqgLUESW9p+LxpxViM6pxy5uZadAoNnUKKLMI3Ehe0ns0Cbrs
 Lsd1SsA8ENGTrMJz9mIIDzCoeGMGMIgIHJAyUqXvvpMosctwQ1pSES78VNU6RTvBSj8w
 1rt+Wun9iEtm2DpdaPyE8GCllbvWdp1aTxcfXCNaIXLF+M7qwq/A8Tld5fi8Kw8sfJNL
 ztj2o9t4JTGEpjgkbMgI/jkEeZ30CHUiXZxZXInVD1KAfSkqylLiljl5qtw29MjQqnhK
 0kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SEMFcIPDfBALSSCWbUM/48N5X3O5aKQwjbMRjI8nqUw=;
 b=DjuTduUyA8coCGMhvXrs2WZlNXC+bAi+nn6BCE38VILW8CgMDlhibUklyhy5GwXiW1
 F/oXw8oTipmEP+ePjcUF9XQWZnOR9MegOImovoLf/78ooqxenDsqg+pIdJaCyXS1X7+G
 JCfyXdCh5j9uQURLIuicDbXM/5y3nxPyZI8BmLrK4UvYRSYYtg8ifVrpUR68AJrkmwi6
 M6zsgrsPTPZkAaVRViDmCIxPGVT9zQX9hkmkyfHkTm8x+F/e+UkfsA7JjxUZymL2RpuS
 5/NOtziuJKiW+Hc4HmGn035v4iflHL9vUazk51s2dVGeKpEqP31CzkdCBQpdDJbgGyqk
 7mTA==
X-Gm-Message-State: AJIora9nguuxz369++CPyfR5k5KGDyVAQ2N10x+Mkhw3EdtdWYSLzKJ9
 Xy5xhxUQn/XpNaoeaJ63z8QyzQ==
X-Google-Smtp-Source: AGRyM1uXRsCmp5t0GXuVL8ntgGXkfKBR3b37W+44IEemEUaddIEU1bPSbYeX9UP2sc9o98WdRbT8HQ==
X-Received: by 2002:a05:600c:1c27:b0:3a0:5098:c8b6 with SMTP id
 j39-20020a05600c1c2700b003a05098c8b6mr4680548wms.69.1656519037113; 
 Wed, 29 Jun 2022 09:10:37 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 r20-20020a05600c35d400b003a02f957245sm3725912wmq.26.2022.06.29.09.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 09:10:36 -0700 (PDT)
Message-ID: <9c71f751-2f5e-4d1f-5f94-942cf7ad6a8a@linaro.org>
Date: Wed, 29 Jun 2022 17:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ASoC: codecs: wsa883x: add control, dapm widgets and
 map
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220629145831.77868-1-srinivas.kandagatla@linaro.org>
 <YrxpgF2B5W7fyYVy@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YrxpgF2B5W7fyYVy@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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



On 29/06/2022 16:02, Mark Brown wrote:
> On Wed, Jun 29, 2022 at 03:58:31PM +0100, Srinivas Kandagatla wrote:
> 
>> +static const char * const wsa_dev_mode_text[] = {
>> +	"speaker", "receiver", "ultrasound"
> 
> Idiomatically these would be capitalised ("Speaker" and so on).  Sorry,
> didn't notice on v1.  Otherwise this looks good.
Make sense, Will send v3.

--srini
