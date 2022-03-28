Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A864B4E9714
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 14:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466241896;
	Mon, 28 Mar 2022 14:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466241896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648471980;
	bh=rhsIQj7nBr93FOQ9bJZloJK9GH/Qk2/DTIZDyoauwxc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTE6jPLnvQeM8jIqXRsx7/1iJMm699EoLX0T4sYnEMG6o8nu7Qx5PtRrSGtrw7cEL
	 o0cj8zLGxW6Wg7Nq7MmTM7IBDTS5Z8b8ljNBnKkRe2XXPC5l9hyKL4mB3kfsy6mWpX
	 Hivjc5mLjcF1k5ZGufqIyn2HiKD8VvjPChWgeNcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D9FF804CF;
	Mon, 28 Mar 2022 14:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C96DF804CF; Mon, 28 Mar 2022 14:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10635F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 14:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10635F80128
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-df014ca245so2788251fac.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 05:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=GP1bdWVmsBSkAlGr/Gp2UnisAPKv1M13pEpomMv6UjQ=;
 b=3Wxm+NqLK1E+LKBGnmmn17zcKEe297iwrF5ZHRApKYMkm1Ugj6nUsIZKT1ag7eLubE
 3hwXSxPbofzaVJPHVyksC1u6s8yI0cMnVRU0NqbdRWv1BGNYbE9jhviQRCV56z2BRJOr
 CeQuLfFYphPzHuVG4j2QfsOZrmTBKzoGPjb6zhFyGlCW7uIzqfJWP6AoDYbGCZJpMJcq
 nDa0QrjJAQin/CwouOBaEjKa5FNPbW29ogMF9JTbqDtMGIj22xl8e8ytK8/QVraqfKzU
 mf/9ZIAjoJT9z9QxD9TeRZ/+e7sBIlaV6Orwil71ilquMSDleypxK3jzaCJS6ayOsjC+
 je2A==
X-Gm-Message-State: AOAM531/ym0ZrpnpUq9xITNIlqYen5hS9xVFOVXmOsRZoz6rFqYg1i57
 RKoVGekeqd6zBabXT8mFRA==
X-Google-Smtp-Source: ABdhPJwT3yYx6LIv4tBCmidDkpcH2xuaILIymk6sDk/mQOiMYgThNK+zceGc8kgIC3YCSqd7omS/7w==
X-Received: by 2002:a05:6870:65ab:b0:de:37be:30a6 with SMTP id
 fp43-20020a05687065ab00b000de37be30a6mr14525453oab.70.1648471871476; 
 Mon, 28 Mar 2022 05:51:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n15-20020aca240f000000b002da2fc73741sm6940329oic.33.2022.03.28.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:51:10 -0700 (PDT)
Received: (nullmailer pid 2153576 invoked by uid 1000);
 Mon, 28 Mar 2022 12:51:05 -0000
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1648448050-15237-2-git-send-email-spujar@nvidia.com>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-2-git-send-email-spujar@nvidia.com>
Subject: Re: [RFC PATCH v2 1/6] ASoC: dt-bindings: Convert rt5659 bindings to
 YAML schema
Date: Mon, 28 Mar 2022 07:51:05 -0500
Message-Id: <1648471865.814225.2153575.nullmailer@robh.at.kernel.org>
Cc: oder_chiou@realtek.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 jonathanh@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, krzk+dt@kernel.org,
 peter.ujfalusi@linux.intel.com
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

On Mon, 28 Mar 2022 11:44:05 +0530, Sameer Pujar wrote:
> Convert rt5659.txt DT binding to YAML schema. This binding is applicable
> to rt5658 and rt5659 audio CODECs.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt5659.yaml  | 112 +++++++++++++++++++++
>  Documentation/devicetree/bindings/sound/rt5659.txt |  89 ----------------
>  2 files changed, 112 insertions(+), 89 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/rt5659.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1610026


audio-codec@1a: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml

