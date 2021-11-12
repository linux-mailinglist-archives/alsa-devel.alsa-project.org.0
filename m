Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB544EA16
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 16:31:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B1E166B;
	Fri, 12 Nov 2021 16:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B1E166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636731079;
	bh=b/CTHbYrwSTaYSjQVcajyUSUyyDg4ptaN9a/TeY5HkI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4W75A+ge9jLdClvwL2UiMA76zvRY5lahQFyqUMx/u/fbZdfmfk53pgohyOiL6sEa
	 recYVDbqCGsOWGY+lvd1YDM4gVLOBqY9ngMJeWtbo6sqeQvpEYVPRFaxepAEUVzTAx
	 YVEoXbQcsdR0NOVsZc8YEp2RgY7xp0KbGVxIdFDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C03F804B1;
	Fri, 12 Nov 2021 16:30:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA75F8049E; Fri, 12 Nov 2021 16:29:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41401F80086
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 16:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41401F80086
Received: by mail-oi1-f177.google.com with SMTP id o4so18460594oia.10
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 07:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DW8VgudtocUZU1HDUii+/dHVF3J3mG1GILU0W17O9qk=;
 b=EpBNBbARQaBWUFjAmgGqJTbxbk6yn0xQDdd7IKuzBK95nobfWqTdq5zhYOwRPN0T4v
 rd6GDXwAbxfU5N9Au+arOtkNMVDknavN5HlZ35N8Ir2d+iH+L0hh79AGdSDZOQeom86R
 VEbIK0t4mIqKCTSbTWHLNUk5+m8fxk2Pp58EJHBgCMl2y4ShlBDZa7tyDMVGB848Q0k9
 h0Y7cRLoauVnGoYL5lAZ4+S7DEZus9vHJ96sGnYpnQDG4DID5iftOTLd7BrcVRLbCXCx
 LVR4pk7cBeRq5YNrcAd90hgX1hQzH48Y77/buCgxTiqxi/6oeOvQGnquSwwbQcQGUUPn
 6Lig==
X-Gm-Message-State: AOAM531jZ5ks9ZnlGcECme8hEE3nYxsmcCTPC15AMTp1PYZnQgQ2nHrl
 onsp8HyAzD9c067uQ2EaXg==
X-Google-Smtp-Source: ABdhPJwbTtvg9M+B+8LafzsMv7N7DUzYI4eFvElyss/WrN8Ef8+ofOCHjyrSNmOpNl/xc9lWPCOELA==
X-Received: by 2002:aca:30c5:: with SMTP id w188mr13002779oiw.35.1636730962320; 
 Fri, 12 Nov 2021 07:29:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bn41sm795096oib.18.2021.11.12.07.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 07:29:21 -0800 (PST)
Received: (nullmailer pid 2884254 invoked by uid 1000);
 Fri, 12 Nov 2021 15:29:20 -0000
Date: Fri, 12 Nov 2021 09:29:20 -0600
From: Rob Herring <robh@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nxp, tfa989x: Add rcv-gpios
 property for tfa9897
Message-ID: <YY6IUOspigx/yDvj@robh.at.kernel.org>
References: <20211031210956.812101-1-vincent.knecht@mailoo.org>
 <20211031210956.812101-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031210956.812101-2-vincent.knecht@mailoo.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Sun, 31 Oct 2021 22:09:55 +0100, Vincent Knecht wrote:
> Add optional rcv-gpios property specific to tfa9897 receiver mode.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  .../bindings/sound/nxp,tfa989x.yaml           | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
