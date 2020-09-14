Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC092696CA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 22:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DEC4168E;
	Mon, 14 Sep 2020 22:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DEC4168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600115771;
	bh=d0xMTPAfSlPDErufsk3TpaC1t5aPt1+8PxDoydWs0uc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e1grpgJ95rIgl1JykYnn4f63uGCyGgnaeci29pvsMMFM/AJEpDe8bpkr7mHOvi3j4
	 sh4xcSY7Ii0qax7ACiqkwjl7ZlTXX9xxqVNJUIfd0xr98LauOO4AcGapmfqD68uZAL
	 qxolOUcJ2lTq+D2BD/na83JleP0xvW3XfDSl1IcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79277F800AA;
	Mon, 14 Sep 2020 22:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF418F800AA; Mon, 14 Sep 2020 22:34:25 +0200 (CEST)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13526F800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 22:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13526F800AA
Received: by mail-io1-f68.google.com with SMTP id j2so1553596ioj.7
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 13:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L47Wr53DwNenaQtlXpt/RvnPV0Mj1KdFsOYEAKHHgJM=;
 b=tXwL8Pxe0fuIoNhPYpMsTINJK21smMDlj4oFvz4yJQ7AGy5n8hlDnGkVfWYZH7n7M/
 uQ2bz6VrlTDS8N4MOEnwS0Afpw4LBLEKxxsciwNqILLTYJLAAypDc3QXqcpR59qJWRGt
 LJmIN/i31EJ5jX9RDNWJ4nEccqchIBzRv5DQj+O4+a2FMPbr38eJX1MjEOY/y+gPkQgq
 3jjEyHUaFl6NTdzUPTjZ/j+GYfIo4T6nr8ejS9HydeXkMx71xe7mv0M05NqRbQv8GDs/
 KHriMrTu1BjANoH4eWDtEk7goE1SoXe1mubJkteoLHSSEyF8BCCi0DNQpCyXE1/MeiYv
 fgQw==
X-Gm-Message-State: AOAM530mZ/zbgHWaxnkf0BFSQR0zC3Ik3HbzYVRDUMEOwUcA0Owygp4E
 OE1dDrzmzDP2lv8SzC/MUA==
X-Google-Smtp-Source: ABdhPJyg4ikLwX3W3iZGCT6sHarUQxriyzmJxrbeomqmR2F9mbVkURzRIGrIqptKPZdKHiS11cUSsg==
X-Received: by 2002:a02:76d5:: with SMTP id z204mr14178152jab.93.1600115061335; 
 Mon, 14 Sep 2020 13:24:21 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d1sm7407980ila.67.2020.09.14.13.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:24:20 -0700 (PDT)
Received: (nullmailer pid 180119 invoked by uid 1000);
 Mon, 14 Sep 2020 20:24:18 -0000
Date: Mon, 14 Sep 2020 14:24:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: aries-wm8994: Match compatibles with
 enum
Message-ID: <20200914202418.GA180065@bogus>
References: <20200902160025.20922-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902160025.20922-1-krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
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

On Wed, 02 Sep 2020 18:00:25 +0200, Krzysztof Kozlowski wrote:
> The common pattern for enumerating compatibles is enum, not oneOf.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/sound/samsung,aries-wm8994.yaml          | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
