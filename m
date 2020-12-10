Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0422D518E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 04:43:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA6E984C;
	Thu, 10 Dec 2020 04:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA6E984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607571794;
	bh=ufe9PNhkLi+e8lva27aQHX9te1VoccSHAHPp16GvWv8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHA8A+hoGRhke8edhTDcnNOt0UHZOVzNMAO0TEMEcjc2UYriDiFW4FH+cKHwiDkE+
	 ZCdFiVuqaAIE9i4IYILuV/f1KQuQiJApaH//yUoVtEBtmUIzmMznaASBr3ieGZG+Y+
	 rGPswx/cLjzTx5PI2SRQzYTpgSrXepTyP9PwQMz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF28F80164;
	Thu, 10 Dec 2020 04:41:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CE9F8016E; Thu, 10 Dec 2020 04:41:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687C4F800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 04:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687C4F800EF
Received: by mail-ot1-f67.google.com with SMTP id w3so3624529otp.13
 for <alsa-devel@alsa-project.org>; Wed, 09 Dec 2020 19:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oHT+bpTlXmEcpnDhxLPen0vIHtK4d63RKLxr2Jz+ZqE=;
 b=gN7Oe54dmNrjVnpYj1jb9q6mB3ZVfUa1ykRR6MFTJA+/40K0iJ5gJd8kEyP9PzP92B
 ODCUtedCQFbQpJdssFsdYCxIwjj+hYd3dVoJUO8hrNSQ8Tg15w/NkFc7xDGB61ysQ4M5
 laxRZIeyQCUgMVIiIa3BeOYAwineZjniVTpNNBUfgaVZEdXxvKaaAuSNiozubj4VgbRp
 bR+s6ZuO67cS7LebLaL1LSOE2VSBghl3jV69XLQa2Jsr8Tz1RholOR6P7k5aFo1AKqXS
 hm9r+B7T0XFqW5oekO6xTuhykjihucsMwpyFPqmOzuaUfAxDu787j+8uxcFOFoFqcviQ
 2Zkg==
X-Gm-Message-State: AOAM532h0CNUYpPIhzsFhVUkjZxycil6uDP1k7S1JOTAo5B8JnPKzT3w
 0E2dVZCgmvUXlwryZ5SDKA==
X-Google-Smtp-Source: ABdhPJzpzWnBwKKImc0q9CG0zR2ZvstScdCgUPs86Y83ZnTGScsY/VaNWpQ4XF/7YdZht+RliCvBqA==
X-Received: by 2002:a9d:7851:: with SMTP id c17mr4572752otm.255.1607571690280; 
 Wed, 09 Dec 2020 19:41:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h62sm802199oia.9.2020.12.09.19.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:41:29 -0800 (PST)
Received: (nullmailer pid 1613254 invoked by uid 1000);
 Thu, 10 Dec 2020 03:41:28 -0000
Date: Wed, 9 Dec 2020 21:41:28 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: display: add #sound-dai-cells
 property to rockchip rk3066 hdmi
Message-ID: <20201210034128.GA1613204@robh.at.kernel.org>
References: <20201206133355.16007-1-jbx6244@gmail.com>
 <20201206133355.16007-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206133355.16007-2-jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, daniel@ffwll.ch,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sun, 06 Dec 2020 14:33:51 +0100, Johan Jonker wrote:
> '#sound-dai-cells' is required to properly interpret
> the list of DAI specified in the 'sound-dai' property.
> Add it to rockchip,rk3066-hdmi.yaml to document that the
> rk3066 HDMI TX also can be used to transmit some audio.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
