Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20696449B98
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 19:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C5851662;
	Mon,  8 Nov 2021 19:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C5851662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636395844;
	bh=DUJ1l83jSHedVVdy9VZh9+kz3FCLAnfXKg78zT5I1vA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QnYpgmpeJmZg23LFZVfGBjYo9foMVx9XOYZXLhSZRd0gHfeadmqtqn0V3zcMBMEAF
	 6r2/jmUHNGhGyaQavtvx807EvkjN11isb9wyAy2mvMkz3gStNKt+e5W7xa0dLM1tnj
	 ybb+06E9tQEtVFXkiKGIe71zi6zFcM57VJojQtcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D8DF80107;
	Mon,  8 Nov 2021 19:22:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75357F80107; Mon,  8 Nov 2021 19:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22C75F80107
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 19:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C75F80107
Received: by mail-oi1-f175.google.com with SMTP id bk14so6040875oib.7
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 10:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sO2dt8DuhlMcsC8zejGWVfhyLHr9Al/EyUYlESvy22E=;
 b=Ua2gmMCAhhi717E5rU1RmsxrC/Xj8Bt0DQNqPIKRZWEXrJwMVsm5uYPZ5Zd0H3lagc
 3jZHrO+GpHdXOtzpl9WeRZM6gbW/30odF/rdir7ulAddYuRg/SyscYe3nKzWRK13s/9x
 gsu4x570eMbD/chvIgcKC7Ai7Jn8ZbixjMVoPSmcWgIp7MbsEqNShrY/+CpI5dOg4O1d
 HzBB83NHZMRNU3pwCEZ+mCK9+a0AAM0TwFSohQqKo7JuEVGrd0nDh4P8U+AuGTL+jjLW
 s8LpetWkiTj7zIP53oqatRbfuzQf56L4JZTImKcokplYnI2aIK/+pVFkn+hWw1qyyw0o
 s+WA==
X-Gm-Message-State: AOAM5337WvKVT8bq7hnva2Xt0sfIbG5QkHSyaYfhLUk/lWT19hZJcbFS
 Z1jQydVjeWD+wzErxPNJRw==
X-Google-Smtp-Source: ABdhPJxjGJxzII6GW6D0MF2LEukd9ujymJo8yNJF+Bk/9w959yWxMDxBudokbIThUeDliSUknY3Wjw==
X-Received: by 2002:a05:6808:2182:: with SMTP id
 be2mr280835oib.80.1636395754777; 
 Mon, 08 Nov 2021 10:22:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m2sm538039oop.12.2021.11.08.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 10:22:34 -0800 (PST)
Received: (nullmailer pid 3971322 invoked by uid 1000);
 Mon, 08 Nov 2021 18:22:33 -0000
Date: Mon, 8 Nov 2021 12:22:33 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: sound: wlf,wm8903: Convert txt bindings
 to yaml
Message-ID: <YYlq6QqkTjxoBJKE@robh.at.kernel.org>
References: <20211028124639.38420-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028124639.38420-1-david@ixit.cz>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, ~okias/devicetree@lists.sr.ht
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

On Thu, 28 Oct 2021 14:46:38 +0200, David Heidelberg wrote:
> Convert the Wolfson WM8903 Ultra-Low Power Stereo CODEC Device Tree
> binding documentation to json-schema.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/sound/wlf,wm8903.yaml | 116 ++++++++++++++++++
>  .../devicetree/bindings/sound/wm8903.txt      |  82 -------------
>  2 files changed, 116 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
