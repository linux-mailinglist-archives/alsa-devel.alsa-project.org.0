Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14588212C7A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F5616D9;
	Thu,  2 Jul 2020 20:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F5616D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593715463;
	bh=tbX9gnwNkjOzk/98d8BFqWlU3Yk39GHs2cPsD7jbrXM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOQPzRBIRVa8Ov/FTo8gbYC3i57UdY4gIKcVVGGhow6u5rUT7+PKqV6MDvsWnBO8C
	 pgElVlwAjdlEUdmI6p4gIL33d6oSga9hkw8oYzdNuSOzII4U9hebWs94gVqkRfqplW
	 38hpIgyD5zpDhhBuTXPBOSmeSmFAM7OxO31j9ELo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A38C3F800ED;
	Thu,  2 Jul 2020 20:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA6D0F8022D; Thu,  2 Jul 2020 20:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 002F0F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 002F0F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JsFN61eC"
Received: by mail-pj1-x1041.google.com with SMTP id l6so9715106pjq.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tbX9gnwNkjOzk/98d8BFqWlU3Yk39GHs2cPsD7jbrXM=;
 b=JsFN61eCI+fVmsDGKjx3xNcUB9PTWSDRaIF3nEA7cb13QIkZmIqYDssIQvKF2ony9w
 Bc/I8YIpo/DNOqg01APimdwuBKsysstKm3eNWmiCC3L/WkvKtEItiHdW/NHiV9JLIy2p
 HHTSap5HMi/MV+wih89HXnkggCyyyijeIt1gDdczQXVBEUvk5m8LIl6T18qw1O504bYW
 FNnUrxwdVjGvbXXZTLejVs98ZvwYFj8GJ/b87XNnMV+MkQ6DuZtq5a6uUyTj4NWjs7G1
 JUrHAvMaz6Hoel+1vWArGEnqsSgZTzcuLoyH6nNKRM2GUj/N382/u5XK3EnAfr8XtJJE
 FMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tbX9gnwNkjOzk/98d8BFqWlU3Yk39GHs2cPsD7jbrXM=;
 b=rxX+K/KkLg8PYlpBeZtNbMHI2SwQ7ep8jbjBpqsu6N4KcPbhzW4IG7K5t03T8GBJBx
 ZcTW/HR9XDbpI0wU0AfpqzXWgNdbdK+pnAN4HpplaHEKAuzK78yO6Hi2arB5FxmJB/kh
 2wtAetBhelzaZH+/rDDyuH4C7olNssX/YcmlLIV+onDo1PKODP8FBwoBMNhv3Fyd1OMi
 TY0Wc+hgKXjjmplOa5QDsSVtWMgTyXrJYK7fh4GHPJGU8Q717neMm/ofrV7NmF18yDtH
 bexTY/evnUgae5qi0JNUJn8Euuy7VB1cVpBl0ALKWjKaKcqc2HX4mv6Z2xCqgLPFAkyi
 grxQ==
X-Gm-Message-State: AOAM533s4qeU2IBG/C76rlA2Vtk9cwieT/lDAYRTH40vZ8u6R/namxcW
 BwHddXdZfcACvgQPjVmEBiw=
X-Google-Smtp-Source: ABdhPJzmKId/+K9zaOkh/BstpizWZM6xvVYuyR3syVZrxtWMXg/kTWp1q3xysYJLElQ8cgvSAK8/BA==
X-Received: by 2002:a17:90a:290e:: with SMTP id
 g14mr30210537pjd.85.1593715354041; 
 Thu, 02 Jul 2020 11:42:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y7sm8819228pjy.21.2020.07.02.11.42.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:42:33 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:42:26 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200702184226.GA23935@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

Hi Arnaud,

On Thu, Jul 02, 2020 at 04:22:31PM +0200, Arnaud Ferraris wrote:
> The current ASRC driver hardcodes the input and output clocks used for
> sample rate conversions. In order to allow greater flexibility and to
> cover more use cases, it would be preferable to select the clocks using
> device-tree properties.

We recent just merged a new change that auto-selecting internal
clocks based on sample rates as the first option -- ideal ratio
mode is the fallback mode now. Please refer to:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200702&id=d0250cf4f2abfbea64ed247230f08f5ae23979f0

Having a quick review at your changes, I think the DT part may
not be necessary as it's more likely a software configuration.
I personally like the new auto-selecting solution more.

> This series also fix register configuration and clock assignment so
> conversion can be conducted effectively in both directions with a good
> quality.

If there's any further change that you feel you can improve on
the top of mentioned change after rebasing, I'd like to review.

Thanks
Nic
