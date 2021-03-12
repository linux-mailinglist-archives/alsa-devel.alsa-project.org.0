Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C44338AD7
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 12:01:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C567D16F6;
	Fri, 12 Mar 2021 12:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C567D16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615546881;
	bh=xWcQ+MnpfJIRixP5+Qzo/jvJOngFZ5uLxkvwxvNVCfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTHxC0CqlxonI/LgnntEfDbFYFdj1P9BYTY5oJirVI18bb4HSgnBAYnFpq40JnYwo
	 wkTcX1leZ/fa0E2N97WoL3rp367y3dpyDwONrjPdgPUFKWj0CH27MhhlLkPGd1qAh7
	 0m5xZm+WAkSnxlH2FzApXabwRz4KEK/5UxDLBIkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28930F801ED;
	Fri, 12 Mar 2021 11:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B42F801D8; Fri, 12 Mar 2021 11:59:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B44F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 11:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B44F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qikOs3sR"
Received: by mail-wm1-x336.google.com with SMTP id d191so3523139wmd.2
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 02:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVhsAnYTZ5uoDdHPv0Rq+cfHyo0uxX+cwVjaziX6TS0=;
 b=qikOs3sRt3V3do4bzfm30QuBd2hEzkVlnGKj4H+OAr+JIqoS3oPynFdRtZLvfg3E2a
 V6SpuIfIZVGZ6wxuYyMtC0XDWZz/69wjGIoKdv/JvqBD8Z4wvpnoQlwzGo9PGdYH+GAm
 31HUCs9Bb9XeC012/uiK7qvGYkgOZzcRxCECDCrowktPUsJLBAzSLaXp4l6vKqmqenUs
 Q/wrSricjQdRRNsOEa9o3N2Tv8C2M31WXU+h3pi9kaipFwbTELY93qfDgrAltAUsEqcP
 YxVlzBT51Jxe4kYAdEdb0C43h7cfVGwg5sPbW6bDNfeUg8AT/k2fsjUxpQYwt+6pEnih
 xb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVhsAnYTZ5uoDdHPv0Rq+cfHyo0uxX+cwVjaziX6TS0=;
 b=YtN/saeYJBxXkI4HZ803fUcO+237Nnoc7I99cfcK5fS7VujvFdfPfk3h+HZ/lmb//9
 wFuaKyJKHvjZM4Z1xVnMSAQZpNhQfckdaabS6r8xhDrCHPT2X9XhQz8pmyTYx/+2qSKm
 MI1yP+spi0RkwpmjLCoDshZc+1P81ytVSzole3Ndf29FWWKDVnWVUEGyfPSJCwmBUbj0
 G5EcSu3p1Secm1LEfu+8HhrAWJxiMJNVOT3iHEb6u6aFdHiT4PdaY17dW6zQGMgH9ZvK
 nA3g/5cgWDmBQTyOMXPbUJMxl6DuZi1pyDbt7YrjtkH6WoURdPzGKt4sbHh9ZGaprvlk
 45iw==
X-Gm-Message-State: AOAM533toc6fPyj/AkME9Mvw8NBk944RVRJPBOuenZeT9/3jfZu7nLwp
 IQLG+QBRwWD6hp/kOzV55M85deP6NW9s+n1SlrM=
X-Google-Smtp-Source: ABdhPJwbgKSnXfoURCE7RpTdeOI9Zab8U8DVozKfPgjtPTa6ObjVYcUsMDNe6NxvxtsA/kzr3NQt7VLBud5WR2U/dds=
X-Received: by 2002:a1c:bc82:: with SMTP id
 m124mr12541876wmf.118.1615546781948; 
 Fri, 12 Mar 2021 02:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
 <20210309153455.GB4878@sirena.org.uk>
 <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
 <20210312104931.GA5348@sirena.org.uk>
In-Reply-To: <20210312104931.GA5348@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Mar 2021 12:59:29 +0200
Message-ID: <CAEnQRZDe_Q-N7L_7z7aVz1o3guKd6R+WFrOfT9KPbggJP8SPZw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Fri, Mar 12, 2021 at 12:50 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Mar 12, 2021 at 10:32:54AM +0200, Daniel Baluta wrote:
> > On Tue, Mar 9, 2021 at 5:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > > +                     if (!dai_link->platforms->of_node)
> > > > +                             dai_link->platforms->name = component->name;
>
> > > Why would we prefer the node name over something explicitly configured?
>
> > Not sure I follow your question. I think the difference stands in the
> > way we treat OF vs non-OF platforms.
>
> If an explicit name has been provided why would we override it with an
> autogenerated one?

Wait, are you asking why the initial code:

  dai_link->platforms->name = component->name;


is there in the initial code?
