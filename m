Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF16905A94
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 20:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3FAC86F;
	Wed, 12 Jun 2024 20:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3FAC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718216251;
	bh=XOoDEVo4OZzwLhKRiU4JC4hHaduq+EtwyfIuPbwP1B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C5Jzm1HDOoqDNPDKpEc2bMW8g2IKq933oBFkL5v6MCUd4S1L0fdwWoDSypnudzQoA
	 bx427GufhJhIrICx3FabhnmMcx8GW6lySHyto/Nb02KJnsFUW5T1DoOf/YBpMvpTa6
	 hR384CxVv5FPrYbJnIRBP7fEI7/CyJyhO0I6jDI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43C4AF805B3; Wed, 12 Jun 2024 20:17:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A64F80496;
	Wed, 12 Jun 2024 20:17:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 380EAF8057A; Wed, 12 Jun 2024 20:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 760D3F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 20:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 760D3F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L9EtU+l7
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52bc27cfb14so307628e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216203; x=1718821003;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUlMhvz/JBG0hn+cnvEVI731dfNOlIAiHpYX40k8o80=;
        b=L9EtU+l7dUOt5TDEdyB4/f5M4XJ2qUkehvC4TNcuAPIKE/xVMIzanrvXsZBJcfTWVk
         bynQ9gH4P3OJd3nOiSuxTn0pJ41MY1bWZvNx/Ue1iMpteLz0/LsAD2sB4BJIltyrS+cO
         RwSxRa27j1EoihaeIIjhv9vkWCFyXgjU1w+SkruUl2cM1pe/AjijMHEGLXJTsq95y5BD
         NnzKHx29Axp2A952/uT31xT6fWHzG/W144jo7DSVHLOg2Tn6C5/Sq3M37SCSyph3bs5p
         fuOo3YaWIQr0aUeLLo5XEQPV5Kf63tgxr8xtKkG4D6ee2IoeeVPpsm45Up06fi6bFPHT
         j3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216203; x=1718821003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUlMhvz/JBG0hn+cnvEVI731dfNOlIAiHpYX40k8o80=;
        b=jFKar596Q1fUZFxUvlQ9ptWoIzimcioXVdI74PfH77HVcGuu12sK4tVowytcnBem4j
         2vPPRrq+izk20BZwaAixP4pzXNaCFdlfQz22D4OLDsy+18GNS7rVsxXwiynevTU8Pviy
         t0Ul99DkAFg/CpX+lCwvI48rX3MmZCOXyIDk1U9ptkWO1s8ktuxNvsto/XqId2E4h0Rq
         hJULGpxZCeZF6+Dha2WymWNY2ckTISliqdB0n4uZTG1qmsHrZX6IBIb9YHe7UDQDlDRO
         jgqaPFq+gtx/Drty/ivJNKkrCJ0JTA0ZzaBjnlMIsPq34IiYPF+tFOsxNB66AnIW+Hr9
         7bng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7MSonkRHbCf/SlYndH+8JrMfDaV1gnfFcnaBN9my6bWJr3UDBArgmwolRFcXWcG808IeQIRZSkBfX0uJrUkPVDO/P1yo8uI6WtL4=
X-Gm-Message-State: AOJu0Yx2gh7JQpwL6QS9YBDrGhx6R7nckD/CiB5eljIo4kLw8khaLmij
	GRF/+J238hrdvM7cjNVqnGeM+ogqZTcVmVC/6apu7sE+H+aobs86ol7h6EXpeqM=
X-Google-Smtp-Source: 
 AGHT+IFi6JIRt0lupvSgxsB5ZYGwl4QJ74CdnmzB6WDu0EVO/YwQmQY0fZ4yKdEvWvDG3PDsu/+Avw==
X-Received: by 2002:ac2:494b:0:b0:52c:868f:a28d with SMTP id
 2adb3069b0e04-52c9a4036d2mr1927485e87.50.1718216203024;
        Wed, 12 Jun 2024 11:16:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb41e1e57sm2635583e87.26.2024.06.12.11.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:16:42 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:16:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/3] ASoC: codec: lpass-rx-macro: prepare driver to
 accomdate new codec versions
Message-ID: <ltq4i765kg6onbcknqntk5uarberl5mblar74l74tnvhsc7sfl@5a3sulhvcce2>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-2-9f40611a1370@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-lpass-codec-v25-v1-2-9f40611a1370@linaro.org>
Message-ID-Hash: ISNYEU45P76UW27DIISKIVBLQMKQJSRS
X-Message-ID-Hash: ISNYEU45P76UW27DIISKIVBLQMKQJSRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISNYEU45P76UW27DIISKIVBLQMKQJSRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 12, 2024 at 05:57:22PM +0100, Srinivas Kandagatla wrote:
> LPASS Codec v2.5 has significant changes in the rx block register strides.
> This is a preparatory patch to do the required changes in the existing driver
> to be able to accomdate these changes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 361 ++++++++++++++++++++++----------------
>  1 file changed, 209 insertions(+), 152 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
