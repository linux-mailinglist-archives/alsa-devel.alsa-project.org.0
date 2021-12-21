Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8847C7D4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77E717C0;
	Tue, 21 Dec 2021 20:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77E717C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640116486;
	bh=wxHx7ON4wS3CgIVDTBcTewY7gB11Z5Pj3BUzw1p5/cs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4JVK578SSld85NoF2+Rtr1xtrXnp5QSzbE+rLfpHA33h4AtV1ynbYytWkZceuB3D
	 Ddg13f3zzRS2UuMgg3zamRTE/J3kAV5aCg5tDPSeSSQ+DNOnopuYGrM03OxRaLbdXV
	 7xiJhploPbPT/JzMGNJG03P59WBOJuJ0radg6m+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1098EF8012E;
	Tue, 21 Dec 2021 20:53:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41170F800E3; Tue, 21 Dec 2021 20:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DB21F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB21F800E3
Received: by mail-qv1-f50.google.com with SMTP id h5so262548qvh.8
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 11:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=inhzLUzVk01mb2/NsFRt+qCJNW848Xt0oNeOLwfZLYg=;
 b=LBAbmsDJrszXioW5U5hhQyrz01VMEnlb6WEmr6+FJy2R5uNI5pBAyxRdqajbtdp7Mi
 Rjn8mA6DaYgZVMyeALikSP9GvbQ+cnITAMgOcGqsphJb2d67wm/W6wPvxkVhwtRRxbbG
 JxRM5IRRmhUznHpjVWoXKZEhgHUECrEnts+buBg3p7M2DO9oJNsSfDE1zaoVt/yedQl2
 wTeLTx2KjiTnI9q3n8qhIxKiMgCod/L+LmUhGdu1aY+hKokdZqTVl/WCeXIIfN8yqbah
 wY8TACEqozCRX4x7WfAu10uQYm9XqPWO1MMbibeVWxUaX2wDXoyQHinCvAhXkfzjn2iZ
 g2yg==
X-Gm-Message-State: AOAM532IbtCYoCbW2G1GOQmT0vPGQXCYjKvfFRrHeuM5Q2gFh7rBbaym
 kZsdkTEaOWc2q4apgF8ehg==
X-Google-Smtp-Source: ABdhPJy+s2cGnxE3IhTQslgrHswM1Pf/g+KTtweTfco05upr9r2sS6TKOHUkkz9IBvD8vbZKX6JELg==
X-Received: by 2002:a05:6214:27e6:: with SMTP id
 jt6mr4114227qvb.7.1640116408210; 
 Tue, 21 Dec 2021 11:53:28 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id r23sm13219102qkk.25.2021.12.21.11.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:53:27 -0800 (PST)
Received: (nullmailer pid 1642209 invoked by uid 1000);
 Tue, 21 Dec 2021 19:53:26 -0000
Date: Tue, 21 Dec 2021 15:53:26 -0400
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Use name-prefix schema
Message-ID: <YcIwtgtvdCiEMoRP@robh.at.kernel.org>
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218143423.18768-1-alexander.stein@mailbox.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
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

On Sat, 18 Dec 2021 15:34:21 +0100, Alexander Stein wrote:
> name-prefix.txt does not exist anymore, just reference the schema instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Changes in v2:
> * Fix 'pass' -> 'true'
> 
> .../devicetree/bindings/sound/simple-audio-amplifier.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
