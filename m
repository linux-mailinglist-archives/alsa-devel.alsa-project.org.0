Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE9741931
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 22:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678507F1;
	Wed, 28 Jun 2023 22:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678507F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687982532;
	bh=xgGT1wo16qlz0rW8KeonyN65IMSLrEkO0mOooqUrcM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ihkgKmq6vPSbBj1ay80BGV81xkMiwvGtGzebiO0RQnhdROaaOw4dNCdXjTQNO/5Zz
	 Ml8xCFwTSytYZ7/FWiLyohjlwChWsm95WuLbibi5vOfxMtcPf8MhfoTYgDd8aExoi3
	 AdfrFBMYxH3yt6ZKFcmwGOaRepTjFuuAZzCDngM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA6BDF80124; Wed, 28 Jun 2023 22:01:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35204F80212;
	Wed, 28 Jun 2023 22:01:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6002CF80246; Wed, 28 Jun 2023 22:01:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 899C5F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 22:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 899C5F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qz9jHSQc
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-bfee66a5db6so135883276.0
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687982466; x=1690574466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pH8fcOy6rMWZ3uve7XV8TBdo5xEMK41yysafMwoH2IE=;
        b=qz9jHSQcQn2Eqv5Gcrj+63LutKi3Xyivczb45g2I/oid/NwcQYB2znuVTukvLXbnYh
         dQ1yCw8Nl/3jRnxBEBKJkON41/9l/WA/O5Z4STYAaBQ/HI6MCloeJnqwq/FYEmtwOt9j
         LqmsVf/132+dYgy+aDN8haLR3sHea+wzGg7ekrV4hr8JlpdLCIF9hvrbIuYX3l0xILNL
         ZwCUwEFvkqy12tPJhIpKFmTabXkNF0FEZN/m1qeW6R1ieMsmBWuOOCHxEIvEqiWET/dL
         WtAl1QYoLpy0eWsyqQIRbtUkAKjzJl/Qzr6uAb+o4Oft4N6JFgrNNltd3kSE5SCQZnvc
         i6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687982466; x=1690574466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH8fcOy6rMWZ3uve7XV8TBdo5xEMK41yysafMwoH2IE=;
        b=A8TANn/51EyGTWR+ItzcRI07Q8UeBrRRT+Bblrd5xrfOITOYnA02jYZM05jV8SkaM1
         J7sfXl6pzpFtVO0D1PGLZe486YpTl8RwEb/vCuwJjgGnFXMM6H68t2gPyl2T4eUw4Clj
         u/9WJR5v1zAFd1FCvE+vDRV9arQqPP+7AkWScJvnF7KbUx6ZSx5RUmxxBjiN08cVXkn9
         BxAo1fcI5B/gB8JyPqsBw7Qht3yN2HqVvrMDHoYJ4SSjHXshXUz46PDwfBJ2jK4y1Jxk
         ASPCdX4YV1BxP9Sa42i3zHKuAwHaxspUoR1SsoQgny8wXwjUCOlAJ8GiVkOD+XGOcRSj
         bHBA==
X-Gm-Message-State: AC+VfDwv2XMbd/z2iulF0bX1/f1rYc1mE7JB+hDMzywEqbyzCLWIB23f
	WpPLRu04ZvRyC3QxgchP4dCBAKWa0jaBG/n/mVk7TA==
X-Google-Smtp-Source: 
 ACHHUZ6rTGYn4z21ozH/ZLqZuWscx/1Ssm6RMV9/o+OjoTbuk1Ka/cUauz/o8y4vIJHKAGz4vpE/C0fYCOszLgRZI54=
X-Received: by 2002:a25:da96:0:b0:c1b:4078:b136 with SMTP id
 n144-20020a25da96000000b00c1b4078b136mr11126494ybf.63.1687982466408; Wed, 28
 Jun 2023 13:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
 <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
 <c377aefe-2678-4ba7-96b3-2186e8f3f1b4@sirena.org.uk>
 <fabef33c-a8c7-af61-80b4-91e55081c977@linaro.org>
 <c5bbdaa9-43fb-4ec3-af7d-b1629d2d88f7@sirena.org.uk>
In-Reply-To: <c5bbdaa9-43fb-4ec3-af7d-b1629d2d88f7@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Jun 2023 23:00:54 +0300
Message-ID: 
 <CAA8EJprRH6aFj17A-sJzzHJXG7vNWu-yznSh7oA3WBXRv19wvw@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org,
	andersson@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, johan+linaro@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HE3ZGQHZB24TBCBVET2MNCP6LH3XSGJX
X-Message-ID-Hash: HE3ZGQHZB24TBCBVET2MNCP6LH3XSGJX
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE3ZGQHZB24TBCBVET2MNCP6LH3XSGJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 28 Jun 2023 at 22:40, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 28, 2023 at 10:33:16PM +0300, Dmitry Baryshkov wrote:
> > On 28/06/2023 21:10, Mark Brown wrote:
>
> > > If the goal here is to put all the firmwares for a given board in a
> > > single place surely it would be better to factor this all out of the
> > > individual drivers so that they ask some helper for a directory to use
> > > for firmware?  Adding these device specific firmware node properties
> > > doesn't seem to follow.
>
> > This quickly becomes overcomplicated. Some platforms use different firmware
> > naming structure. Some firmware goes into a generic location and other files
> > go into device-specific location. So having a generic helper doesn't really
> > help.
>
> That sounds like a job for symlinks surely?

Excuse me, but I don't understand the goal for such symlinks. In my
opinion (and more importantly, in the opinion of qcom maintainers),
firmware-name does the necessary job. It provides enough flexibility
and doesn't require any additional dances around.



-- 
With best wishes
Dmitry
