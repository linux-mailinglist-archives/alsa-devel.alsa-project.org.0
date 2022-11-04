Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9261A3A4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 22:53:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075DAE0E;
	Fri,  4 Nov 2022 22:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075DAE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667598811;
	bh=slw8tN2qIIMKjx+VZUa6HLocKkSj3G2d7zEjYvPkZls=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hc51bqPJYBrVOfviU4IgvaX0PZZdfJ6RmgJ/rsIL4RRdU0tPPJAcM3PN1bCw1fL65
	 OJ/dwJH0DTYZR+txcLF9dkKvUR4dZ6G9O0TRsTgHX0767ZtGTf2JLALkeRfabbJafI
	 mcSjRy/GRvx8QsSPCRbqcUsiRUATyXFv56van5Wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC29F8047D;
	Fri,  4 Nov 2022 22:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484EDF80448; Fri,  4 Nov 2022 22:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BC90F80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 22:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC90F80149
Received: by mail-ot1-f43.google.com with SMTP id
 a13-20020a9d6e8d000000b00668d65fc44fso3398825otr.9
 for <alsa-devel@alsa-project.org>; Fri, 04 Nov 2022 14:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/H9wv3Ry105hn9YPLlG4cTqcOFeFDcAOOAhrcWbf4J8=;
 b=DvOt1hRGkGa4ZM296B1GYzBEfiGGWZvR1qWFswFRK1LoYGwXSMCr7XslPlye7+uuUc
 HlzlG1uhV0dGa7UsHKq8njWiaqNXK7yzPcalws02utwSuKUfO0iYG/r7/XFYgYkNZmhL
 0inqBCpk6Au5zHSFZfmbamn7xeBev1Z6ax4fom/bQcGalADTUMKnU2xIe1tNGIGI3wiJ
 mbqcmttPFDCoEjq61AEpzJ4A4yev/2EyBBf1tnfUU6lRSJ+D+V/CNixEbrJ1biZm9RXr
 QXF4udotcyvg19pWXRPzhjHzu0uIkuY/7alsWh+PtIGBQMt0f5J47R8NkAPYi4Xesc5b
 en9g==
X-Gm-Message-State: ACrzQf05BTEcZTNUR3A5QMdlTB1qsCJKc/Hlk2+jFV+a8Bu2rkMXrKe2
 j8IcjVZzVpgKOYz1+BiqgQ==
X-Google-Smtp-Source: AMsMyM7jSo5RKk0XtK1mVgQ4Jr3vEOaeiYkklWLwczNXNwPiyNPJOwKeAFrRRyOdu3Ms/hkoidtIXg==
X-Received: by 2002:a05:6830:54b:b0:66c:794e:f8c6 with SMTP id
 l11-20020a056830054b00b0066c794ef8c6mr138138otb.343.1667598744812; 
 Fri, 04 Nov 2022 14:52:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i128-20020acab886000000b00354932bae03sm115271oif.10.2022.11.04.14.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 14:52:24 -0700 (PDT)
Received: (nullmailer pid 2891341 invoked by uid 1000);
 Fri, 04 Nov 2022 21:52:25 -0000
Date: Fri, 4 Nov 2022 16:52:25 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 2/8] ASoC: dt-bindings: realtek, rt5682s: Add DBVDD and
 LDO1-IN supplies
Message-ID: <166759874551.2891287.15709130108810995782.robh@kernel.org>
References: <20221102182002.255282-1-nfraprado@collabora.com>
 <20221102182002.255282-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102182002.255282-3-nfraprado@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


On Wed, 02 Nov 2022 14:19:56 -0400, Nícolas F. R. A. Prado wrote:
> The rt5682s codec has two additional power supply pins, DBVDD and
> LDO1_IN, that aren't currently described in the binding. Add them.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Made names uppercase
> 
>  .../devicetree/bindings/sound/realtek,rt5682s.yaml    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
