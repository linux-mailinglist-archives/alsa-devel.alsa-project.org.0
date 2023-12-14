Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE928814250
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 08:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6EB844;
	Fri, 15 Dec 2023 08:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6EB844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702625121;
	bh=JggYM8FWdgCSc1DopFNKb3Yiz7a2sGMoFPvdfGQaHV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mM0keAWfjloBbihrtPP4zC5Gra4uuKJ5WMaZaLcaiq4NbOCdPB6QpJQzY8Tl7x4Zg
	 U5IVfKP7+4+nr0jYxs0Ad0+9tM2Xq/7ae79ljXovAotpaaoakrK9rQcxpWvJSu89DR
	 hx51ys9dqjWyQMr50AHbCCb5+h72vgbM2B4StP2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD393F8016A; Fri, 15 Dec 2023 08:24:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B90FEF80563;
	Fri, 15 Dec 2023 08:24:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 308C5F8016A; Thu, 14 Dec 2023 16:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDB94F8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 16:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB94F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=igan6bac
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5ca1b4809b5so2143525a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 07:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702569125; x=1703173925;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJYbFg0YusLQd7kau+7yl+2+5aq7Aytpc7bFv1yVVFU=;
        b=igan6bacQexx7nPThvCIUo/C6VlwiXWpGEuQK5AMn1/ck2QXu0scyT7jXlUhlstOyd
         pljIoEY8tNdpNLnhMMz29yJe7T9H34Z/sYR052UUb7u6k7yGjOp2V3rQLRrheCvgxJDg
         N0tnIuWXMmMIiKzDhEr8Px3kbcKMwZSyEExsHYINmAJ4Z/WokEaVHlaoB2hVbSSGirIc
         z4gxuS4xb6+yVB1rPBK3cLwNwgl9s98W00foCxMzub0swxOhbRUslxFmWEbXUqGSCEKx
         OH/WBnoGkBwSCwfn7MsEAJ0JKCaR6dxHtaEFeLSGkqezGI2yyLCqyxEavBV/sbOI/n+H
         Kulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569125; x=1703173925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJYbFg0YusLQd7kau+7yl+2+5aq7Aytpc7bFv1yVVFU=;
        b=RRcqJ+bNlyFPy9vLs7a6IuIhpCQqiM1N082DKJNNha0c0AU5uCZD5gIshSbQXA1KMX
         svVM0DyCwJTr/usutPOM7Ndt3PP8m/2eAjiZsclkWXg/32jwqC/pTkqmlDvb/tJjtqiX
         yS0QY1Wrxi3tx0u3fwnXkQljM0Vum8j0pn+bKfzWr1GMxdggxcJvJxfy+h4SxHrHQuO6
         uX3Zw1YsplapTS2e76xdbcVJjn2hMoGd7MsbbOyO4DCXl17MWMKf4z5Y8pPo2xE+8iD0
         sCaE8mrd9D9TzDPUpo7Gd6vPz/Q3hAn6jg9QaZhh1fU7iXj1oGKTYjrutAYyCD8IC2PY
         r1AA==
X-Gm-Message-State: AOJu0YzzKo1FpNEEWEoooEoR+Gon1YBZ8mL80MzP/Pa3ODuazBl8eR9J
	PMPd/HH66pDrptWgEjIINiA=
X-Google-Smtp-Source: 
 AGHT+IGLVtkXrMWtZzPCAej2kU9rW+T3NVD3Oj2+SwbxBlJMUum28HpOEywNDJUC+UADtGETmjTfLQ==
X-Received: by 2002:a17:90b:34a:b0:286:bd7a:9f7e with SMTP id
 fh10-20020a17090b034a00b00286bd7a9f7emr4439129pjb.29.1702569125260;
        Thu, 14 Dec 2023 07:52:05 -0800 (PST)
Received: from Gentoo ([117.189.237.103])
        by smtp.gmail.com with ESMTPSA id
 nd10-20020a17090b4cca00b0028af27eeaf1sm2784079pjb.36.2023.12.14.07.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:52:04 -0800 (PST)
Date: Thu, 14 Dec 2023 23:51:50 +0800
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
Message-ID: <ZXsklsO7nOqBFgzt@Gentoo>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
 <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XZWP3QJPET27WKOFHDDCQQ5PKKDQK4VN
X-Message-ID-Hash: XZWP3QJPET27WKOFHDDCQQ5PKKDQK4VN
X-Mailman-Approved-At: Fri, 15 Dec 2023 07:24:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZWP3QJPET27WKOFHDDCQQ5PKKDQK4VN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 14, 2023 at 11:11:06AM +0000, Mark Brown wrote:
> On Wed, Dec 13, 2023 at 08:35:53PM +0800, Jianhua Lu wrote:
> 
> > Add qcom TDM setup function to support TDM ports for qcom platform.
> 
> > +int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
> > +			   struct snd_pcm_hw_params *params)
> > +{
> 
> ...
> 
> > +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, slots, slot_width);
> > +		if (ret < 0) {
> 
> The expectation is that TDM is set up by the machine driver, not from
> hw_params - if the TDM setup can be changed from within hw_params then
> it's hard to see how it's going to interact well with other TDM users on
> the bus.  More usually hw_params() would be influenced by the setup done
> in set_tdm_slot().

Currently, qcom TDM setup need to read hw_params, if we want to move it
to machine driver, we must hardcode some params, but it will reduce reduce
readability.

