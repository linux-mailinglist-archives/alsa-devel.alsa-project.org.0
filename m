Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24466E7AA
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 21:24:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 081B565B1;
	Tue, 17 Jan 2023 21:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 081B565B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673987087;
	bh=TEbeMd55kODXeaZjXPpsfGF4GwIETYopY81kpIs1Nd0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qXFAU6GhXTFq3XnshiEMxApDRqmJZzTNALfcpZxwyaPL2AiMgk1aYuJrRF6HzF9eM
	 U06o+p7jOtye2/dfUfp0vMi6izMvgKk66SSBi46EBF1aq+qbmPVcnfzhsz+8nyHdri
	 rVy0Xy1n58GaGEkrc7ECl1F/HNRSHuOML1JzGjCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 903A7F804DE;
	Tue, 17 Jan 2023 21:23:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CEE6F8047B; Tue, 17 Jan 2023 21:23:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92D71F80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 21:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D71F80083
Received: by mail-ot1-f50.google.com with SMTP id
 v15-20020a9d69cf000000b006709b5a534aso18486676oto.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJGfJjVZYc/66/mbjIyBiEpogYyo22lwKH5yEocCOfs=;
 b=oIt8xy4NXtgnrN8EBPTAOafVsGE7nx2F8flhO4DkGQPJQqF28q6e9rrZfC8yk3+T/b
 dNAis9dxT/uRa92wA/EgHm+4oCtgDbi2KvmINzCJKgvo1p3Zr/TqAas/GM1cuy8gSPSR
 +oIiCjbP/5qWkjize2xR+ILybkLxWsBbQVyYlEt+/aE35ehVwp8U97im76GptqUP4dBv
 mj7qMhA1gcGsSsmJEkSQRrFHqbf1iMMc42pIVBvqogYzKpS32EGImrM6GkrcWti0AZN+
 lL2MQsLnNq3/qWzo+DjS8N6im8grTZShG9j3hak+K+nalqb1pYjn03TKiGGMxRw1DD8i
 D1qA==
X-Gm-Message-State: AFqh2konTuoDiFx0s8MwIzHdA8d3i6b9LwrmSDdyNHTC+3dvo5Otytz0
 q9s3a0KE8x2cCvyiJ/xRtQ==
X-Google-Smtp-Source: AMrXdXtrtMdthMi3WcbT2+KHvHkH22ask+SpyijR4WuOxDKY7bn2nv2wDl5pydtTKRPFzdumN9/Y9g==
X-Received: by 2002:a9d:3e2:0:b0:682:65f3:c437 with SMTP id
 f89-20020a9d03e2000000b0068265f3c437mr13384664otf.22.1673987018555; 
 Tue, 17 Jan 2023 12:23:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f8-20020a9d5e88000000b00684c9c77754sm1593341otl.69.2023.01.17.12.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 12:23:38 -0800 (PST)
Received: (nullmailer pid 3646579 invoked by uid 1000);
 Tue, 17 Jan 2023 20:23:37 -0000
Date: Tue, 17 Jan 2023 14:23:37 -0600
From: Rob Herring <robh@kernel.org>
To: Faiz Abbas <faiz.abbas@arm.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
Message-ID: <167398701684.3646521.11165836455939789490.robh@kernel.org>
References: <20230117061808.18422-1-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117061808.18422-1-faiz.abbas@arm.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Anurag.Koul@arm.com, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Deepak.Pandey@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue, 17 Jan 2023 11:48:08 +0530, Faiz Abbas wrote:
> The simple card driver already has support for a simple-audio-card,plat
> property but its not reflected in the documentation. Add documentation
> for this plat property.
> 
> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
> ---
> Changes since v1:
> 1. Updated commit message to indicate the property already exists
> 2. Removed redundant example
> 3. Fixed formatting issue found by 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> 
>  Documentation/devicetree/bindings/sound/simple-card.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
