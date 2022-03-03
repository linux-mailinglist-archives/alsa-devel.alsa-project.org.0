Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517514CC591
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 20:02:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D821AC8;
	Thu,  3 Mar 2022 20:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D821AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646334133;
	bh=jKzMyKCek/vs84ee7QXPZW7/c3RhytWyJvUV5sdPcnY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ewasOR7g6FmU5dduU41+jtWWojaG1nnrVHrUqSh0S6H0Mxo+NId25EblrqTLD0SKG
	 vsxsC4HwEVkBZT/FgXXxar/ZedWR0Yw4kQz/PfmERL9cWVeNyVEM/3lL2KA6uHA/Jw
	 RfPoJXkAImr3xI7Nqusdx88XXtO1WATfWGPEuYAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40505F80166;
	Thu,  3 Mar 2022 20:01:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6876F80152; Thu,  3 Mar 2022 20:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8100F80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 20:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8100F80109
Received: by mail-ot1-f47.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so5391204otl.12
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 11:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dEqyBR6kCW9UlA1zBsmnhStMOP8YHEJxcgst1aAegPQ=;
 b=t8WmOup4o4/AQs05cY2p24RMe2hwD7miS9ox/7UAuFFzzJU5IiXATviguf2hLe6NDK
 9OMWO1YZMjBgy7NUFWaFSmjjv8AAkEZJWrqQ+Cew/w55fRe+OBitwF1Ld7ujuDhqM/rg
 sB/3yNNx5NKPO+gt6wIpI1J1LOJ8lJpd+39jkBkQTj2m0bAq8IastmOURwMpX6OgEznQ
 azmiyaYoaP7b9wdFCx6m//WJWQqfW8TcFYSO8L5dWijs8QAAEEzwWDWUhDnHgkIGAfYd
 /DCQQovYalKfL05i9MPbOJp1SXKATWSctf4kCi6pPWhBl4I2MhbPt2SrdmQJeAeYqvMo
 mQdg==
X-Gm-Message-State: AOAM531j6Pn1jlBICma1nOSz8UcreBNb4u/ZGA4/QzW4WX7bS0ESa4gC
 rIVLubV5VTxbPIcLSZCuGQ==
X-Google-Smtp-Source: ABdhPJzs7+4gMhuA2iPpZzX05xAcl9nkwd4vsQrGe/23G32SXPHyHmKj5dA92zRXVBLstlHcEeuVSA==
X-Received: by 2002:a05:6830:2783:b0:5ac:e99f:70fe with SMTP id
 x3-20020a056830278300b005ace99f70femr20213907otu.122.1646334055673; 
 Thu, 03 Mar 2022 11:00:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 x25-20020a056830409900b005af164235b4sm1318358ott.2.2022.03.03.11.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:00:54 -0800 (PST)
Received: (nullmailer pid 2139596 invoked by uid 1000);
 Thu, 03 Mar 2022 19:00:53 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220303173059.269657-21-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
 <20220303173059.269657-21-tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 20/20] Documentation: devicetree: CS35l41 External Boost
Date: Thu, 03 Mar 2022 13:00:53 -0600
Message-Id: <1646334053.475639.2139595.nullmailer@robh.at.kernel.org>
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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

On Thu, 03 Mar 2022 17:30:59 +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document external boost feature on CS35L41
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l41.yaml        | 42 +++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/cirrus,cs35l41.example.dt.yaml: cs35l41@2: 'cirrus,gpio1-output-enable' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1600514

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

