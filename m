Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC47977E61
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:17:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526CA211A;
	Fri, 13 Sep 2024 13:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526CA211A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226255;
	bh=DmD/oFS9ztHwN6LHCihrKLQc89zTH//9v3d7Pudf0gE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NPgKeUJwcKcqfu5CRFUE01svToEISxXgAAwJ1YHzGc/ZIV5KP2wszFSoRmsnqnPd/
	 IK4rlr0dKzSVo1CZg8eMvaq2dH/Q4zk9BWX8Kz/wKP1Dqz2PH65d+5YXLsjeizwnWm
	 pWmx3PTVdxKM88Z+M/9YohiT62byNZdi+gNnMk8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C189EF805EB; Fri, 13 Sep 2024 13:13:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98C6DF80697;
	Fri, 13 Sep 2024 13:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 331F0F801F5; Fri, 13 Sep 2024 10:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E044F80074
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 10:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E044F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Dyl6Fpge
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cb57f8b41so8515505e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Sep 2024 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726216364; x=1726821164;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp9Y737ViR4EfOInl3nplGoJAcdlB+yuFRrQ0BSzktk=;
        b=Dyl6FpgeUAwyAXGzMbHgCusHTtyAMjQCNnrXgGQq/lw39biUTt6CRHegrUCQsb5aLv
         4NWab87NulHfJnNBO1IFxd8ZqtaRkZgrQ3u/AZEsFDWBSgATHFZVlXFqdwZfCbbqGjIf
         ligIk0J7QCdI9KIGPTGaP61RXrzZGpd95Q+5EJnlfgxwfWY2QaTzOGuQvG+zBJbCzdaN
         14ia306E3BsAm/WYTYke3IoYG5s2st6xvzLfuAut45xE2jM+SmkjYZgHVVZGhrlg14x+
         BmtHyD11peQ1OlEtYbxGS2Styz8I88Q6SglKZlbNlpBGHHEFvMzCWRaRs10ChnVBWXlx
         l2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726216364; x=1726821164;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp9Y737ViR4EfOInl3nplGoJAcdlB+yuFRrQ0BSzktk=;
        b=BnPlxC+t8BoSeNNf0M/nb6DFDQPRMPxBVoQips8lm7jnxD5AR8mWIzgSh90OS+21vf
         dzyfum3xKB386mqdK1KK+HJvGovWv7vX+kGZCwAYccnINZ8dnmqBF8looeAolBLoHo+8
         1oQE2umcUzhL1UmQai23FTOYYDPrrosPgrXd7ZDqNUjQhr19lLPCZnDqSaihLNn703fF
         1d9fal+TswXxvQn7SF8S+TBh55UvvuQ5BNPqUUzBhL6GFoRICM7RFruMteQ6Y37woQ2n
         dUs8UImdE0qTlnrNZqCXHLlWDvER4CmmekM9HOzm26PkVXknK6SRjuExEC33xfuwQ5E5
         F1TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi/AusE4JOk+/jeUbPDjKviNgIwyj59e42RuSx8DgqLabITOKj1p/YirigxUkvfgvOWbvpHzsVPPTa@alsa-project.org
X-Gm-Message-State: AOJu0YwpIyAq3GQW0D+zMVuG0mJT4PYfwNrAkEQf7MydGsyXtkPWLBnB
	4qGaS3QhsH5FsIygl6rusIBNtGUXDUL6k0Al39W3E5EQmuw5xZr8
X-Google-Smtp-Source: 
 AGHT+IE2Ku5Yqa7DnoqdH5xDY5dD9ozv14FV0pNO09UH2LmGbvbqmw1nTSHM8AvIojolJCXpaHwH8w==
X-Received: by 2002:a5d:5150:0:b0:374:bd48:fae8 with SMTP id
 ffacd0b85a97d-378d61f090fmr1570895f8f.25.1726216363746;
        Fri, 13 Sep 2024 01:32:43 -0700 (PDT)
Received: from foxbook (bio60.neoplus.adsl.tpnet.pl. [83.28.130.60])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf03ccsm846921566b.183.2024.09.13.01.32.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 13 Sep 2024 01:32:43 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:32:37 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: quic_wcheng@quicinc.com, mathias.nyman@linux.intel.com
Cc: Thinh.Nguyen@synopsys.com, alsa-devel@alsa-project.org,
 bgoswami@quicinc.com, broonie@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh@kernel.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait
 for completion
Message-ID: <20240913103237.2f5dc796@foxbook>
In-Reply-To: <20240912193935.1916426-2-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: michal.pecio@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FJBXVZCIGNPXF5ANWDFIB64VZXONWI77
X-Message-ID-Hash: FJBXVZCIGNPXF5ANWDFIB64VZXONWI77
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:13:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJBXVZCIGNPXF5ANWDFIB64VZXONWI77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
> xhci_queue_stop_endpoint().  This is useful for client drivers that are
> using the secondary interrupters, and need to stop/clean up the current
> session.  The stop endpoint command handler will also take care of
> cleaning up the ring.

I'm not entirely sure what you meant by "cleaning up the ring" (maybe a
comment would be in order?), but I see nothing being done here after the
command completes and FYI xhci-ring.c will not run the default handler if
the command is queued with a completion, like here.

At least that's the case for certain command types and there is probably
a story behind each of them. I know that xhci_stop_device() queues a
Stop EP with completion (and also a few without(?)). Maybe it's a bug...

Regards,
Michal
