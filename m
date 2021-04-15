Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1736139E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 22:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB0B1676;
	Thu, 15 Apr 2021 22:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB0B1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618519082;
	bh=uixgFwiqZUWfgXWb+trNAhDzhrdY3OGZsWLhnX0zzD0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUwLGitkNrff+sWPmuedipeGRFrKxiYIXJPaiiDcyKtXPxh5bpgs9sb9ogLlrYJn6
	 9SQlmczYFg590L5PoBNrBveTfO1rWZdh1sOwBSkK+pTqwbZUEuqh1OSL1b8meC2gk/
	 ZHoLMy8RU+aJXz8Bano8TxTTiuk74X4idPmysPXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E22F8022D;
	Thu, 15 Apr 2021 22:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE5FDF8022B; Thu, 15 Apr 2021 22:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD339F800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 22:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD339F800ED
Received: by mail-ot1-f44.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so17905109oti.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 13:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KBqkXVNW6CoLFV8AmAx2h6U2I9QrN9OCJEmOA2YWE58=;
 b=t6xBnPWvEjQvYoZXjcm/2/foXFKnPZsplIrhD06V2zTYar9YxexbdQJFqTW8OW38Zx
 A7r5lzdDygw6evuFUDNntOEOIRSs+baOjWfh2PP9EjDt3QeXxJ+aWZM7pCMjriU5OY5G
 QkAZwdHXnUqvnepJnbAWLnh8mSAjr1iSvhJLcpBceiEz5BG5cT/ERZbUsi4eORekPJ8e
 USF6nIGW/ANrXjjB04xBahHqv85C+/ArcxHV4W2Hf6taNhRU99PTZHMHWJIVe708AWHN
 XtNp6rVTDrIKMRScB1K7fetFqbEXWmmEESdFY6Swn/GufF0RmFH32P22iU7zjqdvkfb5
 XSNw==
X-Gm-Message-State: AOAM533/md1WhD0e41ALoA4ubHxSSvlfENhwlIVnyzIWBOtLypc/J0QW
 Nwjdx+pVCBFfmofSSiPwRw==
X-Google-Smtp-Source: ABdhPJzGRkx0I4NexqDCsyAQVdMKCnbMFjeh4brrvgu53QoNLi1Wn7PvSBRXYW9pkDQM95za1ZX0Bw==
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr819824otl.307.1618518977819; 
 Thu, 15 Apr 2021 13:36:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m133sm853920oia.22.2021.04.15.13.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 13:36:16 -0700 (PDT)
Received: (nullmailer pid 1839871 invoked by uid 1000);
 Thu, 15 Apr 2021 20:36:15 -0000
Date: Thu, 15 Apr 2021 15:36:15 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'dais' is a required property
Message-ID: <20210415203615.GA1839818@robh.at.kernel.org>
References: <20210412100638.3349-1-thunder.leizhen@huawei.com>
 <20210412100638.3349-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412100638.3349-2-thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 12 Apr 2021 18:06:37 +0800, Zhen Lei wrote:
> When I do dt_binding_check, below warning is reported:
> Documentation/devicetree/bindings/sound/renesas,rsnd.example.dt.yaml: \
> sound@ec500000: 'dais' is a required property
> 
> I looked at all the dts files in the "arch/arm64/boot/dts/renesas/"
> directory. However, the dts node of this driver does not reference any
> property in file audio-graph.yaml. This can be proved to be true, because
> after I deleted "$ref: audio-graph.yaml#", the old 'dais' warnings are
> cleared, and no new warning are generated.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
