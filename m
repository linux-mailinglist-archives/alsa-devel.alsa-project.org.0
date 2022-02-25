Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B96C4C4B18
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 17:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 227891A99;
	Fri, 25 Feb 2022 17:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 227891A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645807471;
	bh=fR2ephJ5cggNJbvz3sdChMuZutVc97auPasXASa+tdk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTZOOSa4dPqhwdwCa4Pdsy4HRUkEcFN9RM8a7BneKlU6+LaRLVZVmPmKIh5I8SNbk
	 hQdfsOtRwrxXhEFanlITBYQ/+xpf3lbSGkq6HFt2kQprPvuRlNAn3jXqiRWJbuk+rJ
	 FNGXDhsIpeRLkDo+slfsu9qcVSYJX4elDZHG7wWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ACD8F80159;
	Fri, 25 Feb 2022 17:43:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FCBCF80132; Fri, 25 Feb 2022 17:43:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 579E6F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 17:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 579E6F800E1
Received: by mail-oo1-f52.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so7008477ooi.0
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 08:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Si+iJ2zhKvF5YLvRPOXET3hV1fppMjzs+UaFXFDwI3Y=;
 b=dCIOvX4BWq7qjN/0oWd4LyworS0Z837nUFd/wxN+fF6h0pfOuLsYQX52OiKLTl3nMx
 lvrJLah+skFA/IUdmLov/ZPNgV288i5TpRLzPLEu701oVcrGgeSk/+972NVHZ4FpDVKn
 6y6aw8teXje4xsct8WhmRDioEcwtMl0IcPJrUzAYXc4iQq/PmB2D8hnqIHsG12Gj+XHc
 LFg81+qqZ3GIUJ+2WAlXEpT/D/Bd0miE/gcNuhnem9Ey0PLCUdpZBKFFXVO4nkKtjJvx
 39e6sMFIGX3AHV56y9jt9YDGiJw/iSTs/FX2vzB36enTFq9RHJvChLluVjCii2SKrwVD
 dFlQ==
X-Gm-Message-State: AOAM531UuZO78zdMKKEwQo7yJ3hTMhTfecWkP8uK1JoG2QUCLe/UEX3i
 ASiHbILUF3NdsCn3Jj3g8Q==
X-Google-Smtp-Source: ABdhPJyVL64erAPpA8+nT5f7+kdz/RH/QaYjqSDhpt4WRNkeN4cGTxKxp8BLy29TQl4zF7yzzWSTlg==
X-Received: by 2002:a05:6870:b402:b0:d3:3712:efa7 with SMTP id
 x2-20020a056870b40200b000d33712efa7mr1652745oap.88.1645807395186; 
 Fri, 25 Feb 2022 08:43:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm1198927oon.22.2022.02.25.08.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:43:14 -0800 (PST)
Received: (nullmailer pid 1063989 invoked by uid 1000);
 Fri, 25 Feb 2022 16:43:10 -0000
Date: Fri, 25 Feb 2022 10:43:10 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v2 13/17] dt-bindings: mediatek: mt8186: add audio afe document
Message-ID: <YhkHHl8u02MY348o@robh.at.kernel.org>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-14-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217134205.15400-14-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 zhangqilong3@huawei.com, broonie@kernel.org, tiwai@suse.com,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

On Thu, 17 Feb 2022 21:42:01 +0800, Jiaxin Yu wrote:
> This patch adds mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
