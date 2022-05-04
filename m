Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD2451AF82
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 22:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07A617B2;
	Wed,  4 May 2022 22:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07A617B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651696852;
	bh=+QD6EX+u+9aS5QW0daRYWMhEsedxJoYLWF1WaYvEAfA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOYkrZCFcMl+pEh6V2pYXCIOmVlWgWG/tOPCJJPVin/LbctSdb+VqZoZjCCFsmWTa
	 cMG4xf/IdC1FRgqZrynRmzWEG6/dCBmLml001KmErkiBsMnTMJrrD9crXB217zf3XB
	 DF7UwmHQt9MkuM974xvtEywurRKZJzWFwXkWzgHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 651E6F80508;
	Wed,  4 May 2022 22:39:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A07F8049E; Wed,  4 May 2022 22:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E0E8F80506
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 22:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E0E8F80506
Received: by mail-oi1-f172.google.com with SMTP id y63so2382552oia.7
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 13:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4qEjMBGyn6Ax7kk135DQcxU8nStaVR1F7LoMbwMuoWg=;
 b=n40XwYoaViwBl6QCzDhIcur2PPOlez0RVW63Qg0K6VdlnbVUPFJqwOd793JjBxjwA7
 Dg3Vny9ABCcu80zkkWQ2hFg3XOXurbhHJydxkyQLFSWIRaUAE11lkk442w74/tsoiAC9
 4bQ98AGz+O48UT9kmJRpP+zUIp8nwTa+Og0gz12Xc2IzFOwdKuD9YEwV0GqbKWGn52at
 nF5+Xfcyascd2IjG8+guit/i/D9BzECbOmT1Efz78ej57n+Ao6DLKECf0kj7tMHPmiFE
 eBS+nbcreJk3iLNtTU3XyBG0QcnXJjsREcFnH2qYp7vzhTZ8lHhBjsNmVvvWuPG+qBxz
 0NnA==
X-Gm-Message-State: AOAM531kXUCMzmJaZZoGzk70dzwVakny+1ZPg8pPSTknrNLA13IJ80Ra
 RtkxrasZUi69qsmhPTSzlg==
X-Google-Smtp-Source: ABdhPJwDMlqxoLd2JwDyv6kHNDs81yJUYwFkx2lp9aIStnjbEDAFyQyot+1S4H/D417GQgMWDXaJhw==
X-Received: by 2002:a05:6808:170d:b0:2f7:338b:1fc2 with SMTP id
 bc13-20020a056808170d00b002f7338b1fc2mr712692oib.60.1651696778437; 
 Wed, 04 May 2022 13:39:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056870e50300b000e686d13884sm1413116oag.30.2022.05.04.13.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:39:38 -0700 (PDT)
Received: (nullmailer pid 2188386 invoked by uid 1000);
 Wed, 04 May 2022 20:39:37 -0000
Date: Wed, 4 May 2022 15:39:37 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: rt5682: Add #sound-dai-cells
Message-ID: <YnLkieDO1QJtWFQC@robh.at.kernel.org>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-4-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429203039.2207848-4-nfraprado@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, 29 Apr 2022 16:30:39 -0400, Nícolas F. R. A. Prado wrote:
> The rt5682 codec can be pointed to through a sound-dai property to be
> used as part of a machine sound driver. dtc expects #sound-dai-cells to
> be defined in the codec's node in those cases, so add it in the
> dt-binding and set it to 0.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  Documentation/devicetree/bindings/sound/rt5682.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
