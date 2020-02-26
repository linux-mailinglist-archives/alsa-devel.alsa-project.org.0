Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B7170230
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 16:20:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE503168D;
	Wed, 26 Feb 2020 16:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE503168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582730406;
	bh=lOBT0rdMCmtOqrkTD8P4KrT49+XAZOvwcefk8pJTKUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l8CZ7nqNsbzVK+K8QFPkPA8kDNWRP3212txkCwi0ewjz8gjpB8+9rqgybAWTadahG
	 08Oh8kdlY8m2AVjju+uYUSbKLw5qcyJWw6WrhVPVIkXUJR1qMqEtNOK1c16sKFYZef
	 fmzptYIrE3sd5mIXmYTlquU7nvdxgQXqkVnRgqUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04305F800AD;
	Wed, 26 Feb 2020 16:18:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 028B1F8014E; Wed, 26 Feb 2020 16:18:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C950F800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 16:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C950F800AD
Received: by mail-oi1-f194.google.com with SMTP id i1so3352727oie.8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 07:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fYm1FLvzpWart8O8B29NpqJZu5CXwIwbKoUSVw9pzR8=;
 b=Z0AoMyHFVU1Z05ikdMdloFaxr0llBqG8Wtf4NkOP9Zg/+DHAEduO4RqR/mojy5kJNO
 1N3I9UGe2fRZ3jpT6MihmIRgNsFYVLYh1PVNvmZ4JpZ1tXA0eB19tj5StYfk5HjKcMFU
 iIEpMzs07LSPW574Qfj5ZdndesX5I7Wg9Gi+PKYurTPer6z+1Z9LTZpK3MfMjc8E352m
 qTjFgSG9K6jlU9OoIEZNx3fLGR2z1ljUU7sv1dcW8CBU/8YEI1uIt1J0BFx7Jqv2xJF5
 65ewoqkSZEt/JXaZh0S1sjvxo/bsqhIs/REBs6LHE1xsayG13eIDMUIvXWdeOcjmvPp7
 IIgg==
X-Gm-Message-State: APjAAAUmcFGywi4JNnTfT7+NIZAe0ICKy9qdcuPJ7Qkpn5fdZUv7Znh9
 ZrOplWg1vjgtz6hd3ZsjrQ==
X-Google-Smtp-Source: APXvYqx2YW5yQL3vP6vRMKcu64GAOBwTbSvG2qgbbAZWZqs/Hl8t2xyHxllc7hnR9+UoRACfoez3Mw==
X-Received: by 2002:aca:5646:: with SMTP id k67mr3608068oib.166.1582730297617; 
 Wed, 26 Feb 2020 07:18:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p18sm214800otl.70.2020.02.26.07.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 07:18:16 -0800 (PST)
Received: (nullmailer pid 21302 invoked by uid 1000);
 Wed, 26 Feb 2020 15:18:16 -0000
Date: Wed, 26 Feb 2020 09:18:16 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 01/34] ASoC: dt-bindings: Add a separate compatible
 for the A64 codec
Message-ID: <20200226151816.GA21237@bogus>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217064250.15516-2-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, 17 Feb 2020 00:42:17 -0600, Samuel Holland wrote:
> The digital codec in the A64 is largely compatible with the one in the
> A33, with two changes:
>  - It is missing some muxing options for AIF1/2/3 (not currently
>    supported by the driver)
>  - It does not have the LRCK inversion issue that A33 has
> 
> To fix the Left/Right channel inversion on the A64 caused by the A33
> LRCK fix, we need to introduce a new compatible for the codec in the
> A64.
> 
> Cc: stable@kernel.org
> Fixes: ec4a95409d5c ("arm64: dts: allwinner: a64: add nodes necessary for analog sound support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
