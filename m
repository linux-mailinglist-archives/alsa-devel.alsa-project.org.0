Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD84EB6C0
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 01:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5EB1752;
	Wed, 30 Mar 2022 01:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5EB1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648596498;
	bh=lXv6IuUPLOuIWJpkhwAVPVx2PxoRpWJn+TzT1aGzWjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1ujZZE7N4hoZhKpg1PPyiaHrYZsLBQoFRNu7m9vmAMMgGDz1gk3UFgE0DYwIWMmp
	 Hba6YhpShV08bS8DYQu9aZv/O1N/iLbcIfJLLc9uo9rW+6aIY5uVn4OyoBWzyRxLhQ
	 KVMJk5VqTOOaVOU7E71NELEp7Ds6+uLjh3lKFQ5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFBCF804D6;
	Wed, 30 Mar 2022 01:26:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CA58F80311; Wed, 30 Mar 2022 01:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35D5DF80311
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 01:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35D5DF80311
Received: by mail-ot1-f50.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso359467otj.9
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 16:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Onx8whWtYNziaSOWeikFCxBSNS52wmmziZDYwpwSOs0=;
 b=oa78fy/tlBbNs6kPD4Ocz5mtw+HoMpBc4T7f8Q+cLuuaBW0kfzmOcoyfiXQfyhOn5/
 71Rdk5MzxvjmACaGULHhdLpLNiSAC/oOeRx/BGrYW469py84vmWICmbEE/xCw2rc6sQ/
 R0sVUPbawUvR8c//lE8gOjl0Gy3DQnBf+59Y9YI35yZkA4U5IBrMJQpD2Tq7s68M35YL
 GdxzNQEQOqWh7MYsw6FTyn6v/2xdvybuE2WC0K4CIKmHH0O2jFtLVp9ENLTgF4C1b8Yr
 Xfr/zui/c6Re6rm4T4g/ZpGPCu5E4VuwnZd1GLmVs1bXTAztTyg1K0AXvywr6KEFd+Jc
 MB5A==
X-Gm-Message-State: AOAM530SnDj/Oj9MJHNHGKrxR8wm1MS3QDR8myvLeVrRa+4mvR56FtEy
 5m2WeKLBOBPg5sSLgDtG3g==
X-Google-Smtp-Source: ABdhPJwgMeIuk1f9wBngw9sMNVUFDANIzQF6qRJJfG+W5rTEJltAFjng0HItLceLMRGMH3tlj1E5wg==
X-Received: by 2002:a05:6830:82a:b0:5b2:36d5:1603 with SMTP id
 t10-20020a056830082a00b005b236d51603mr2173120ots.240.1648596397558; 
 Tue, 29 Mar 2022 16:26:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q12-20020a4ad54c000000b003245ac0a745sm9268545oos.22.2022.03.29.16.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:26:36 -0700 (PDT)
Received: (nullmailer pid 1552943 invoked by uid 1000);
 Tue, 29 Mar 2022 23:26:35 -0000
Date: Tue, 29 Mar 2022 18:26:35 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v4 6/6] ASoC: dt-bindings: mediatek: mt8195: support
 mt8195-mt6359-max98390-rt5682
Message-ID: <YkOVq9XA9VGSNqzc@robh.at.kernel.org>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-7-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-7-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, tzungbi@google.com,
 miles.chen@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, 24 Mar 2022 13:38:51 +0800, Trevor Wu wrote:
> This patch adds compatible string "mediatek,mt8195-mt6359-max98390-rt5682"
> to support mt8195 board with mt6359, max98390 and rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
