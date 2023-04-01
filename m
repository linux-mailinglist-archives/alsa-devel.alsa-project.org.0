Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A86D2EF2
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Apr 2023 09:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A201F2;
	Sat,  1 Apr 2023 09:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A201F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680335170;
	bh=n+xyd6u0/2X9kn+KLVToYuRMWQiPHTLQnjI3/q5ftKc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q1ZMDV+WlZ8RCNaNQFuGwGmFzZf8X29FJxOLXFtLzrG0X9nxZbzl+OrY2c/LAgiwS
	 jcRHzam7mIC7sVF3/d41S14Cz1+ZPKWTxyytPsHr78u04ZE5Hx6lpux3zfLiJGG39t
	 jU8Dd6LD4noVKxFfLLjHZ15+9EzDWiHto/18eqvM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD5CF8024E;
	Sat,  1 Apr 2023 09:45:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4535DF80272; Sat,  1 Apr 2023 09:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21A08F80114
	for <alsa-devel@alsa-project.org>; Sat,  1 Apr 2023 09:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A08F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R73qt/5v
Received: by mail-wr1-x436.google.com with SMTP id d17so24534961wrb.11
        for <alsa-devel@alsa-project.org>;
 Sat, 01 Apr 2023 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680335097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GMP16VMB4glK9LzdcppyZ5x2fK6P/IiC8D7Tagz9Gw4=;
        b=R73qt/5vuXaWlkWFmvgc/0MbyKc/f6JNFBRxUeIdSXUH3kDQukW5A2jhNRD+wNiwZ/
         RR9lE5h4rQxx4bnsbLJHE8b0i/64lsUWulc7qWpW2ruslQM/jisw3UJllElkeLob5Fea
         oO8Qan+nWB8PE9VlEJRYtZOGKPxMb4qDvGWHt+UAccOb2jYdv+AjBtKkzKgZgFpgrXJe
         wf7E1gAmUmAuly+aqi9PI7U4EM5jauSJ/taNB6ERlipxSBiEphRF/XLPoRdWtycEtWcZ
         320vuSihnzs/8BK+fKApHf5XrNp6K5PkozPwfrMljrmSQMKHB9PdxxN+wnjyTHtwd196
         HyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680335097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMP16VMB4glK9LzdcppyZ5x2fK6P/IiC8D7Tagz9Gw4=;
        b=QCnvw5qKiKniyHZKywlAdeLmR2EmR7GNfLq5WtxVAhMnG9XQSVSvA7nPexygFolMEc
         57uZkeVuvS94iQl0VwiU0Mknbqj4QmrfP2GbsGwmrwexeWqfGy2N/W8UkAJM0RC1MoNc
         JPUKarw8BszfJW9y+Y+66r2ypLJCeX3GF9qYakmfbAfIbKKWMZntiV38aUF/oQgyqbgm
         kDz0bw08E2r5TUz1y/4xR1nfFrHBx9OThzAdN//w7l/Lgy5ZXpBs0Hz1kFZMvDVgFjW9
         7hoLf3WE3gNTTqms25COwuBvXpNiiz1U/KZo2AOrKw5KgnQpyflzsOwTTkP2ae2hWSW9
         8tmw==
X-Gm-Message-State: AAQBX9cgZb9ipwx1XrFLpBn1WuKYHouLrSejhBHl8odJSGhYdwulOMQg
	hKSUURZVZt17wnlyyJw4N/s=
X-Google-Smtp-Source: 
 AKy350acOQtEh8fTtzW80EqU33oSMF6JJtEBpsRIbAoRveH0DN2B+ZZQmxtdxaNkho1Ampi/AExm+g==
X-Received: by 2002:adf:f8c3:0:b0:2d2:3dc8:767f with SMTP id
 f3-20020adff8c3000000b002d23dc8767fmr22287103wrq.29.1680335096758;
        Sat, 01 Apr 2023 00:44:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm4150355wru.65.2023.04.01.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 00:44:56 -0700 (PDT)
Date: Sat, 1 Apr 2023 10:44:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [bug report] ASoC: SOF: avoid a NULL dereference with
 unsupported widgets
Message-ID: <b3671cde-7f77-48aa-a4a2-db25e141ff45@kili.mountain>
References: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
 <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
Message-ID-Hash: D3CTWDZEE6GED7PAFF7YTBRU5VLEKEQD
X-Message-ID-Hash: D3CTWDZEE6GED7PAFF7YTBRU5VLEKEQD
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3CTWDZEE6GED7PAFF7YTBRU5VLEKEQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 31, 2023 at 10:14:11AM +0300, Péter Ujfalusi wrote:
> Hi Dan,
> 
> On 31/03/2023 09:58, Dan Carpenter wrote:
> > Hello Guennadi Liakhovetski,
> > 
> > This is a semi-automatic email about new static checker warnings.
> > 
> > The patch e3720f92e023: "ASoC: SOF: avoid a NULL dereference with 
> > unsupported widgets" from Mar 29, 2023, leads to the following Smatch 
> > complaint:
> > 
> > sound/soc/sof/ipc4-topology.c:2353 sof_ipc4_route_setup()
> > error: we previously assumed 'sink_fw_module' could be null (see line 2351)
> > 
> > sound/soc/sof/ipc4-topology.c:2353 sof_ipc4_route_setup()
> > error: we previously assumed 'src_fw_module' could be null (see line 2351)
> > 
> > sound/soc/sof/ipc4-topology.c
> >   2350	
> >   2351		if (!src_fw_module || !sink_fw_module) {
> >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > One of these is NULL.
> > 
> >   2352			/* The NULL module will print as "(efault)" */
> >   2353			dev_err(sdev->dev, "source %s or sink %s widget weren't set up properly\n",
> >   2354				src_fw_module->man4_module_entry.name,
> >   2355				sink_fw_module->man4_module_entry.name);
> >                                 ^^^^^^^^^^^^^^
> > Both are dereferenced.  The comment is very puzzling.
> 
> if src_fw_module is NULL then the print will be:
> source (efault) or sink sink.module.name widget weren't set up properly
> 
> Guennadi is relying on some black magic in the printk system to handle
> the printing instead of open coding.

I've done compiler related work and explored some weird aspect of the
C language and I am so fascinated by this.  I would have thought it
crashes before the function is called.  I cannot even imagine how black
magic like this would work.

Is there anyway I can test this?

regards,
dan carpenter
