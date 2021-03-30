Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46834F3F4
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 00:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A17C4167F;
	Wed, 31 Mar 2021 00:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A17C4167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617141923;
	bh=hK11PbNE9cISymjnWxnOIeOjmucwUlMxRDVyN7FuBbM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gpvgEFJm7JvcFZvL+m3UF40NxTZhC53biv39JcOCbuxpigUh+MCPK6dTxabz6GEuw
	 DcfGUv3GtN1RGgLz+09KAJgmHb0qH7ERfBIXwZBNhjEVt6PHDpJrNV159/ecun7Rzb
	 L9IFsTuGbGUsWqNiE9taCSmDCES5epI3lU+F33Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F24BAF800B9;
	Wed, 31 Mar 2021 00:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89050F80240; Wed, 31 Mar 2021 00:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F53EF80141
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 00:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F53EF80141
Received: by mail-ot1-f43.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so17038800ote.6
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 15:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kT3zV71FJ+KWr7wDc18R/r+VQdMcPYEV3G2c+81a2Jk=;
 b=kvSb39rkPT0S+0+x3dZaPlYWZ0kS8+XCe3X1d9f+T9PhQbthsw6gpR+MANdt1bZO7G
 SINKHINfgs75hFFhDum3YFVyg/wbn98Rw5A04rpQZqinqTmYfQJEIqyivh/uBG6uGFDm
 /XHALB7OSnbNFX1HA6SV/FUcWYNqX1iG+z3pex3lSjqV1sQ/qMktfY/hBhiYr3CJr5UI
 w6YDy6/UKrYYBwVodQhPyod38uf+CNAUwC1+fao+9Z8GWHM1771/MswXcF2tEAa6/cHD
 njrR6eXbpxJz3p+n/udF19lPX2rQaixGZM+/tyqYEGZPmztUAzyBRhL9fhi8C+IMiO8S
 j2ug==
X-Gm-Message-State: AOAM533xacn3gTlv13Wd4FX+S/wucH7k8AD7/e4hka7p5fMZEyO+501L
 xDHFpuLvoK75Abc7ir4Xjw==
X-Google-Smtp-Source: ABdhPJyh2I7htYL3QyX1DObBLG3JvR3UrFCpUcE/E4wzSOKe1drGK80ocIqUyt6nVh4CFLt6ehNY8Q==
X-Received: by 2002:a9d:6a8a:: with SMTP id l10mr41666otq.107.1617141821156;
 Tue, 30 Mar 2021 15:03:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c9sm37793ooq.31.2021.03.30.15.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:03:40 -0700 (PDT)
Received: (nullmailer pid 794287 invoked by uid 1000);
 Tue, 30 Mar 2021 22:03:39 -0000
Date: Tue, 30 Mar 2021 17:03:39 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] ASoC: intel, keembay-i2s: Fix a dt_binding_check
 warning
Message-ID: <20210330220339.GA794236@robh.at.kernel.org>
References: <20210329081435.2200-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329081435.2200-1-thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
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

On Mon, 29 Mar 2021 16:14:35 +0800, Zhen Lei wrote:
> The property "dmas" contains two items: DMA "TX" and "RX" channel,
> Therefore, its value also needs to be written in two parts.
> 
> Otherwise, below YAML check warning is reported:
> Documentation/devicetree/bindings/sound/intel,keembay-i2s.example.dt.yaml:\
> i2s@20140000: dmas: [[4294967295, 29, 4294967295, 33]] is too short
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
