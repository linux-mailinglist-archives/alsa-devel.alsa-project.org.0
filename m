Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D112E3F5E02
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 14:31:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65DF0166B;
	Tue, 24 Aug 2021 14:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65DF0166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629808293;
	bh=PF7pnL6LjuBD09tSvklwRPYxjH+7LM11/zNyNFKVMTw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ky00+2l9HnVuPeOxlMv9//gx0ONQGl6XcQ/njDxIZ/Sw1MiDPFseGyDakGNRTIgQd
	 NMjvZNR//Iq3q1Xm5pwPh+ee8h5ZnC2OARncqkIyWcpegoi3UXe7vnsFPY09kieu8v
	 Rz9bR/1PGA+J36tqxfjpj3HRbDxqrtHUT93Vbmu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B2DF80087;
	Tue, 24 Aug 2021 14:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3816F801D8; Tue, 24 Aug 2021 14:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E80F80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 14:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E80F80087
Received: by mail-ot1-f44.google.com with SMTP id
 y14-20020a0568302a0e00b0051acbdb2869so38707399otu.2
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 05:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=wCddbBkBFsbpc3gLzGC+afVI1xhhkM3RxpwaNW7mQMQ=;
 b=jk4xS6cOIAhD/UJdGrYYNbY4tgumQoeXPRp6I01SmZncP6M1D5Fu2ES+GOeXVl0GO4
 42APJV/edciYzlLSMKZ1hzQ7UQApQTHvEuAm+jHzmb1T3NKaUo0OqbtcldHcq+Z5/6qB
 nhDZguprMvZGkF/sBIVQYa3iUdWN0SS94NXWRU/Ljefy1+S0RPhqHV/0oIItZvE5ROEe
 bSSZiL3VELTkvI/fR2aVOo5efE6zRxbxZvylDChZp+4TwWOLB7hTy/DIh+E5DPIWmfaF
 mpsyYonRuZJKD4oQnFGKGuO8lFz7LDtvcchC4AZW4nModXKjr9DV7UIvwAmQQm8IQbP/
 PIgg==
X-Gm-Message-State: AOAM532Km4osHPVsgnsZmcSrH+fK+Kvpj6Ym5USFxFbJfKs4bVxr+vo/
 oEQyUhqNIrF4AFS89uejpA==
X-Google-Smtp-Source: ABdhPJwyL2/AOUZUc091A0XC9ihGhEYxxo6IDHFdYPz6/N3UNb8LYue1N6moEAb+PoXZ9uK0U/oNlg==
X-Received: by 2002:a54:4791:: with SMTP id o17mr2641977oic.133.1629808182653; 
 Tue, 24 Aug 2021 05:29:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s24sm1487318oic.34.2021.08.24.05.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 05:29:42 -0700 (PDT)
Received: (nullmailer pid 61433 invoked by uid 1000);
 Tue, 24 Aug 2021 12:29:41 -0000
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
In-Reply-To: <1629791656-13698-2-git-send-email-sugar.zhang@rock-chips.com>
References: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629791656-13698-2-git-send-email-sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v1 7/7] ASoC: dt-bindings: rockchip: Convert pdm bindings
 to yaml
Date: Tue, 24 Aug 2021 07:29:41 -0500
Message-Id: <1629808181.201442.61430.nullmailer@robh.at.kernel.org>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org
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

On Tue, 24 Aug 2021 15:54:16 +0800, Sugar Zhang wrote:
> This patch converts pdm bindings to yaml.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
>  .../devicetree/bindings/sound/rockchip,pdm.txt     |  64 ------------
>  .../devicetree/bindings/sound/rockchip,pdm.yaml    | 114 +++++++++++++++++++++
>  2 files changed, 114 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/rockchip,pdm.example.dt.yaml: example-0: pdm@ff040000:reg:0: [0, 4278452224, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/rockchip,pdm.example.dt.yaml: pdm@ff040000: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/rockchip,pdm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1520109

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

