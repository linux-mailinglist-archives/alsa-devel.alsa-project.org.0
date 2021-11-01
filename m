Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7374422CD
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 22:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 393B316B8;
	Mon,  1 Nov 2021 22:37:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 393B316B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635802721;
	bh=9TF3gGAhuHNCG24L/rBo3Ct/4tDDLf3RhkGmTbmZqQw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kVeDGhd8SDCqi2PWpj4YN0d4t6PuxR0Iwk3vptQRhyi2Fkxce6qzWuA+aDPmxLIJk
	 UcmYDTSCYZzhkzJ9sK7jUyN/Xd4Yr/1H9Jxi6prDcre7oX6N6zzHu07BmLiqEsSCMU
	 +o3Erb9adn5fOo61XhxUPy9D2EL4cn46G8q4Gtuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E02AEF8026A;
	Mon,  1 Nov 2021 22:37:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B53CF80269; Mon,  1 Nov 2021 22:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B165F8012E
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 22:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B165F8012E
Received: by mail-oi1-f175.google.com with SMTP id o83so26949785oif.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Nov 2021 14:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JAg6KdmFAXzUuXNGb8fBqgMEGAaw9CamDaT7qNQbpL8=;
 b=Dd5wxv7U6BLCGNHigMkP5Sn9WC6kDTOcB/ccYkg978kbFjTU/0Wro7/HDE1bUr6Cou
 6o9K/8xsur6PB3QCpmJ3GJDhRRc60OMhe6yaVajYH18Whqq9nLXkrOAsTLZXQjo6L22H
 nBJ2xnfKJHUpZeyo1YT8DnHvW2aofS6bgaWAsFhUrngQhrdAg/wBfwPcoe4Pf0uocXbq
 K8zngD17mO18jET2lvrlLHxn4x7BSjxx1ICCt806WzVekEwR+OkHpv64X0bOhjdki1SO
 od00wYexbvtz4T++5yujSrscu+ZqLosSjpodpABbBeTouwlk/CkPsPTkGQV5RA+hHYRj
 32YA==
X-Gm-Message-State: AOAM531OO5chU3YwuBwsA4RYPBe6LfMD7ENfBq/MEUIQLgUTcJXfNBIS
 8HOMDVrHnsuzQyJeDXvCPA==
X-Google-Smtp-Source: ABdhPJwwHJSQi7dkJRcGUNwGb6a7bA1FO3rXq7O3icm5Iokg0YPIWwbrh3XTqnkeg8LqfAGHRmgsWQ==
X-Received: by 2002:aca:42c5:: with SMTP id p188mr1447707oia.125.1635802629571; 
 Mon, 01 Nov 2021 14:37:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z22sm4001594oth.63.2021.11.01.14.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 14:37:09 -0700 (PDT)
Received: (nullmailer pid 1110199 invoked by uid 1000);
 Mon, 01 Nov 2021 21:37:07 -0000
Date: Mon, 1 Nov 2021 16:37:07 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl compatible
Message-ID: <YYBeA7Qt2vhFoMeO@robh.at.kernel.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635342097-2726-3-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
 broonie@kernel.org, rohitkr@codeaurora.org, judyhsiao@chromium.org,
 plai@codeaurora.org
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

On Wed, 27 Oct 2021 19:11:36 +0530, Srinivasa Rao Mandadapu wrote:
> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
