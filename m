Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BD97C9D3
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6739F85D;
	Thu, 19 Sep 2024 15:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6739F85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751625;
	bh=QralsGpTk/VE7c1/yICJm16dg/6F7TBywR1ptd4plqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kSt2fNiLVMQp7q8P8tkq3MHpQPO1uAa7I69KMyDvbnZIPdfb1lltMmoLDPRC/GQfG
	 2Cx81IYJQr4QMYRAkMWRs2Md9+tvshdVdRQdzZ65PlTsfOeiwwA2XHZfjUNjAjNFOM
	 TPaqArcRXXdjCOzBBN4TeC8kEtUggu8442LrUmCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B010BF805FF; Thu, 19 Sep 2024 15:12:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F80F805FC;
	Thu, 19 Sep 2024 15:12:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CC5EF8020D; Sun, 15 Sep 2024 09:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EA6AF8010B
	for <alsa-devel@alsa-project.org>; Sun, 15 Sep 2024 09:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA6AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HugPROTg
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso8580165a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 15 Sep 2024 00:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726386921; x=1726991721;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QralsGpTk/VE7c1/yICJm16dg/6F7TBywR1ptd4plqU=;
        b=HugPROTgJyPQtG4cVtkMpJLZD6K2W+Mhy1a8raEbBteJR2m16+PeUmd7/dumfK/1kx
         g8uTXqRckWRzqgEb15T0tigQpV9iSy8xXPQEHlzEg6wijvdONpQJzxHJ2M+6G5rCwsd+
         WQkzgjx2A2RioYyteLnyUPS4Hlv3+5tkMuA1lBpZkKl6PTp6qAWaO0A6RMjR09fBV6/H
         5VqGaJyWxDkHeZMfjA9Gy2JheCYWSWiOFYwbjYT1dD+OSPPUIJ99F1YBC74TZeRfvK4o
         XIW+4JSyYRB+GbSzv8pyGi3cf+RPFfAUnLLviD6oQLPNcLO1pmS8KfK11cix0tFaiZ4k
         rF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726386921; x=1726991721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QralsGpTk/VE7c1/yICJm16dg/6F7TBywR1ptd4plqU=;
        b=AdB8vkcgkYqy4g2hqUp/2W6kxD/SBSY3s0LxvolNmvjip6ptnxVnWj9JEggby/75kt
         1dDQ7YAeNrSGs2H56SulPQEI/uKGhh7ZAs9z7BzYHoLYkDuhWX/FusallIh1u0IRN3I6
         wuLHAnNZexgZulO7dk7EOLzfVHgxG8OCUnGzYNfE1EJP5eu+Yy8/0ElKgRugOcGbz3iL
         LiCF/AwTem/8hiBVJMi/rSJURG3cLQ1nao2IXEL+B92IZOfeX8Q2SAAoT4dqE52gx0rp
         NNND9c66Jqpi3bD+IpDciy66hPS5WGv3jryCOXj4hf/lRvNnh9Qs3tgNqIMleb81HFkP
         jeqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1JWcJXbrps1H5Z3mpuMYyLSIf+kNguS1F+qBA+t3OdSQGSzUkDlrKpYbkf6aCiygoo9UW7s7llEzB@alsa-project.org
X-Gm-Message-State: AOJu0YyP5mPepG96uXOkPC1TC3UFzQFcP+fmIInUL3OK+T8YDt5HmU+D
	6ik3liMz76IPP5nDhGlPONfsm5Hx4rvi3CMBGX+ABEMn+LCklDAd
X-Google-Smtp-Source: 
 AGHT+IGPQI+t4lYTwiuu4hyJoLvLouchr9DqQvDvbSEOgzDQJG8ZpceHMqTZzT7/DgMVYuW1CsOVDg==
X-Received: by 2002:a17:906:259a:b0:a90:126f:bcbf with SMTP id
 a640c23a62f3a-a90126fd1c5mr1196022766b.10.1726386920479;
        Sun, 15 Sep 2024 00:55:20 -0700 (PDT)
Received: from foxbook (bin105.neoplus.adsl.tpnet.pl. [83.28.129.105])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4375sm166709266b.73.2024.09.15.00.55.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 15 Sep 2024 00:55:20 -0700 (PDT)
Date: Sun, 15 Sep 2024 09:55:14 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <mathias.nyman@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
 <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
 <broonie@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
 <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
 <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <mathias.nyman@intel.com>, <perex@perex.cz>,
 <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait
 for completion
Message-ID: <20240915095514.6b01fefb@foxbook>
In-Reply-To: <a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
References: <20240913103237.2f5dc796@foxbook>
	<a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: michal.pecio@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZBMZIZ2AKFNFHLA7754R2ELSVRSXZLI2
X-Message-ID-Hash: ZBMZIZ2AKFNFHLA7754R2ELSVRSXZLI2
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:12:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBMZIZ2AKFNFHLA7754R2ELSVRSXZLI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

> Maybe the last sentence is not needed.=C2=A0 When we are using the
> secondary interrupters, at least in the offload use case that I've
> verified with, the XHCI is completely unaware of what TDs have been
> queued, etc...=C2=A0 So technically, even if we did call the default
> handler (ie xhci_handle_cmd_stop_ep), most of the routines to
> invalidate TDs are going to be no-ops.

Yes, the cancellation machinery will return immediately if there are
no TDs queued by xhci_hcd itself.

But xhci_handle_cmd_stop_ep() does a few more things for you - it
checks if the command has actually succeeded, clears any halt condition
which may be preventing stopping the endpoint, and it sometimes retries
the command (only on "bad" chips, AFAIK).

This new code does none of the above, so in the general case it can't
even guarantee that the endpoint is stopped when it returns zero. This
should ideally be documented in some way, or fixed, before somebody is
tempted to call it with unrealistically high expectations ;)

As far as I see, it only works for you because isochronous never halts
and Qualcomm HW is (hopefully) free of those stop-after-restart bugs.
There will be problems if the SB tries to use any other endpoint type.

Regards,
Michal
