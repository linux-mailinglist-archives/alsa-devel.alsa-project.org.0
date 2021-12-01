Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6FA465A09
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 00:51:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A75264F;
	Thu,  2 Dec 2021 00:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A75264F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638402669;
	bh=uoFNGFaxKHqCsHh9938+Y2GagAh+XcKkSF394LNJWfg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GPoQBHhblLYGixOxMJIuA1eIzP/2hu1MRZhy+rZpsgXoaSjyFiVus1mDcx3/1XAvF
	 9mVGTs60mycfNR289wv/fSGOs5VT5zeR/h4ZigrAoTBo1889zxcJ/qb+1dZpuZ158S
	 WHnCLiBWKK+Jkm2UnBeFf7btLuIVFcwUbAeU96mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3485EF80256;
	Thu,  2 Dec 2021 00:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C9D5F80246; Thu,  2 Dec 2021 00:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED319F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 00:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED319F800EE
Received: by mail-ot1-f50.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso37598326otj.1
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 15:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AAKdEKP97Ls7n7IAvtp5z2iqSUT8MEQ6F41F7W+0AQ4=;
 b=4fLWrrpbRuSctjfH7LwTU4EJ/Zz2MZY140wpS9lJazarj+wRBtOXsUYdABi/SN/88R
 O6/sdNfYEugbwqCnQdMW23ZGzAk5cYqbPKesfL+w/p+dcUK7HGFMISUNH0ICJNXbiyTk
 CizrsUXpxUb3gjGMITHMJi5I3KHDaAgWXPoLgyGY7DXjbDhSCsGzHXbBP5D+NBUvJ9tX
 Vsmp04RHCGcUqQcW6ZT0xszrG7mvvyKNJxmvYvkx4CZMTczBVDmnrmlKUioi1dJIDFQM
 Jt+ce5PehRJqaELP7Ro7UibaEG3lukAkfF7TzUDntFEdSqLexHuovkJmsoDojikYzwKR
 RfYQ==
X-Gm-Message-State: AOAM531fcEMbzrXEBg7M/JhCPHtb7w1uXm/U23KBF4JjdHpAwpBywSnJ
 NujqvGAf2ugTKjHGhje1Vg==
X-Google-Smtp-Source: ABdhPJwFGco+ndtzGH+H4l80NmfjEg0wHDCC2Paa28Apu7hnxPttflAx+Rqn/6LnLcW4bvBsRHXMjQ==
X-Received: by 2002:a9d:24c3:: with SMTP id z61mr8751119ota.100.1638402609383; 
 Wed, 01 Dec 2021 15:50:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e14sm603686oow.3.2021.12.01.15.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:50:08 -0800 (PST)
Received: (nullmailer pid 3241728 invoked by uid 1000);
 Wed, 01 Dec 2021 23:50:07 -0000
Date: Wed, 1 Dec 2021 17:50:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Message-ID: <YagKL2mSy0miICW0@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-3-digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org
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

On Fri, 26 Nov 2021 19:17:49 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 I2S binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
