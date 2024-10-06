Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51956992118
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 22:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C932822;
	Sun,  6 Oct 2024 22:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C932822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728246282;
	bh=9/IyMAHv2eIUwA3++BDoFfJTjz9glj1kN3V5KZf62zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qmQKJCrHsqUMCHPijUEnc0afvbEGHy0oMo44tnQxuCJRwBv/oqj+5fvanW+3W2BbK
	 YxG2fyugPyGDUHBC75H8TBDphfsfYUV+lz2i8blaFNlPy/qC2vm2VLeXuD3rqZIizj
	 LpZRoGEr7S01TfoTHPhZN1ooyaSFPL8QQ50amjmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FD09F805B4; Sun,  6 Oct 2024 22:24:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8325F805B0;
	Sun,  6 Oct 2024 22:24:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F3DEF80528; Sun,  6 Oct 2024 22:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF6EFF8001E
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 22:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF6EFF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nFfBY8/Z
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-539908f238fso4023756e87.2
        for <alsa-devel@alsa-project.org>;
 Sun, 06 Oct 2024 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246232; x=1728851032;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjmOkhGoHww5SsWhWZcZeAeLgnv0SYVUTlVXfaGN1Ts=;
        b=nFfBY8/ZO0ZAubq90IpKp964lSy5w9DtIszBPf29FfNf2KRcX5bEbPlsVw8GeMqQ2n
         lw7uSv0EbPMWK5mPFk3Z2HMXMJkFw+BERIS4j+IXWO/8MuKGfDIQv6GjUmG3VWgiUGew
         M2kSW1s/qRuw4lU9mj1NeBejAxkY+hnAKmbt6zTokNxqr3cOjPT/6FFhignnHfvK714S
         3v0+n2O5x9USQ6bpALwoZQi93uMCGB0BymP/LLXS898mFSpe06VB+ZxBGsKkoVK6WaWP
         3oBdmZ5uWcX2VltnCqY8vMmj0zcDVj0lbZDGVLqWuMfqEdAOK99daKKBJ2fTtA4+sb9+
         6sLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246232; x=1728851032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjmOkhGoHww5SsWhWZcZeAeLgnv0SYVUTlVXfaGN1Ts=;
        b=iQdMFtaUPcgdM9ksLEey5IjQ1al9gXJ1K0yF8ghxpYkuHuTm+WlXVaX+zrMw2aTvo7
         LMNARYKanxcPJq8bq25wT9yVMNNZ/1Wtdviucc7NlF3ChFsn6EhWK4K/kuBK0Qx6G9PE
         TST7Qw3HtVjiX40T2BMb3rnOjODxWbVKECcC89QItmcPorkYmhFZksW7RcXvOoalg3a9
         JIGKxqBdrf73XPkBJ3CxWlG3cQMfdo/ipjugg+qfUY6eViRns0sqdyImDPbC7BJkSDaA
         8Sr/evNtpMk78uJB20SFwUicov8kRmb/Jgy2Wto2+HwsgLz58t5nNAr/PzIRksbUvthc
         HJJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+bitN2lFIR//HemjVbEKu5f1cddaCyOpFMfrc90O0W6zl5dBqUjMGNnSf4sQSXxjm9NfGapL74I/k@alsa-project.org
X-Gm-Message-State: AOJu0YyPOQH1SEzLcNb3BkiL3qGfoSGdUjOGx12eSduaEwtBX1IsqbXy
	x5JbF5Dxmq6AbLLyHn3kcYYgo7qWQwqxPxyrxa97VM1aWSQOpTWF1WFXrDJze0o=
X-Google-Smtp-Source: 
 AGHT+IE9Ou+NDUiMJlp5CAdop1NdXKTU8QhE3wA1kzmQkrSFmqoSvuA4HniJwQ6rP+n6zCcA1stj9w==
X-Received: by 2002:a05:6512:398b:b0:536:a695:9429 with SMTP id
 2adb3069b0e04-539ab8625a4mr4460950e87.10.1728246231828;
        Sun, 06 Oct 2024 13:23:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d0c8sm602410e87.130.2024.10.06.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:23:51 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: gregkh@linuxfoundation.org, broonie@kernel.org, lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com,
	rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 stable@vger.kernel.org,
	alsa-devel@alsa-project.org, chenyuan0y@gmail.com, zzjas98@gmail.com
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <r6bumoyhuu53kz57tqlcscitpyi67tb7422d2kffifzpqyphfz@agniiovymvdw>
References: <2024100358-crewmate-headwear-164e@gregkh>
 <20241003152739.9650-1-zichenxie0106@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003152739.9650-1-zichenxie0106@gmail.com>
Message-ID-Hash: H63EA3V2A2ALEVWSVCKUKME3GDGSUXCA
X-Message-ID-Hash: H63EA3V2A2ALEVWSVCKUKME3GDGSUXCA
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H63EA3V2A2ALEVWSVCKUKME3GDGSUXCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 03, 2024 at 10:27:39AM GMT, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
> Add a NULL check for the returned pointer.
> 
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org

I think Fixes / Cc / Signed-off-by is more logical.

> ---
>  sound/soc/qcom/lpass-cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

This is version two of your patch (even though the patch contents didn't
change). Please tag your patches accordingly, provide a changelog and
don't send next iteration as a reply to the existing thread (it might
get lost or mishandled). Please send a proper v3 of your patch.

-- 
With best wishes
Dmitry
