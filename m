Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C1F0911
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 23:08:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 888BF16E7;
	Tue,  5 Nov 2019 23:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 888BF16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572991687;
	bh=A8mwe9wQJtWXbmfTU1IfEkK1Q26zuHaQIqf/o0rnmuQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vpg1IplImTUtIcNMEC0HlJy2uvTS6q5YZ6pX9PsNCB9HEVsuHSGwrkzLveyluVm/b
	 m1MzOKN3cPOAA5PU8sluUsIBr69mm/ZQm08rBX/RxoxYbZB2ApPlzmr2ates1BCphb
	 LrZk5Ds5p2uGZhS07IHpy/TdHNAiG44YBcQW+Bb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3618F8053B;
	Tue,  5 Nov 2019 23:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D703F8049B; Tue,  5 Nov 2019 23:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5557CF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 23:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5557CF8015B
Received: by mail-ot1-f65.google.com with SMTP id r24so2764587otk.12
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 14:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gisrq4TxhtoP8Q30cWa1tTfB7XNXHFmOi8fXi53w+bM=;
 b=uXqesS4EMIfxrDfR1/NK/OERMjTNJ7TYe/yZrnyAv62g3ygVbin8Nb7t1VNkWc6XxH
 UPgkofXqDQviqP6YLioEYgKXcfCssl8vdDgzaloNXTIVClujeW/lv8TWVy98kM/kwn5+
 cYvzQNKQvm64VxD2ybkr9SxwTsjKxjNVgGIyjkHu3KoTpYf/v6hEfY3AnuU/IrBT5DGi
 xCW0tapwQrv5C8euunZfTHvzeePTeKFW6SBXe93W2jPaNPPhwKuGBhEUqgvcPwFjvE2X
 TKoDjSbKbDwerQdqD42uTyUXXesVyWy6+2byVvFQp8dB21quqCkRJBVdCLMZAkaHB0bh
 NyyA==
X-Gm-Message-State: APjAAAVQlNAsS6ekgN6K2/Se9Ttq68ry6LaQRseoXxkjC2wZsQRKf98F
 B3qQrQEyYXSHFEiselP7pA==
X-Google-Smtp-Source: APXvYqziXsft0r6jrafQ9WzZOixRtOGMfgoIJWpJT32hv2BnJtDlqlWeelJ4ao+H8Pht1CzipcEy0A==
X-Received: by 2002:a9d:6a50:: with SMTP id h16mr5137307otn.370.1572991575309; 
 Tue, 05 Nov 2019 14:06:15 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b12sm5910543oie.52.2019.11.05.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 14:06:14 -0800 (PST)
Date: Tue, 5 Nov 2019 16:06:14 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191105220614.GA12397@bogus>
References: <6465fb7dfaa68b6693584bcfa696894628d45fe9.1572435604.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6465fb7dfaa68b6693584bcfa696894628d45fe9.1572435604.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 30, 2019 at 07:41:26PM +0800, Shengjiu Wang wrote:
> In order to support the two asrc modules in imx8qm, we need to
> add compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"

Are the blocks different in some way?

If not, why do you need to distinguish them?

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index 1d4d9f938689..cd2bd3daa7e1 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -8,7 +8,8 @@ three substreams within totally 10 channels.
>  
>  Required properties:
>  
> -  - compatible		: Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> +  - compatible		: Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> +			  "fsl,imx8qm-asrc0" or "fsl,imx8qm-asrc1".
>  
>    - reg			: Offset and length of the register set for the device.
>  
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
