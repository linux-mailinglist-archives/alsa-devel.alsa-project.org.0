Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DA4D23CB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 23:03:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D5618B3;
	Tue,  8 Mar 2022 23:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D5618B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646777010;
	bh=EO5x6MY11yBsUQMKcsYsFJhfkcoCiVfVqf1tT+3WPqk=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=toSE3IPk0v//9717/onJsLxXNfUHNle5Le4OobEVGqWuUwHLc7kkE2fg3mPCvz/WP
	 za+XZnuEb6J4DHyLrnnTzDCPVrQ9N6EF2cMbFkwk34r02osk7GYpNu+pvw3b4vqhLM
	 Oan7Fwg/Ww1Hdsbs/0PWrb0RXH6pfUy7T8I4p3Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05AB9F80279;
	Tue,  8 Mar 2022 23:02:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D0AF80272; Tue,  8 Mar 2022 23:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 261DDF800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 23:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261DDF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="i42+2Vc8"
Received: by mail-oi1-x22d.google.com with SMTP id 12so707963oix.12
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 14:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=H7bJFP/SMFW15p3pLkm+L7vfC59HK/LKRG6ORsvtMls=;
 b=i42+2Vc8KgRNR5vQOWKZQ8tq5xqvdZCWTi3cf710Q3s6ESxTVSUd3AKl1L77hB3slu
 heJQVnz6Bq7oJpDDVzgV1E3IMlLVppConv7H3E4ugb5PYClNiUuTFkD32ZUcHv3UBAGw
 uvl+qAE4GWMcPYCxEeU2WYWBJ5BuQf/TcluSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=H7bJFP/SMFW15p3pLkm+L7vfC59HK/LKRG6ORsvtMls=;
 b=hruvRPWfyTOrIojCFkHe4ztvXaHLHDCOrTvM46bhtRUzRL8eAWHZQVpY256uG4FCKA
 JuutkwfqEWJthj9Ks0/jYXVrR8XlQuXAGz6xTEPiWIdCnwvWwXxrJk3lNWhbPk2i92vN
 aopAbTWa8Ez5V7PUv/uTSkT+oMqlspIc2T4ehG+d1vPg7I3asa+Dj1l/8Mx6e0sFUe3a
 An0UDjyxkzY4OpqYT3NB17N01acdfaD66ldxWji80V6l37GkOJU5jcHB1JseNEuJTt7h
 EAdltvogbkYObpVY/XOiDerEphS6k4dHxF7mapS1tTPRJXgH7eIx9WGul63rONUSg7qD
 nGtw==
X-Gm-Message-State: AOAM533P7rR0VE/Zm7E9v3lroqQRXb/7jFqcatPUGM46wIWrzY7eIJ/G
 4IO/o0mK+H4uRTni21qV02oVtmkRHU46P/Wkao77fA==
X-Google-Smtp-Source: ABdhPJzV5rZOO86yLbriX4+ATjnhaQh8o6iRmze3RyGwf6WbMtRYo4wlAN0seA1257wNimyu0mhdx+fx6AdOlUF8ZzY=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr4090715oib.63.1646776919910; Tue, 08
 Mar 2022 14:01:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 14:01:59 -0800
MIME-Version: 1.0
In-Reply-To: <1646316128-21082-3-git-send-email-quic_srivasam@quicinc.com>
References: <1646316128-21082-1-git-send-email-quic_srivasam@quicinc.com>
 <1646316128-21082-3-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 14:01:59 -0800
Message-ID: <CAE-0n50tqb6+aNNRAVjHjkExZDYqbnJ+3zDnSOMgndxMVXZXzQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: soundwire: qcom: Add bindings for
 audio clock reset control property
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, 
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, sanyog.r.kale@intel.com, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com, vkoul@kernel.org, 
 yung-chuan.liao@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-03-03 06:02:08)
> Update description for audio clock reset control property, which is required
> for latest chipsets, to allow rx, tx and wsa bus clock enabling in software
>  control mode by configuring dynamic clock gating control registers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
