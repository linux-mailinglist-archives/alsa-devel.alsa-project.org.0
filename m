Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E0814251
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 08:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A907844;
	Fri, 15 Dec 2023 08:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A907844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702625134;
	bh=4GkQfSSvwVnF2rLdHRJNHNQhFKK5mD0j6Qal0HlvyZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KPwy+RQkFTOs+EmjOTVy5QMpXnXACMHZKutxRM5vUJErZ0W0Zzm5IPVlg+JJBgrQa
	 P/nTEpS02R0xv59u3kdvLbFwTP+P+IUYtMCxH5LzdYJ2j7+U50k935l/PlydEmjZRY
	 S3tyGXKZOfwm06b9P4nU8t58z2ra7Q83ru+CGLBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 171E5F805AC; Fri, 15 Dec 2023 08:24:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C63F805C1;
	Fri, 15 Dec 2023 08:24:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB26F8016A; Thu, 14 Dec 2023 17:55:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F27F2F80124
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 17:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27F2F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J2m0gHgf
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28aeacb2dfdso1299712a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 08:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702572923; x=1703177723;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAfq8J8C5KAtCB8rcO3YT1HYm/yjjDzGk9Gqq0ijzyA=;
        b=J2m0gHgfUOH1xyDmwmDQje2HMlE2kAAAztULQ96Dfr0DuCdyb0KHn+v7v+LrcAvBjI
         NNFLFg1KVAGKO6ebGiJwp6zesa0gwLlxMP5Eudcb89WNt6ad8UaKvGTxQW+hxz8OjIqD
         Wad1dtk7TohzCmY4HKR/9tI1I5qd9ZNSo9m6D6ex/1FVHd29JsffOJAVxcVjk++ceksC
         evicJVj0IpMdUfSnRgVtOD2ZMV/2t3zSSr9IjuS6p1WjLx7pZWcLxNIyrc4fpdqqWyaZ
         wb+0ZPpiFu56W/R2zM4G21XQfn2+AnKHyNXsNTWn5naDCU1ReG5BPwffSTNO6ypSa4sg
         2AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572923; x=1703177723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAfq8J8C5KAtCB8rcO3YT1HYm/yjjDzGk9Gqq0ijzyA=;
        b=MNQgOKF69FPoLx9K9E/5emisOo2ZhgHAvsXKwZeww7qKmV/8e7w8rrq1Ctk7cbwlBO
         RoMD7PolrYCycL+QHXwq7PEuzggiK24NksE4kB0Z3xHdx877PyfqUAY8JxM9h1m99o9S
         /qPDSu8QusNmQ4WP30J2gjJ2LzT5sFBGK9dT6I8CVn7g4kHAY7yBojHXsorC623RZPy1
         DGW4v8fPHAUouTD0s4immxGp9fpfYzHuriTyd0/k4hL3tbRSneDkoMxG3dsAPPjyW7+o
         fi7R3SQkxsRKhJgrUSj9OqxhQhR/2+C7XYzBpfEQHTB+k4m+PDWEWQjb1DkDE2vnWp9+
         zOxg==
X-Gm-Message-State: AOJu0YznOsuXCIeGTlY7RTvzm1DEMomzC+ApVNK4a0Cgh6Cd4ysIEeoy
	01rWVQNRb8mH54iliyOfpdM=
X-Google-Smtp-Source: 
 AGHT+IF7MooXa4kxbQW00+77DwdpwEn1ms3nqj2gxkPcOMCX1QO8nz22V4Z7dd0pF5kA1bOSrP7nXw==
X-Received: by 2002:a17:90a:5797:b0:286:6cc1:5fde with SMTP id
 g23-20020a17090a579700b002866cc15fdemr4833396pji.97.1702572923165;
        Thu, 14 Dec 2023 08:55:23 -0800 (PST)
Received: from Gentoo ([117.189.237.103])
        by smtp.gmail.com with ESMTPSA id
 oe16-20020a17090b395000b0028b21d24ba6sm277441pjb.15.2023.12.14.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:55:22 -0800 (PST)
Date: Fri, 15 Dec 2023 00:55:08 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: Add qcom_snd_tdm_hw_params
 function
Message-ID: <ZXszbA5fVq2AMjEb@Gentoo>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
 <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
 <ZXsklsO7nOqBFgzt@Gentoo>
 <bee0ab28-6bd3-4904-8afc-44fe7ddacb79@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bee0ab28-6bd3-4904-8afc-44fe7ddacb79@sirena.org.uk>
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NSYIDH6QVNFQ4ZLKQPB56KMWASIPZMNJ
X-Message-ID-Hash: NSYIDH6QVNFQ4ZLKQPB56KMWASIPZMNJ
X-Mailman-Approved-At: Fri, 15 Dec 2023 07:24:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSYIDH6QVNFQ4ZLKQPB56KMWASIPZMNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 14, 2023 at 03:56:52PM +0000, Mark Brown wrote:
> On Thu, Dec 14, 2023 at 11:51:50PM +0800, Jianhua Lu wrote:
> > On Thu, Dec 14, 2023 at 11:11:06AM +0000, Mark Brown wrote:
> 
> > > The expectation is that TDM is set up by the machine driver, not from
> > > hw_params - if the TDM setup can be changed from within hw_params then
> > > it's hard to see how it's going to interact well with other TDM users on
> > > the bus.  More usually hw_params() would be influenced by the setup done
> > > in set_tdm_slot().
> 
> > Currently, qcom TDM setup need to read hw_params, if we want to move it
> > to machine driver, we must hardcode some params, but it will reduce reduce
> > readability.
> 
> What makes you say that TDM setup needs to read hw_params?

qcom_snd_tdm_hw_params function read PCM_FORMAT to set slot_width value, read
channels to set rx_mask value.


