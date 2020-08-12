Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634CB242F87
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 21:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9AA6166D;
	Wed, 12 Aug 2020 21:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9AA6166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597261529;
	bh=y4ELIOsvGVAFxRhK1EnW2G9rTljAV6PZKr1+MkHcOZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdtrBjrT4JzDspvOH2K6OvPx6oUkZzJpLqtHDtyTMvq9Z3g2Nrf/EPiImUDnuHddj
	 5FL3h3nnR56TbVuuUYffYu7bRT0gGvd5qFehojB0DFtkCbgnJZZBUHdpwOTf9IZaqW
	 e1Qp4QcKHjxmUESVh4eOrI4rGDjo5KWXlsNOgzeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EFBF8022D;
	Wed, 12 Aug 2020 21:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C96EF8022B; Wed, 12 Aug 2020 21:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5B6BF80147
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 21:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B6BF80147
Received: by mail-il1-f193.google.com with SMTP id x1so3045442ilp.7
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 12:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F25zreK/uMPj1Zeh3/PKOdX/kNSOqJf1CQzVccpZong=;
 b=k1KhlYUwVl0l7+pHIsslEPaiMAQ/EubjnWbRhl7c9bpwBItt6gHjCFZvi8ZtH+yWZx
 5kadsrA+qamqkzK+9gUVrBsOgzYHpyNMdCdMPRSJN6LEqp9WuaUegfAQ1/7HVGw9IlmT
 fy5DzDDEzRoaz12F0YYDoBiOHEeacMz91Pgot7oAesKFjiQxmCoYR7ax6SYYhHKWJh2n
 MwtEpHZWY71eSOsGrj/7icTM2FYYKfxpsaEyVmmAUamsc6S4OQ11hmXoJbikS4w3wVxF
 ZI1bzQ0nfLzMc8+BHawTouBlJ2xmXK+Xbfn75ml73hzEygu0Fd2ZEnqGK9O48/FxA/Xz
 npaA==
X-Gm-Message-State: AOAM530e3TosAY+XU2SgOBSL8HJRscKJ5cKWkCufpAz41bPR6FywhoXP
 8DVR4+ApG2ZT4Uqqmj2VMw==
X-Google-Smtp-Source: ABdhPJzXbKpQczi7VhkjG9X+vXDz4AATVf/LWQQxKg2HZu8cGQum7joDaIR3c56n1O/YtSkfWB1Qog==
X-Received: by 2002:a05:6e02:1207:: with SMTP id
 a7mr1177891ilq.303.1597261413373; 
 Wed, 12 Aug 2020 12:43:33 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x12sm1503060ile.14.2020.08.12.12.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 12:43:32 -0700 (PDT)
Received: (nullmailer pid 2586064 invoked by uid 1000);
 Wed, 12 Aug 2020 19:43:29 -0000
Date: Wed, 12 Aug 2020 13:43:29 -0600
From: Rob Herring <robh@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sound: add DT bindings for Microchip
 S/PDIF TX Controller
Message-ID: <20200812194329.GA2585991@bogus>
References: <20200803081851.102570-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803081851.102570-1-codrin.ciubotariu@microchip.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 alexandre.belloni@bootlin.com, broonie@kernel.org, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 ludovic.desroches@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
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

On Mon, 03 Aug 2020 11:18:50 +0300, Codrin Ciubotariu wrote:
> This patch adds DT bindings for the new Microchip S/PDIF TX Controller
> embedded inside sama7g5 SoCs.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> Changes in v3:
>  - removed 'oneOf' from 'compatible' property;
>  - added 'maxItems: 1' to 'dmas' property;
>  - removed pinctrl related properties;
> 
> Changes in v2:
>  - replaced https with http;
>  - reworked example, included bindings;
> 
>  .../bindings/sound/mchp,spdiftx.yaml          | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
