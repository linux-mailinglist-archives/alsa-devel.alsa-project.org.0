Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2FC48126B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 13:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E391777;
	Wed, 29 Dec 2021 13:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E391777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640779549;
	bh=lBUVhoF4RSJMtieNdbWHPWvJeKm5wEEk5bysjAdIBcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+gt03gBa/fk9BMM2RU72YTaUzASsVR2HvXqqpaeXjuSrS9mrYSwzCaz4ac75pplA
	 sDkB594rcRug9k1Lb6sTeFs/7QnaKv+2OkfTlsdmDT//em8ecrmb+L9ILGrOUv1yv9
	 Lu8/Iab81lYQTW7rRXS+YVpphWsLDAD7Fl+yOiF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6652DF80224;
	Wed, 29 Dec 2021 13:04:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 230F7F800CE; Wed, 29 Dec 2021 13:04:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA684F800CE
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 13:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA684F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UB2a42+I"
Received: by mail-ed1-x52c.google.com with SMTP id l5so50732696edj.13
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 04:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBUVhoF4RSJMtieNdbWHPWvJeKm5wEEk5bysjAdIBcI=;
 b=UB2a42+IwNoOrtOr6n+5cmWFNieHfvVkBlMGxKFxS4Ya8G3GWByBvleyP2CrR45AB3
 hm/kPzn1YhkKYln+pVIO33VmHV966OvK9M4CbPsx34L1xrB5A2IukqaErk1Sf8AJfQN1
 vVnhybX4u7PGVJ2h0r/nhMj5aVUJDlb5IR/a2OXZBdQDKJs27xOzEHOm7KGpJmyo9v3m
 AqkvOIGewHfSEIV7hbFBe/SDFBWsZirg+pKr39lZGlh/tXYTKr3qjbKyUUk13+OThl/J
 RiX0akR6UQrj9LkExX5OqVgm9aFSYgmtT2FRVLBBzeubMVG79vodq4rNhxstRLHCi1PC
 oTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBUVhoF4RSJMtieNdbWHPWvJeKm5wEEk5bysjAdIBcI=;
 b=aDkEtPQaSr40DYYQAmOEn8EJgFTYOW/Ec5cLXsSVd0SWpFsDLirtl5ni5pVUIg3GJp
 ImMLVFVMGJCStxvDX/luJCAx7gm/NvN2LmtEkozAC4uAcdbBAr2XG6tXEryxLZw/3Bop
 xz7s0PpdPxtRrbFc3ZyNmlI166XmAV8Ws+l2H4aocDbDx3wvDbd51xwE2yBB6fEWF0Tx
 F/NaHHW3talHIDZAg3+c2rmKE7suRXdYMY7KBWYH7KhGC/LTtrU2bUIWg5o203+bSs9g
 6LwzMEIEhOr/rpdjaCn8oaZYDCr4rZoP9Y1dYSQhR/PWMN/w6RiLcnh0t6yLsl03rUJs
 yLmQ==
X-Gm-Message-State: AOAM5319BCN7L1opVN4NaEgVBGGxT6NRCyw5zD4QUv8X/LZxC7wikdgT
 jpm8LQUhvNzXPuWhCDhEHdfsWl9bK4RFUvfVbg0zRzdS
X-Google-Smtp-Source: ABdhPJy4Zjo+rEcudpmRbAjJdXYXoXd+a8ZAfCOXMu823EOXDvTFe4zt4Y68rnga3qsWTTgF2cbEA0Y6oJYj5NenxnM=
X-Received: by 2002:a50:da48:: with SMTP id a8mr24854142edk.155.1640779470169; 
 Wed, 29 Dec 2021 04:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20211229114457.4101989-1-festevam@gmail.com>
 <20211229114457.4101989-2-festevam@gmail.com>
 <20211229115352.GA18506@ediswmail.ad.cirrus.com>
In-Reply-To: <20211229115352.GA18506@ediswmail.ad.cirrus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Dec 2021 09:04:19 -0300
Message-ID: <CAOMZO5DcXUR2Z6-cokwizDbAKnEs877AjbX9FEow2RFHfebnuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: cs4265: Fix the reset_gpio polarity
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Fabio Estevam <festevam@denx.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, "Handrigan, Paul" <Paul.Handrigan@cirrus.com>,
 james.schulman@cirrus.com
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

Hi Charles,

On Wed, Dec 29, 2021 at 8:54 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Hmm... I might defer to Mark on this one. I totally agree your
> new code is more correct, however, I would have a slight worry
> about existing device trees not correctly specifying the GPIO. As
> in if existing systems had been specifying the GPIO correctly
> they are presumably currently broken. But I am not sure what the
> obvious solution would be, and I don't really have a good feel
> for how widely used this part is.

I could not find a single user of the cs4265 in linux-next.

The board I have does not connect a GPIO to the CS4264 reset line, so
I am not affected by it.

Cheers
