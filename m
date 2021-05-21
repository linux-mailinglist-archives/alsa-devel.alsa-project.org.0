Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8B538C793
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 15:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2595C169D;
	Fri, 21 May 2021 15:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2595C169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621602853;
	bh=WV93ac5ZhlCwFgf6IyKsZeNswhyFdcaTvlclJSnC6jY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyOkjThiMxpBxdhF9w4/cAFots5m0upejyZxcEM8ce9FxrgZwKIiAcxcHQthSurgl
	 Pg1P2nBpzEFkWps33Q3kNkKOcBQ94a7M9Og2DNTGmO2DvzYtiK0BB70Kr5iuf26BWF
	 zFK5o4HNNxj4A9yyQbIMK/fD8l/T5UgieNLRmjqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F3FF80153;
	Fri, 21 May 2021 15:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06F91F80246; Fri, 21 May 2021 15:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E923F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 15:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E923F80153
Received: by mail-oi1-f173.google.com with SMTP id x15so19554490oic.13
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 06:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=F5/FDLp99kYvDUFQHD2N7h0ExV2sVgHTRXMIb5zlU0A=;
 b=VrSN/CxBkgq+pmUj4ih4NCKGJ4enxCK8qVYQ9WhNji+k9e/95c5xZQFZQq6xDu4SWW
 cLkK5JJrHd2PN1K2/xsJDU52f5+o5IDNCmclYzPVJLIYgKcCiviub6+aHli3YrR0i5oR
 mqr80hTvuV/vhXv47PvxpDTKTu5RKZBozI/7fousOWTCXzSLZaZLza2jDcazbumI50tb
 UP8+uUyNb0VvLOlnqgeiLt05f0acagc3lP2fbLKkpwRONWZOx9aIQWY3Gd/fqqvrwE91
 CAOsOAII7903ReHrR2KXEzOriRo3toxtXOWrUxGE7W2X5R66RwODQpBGVLAn4GKRfceq
 Xfkw==
X-Gm-Message-State: AOAM533HspSSWRqGHxb7QTHE+64USdYovv1lkjzQ2sDXHbtgU62TvtwB
 LXSQcxEwhs7djvAhvkauxA==
X-Google-Smtp-Source: ABdhPJy6cVgU2la1V7JAKJtCsrt8M8thmK+xhj1dCw7mcPs57IkquhQXoo9A6yq0bJujKlFT+Zp4Hg==
X-Received: by 2002:aca:4fc2:: with SMTP id d185mr2073811oib.123.1621602754559; 
 Fri, 21 May 2021 06:12:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q22sm1235945otl.11.2021.05.21.06.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 06:12:33 -0700 (PDT)
Received: (nullmailer pid 3780504 invoked by uid 1000);
 Fri, 21 May 2021 13:12:32 -0000
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20210521122129.1371-1-o.rempel@pengutronix.de>
References: <20210521122129.1371-1-o.rempel@pengutronix.de>
Subject: Re: [PATCH v1] ASoC: dt-bindings: Convert imx-audmux binding to json
 schema
Date: Fri, 21 May 2021 08:12:32 -0500
Message-Id: <1621602752.149998.3780503.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Fri, 21 May 2021 14:21:29 +0200, Oleksij Rempel wrote:
> Convert the imx-audmux binding to DT schema format using json-schema
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/sound/imx-audmux.txt  |  28 -----
>  .../devicetree/bindings/sound/imx-audmux.yaml | 119 ++++++++++++++++++
>  2 files changed, 119 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/imx-audmux.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audmux.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/imx-audmux.yaml:16:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/imx-audmux.yaml:17:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/sound/imx-audmux.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/imx-audmux.yaml:21:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1482202

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

