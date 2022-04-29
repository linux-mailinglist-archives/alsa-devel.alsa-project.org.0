Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265775144C7
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 10:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77FF950;
	Fri, 29 Apr 2022 10:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77FF950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651222111;
	bh=yn70nK+WS+IAOTHF+SA05wSEuk6p4NwE6hE77E+hcGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZ5fv7sRXgUdazP3CUr98OEHncqzI03kCmJWYvZWhoS87hvchikvGYfEHrjABzcmi
	 pO00tlPhOdoBhKhFpmTRt8AeXasM5JlL+n1e/YWYLXESLTQlVRq7EibQ22Yhtp33KB
	 8Vf1k6TPBSfBqF3Uw/z0jNvs+hM6JIgjbNPhPTPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 041BBF80269;
	Fri, 29 Apr 2022 10:47:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B220F8025D; Fri, 29 Apr 2022 10:47:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F755F8016E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 10:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F755F8016E
Received: by mail-qt1-f176.google.com with SMTP id t16so5222402qtr.9
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 01:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6sgYQJjr5iy1crCmQpq1/lmSUnF0hBfImD2gP+L9eDc=;
 b=K9q8JfRK8nqn75GXCxhzgsAATW0YXX1BMI3wZJfDTyipN3FZaXj0nFZ4E1QpcDgy0U
 Y6j+v+f4CpzX73aQbeHf9s2YbHVLAuYXYqF5ZFml/6xWNSXYmpkc7VPqSjSuK/u9W7q4
 cr4PSVhEZy9Dw5VVhzlxcR/s5sK48nlya6RqquRPvTHxHuIJUUPAIFDftado+wpaMZu4
 SaV4CVbBuwyB3I1BbKcJVzbw4xhwZ6FJ1MfKzD9atT387PMrafpLsdF7oXKs47Kr82g8
 56DqCQmcna4dgYqMcIhbHYHiDCAZ0n1GCXEBnsX7LrjsIVS2IfxWUzOJCNcyR4lZcRUw
 fkAg==
X-Gm-Message-State: AOAM530yW9eAdldwid8KtFtPx0BWQBVTyQorIVwZlCtNB2MriRsGjbp/
 h5wgIc+6PH9liWEWx7lU0Fla9Tmfs5OVVFPW
X-Google-Smtp-Source: ABdhPJwl045aJuoc5cjbNW5SUHtc6IKWRUSwwkY4e80Y7cYLvWAnJ0NpKdFscUjNbVz2ZuQcbXGxmQ==
X-Received: by 2002:a05:622a:189c:b0:2f3:654c:369f with SMTP id
 v28-20020a05622a189c00b002f3654c369fmr18676391qtc.50.1651222042885; 
 Fri, 29 Apr 2022 01:47:22 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 y18-20020ac85f52000000b002ed08a7dc8dsm1409559qta.13.2022.04.29.01.47.21
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:47:22 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id w187so13325405ybe.2
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 01:47:21 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr35590406ybq.393.1651222041398; Fri, 29
 Apr 2022 01:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
In-Reply-To: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Apr 2022 10:47:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
Message-ID: <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, aaronyu@google.com,
 Julian Braha <julianbraha@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

Hi Jiaxin,

Gmail tends to mark your patches as spam.
Can you please make sure to use "PATCH" in the subject line, e.g.
"[PATCH v4 00/18] ASoC: mediatek: Add support for MT8186 SoC"?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
