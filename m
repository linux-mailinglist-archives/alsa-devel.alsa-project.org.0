Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF724D5463
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 23:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B14421932;
	Thu, 10 Mar 2022 23:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B14421932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646950427;
	bh=SrbeWDUJA575QGcisqemZrmpfYz8rpK9Vq7rnn0N194=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRnv0TOsmjV0nEcgfdASFGIFNWuwrpT/LSw1IzUlvT1ENxRgWXKTEXJNuWEVOUcl2
	 wfdM5v02wHAu5/cNSu3IBS57D7tHPNzY4+N47L9gIB9S9oA+VvabUFtA0Alx/p1yfp
	 3oTKgtgpDdVCEfBrjOlq0y6PW29lFJKAKcc3MD6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F222F800D2;
	Thu, 10 Mar 2022 23:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF37F80137; Thu, 10 Mar 2022 23:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B06AF800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 23:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B06AF800FD
Received: by mail-oi1-f172.google.com with SMTP id 12so7418529oix.12
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=omjoz0M9biHPr5EKrbgbc5QfautyWsC0HyZJaIjRDEg=;
 b=7GPRsDeNfYIXTqfL8K/iabODFxmcKxNxgdCdqNAr2W1E8+KTrAPJ2Nqwd2ZkW2bKAZ
 U9Ta8N+aWdh0M3GgUnB9wfVc+xr+UBRh8O/jszEvzymYQl4VH1MLP3INESbzTfmURRDB
 22Hdmvk78TAPm9LVuWDV428FdNXg3DUoPD8kO7hE+HDeKOmr+VkYHm0NdCO8bPnGso0A
 YXk6k41UF5nksSCr9XOXh78QAOGpyl6a9pIoyca30RclbQsnwwsaRDPraWQNmSnMQt0G
 0MQh37WcaxTvqLzrEdpDKcHS+hQSSu7vU/20i+qHghEduSBMo+Dhho8i3KvysYEg4kCN
 Lrrw==
X-Gm-Message-State: AOAM53268ioWHcOd2sJm2Uk/y3/0BI609sRc2wndtsfVpOEkhBNgqSrQ
 CDxdtuqEh5a+xXHM6kX6rA==
X-Google-Smtp-Source: ABdhPJxHna6A8giuUalT7X77knNuIyLF0eFu5RYM8FUTp80V2T9F0GnnEXgbqAyoeBJg75biyF6+tw==
X-Received: by 2002:a05:6808:1528:b0:2da:7f1d:f847 with SMTP id
 u40-20020a056808152800b002da7f1df847mr1796358oiw.85.1646950353167; 
 Thu, 10 Mar 2022 14:12:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c14-20020a056870b28e00b000d7d5962242sm2821551oao.35.2022.03.10.14.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 14:12:32 -0800 (PST)
Received: (nullmailer pid 2175473 invoked by uid 1000);
 Thu, 10 Mar 2022 22:12:31 -0000
Date: Thu, 10 Mar 2022 16:12:31 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 2/5] dt-bindings: mediatek: mt8195: add reset property
Message-ID: <Yip3z3XoarN8TeMn@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308072435.22460-3-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Tue, Mar 08, 2022 at 03:24:32PM +0800, Trevor Wu wrote:
> Add required properties "resets" and "reset_names", which are used to
> specify audiosys hw reset for mt8195 afe driver.

The subject needs to be more specific and indicate this applies to ASoC 
and mt8195-afe-pcm. Try to write subjects that could only ever appear 
once as you can never make the same change twice.

Rob
