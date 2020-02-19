Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8D1651CA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:40:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5DEB169F;
	Wed, 19 Feb 2020 22:39:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5DEB169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582148420;
	bh=McV5z3AOKh1DYVx9b2DiQokkQOrYW4AqY96xfMyVuK0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhYMNLv2Ppb8oEW0K4C2lJAjf9meNxZtQLEI0paPR5JjsZhDEn7Zf8t+sMRu3vRdq
	 9MrRRjYXSn37gqJmZpzE9uT9/1eygdnxy2w8+mWDB4TMKQgvq2azqL3WajZJDzVt2g
	 cmTVQ3DuyCs/rqiE8H/7m4HYuXly6oEVX7qTSNNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE5BF80114;
	Wed, 19 Feb 2020 22:38:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC8DF80273; Wed, 19 Feb 2020 22:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7BDDF80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 22:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7BDDF80142
Received: by mail-oi1-f194.google.com with SMTP id c16so25392914oic.3
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 13:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E/e/t/Igu2jhBduZSv2AW4CMedwV0BIQbWhMahuclRw=;
 b=PmPN0Zh48vVnQhXjK8g8YZASHXwcvklZSHr4rYpy56U4cdCMx2AIGFZpyA8OUlDM9P
 LktKKHk0n/h5r5niKsmi6uh2EGOv/L0jm72jKTD7pU/FTOT9X8DixoCVLx57lk6p9Cws
 qBDvxDlTZ/dTTbg08VZEMWCoO5h/9AG5fjsDeV2/z71hmA5s3IgszhThlVVNTEHGzDXf
 m6mIUpp7YpKgnLVeiDV3aeGZta2RUbWyRRaUxDd7tGvzV6c+eb/07Y+4HNj9E7h4GiMQ
 z4rhd3V9ygkB1sIeODynedyeeRht78FUzkIS+CYLdew0bthiqvVogBdkz4PShTjY8FWU
 C3VQ==
X-Gm-Message-State: APjAAAWdQUjRI+6pVdxE9UQWNCsjft2wvzxWDmuv4djnV+6DdPIDaMe/
 57PKgkGLg9M85Z6QMTjgRA==
X-Google-Smtp-Source: APXvYqzXRQu0rzVdzwAvjm3VOQxfppCool33P+2clSM/5tqQ9a4Gt59ZBgfIOhaxSQcWmeEQr5REYA==
X-Received: by 2002:a54:4791:: with SMTP id o17mr5704299oic.70.1582148312171; 
 Wed, 19 Feb 2020 13:38:32 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w72sm378347oie.49.2020.02.19.13.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 13:38:31 -0800 (PST)
Received: (nullmailer pid 15386 invoked by uid 1000);
 Wed, 19 Feb 2020 21:38:30 -0000
Date: Wed, 19 Feb 2020 15:38:30 -0600
From: Rob Herring <robh@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Make RK3328 codec GPIO explicit
Message-ID: <20200219213830.GA15330@bogus>
References: <cover.1581376744.git.robin.murphy@arm.com>
 <5f7a399dea8a9dedef57f6f99f0f6ab1c1fdc56a.1581376744.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f7a399dea8a9dedef57f6f99f0f6ab1c1fdc56a.1581376744.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 pgwipeout@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Tue, 18 Feb 2020 21:31:58 +0000, Robin Murphy wrote:
> Existing RK3328 codec drivers have overloaded the GRF phandle to assume
> implicit control of the limited-function GPIO_MUTE pin, which is usually
> used to enable an external audio line driver IC. Since this pin has a
> proper binding of its own (see gpio/rockchip,rk3328-grf-gpio.txt), make
> a GPIO explicit in the codec binding too. This will help avoid ambiguity
> on boards that use that pin for some other purpose.
> 
> (and while touching the example, enforce the "don't include status" rule)
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: no change
> 
>  .../devicetree/bindings/sound/rockchip,rk3328-codec.txt    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
