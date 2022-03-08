Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8F4D2348
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 22:25:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5BA17C8;
	Tue,  8 Mar 2022 22:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5BA17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646774757;
	bh=2Lvdu3NQxwu3/zNl4soTY3BjZxqQ2P+3Ss5h7PVAiQ4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KaQ7QIUHC+EU2neBa8BaLG0QgEZnBEn+vE0xtOl4lIGTJwX7Lg/rz2yQxybA5n8Qd
	 2Dq8+BzzhTZXx0U92YWCCQfRGjhbafrzT1ACC3niY3dJgkrZ1yEUBYpo4qWoFnd5dG
	 E1fDfSwzje5Nyo5oVTSFc6Rhugb+mXlNA4C8FLjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 778C2F800D1;
	Tue,  8 Mar 2022 22:24:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FDA9F8026A; Tue,  8 Mar 2022 22:24:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40938F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 22:24:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40938F80121
Received: by mail-oo1-f53.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so580014ooj.2
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 13:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=F7AKtHuwjN2s2m0mkt2Zt0oseAiFhWfXD+KKCoRGMtw=;
 b=pzw35HcFhwkQwYoKgbBgzJJwpu2xQm89Nf9YIZWmSTh+pZYJURh/Z8DakyVCHlssfK
 WlWNl3oQI09+RaW7XypQ7N4cCA22zJE73lJKKCWfK3gigtVJfJmWMRw1teSO//znutco
 0wQamDWdZrEgMzvAF9iZjcPQ9u2NbB4HMs7T2fDiz7yYnRI3mM3F50E/PtPK4Eurgvzz
 kvfC3o+xhaMt/b+9YYOdOSft1KXIpGP6pvJWCn+NOYMCOX0e2I9daDKN80Rg2NJ06w6X
 oUthJA2MGSMt4Vk7oSYvlNCPb6TF3U6q2/MJukeUxh615TdZHcSzMnogzENyA3h7Tg1u
 TUlw==
X-Gm-Message-State: AOAM532PFwOl5Ns51J70hdjLUy41ALf+O22qsvLlBKmu+kPibxm+BnoF
 kWb/yny8cKMTVJPj0vvbxA==
X-Google-Smtp-Source: ABdhPJz5aT6/Ogkn9SbklQVQ5zCOz8O/vrq+Jch3k6VOBoG/Sn8N0p4eGgchTEX6dq8p0pcQvErG8A==
X-Received: by 2002:a05:6870:313:b0:da:8850:c0bd with SMTP id
 m19-20020a056870031300b000da8850c0bdmr2015277oaf.52.1646774681244; 
 Tue, 08 Mar 2022 13:24:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w12-20020a0568080d4c00b002d3e7a6f8e9sm25448oik.26.2022.03.08.13.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 13:24:40 -0800 (PST)
Received: (nullmailer pid 1390767 invoked by uid 1000);
 Tue, 08 Mar 2022 21:24:39 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220308171730.454587-16-tanureal@opensource.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
 <20220308171730.454587-16-tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v3 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Date: Tue, 08 Mar 2022 15:24:39 -0600
Message-Id: <1646774679.497272.1390766.nullmailer@robh.at.kernel.org>
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

On Tue, 08 Mar 2022 17:17:29 +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad
> 
> For external boost, the GPIO1 must be configured as output,
> so the following properties are required:
> - cirrus,gpio1-src-select = <1>
> - cirrus,gpio1-output-enable
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l41.yaml        | 44 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml:152:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1603100

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

