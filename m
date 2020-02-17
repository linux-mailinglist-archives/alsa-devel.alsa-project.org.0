Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94A160D29
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 09:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E521672;
	Mon, 17 Feb 2020 09:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E521672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581927872;
	bh=JsY4pHSdYkPDX7W0YpjOduzut3u02Uxes/3fU2iRMQM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ISm/rZbIcPoenwpCQzHO4cUwEvpfKFWHkszRye6NT2E68GpYPY396eJl2VCVTdS4d
	 N4LKfFoaSEVD4edkXHaUOJL+26U89/9Bmmt/L3i+GjWOX+JBt8Q2Ovdyk6TTUHpuYJ
	 0dWkCc8hKvXPOyAKeZxc3AtEx8PlD/PHkfd+T/6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6006DF800C4;
	Mon, 17 Feb 2020 09:22:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B488DF8015E; Mon, 17 Feb 2020 09:22:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4F96F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4F96F800B6
Received: by mail-ed1-f66.google.com with SMTP id t7so8022627edr.4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TGqR9iwqEEPoAOlQ581BXw8F7VHSOXMBtuvI7O8A+Jo=;
 b=BXaMqbJhk6napCrLOU6lscXZJOexxkGoCynf+f1ws7W9Izs188t+vOteQ/W/UX54IL
 Dn2UorhjHa+Lzd3yWo6TgtJnYOrU2zaGoPv2LcMHITa7w7n63CuIKbcYsZEtI877NIzG
 Vzo3NOLpTLgOkp8ql9NOMe1z8R6pgNF6lLTKAvEFDfShMwxI02CkP0dHL1pT2TRcmipL
 3KebAk+VwnlBHYl7wxwFrQRC38/ofvXV/dNbPRxtoLFPftuy1lT+x2FmP0LBXc5cnCqf
 LRg1xxkcvZNjDdVs8r+ld0pnzQdHXeMbDHGhHSYS2tzd9h8iMHVWnHQTfz+dssg4BJ1f
 wL4Q==
X-Gm-Message-State: APjAAAVnxmyyDPm3GVHrtS28EwuHeAb6pI11uCPHsSoLrZaH6n4oAVz0
 G12gDmmNLHJrnF7s3k0TtOXMKY0aUYE=
X-Google-Smtp-Source: APXvYqwYl06banaR1xHP4eVi5ZNKTZ76KGUDL9NkgFRDgNo5e7TGTO8RiVZtys8sR0g9xFSPHyDdyg==
X-Received: by 2002:a05:6402:3c8:: with SMTP id
 t8mr12958957edw.115.1581927764199; 
 Mon, 17 Feb 2020 00:22:44 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id r24sm504487edv.69.2020.02.17.00.22.43
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:22:43 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id z3so18531718wru.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:22:43 -0800 (PST)
X-Received: by 2002:a5d:4a04:: with SMTP id m4mr20971822wrq.104.1581927763057; 
 Mon, 17 Feb 2020 00:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-9-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-9-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 16:22:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TfTN6_wRgbLswEr_ShvL7Zb2-tgj7bS7oA6UfLvc0GA@mail.gmail.com>
Message-ID: <CAGb2v67TfTN6_wRgbLswEr_ShvL7Zb2-tgj7bS7oA6UfLvc0GA@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 08/34] ASoC: sun8i-codec: Fix direction
	of AIF1 outputs
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

On Mon, Feb 17, 2020 at 2:43 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The naming convention for AIFs in this codec is to call the "DAC" the
> path from the AIF into the codec, and the ADC the path from the codec
> back to the AIF, regardless of if there is any analog path involved.
>
> The output from AIF 1 used for capture should be declared as such.
>
> Cc: stable@kernel.org
> Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
