Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CED9177B8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 06:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89B39E65;
	Wed, 26 Jun 2024 06:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89B39E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719377878;
	bh=UH7Guk0ZViEtNHLe2Rm6vPoD2ZtesweQWurg2zPQG0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=reaSsJHyKRBkoj2nc7kzO+gTiJput4KrltttWBeku/TWTNkehsgh8hI1pcoWoHqV8
	 1DZsKjefLHrpJbTww25WUYrDzwUQsylbScEHKdgSfti6y8qY6WO//C6Bs9c1TTxDLy
	 rbt5krYysrCegNUYiBPNjLYO4ZN9aAC9y0eu26r8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93080F805F5; Wed, 26 Jun 2024 06:57:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76821F805B4;
	Wed, 26 Jun 2024 06:57:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 249FBF80423; Wed, 26 Jun 2024 06:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8776F8013D
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 06:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8776F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VjJii1M2
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso8125796e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 21:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377543; x=1719982343;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHtEVEj8JBWiO4kzFiIiv1rmTa0ntU60eMALIMv5KOs=;
        b=VjJii1M2Xd85V0TEFrlrBFBUidXUUwksNYOLeWkmUx45a2TinStbe5ucqBJ/smEW2l
         uZYO0qUNYflReSq2D4PJ3HWEv0IKQIJ+N/Ru79Ir96zKvsYGkFviMz9oirjBYl8ojSD+
         P9ywfkqDcp8tat28FhvAYfGQDQ+K+XUKkhkI2jLmyql8nL1ZBgCMTAoJhABRnO7TzIhw
         RBaQnranfAUdNxYO2jdxpvTCsgHd5XYZRf08Mz1W8FFIKzRifg/A49RrJJEnzqCCYu3h
         ruhWB2EhQKE63Qu7xMgh53v3NxdRiT8s3TvLRgh3JHWOow1YtNxzr8fFYsTJ9MTKYZr4
         aixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377543; x=1719982343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHtEVEj8JBWiO4kzFiIiv1rmTa0ntU60eMALIMv5KOs=;
        b=curwCjdwtua0oqLP3rc3BMeY1mfUgZfdQMCCUHREHsjhbVgejeXh5jxCWm+dOX3PoH
         RbHPLD6lwjmd4gTgMbYgXR0n3apKSx45Pm7YV3acONg5Uk/65gaPD79+r5rURSU3LODm
         DF4hkiiC0ZjTU9bvcPcg3Rd/6NwUOV4szNnHKKbqH0OLBcEVIaL4sFB3kkPI/oFU6ImP
         53oOViFPxPKzbzZQApOA2RoOQo9DoSftcjQztXtHdwioQlXcWRGBefZoBfXKjWuNUa6O
         OYkzUAe23VZjlRVvrtLOG5z3utIs/uGRk2eWBOS1YLMeGUEzBLst+kpsddHfE8ohh9qY
         UuAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx6fBm1oS2/HsY5p0INMQ+qr9ejCAG6ZiIxQh44JiGSqtev74th+jk90xztt2R37oTguOrbju7sPcSaqpEfP+2vgyBNpnb7GzndLU=
X-Gm-Message-State: AOJu0Yxkf4HpIrbfS1ICmAoHmCaCC5R4/32z+LcU1qZsW3ijCZupu/qI
	Q6F8EWE+LBqMfvOCCLDBQ/7w74OyO7DCsiSdSRRlWrFtEpmLs3ia+0YEsuXtJbg=
X-Google-Smtp-Source: 
 AGHT+IG2adZQtvwyPskuS7BzV1Hv7koYS1cTyuzBuEl/nHq624PyB5bLw8U2WyHXv+Od7Ngz+ahDJg==
X-Received: by 2002:ac2:5e79:0:b0:52c:8909:bd35 with SMTP id
 2adb3069b0e04-52ce182bc95mr6906334e87.10.1719377543219;
        Tue, 25 Jun 2024 21:52:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cf3361cc7sm324288e87.65.2024.06.25.21.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:52:22 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-macro: Use enum for handling
 codec version
Message-ID: <fyuovswhhso2ishvullvj473xnstqcpc2czqiqy5lfaafy2cix@kfifmubk7gy3>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
 <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: RNSJ5OJKIHLV6JQMSMHP4WMNNSNRDDHQ
X-Message-ID-Hash: RNSJ5OJKIHLV6JQMSMHP4WMNNSNRDDHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNSJ5OJKIHLV6JQMSMHP4WMNNSNRDDHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 25, 2024 at 06:57:36PM GMT, Krzysztof Kozlowski wrote:
> Replace 'int' with proper 'enum lpass_codec_version' in every place
> which handles the parsed codec version (not raw register values!) to be
> explicit about contents of the variable.  This makes code easier to read
> and compilers could check missing switch cases.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.c | 8 ++++----
>  sound/soc/codecs/lpass-macro-common.h | 4 ++--
>  sound/soc/codecs/lpass-rx-macro.c     | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
