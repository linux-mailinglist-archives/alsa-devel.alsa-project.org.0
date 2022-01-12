Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2F48BC91
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 02:44:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28CFB1A99;
	Wed, 12 Jan 2022 02:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28CFB1A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641951882;
	bh=CqgruQDLR3NutRrWUR5hEAG2435lQZK1XT8whRKfab0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ux3wWjxZzEx6RMdtKSeOc8Wb2xjMB5qt55kgUC7E89S1Q9L+AIV7rBpa6egLlj5CC
	 YWLbD7iJtOkrc7nnzKJeFrdQwwm+U+J2ONuxbt3p58J772ArnI1N2I6lUnnbwGUnOJ
	 0UrCXlrVa8jnIhgko5J7/ZQY7KRaqtRwAYq65ryg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E1DF80054;
	Wed, 12 Jan 2022 02:43:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3E02F80302; Wed, 12 Jan 2022 02:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACB1CF800A7
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 02:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB1CF800A7
Received: by mail-oi1-f173.google.com with SMTP id g205so1513440oif.5
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 17:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e/Tnb+6NC4NDoEen3QeGtmshX2VZpftcd33BR336ijw=;
 b=QzJ1yfAEjHr5a0DTd/vGfU/OeHTjBsIC7DX8CVJhHcZ16GQJFSBINcB4bPFfYivG9E
 uOo5Z46TbZ6g3WMYctL+4ynxboA3D3FXq2A2wJK3Hk6BEsvzQfioVycz0RvtbAs6dEUR
 wKCPORe5jHL8+pu8pyxIClRumeEH+NRBhDsgXfUU9Lm+OOw9tSeHNgrn1w5ThWduUgvM
 lexJ3ZcDl8GG+jJmJGlfvNSsqbUWzItElb1Tad8K4TxOlN3462LFsjVHlIpLL11ycjY4
 zijNXo1I5d46goNa5TnuchC2xeadlOinXbiNBWo78PVhKMmZOPjxMj/8BXuunFEmH4qC
 06/Q==
X-Gm-Message-State: AOAM532SvLSCGnzeo5wxuA+hOMIrpgrKPz+a/4HMCizPq3gcWXDqbHDa
 IqC7IcpSs0ir/HBeWCvU8A==
X-Google-Smtp-Source: ABdhPJzJTSFUtdEQLZAtLeh5H43ctftwk1Z0EICg9ZlaMpQR1Vk4Ah73GP2ShCBaFZnQGsqfer37hQ==
X-Received: by 2002:a05:6808:2113:: with SMTP id
 r19mr3759580oiw.118.1641951800511; 
 Tue, 11 Jan 2022 17:43:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r30sm91841otv.48.2022.01.11.17.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:43:19 -0800 (PST)
Received: (nullmailer pid 3887562 invoked by uid 1000);
 Wed, 12 Jan 2022 01:43:18 -0000
Date: Tue, 11 Jan 2022 19:43:18 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106064847.15588-1-yc.hung@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
> From: "YC Hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v3:
>   Fix patch v3 error : v3 only provide difference between v3 and v2.
> 
> Changes since v2:
>   Remove useless watchdog interrupt.
>   Add commit message more detail description.
> 
> Changes since v1:
>   Rename yaml file name as mediatek,mt8195-dsp.yaml
>   Refine descriptions for mailbox, memory-region and drop unused labels
>   in examples.
> ---
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
