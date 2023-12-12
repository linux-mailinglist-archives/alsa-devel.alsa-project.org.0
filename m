Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E0780F188
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6FFAE86;
	Tue, 12 Dec 2023 16:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6FFAE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702396481;
	bh=UfXfaRMLuP5CTaSDy3nPQhnSzF+o5p2547PxaLfWFtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JAZcV/ytJHiwQxjoGZX0WEQzGmX2zaT/SXrCyPQP65xvejD2xrrv9BZCVNXqhtGed
	 qqubSD5WQz9cmIBefowd7qKEDzhaMheqBV2e5R1Vx4/ZfoJ2RBe1SwQVw7Y2I2gdmd
	 N6Ty3SxeXynfGuIT6yQf2B73u0adR1UqnnCu3mB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0D78F805AC; Tue, 12 Dec 2023 16:52:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA538F8068C;
	Tue, 12 Dec 2023 16:52:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C816F8016A; Tue, 12 Dec 2023 15:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EB79F8001F
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 15:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB79F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a6WUwMls
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d307cf18fdso12732365ad.3
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702391585; x=1702996385;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgtrwCld4CcJzZn2fDspIh0QCBOkWG+UpKY4fFhtYqs=;
        b=a6WUwMlsknrXvYsifrstIbAZBTHHOUVWzDRkKj3ra3NWAl0Oy+txu63PlcXOoZyi00
         1fQYQH0BbhoZpY9pN9KO9kO32G+De7ju6n3jZJY89zvoL+UgVSQKQt8VqqMKiH6TjnAW
         BrMo/E611/anKOUlrkGdJ1u2LkS4K2EQdEdzdiQLCKx6VghW/1aqL0YyPmlGIykomqJ3
         yhn0vc2r13PsLFT9G+XlwsYMG+Bwf77SwMgfDSZbVGGz2QqnrXUKluwJ14qclkN2mPIo
         1q4p+scc2pKoEI3XqNa/OPhOM+3FTYCL+Ih8w3Vd7a3+4kZIe39jGT0V1w0TNy3wPy2e
         kUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391585; x=1702996385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgtrwCld4CcJzZn2fDspIh0QCBOkWG+UpKY4fFhtYqs=;
        b=k7Mq2Bz4j2d6ftu1mtskqOylf7bbKKM0198675uqSOSJZIuNLbgeOM4XFzmLAL6V5k
         XQr7iYR9GpClqaDqKRNV94kB+VqYzqQQlf6TTwbNiPe/JnZ7vizOrWsoqqGPMBhEt2Jb
         I4X6o3j/ABrdLpfKqHbbyzHD+BweoqTBq+Af17mHcnWNKOydxyjH4s2TP6oe4lImIvaZ
         xzg+fRI8dkd/caXNuGeW0KcQDeG3RL+X3Rb41/KP6CrguHYfs5lMXsKwUfN9ynQKTLaJ
         GhJpS9whEZA8g+vH92zu9JJ40kDermmAg0JwRwEa0rfZCyHJfUmtSaDASI70KqgGMKeT
         Jnng==
X-Gm-Message-State: AOJu0YwKCkULg69YpGocjHXWQPJvcOcAUKrawLmmAGzx2CfPQ69kmioD
	+P+5hIWWvTXPAJhss+T8cLo=
X-Google-Smtp-Source: 
 AGHT+IEIsWEtcl3wL28xc8lcH4vTgfH7wPqcFpwscBr1whjZyLhbBmOtDQfzVbXOl/StNV2Ux+dZZg==
X-Received: by 2002:a17:902:bc4c:b0:1d0:6ffd:cec3 with SMTP id
 t12-20020a170902bc4c00b001d06ffdcec3mr3345275plz.124.1702391584856;
        Tue, 12 Dec 2023 06:33:04 -0800 (PST)
Received: from Gentoo ([2409:8a6a:5426:70b1:a6fc:77ff:fe50:e63d])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a170902a71700b001d0c418174fsm2902272plq.117.2023.12.12.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:33:04 -0800 (PST)
Date: Tue, 12 Dec 2023 22:32:56 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
Message-ID: <ZXhvGEN28L5EqMx-@Gentoo>
References: <20231212095850.26482-1-lujianhua000@gmail.com>
 <c43c4303-ed59-49e7-940a-62df6ad1b575@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c43c4303-ed59-49e7-940a-62df6ad1b575@linaro.org>
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BXUNFKP7ETNPHA6COVXWR2CFX7P6GC7Q
X-Message-ID-Hash: BXUNFKP7ETNPHA6COVXWR2CFX7P6GC7Q
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:52:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXUNFKP7ETNPHA6COVXWR2CFX7P6GC7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 12, 2023 at 11:47:36AM +0000, Srinivas Kandagatla wrote:
> > +int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
> > +			   struct snd_pcm_hw_params *params)
> > +{
> 
> TBH, this should not be part of sdw.c file, its intended for more of 
> soundwire specific helpers, pl consider moving this to common.c for now.
> Because, Not all old qcom platforms have soundwire controllers.

Acked.
> 
> > +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);
> 
> slot mask is always set to 2 channels in this case, should you not check 
> the number of channels to determine the correct one?
> 
> 
> These magic number 0, 0x3, 8 seems to make the code unreadable, can you 
> do something like this:
> snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, 
> ARRAY_SIZE(tdm_slot_offset), slot_width);

Acked.
> 
> > +		}
> > +	}
> Finally  ./sound/soc/qcom/sdm845.c does have exactly same code, can you 
> consider removing this and make use of this new helper in that file too.

Acked.

Thanks for your reveiw very much, I will do it in patch v3.
