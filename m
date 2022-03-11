Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC814D7B1C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B534172B;
	Mon, 14 Mar 2022 08:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B534172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241288;
	bh=q6LEjZWiUmVtO6dBJg7Mp6/2FdVmuE0KsYKfGy3NuGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lgJvvzpgvZ4Ph+9e9/na7HvgTBzP7cxZYLXJMR/KnKY5rgEKQf05HvQQJsIspz9yN
	 L7Y3j4V5W/yYrbBKfJipfbJ2IW+rZpHtCsPIGuruyM+CN+UvOcWzr53U/hOKIZKTIb
	 2J7HTPoVibr6Hjwj7Wy+ytt66XeC2C6qKCsuGRTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A6CF80526;
	Mon, 14 Mar 2022 07:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8898AF80227; Fri, 11 Mar 2022 23:25:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E80F3F800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 23:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E80F3F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dS5amww7"
Received: by mail-il1-x142.google.com with SMTP id l13so6963421iln.13
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 14:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GyRIcZoZdI7XJjcQT5Ld8APIti4p48Wxyfw1hBRxBYU=;
 b=dS5amww75jfn2iQvjxVUBXupGO2l6Bys4O6ss8C+vdIfjfPMJaujEm9TMdOfi7JJyn
 dbbcd0UFSTRfv2jADGOoSFe/5DqenzhVZiNNC5D7pcNNV5fNMn6qY9YozZdE73LxFZtI
 pnveBYNUf9BYXlTbd1eXM3UPGIUa98Z7uBLitXc8JdYSGBw9ETqBFQmoAbHVTtll4cyU
 K/KBDNv6YGh/NENGPHCdN9wCmBkbzE/D2e0bK4dxrorUsqRcpcKs9cG9AgxQA5ylD2nc
 RtdafaGoBCkTZ1oFaqNQ1swY2EvaLzVFAERsNeGJjn6VO9ThV34v6kZ9RrIh6DJTNqRs
 LhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GyRIcZoZdI7XJjcQT5Ld8APIti4p48Wxyfw1hBRxBYU=;
 b=SUqMbEvkbrF5MZ1L6TSwjPAaipRDQKdurnzNr1GiXVcsAuptuplfwtg7gR7WjWMAri
 jVXFdrKFgSRc5uqtsCI30p841Qz73ErRhzbEhY5iW/A9qPkPltZZ18f47wyj10AYcPjv
 jzy05+9+9pgdGBZYRjQu5RZWdGpXEvhErf8i0t52GlhsCbjTQpQrmt1tpuFVrMe8hFlz
 EegP3t115zXBQvBe2q/yuUA+v0zN9y9LP7kidXn4iwCf3QudkHAcjGvBB2y5fRtOziB8
 fjucvbbSruIza5Cltb47E/R59K8I5lf/YeACip+XOLhXpbgPbhFd9IFZ4nFLmvCsM3iM
 Cobw==
X-Gm-Message-State: AOAM531gT//4yN7PMWVxh91eT+egGVOSpUBtBMNj5oZnluxiw2Q8m2M2
 pJOzRAggOp5o68vW08u684J3yqEyPdracV9Xe24=
X-Google-Smtp-Source: ABdhPJxZl3L+TKpxjt4oWEG4AolAgkwpnkj2tGpgqjLVYdjTm0XEwk6syLuzVL7BUndaT96BlC3Ga8o+TnZXMlpD/Yc=
X-Received: by 2002:a05:6e02:20c3:b0:2c2:9e23:8263 with SMTP id
 3-20020a056e0220c300b002c29e238263mr9686933ilq.248.1647037508686; Fri, 11 Mar
 2022 14:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20220311132906.32292-1-steve.lee.analog@gmail.com>
 <Yit5v+JkYDiWz0z0@sirena.org.uk>
In-Reply-To: <Yit5v+JkYDiWz0z0@sirena.org.uk>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Sat, 12 Mar 2022 07:24:57 +0900
Message-ID: <CA+Fz0PY9bi7cJpbmD4LSMRyDFEyJ4JQPqWWNoV-PZm01=KboNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: max98390: Add reset gpio control
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ryans.lee@maximintegrated.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
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

On Sat, Mar 12, 2022 at 1:33 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Mar 11, 2022 at 10:29:05PM +0900, Steve Lee wrote:
> >  Add reset gpio control to support RESET PIN connected to gpio.
>
> This doesn't apply against current code, please check and resend.

I will check and resend patch.
