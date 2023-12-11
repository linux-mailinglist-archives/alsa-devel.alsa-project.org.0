Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A850880F17F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461D7950;
	Tue, 12 Dec 2023 16:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461D7950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702396385;
	bh=TMA1dm91Qn0cLMKARor1ely87UTer/wdCmavljFfyUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lnmfgu6lWBaAtwa/GndSp5X1hYjFuLW45wHYMhV7AsHFEpJjhxKSavxVed6aWz6Uo
	 dF09qSFuEHOdbr/OlgVwk+Po5RVrPauzYXE3Juwf3Ovm6TPvHOOvFJZAM3kl8OCFP7
	 g+6zGs7OrfC7Cuxzk4d4dvh7JKRBCf4hGH0QRM9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 522F3F805E4; Tue, 12 Dec 2023 16:52:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 604E0F80587;
	Tue, 12 Dec 2023 16:52:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 679A5F80166; Mon, 11 Dec 2023 18:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1DF1F80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 18:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1DF1F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DtjiqXaO
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so3931603a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 09:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702315197; x=1702919997;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inka48OAdcaVBLEbG6N8fA5G+Zz4KQZYKI7zI+nD6dE=;
        b=DtjiqXaOelHkpq71DTv/avcseCVOi59ndLAA6Y/FDl4xNkehhCjf8V12g5zxrYtItn
         H8sU/liG7k5PnxgiM1mJ137ZS2Fvk6ozKQ7rVMw+zDkz1ssrZsFqrCYn1ywgqHf3W1f7
         TkSJnDCCCL9u8TsJwUZlulxKruS8zzXq6H0mL50EySO6JstVL/VOGjbECVhY3UM2NLmV
         kUZ5xPpeI7MB3u4w2g6L38WpoeerWnTT0M4bzGELaYLWCbPkCwD4owELSVUY2OVoeYcO
         h8CbYXRY3pgvHjFhJdGY6IsL0mEYyPtkZGt56ZIStcThI3ISW4atqEQKyye76myTlSsB
         YzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315197; x=1702919997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inka48OAdcaVBLEbG6N8fA5G+Zz4KQZYKI7zI+nD6dE=;
        b=O/ciFzXe1gm0XdtgcktwbK4+U7MvE7VOWxar8yFsaPj8OY9FkD0qWsije1bG4kQDj+
         8OSer8HyR/B42rTdw/ZeyIGSAYeVgbfhHzaDCq1NWXbPTE1OQ/K7BpDIMjev2RvpuDDC
         xY4xrSTVKbd+S2vs2CehoHLZN5ib9Iyf4FqM7zOEvLpl58iHwai1JsDjVJaZDwLTolXU
         hCKQ4/9gX+mTWJb2zWvl6U0dz4HLZjmEzGkwyamoOOjra9yilbIPrNozKDkYyOYP/wXU
         Kmw/UBL958y7Oda7D/aKZiTPD7evn3gFDQSRoxLu5zetSdvN3h+HxykrxCepfMoRFY6+
         qMqQ==
X-Gm-Message-State: AOJu0YxYjjqzRwSArS8UfezN8MG7vCt4KAfXyVVskC33/4xQKureHO4B
	grKy1XKWUPqDUGmcvCA+eZZ0HzFimPSCNg==
X-Google-Smtp-Source: 
 AGHT+IG7sPY4ZkHUESIL4EePiYoVswp6ZB+4ipr0qdjWdf1SE25hvrqy1SROE6Upfr4B3DwnutZv9w==
X-Received: by 2002:a05:6a20:8423:b0:190:93e:f224 with SMTP id
 c35-20020a056a20842300b00190093ef224mr6328208pzd.76.1702302018197;
        Mon, 11 Dec 2023 05:40:18 -0800 (PST)
Received: from Gentoo ([2409:8a6a:5426:70b1:a6fc:77ff:fe50:e63d])
        by smtp.gmail.com with ESMTPSA id
 n19-20020aa78a53000000b006ce61c9495bsm6517068pfa.10.2023.12.11.05.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 05:40:17 -0800 (PST)
Date: Mon, 11 Dec 2023 21:40:09 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC, PATCH 1/2] ASoC: qcom: sdw: Add TDM support
Message-ID: <ZXcROf5dIpKbBMhP@Gentoo>
References: <20231211095357.4629-1-lujianhua000@gmail.com>
 <01cbe664-f344-45ee-a049-1c27b78ac9a7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01cbe664-f344-45ee-a049-1c27b78ac9a7@sirena.org.uk>
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GKKU4FXNES3BRSGLXU6SNT4IUOXAD7A2
X-Message-ID-Hash: GKKU4FXNES3BRSGLXU6SNT4IUOXAD7A2
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:52:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKKU4FXNES3BRSGLXU6SNT4IUOXAD7A2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 11, 2023 at 01:20:25PM +0000, Mark Brown wrote:
> On Mon, Dec 11, 2023 at 05:53:56PM +0800, Jianhua Lu wrote:
> 
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_snd_tdm_hw_params);
> > +
> 
> Why is this exported?

Thanks for spotting it, I will drop it in patch v2.
> 
> > @@ -125,6 +186,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
> >  				*psruntime = sruntime;
> >  		}
> >  		break;
> > +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> > +		qcom_snd_tdm_hw_params(substream, params);
> > +		break;
> >  	}
> 
> The only caller is in the same file.


