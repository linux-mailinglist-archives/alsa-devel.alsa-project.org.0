Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99871358EA3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 22:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23EDC166C;
	Thu,  8 Apr 2021 22:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23EDC166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617914630;
	bh=fUE5BlMW/ryze5XpTMOXxp0VQUjyQGu9M3OfUPDHc/k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBIfJDTZvejC/rq7BEai9f3RkXTkEMFoGiTRpOP5cnMVZrdlpAtB71gsgOVY6TN2p
	 54mq5xDjIGYmb6xMQkFQ9iarjLgnbAczUeLDS8YeRkykzJg6V22Hp4l0u3dABKYK09
	 dsju7Fl63ZISbvPGDAB3h8ZOLTztDJF6UhsBULN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B46CF80162;
	Thu,  8 Apr 2021 22:42:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90A6BF8020B; Thu,  8 Apr 2021 22:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6894F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 22:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6894F8012F
Received: by mail-ot1-f48.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so3598259otq.10
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 13:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ksMNUkynqwh36NE05zFBaJrSirKhcoFilHBF+Zu5wHo=;
 b=ISxUg/sOt8gUILw7wo7qdsqp34bg9+76IzLyHaP8CDTndLrt+L9h6BOIMp4PLun6t6
 XYfAAuufo9a41G33cKo3myGjP8Q6tATRJYeKbL8IM4XTGmwyUKuegI1Sm9IeHbJlhPGM
 1Nk+gZ8X7Gv4wDAkOOrv07Z2u4mPPjrKaqvLAaJtqrfv4KllHNQgpsXjTVZO/8znp18a
 Tjpe0vjq44cXtfzbqJ0dHOcslagY8hesgvmR8zzLqj9K5FjCYZTt+Uwa3j+80lmVshhZ
 Sd7JnIyGnaSfj2nsXRvIBmukSsDkvmiuKwcfu8xLvWxdJHtyTUlzxXsouVBNdSFdmEO/
 23Hw==
X-Gm-Message-State: AOAM532AM/fpj4RJOUc0RIntDr3tqgAZSUfLYxPVCzDnralQ6NJhZmx2
 3bpUNPy67faH1WmSfnqgYw==
X-Google-Smtp-Source: ABdhPJypfQrcSFzDkeShPblZvM8C4X4an3XFIiS3xHbUv9F//szZVrktAcA4t9YWKwCXT8r3/RIZZA==
X-Received: by 2002:a05:6830:2105:: with SMTP id
 i5mr9189763otc.215.1617914534437; 
 Thu, 08 Apr 2021 13:42:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j18sm103820oou.43.2021.04.08.13.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:42:13 -0700 (PDT)
Received: (nullmailer pid 1925503 invoked by uid 1000);
 Thu, 08 Apr 2021 20:42:12 -0000
Date: Thu, 8 Apr 2021 15:42:12 -0500
From: Rob Herring <robh@kernel.org>
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'ports' does not match any of the regexes
Message-ID: <20210408204212.GA1924190@robh.at.kernel.org>
References: <20210331091616.2306-1-thunder.leizhen@huawei.com>
 <20210331091616.2306-3-thunder.leizhen@huawei.com>
 <20210401202056.GA947212@robh.at.kernel.org>
 <a1aed23d-a9d2-5e05-b1f5-3b48ac8d17f1@huawei.com>
 <15a406ba-b288-c98c-46f1-36933c11fb11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15a406ba-b288-c98c-46f1-36933c11fb11@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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

On Thu, Apr 08, 2021 at 08:28:08PM +0800, Leizhen (ThunderTown) wrote:
> 
> 
> On 2021/4/7 10:04, Leizhen (ThunderTown) wrote:
> > 
> > 
> > On 2021/4/2 4:20, Rob Herring wrote:
> >> On Wed, Mar 31, 2021 at 05:16:16PM +0800, Zhen Lei wrote:
> >>> Currently, if there are more than two ports, or if there is only one port
> >>> but other properties(such as "#address-cells") is required, these ports
> >>> are placed under the "ports" node. So add the schema of property "ports".
> >>
> >> A given binding should just use 'ports' or 'port' depending on it's 
> >> need. Supporting both forms is needless complexity.
> 
> Hi Rob:
> I don't think of a good way to avoid "port" and "ports" to be used at the same time.
> Should I disable the use of "port"? Convert the two usages of "port" into "ports".
> But usually no one will use both of them in one dts file. And even if it's used at
> the same time, it's not a big mistake. So I decided not to test it.

I think the Renesas folks need to comment on this.

Rob
