Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91E1A70B0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 03:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211971693;
	Tue, 14 Apr 2020 03:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211971693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586829262;
	bh=3L8PsD4e8Nm1+Cris6pnoVJCRhJenzVFqG1nxz0Qapk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sl4gbmW8/MmsdITfxQyYAA8PDUGJP/eKbxVe3B3lPGBKT2teuRN1qZM9I9DLNUSkv
	 +8S/l9WUL32jhHZyIUR6nJNzxS78YMUiifoVdP9zezjJtc79xeaEMmnAVvKgyqQROZ
	 J8J1Cig3QSDcqEan76gHXRnFNmWebSgeWjUrLDKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 421C9F8013D;
	Tue, 14 Apr 2020 03:52:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A14C2F8013D; Tue, 14 Apr 2020 03:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 510BDF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 03:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510BDF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OCvhU4O/"
Received: by mail-pl1-x642.google.com with SMTP id n24so1354309plp.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 18:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ueS8P+6v2FrlXivoVjNe19uVCUfAZxgQePy2A4X+RsE=;
 b=OCvhU4O/qcMY2FRjZ40rJkFvcFiCnnlXdwpTxot5wBOLYRNgpnFCHbxz852a6MeIj4
 NPa5mtPY5kIIvICQIRdv37OLe4jCCFm8PShYINo9ATeH1KlDDfWsZ63+QG4jZNNEo+JT
 ZyYXrSwFwjTBYt3Q7xqkXtfvZ6bICTCH9ANVE52aI2sjgtoMB7gTeo1rGz6wLMQK2Pi3
 HPAAtEEsaclya5CZ9i66SK7RRcTQNe54wG7Z76wzS/QaxaFwFWDD4Am8L5ZsOUjDswix
 rdZ6h8419sEHgMfFI4g0w+/ucUvgIoU75+jPx9MwFrekVFL1Z78EFnshuf0yOivCZApK
 7YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ueS8P+6v2FrlXivoVjNe19uVCUfAZxgQePy2A4X+RsE=;
 b=BFABLXf8AAC+zm845y8jPkJkot4A0ez8ODw35c3TXF0aps/5lUfsKKYh6H0p37h4Ak
 C4GYEHmLf95WrXuk3DcBSCizdh1ZNn+t0OEl0aol84loBwkXva6VFTvY9lRTMjSjCBXh
 vtdsAnoQugij5lK6RLz/P36nVzpgSg3gxP7En+XZ5JrrEdA8WrYUaFJmqN46oP0mBc1Z
 ko+AOtoaweXhklbwu2P294mmbL3FkG7ieiJkmgZmAYus3WI0JzWPHUFaZCufayxck+YF
 3jN8NaC4KPCxSPhljnYLxMLG9WhRPUM2bwdle+fY/b4gJ2+peIlZJxIUCvlIRnROq/7o
 Yspg==
X-Gm-Message-State: AGi0PuYXxnmwGXimUnr8FIMFdAlHTGB+jeQiIQLnoSY6cM5R3N0HuQBl
 Dql33BiqYHUWXUNRzcJdqkE=
X-Google-Smtp-Source: APiQypLV5A3zPqygKILoFJrzU50eijbeEVBpOWKiwDq2bSqyS0pUFarFX0qGCERIK8ocAccEOj2a5A==
X-Received: by 2002:a17:90a:252f:: with SMTP id
 j44mr16076039pje.9.1586829149030; 
 Mon, 13 Apr 2020 18:52:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x12sm2242431pfq.209.2020.04.13.18.52.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 18:52:28 -0700 (PDT)
Date: Mon, 13 Apr 2020 18:52:37 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v7 4/7] ASoC: fsl_asrc: Support new property
 fsl,asrc-format
Message-ID: <20200414015235.GA10195@Asurada-Nvidia.nvidia.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <d10df72d2e9985fede7969b5da1f579627f5e821.1586747728.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d10df72d2e9985fede7969b5da1f579627f5e821.1586747728.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Tue, Apr 14, 2020 at 08:43:06AM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
