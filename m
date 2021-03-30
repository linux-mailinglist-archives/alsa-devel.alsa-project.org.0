Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D334F48A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 00:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892AA1673;
	Wed, 31 Mar 2021 00:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892AA1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617144448;
	bh=w9ngSkZzR/unWq3zDaMRN4ju1djyeL734dg46zLhd2g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBNxo8eP8+GKbWB4LIPHjmmG3RLiCa2nF0E0yskXZKd3OaC6YRdwFL6aowFlJEou1
	 oqUOkiaa1gRHF7soA4ThqLEMaCarfhFlXT9QEP7vbEgKhenPheMfrF7CUdZXnEXt/S
	 L2hdYKZTUgBJ74RAdIxFnA2xU/Xaf+0AWbgv6QR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F07E8F800B9;
	Wed, 31 Mar 2021 00:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8418DF80240; Wed, 31 Mar 2021 00:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86B9CF800B9
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 00:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86B9CF800B9
Received: by mail-oi1-f181.google.com with SMTP id m13so18066242oiw.13
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 15:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cLGY/U77bjaTReaj2IIARZWRCCbRNc7FTLFruMbM/vg=;
 b=DZtrRNnhDeRQ00mzrQQUgFnwpp05b9l6mbdH+LSwsBUSiubHEaNpA9hNFOwjetV008
 p+39ZjoZgyiXxTQf9BSCC+dTifFtgTAVXaWCsvryYCKQdZyfKb6/YJkSAuLX1S186h5k
 oOovxwNiNvEBLeJQLnOE2UGDQLEuFwtHUCL05F47mkJHcggIVY5rrUSxqW1h/CP0ofdd
 5JNT+T/XYHx0yeFNDNxjeOseTsiYTYNlAFoaOOhXrn/XQuozOFaWF29l+1ybb4L/Rj5Y
 C64ypt2WOnCqWfyZDCpnNoFdp4Kta4GWYZ9XgmweXveF0008rRgBFNLx7fzm0xM08IUV
 MLDQ==
X-Gm-Message-State: AOAM5324i0psr2K7S4VnLWiRTKCLMGFGbnooO3QmQ925SXlZHhPxtVvn
 qf3ot7SF0/VyQGGVye8RzQ==
X-Google-Smtp-Source: ABdhPJwEBrY+z1c9H+Ydo5wbfdprtBqSKqvER/L2vbgFu9N7KHmRm7qB+S0Adse53LXloREJLLHdAw==
X-Received: by 2002:a54:4492:: with SMTP id v18mr141539oiv.49.1617144353522;
 Tue, 30 Mar 2021 15:45:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s193sm79142oih.52.2021.03.30.15.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:45:52 -0700 (PDT)
Received: (nullmailer pid 850891 invoked by uid 1000);
 Tue, 30 Mar 2021 22:45:51 -0000
Date: Tue, 30 Mar 2021 17:45:51 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'dais' is a required property
Message-ID: <20210330224551.GA842101@robh.at.kernel.org>
References: <20210330030631.2253-1-thunder.leizhen@huawei.com>
 <20210330030631.2253-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330030631.2253-2-thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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

On Tue, Mar 30, 2021 at 11:06:30AM +0800, Zhen Lei wrote:
> When I do dt_binding_check, below warning is reported:
> Documentation/devicetree/bindings/sound/renesas,rsnd.example.dt.yaml: \
> sound@ec500000: 'dais' is a required property
> 
> I looked at all the dts files in the "arch/arm64/boot/dts/renesas/"
> directory, I found that all nodes that contain the "dais" property have
> compatible string: "audio-graph-card". So I can be sure that the
> "$ref: audio-graph.yaml#" should be corrected to
> "$ref: audio-graph-card.yaml#".
> 
> In addition, not all nodes have compatible string "audio-graph-card", so
> the "$ref: audio-graph-card.yaml#" should be described as "anyOf". To
> ensure the validation of "anyOf" always passes, group it with the "if"
> statement, because the result of the "if" statement is always not empty.

'anyOf' is probably not right here.

In any case, the is going to conflict with my series[1].

Rob

[1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
