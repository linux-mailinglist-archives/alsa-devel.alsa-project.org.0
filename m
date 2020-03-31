Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B05199F2D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 21:34:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37B91660;
	Tue, 31 Mar 2020 21:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37B91660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585683243;
	bh=R/xbQ3x0Tl3UR+fUjZS4V0QbsUouAGo0fp+vGcIXflI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VnXOOLFS6h+cFMoqKCYfIae9IImbxdGRF9ZQPjuGcZQHfXYIHcQlQXGuxFdKjA+kI
	 omYLDwQTOpuTW5tn0mGxjmPzaTVetbmiLS+79bu73a5KDx3ST60kK/vHa3bI04wfW2
	 NdHwD5NEEIv9JbLpXORrv6wF05UQEQf1ANlvaTD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF412F80140;
	Tue, 31 Mar 2020 21:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36394F80146; Tue, 31 Mar 2020 21:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED1CCF800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 21:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED1CCF800AA
Received: by mail-il1-f195.google.com with SMTP id i75so13338283ild.13
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 12:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ffyuJBft5eRj0uXoExB7KaHT1VC+KdBgrEZukPCp/jk=;
 b=R8msVufQNzErgz/bXrvGV1ilg4XVyzg5CSSDY2yGQiHe6+HeAEQTOmp0LDoRrEHrLH
 1SyID1UY4iyh1B809hCZzS+Q77vdVAdJu/55Dkk7NMDGcZ560EqVQC5sDRN1UyU8SyV3
 b0rFL0U4a6mBfaT/qZgmz7lvSoEqALGSR+1m26U6BF/aJ+NtN9OuXj1TbPaPWbXIvdMV
 e4avaILSjReVEzQzu+TGKSxcVeyyIkPOdTjdANAtl09Gkmrrr93pmFUF/k4lnqimZ62Z
 b3Wp/x4KHbBhaQfSjpcLVf9tjEtR/JmZ/mDWQFNASfFBKAQ3FWJT9k4e+W/fP2qcUMbP
 lRtg==
X-Gm-Message-State: ANhLgQ1Gr4sx8WTTPe95XM44idVudBod/CQftbLKRbKxVF9AY7Fo/sDz
 K8KMSG7+4T/3pt/5vUVhdw==
X-Google-Smtp-Source: ADFU+vs20F/WPfwobCVQDiWAIDI6LL0zgRgv9YyT1gwXPo5RofbdAd8avWmVDPg2Lg2rbY31XKH7RA==
X-Received: by 2002:a92:48cb:: with SMTP id j72mr18224637ilg.162.1585683130347; 
 Tue, 31 Mar 2020 12:32:10 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id d70sm6197008ill.57.2020.03.31.12.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:32:09 -0700 (PDT)
Received: (nullmailer pid 30593 invoked by uid 1000);
 Tue, 31 Mar 2020 19:32:08 -0000
Date: Tue, 31 Mar 2020 13:32:08 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: sound: rockchip-i2s: add
 power-domains property
Message-ID: <20200331193208.GA30530@bogus>
References: <20200324094149.6904-1-jbx6244@gmail.com>
 <20200324094149.6904-3-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324094149.6904-3-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 24 Mar 2020 10:41:49 +0100, Johan Jonker wrote:
> In the old txt situation we add/describe only properties that are used
> by the driver/hardware itself. With yaml it also filters things in a
> node that are used by other drivers like 'power-domains' for rk3399,
> so add it to 'rockchip-i2s.yaml'.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
