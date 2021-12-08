Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5846DC1F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 20:25:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 854B725EC;
	Wed,  8 Dec 2021 20:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 854B725EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638991499;
	bh=HD80nUN1CJljU3l+hcNod5sCpQzi19faqRMNk7TVXEI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UslJzPrk8fGbxJrLIIiuTtAwNcXtampqiIXckwvTyqBy+FK+zyRUBUe2v5vP5qkRF
	 eJs0AGjfHn4rwieHkEajO8AR84m9C4no2rA/VWqZbHukcd9SDjuvs0NQSCrXDfLo9y
	 EOm1WJWPRtfajIzht4e44pFIwdm/VwANk1hmM5JE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBEBF804EC;
	Wed,  8 Dec 2021 20:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0472F804E5; Wed,  8 Dec 2021 20:23:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B12A8F804CC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 20:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12A8F804CC
Received: by mail-oi1-f176.google.com with SMTP id t19so5494435oij.1
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 11:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L9tuImQipEdWA62iP26K1VCWaEa6caOxdPF4GSbxxRE=;
 b=MGjmfGSJyIfGG0hBQKjOLnO5TrGm/mnAwGLtIwT3OTSNMlUF9I7P7JR4uIZh0yu5Mv
 4JiPa/wiHSQlteHqMOd4RS9bzOdJAfG+VJHEw1YPe45z/toLeX4JXh5CylrtLgnjW0mB
 Cr/JgpdLdEaHW0YDsuHFFVnHfxr7Q4XFHIeR22W5Zp1v85SuxQhOm7TEK8CMUfvH6LuJ
 pmx0mAv9Sml08UTLuQOJNC55hcuosmfrpGKndThL2iWd9LU5kd9gyW1gsGlmxQx/vKZO
 Gr6F/EOSBTTJothHaHlHGSFKS6V3r6wwAK9YrnqPJhMfh2Vu0Sa9j0Zw9K5AZuSr1FRW
 +6Jg==
X-Gm-Message-State: AOAM53109f4nj0idDk8FEoB854rq+q4u2HqdtHavCdiFheaPuVH1VQgk
 Dzh0K3osj7p0oDGVB9cgiQ==
X-Google-Smtp-Source: ABdhPJwEXKjzQVMqf0l+eXC2BX/ExroyFCZSz0010kEAYxGIWrwtCnAV4BsJ38RUj5CtvCKiUIa+Sw==
X-Received: by 2002:a05:6808:3b7:: with SMTP id
 n23mr1367820oie.160.1638991412349; 
 Wed, 08 Dec 2021 11:23:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m12sm620250ots.59.2021.12.08.11.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 11:23:31 -0800 (PST)
Received: (nullmailer pid 184018 invoked by uid 1000);
 Wed, 08 Dec 2021 19:23:30 -0000
Date: Wed, 8 Dec 2021 13:23:30 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: tegra: Document interconnects property
Message-ID: <YbEGMp3P9GkkCGeQ@robh.at.kernel.org>
References: <20211206154624.229018-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206154624.229018-1-thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
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

On Mon, 06 Dec 2021 16:46:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the interconnects and interconnect-names properties to the bindings
> for the sound card on various NVIDIA Tegra based boards. These are used
> to describe the device's memory paths to and from memory.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra-audio-graph-card.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
