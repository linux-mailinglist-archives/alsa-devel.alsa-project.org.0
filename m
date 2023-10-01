Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99F7B4997
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Oct 2023 22:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BB085D;
	Sun,  1 Oct 2023 22:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BB085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696192799;
	bh=WkWYfh6kxmSJvi5G3VAHMPzieb+ifx+NaucGBHobGME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VsTKuDadE1PG+6V88RwBS1aULn8pricL+dk95VXIP1GSk1HCBDdCiEnEzv9TZJj0O
	 CBbWs3xx2zQ3FwrPqIc33aXSVLur2syzRdx+0ytF5Hqwq/i/O0ebZquf+uHOnPZweZ
	 PJtAN0NN+OxIWfNYgxq8UXFVut+FO2XBTMUwl/fA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 737A5F80558; Sun,  1 Oct 2023 22:39:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36AE8F802E8;
	Sun,  1 Oct 2023 22:39:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04A89F802E8; Sun,  1 Oct 2023 22:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F488F802E8
	for <alsa-devel@alsa-project.org>; Sun,  1 Oct 2023 22:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F488F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=HTMriqpP
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-564b6276941so11658179a12.3
        for <alsa-devel@alsa-project.org>;
 Sun, 01 Oct 2023 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696192628; x=1696797428;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyBFMSqqwX8RPnuE4cKMfmvDwm/8Oa7DFI/6NjwESSg=;
        b=HTMriqpPUmQLgg/BEy9HlJtQQSYhcxd3pmM68RZjHJ7pyhgCUxmfg1IocUL75RNEXK
         zDV5BSe3W8xgnrnpJPTPol8Be5Ay6uuhQeNGLalAoLsPyXmXvey4M/5mmCTbquHCo4va
         wwsSgDXDMp+TohldoCGsFzDmIHMiGYYcNZGSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696192628; x=1696797428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyBFMSqqwX8RPnuE4cKMfmvDwm/8Oa7DFI/6NjwESSg=;
        b=L1VzLT7sRnRfdiLrsnSOaRA79NhbzwfwC9wOCIHYEBW49/NfCIIUmaIe6jg90OC4LP
         8AC96GWIEvujALFx2rl2c2JUXGVEvs8bvSX+ymqttd3bvR0L6BsnmqllDx4XdiAV9a70
         MC46SUz+cQwLFwgilgtsxcd0ZMlrJk7gTc9M6SR+t4kqrYZpQzvz1patSWAyIIdQgV3r
         vJeWHtdqoXWnpnhbyvmoylUwcwnhr/CVLiiVIw+a8yCsUvEHg3KfFYjg9rk+xiSlUKkr
         iCUa4wSCd5W/wIB/U0SD/tcL6VAzvMQrm9LHGPZhtODUsYSLGXDZ0V6fdwd3ox3XTCKU
         u3zg==
X-Gm-Message-State: AOJu0YyaTKrVXXYBTex4jfooQVf+B1vmC/HEHWWFaW+Z27A/T2diSM8E
	2F2Cu4OF2/zB99s95NQpK+O87ihbTC4Z+GqqzmM=
X-Google-Smtp-Source: 
 AGHT+IH0+lH3U3tlZJvdil7jRXzwK7T7NrFAv5uYLQCT/HAB93NjqNDt0CShB8VBCNkf5st0BzTA+w==
X-Received: by 2002:a05:6a20:8e0a:b0:133:bbe0:312f with SMTP id
 y10-20020a056a208e0a00b00133bbe0312fmr12736806pzj.50.1696192628223;
        Sun, 01 Oct 2023 13:37:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 y15-20020a17090322cf00b001c3e732b8dbsm20673804plg.168.2023.10.01.13.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:37:07 -0700 (PDT)
Date: Sun, 1 Oct 2023 13:37:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call
 to struct_size()
Message-ID: <202310011335.28B55A3BE@keescook>
References: <ZQSr15AYJpDpipg6@work>
 <169601489953.3012131.13922425518082792309.b4-ty@chromium.org>
 <ZRlJN9qVOv7CIu1N@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRlJN9qVOv7CIu1N@finisterre.sirena.org.uk>
Message-ID-Hash: 2IMRYA2PSBRNCUV74YW2RKJYPYATUFEL
X-Message-ID-Hash: 2IMRYA2PSBRNCUV74YW2RKJYPYATUFEL
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IMRYA2PSBRNCUV74YW2RKJYPYATUFEL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Oct 01, 2023 at 11:25:59AM +0100, Mark Brown wrote:
> On Fri, Sep 29, 2023 at 12:14:59PM -0700, Kees Cook wrote:
> > On Fri, 15 Sep 2023 13:09:11 -0600, Gustavo A. R. Silva wrote:
> 
> > > If, for any reason, the open-coded arithmetic causes a wraparound,
> > > the protection that `struct_size()` adds against potential integer
> > > overflows is defeated. Fix this by hardening call to `struct_size()`
> > > with `size_add()`.
> 
> > [1/1] ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
> >       https://git.kernel.org/kees/c/93d2858dd630
> 
> Why is this bypassing the ASoC tree?

Hi! Sorry, I can drop it if you want to take it? I tend to collect trivial
hardening changes with reviews that haven't been otherwise commented on
for at least 2 weeks.

-Kees

-- 
Kees Cook
