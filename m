Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52205149E8
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 14:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7968C20C;
	Fri, 29 Apr 2022 14:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7968C20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651236656;
	bh=mRng7upD/wBQvykCDiip2T+ajmoegwat89+qn9YQKkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUX/T7I2A5sY4kSLRQHQ1t4AqsLiRd1FPt2nCVKSEKICxSUdREEFxZ1STxaofcruD
	 YMlFLQAGjpEXcyFSzk6evfg5XYjYnFWx+4sLAIEByd9jnwpj8Zl5g10jN+Kgdn/PPo
	 5z1+0ztWOaTfCKiHHZx9ksvVbmEVGw6ZWQd39qB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E689AF80269;
	Fri, 29 Apr 2022 14:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94E1AF8025D; Fri, 29 Apr 2022 14:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74823F8016E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 14:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74823F8016E
Received: by mail-qk1-f174.google.com with SMTP id 126so4754525qkm.4
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 05:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tqelAYwf2EnKhlkfmEW1Nniwpv4OsNQ/+Rpd0YuVJE=;
 b=uv9ORgcqF5PwEIIXTnoXX8UK+1UDIV7zTmAqSjG94NrW75r/jwojF9AplgzUJcJzGG
 QWMCz8ntLcTZRtY4FBM7IEhBa7VXxzzWj+0ww80RgslZuqRJvosnyYgUws/WXm05gYOm
 p70c5CwV5koTENLbv0gXSDr9VgHidotXxuKqFUER8oCFX4RnqdoWUOs6aqbKiZfhzjva
 LVnN1zcAiMQvGFiF2aGK8DZDOp+ta1Urkgd3uE/DkVkmrHSPF0rD3HQbJ9JIO0aWZ9tw
 7y0LbX8NykLvzW0Sn7T5/NWyNCWleunigetbR0Xyi5KcitQr2+sU9029wRWqmO8oaJm1
 yivA==
X-Gm-Message-State: AOAM5306tFuAaL3E0dVj5nV4Otfv5LheAWHXzV/hpfeb6aK1efwgwEz7
 V94Awa1jANyaJUwIvswAuQUYe/7VCoRm9fWC
X-Google-Smtp-Source: ABdhPJwYI3NV4o/0lt0OZt+tSlGMPcuadHAjQZuTpIzEovwfCDMKVSS5/c4LLaohUB/B1dDXsRt3KA==
X-Received: by 2002:a05:620a:2943:b0:69f:2013:3783 with SMTP id
 n3-20020a05620a294300b0069f20133783mr21077525qkp.727.1651236588309; 
 Fri, 29 Apr 2022 05:49:48 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 n186-20020a37bdc3000000b0069c218173e8sm1402039qkf.112.2022.04.29.05.49.47
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 05:49:47 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2f7c424c66cso84309077b3.1
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 05:49:47 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr34597687ywh.62.1651236586925; Fri, 29
 Apr 2022 05:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
 <b90426905a486ab720b9d67f00ed869285acd768.camel@mediatek.com>
In-Reply-To: <b90426905a486ab720b9d67f00ed869285acd768.camel@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Apr 2022 14:49:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVA-JJqPB9fiUZSeXZR+fa58V5t2OQjaN1-JvGR+K_H4Q@mail.gmail.com>
Message-ID: <CAMuHMdVA-JJqPB9fiUZSeXZR+fa58V5t2OQjaN1-JvGR+K_H4Q@mail.gmail.com>
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

On Fri, Apr 29, 2022 at 11:32 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> On Fri, 2022-04-29 at 10:47 +0200, Geert Uytterhoeven wrote:
> > Gmail tends to mark your patches as spam.
> > Can you please make sure to use "PATCH" in the subject line, e.g.
> > "[PATCH v4 00/18] ASoC: mediatek: Add support for MT8186 SoC"?

> Sorry for this mistake, I usually use "git format-patch --subject-
> prefix "v4" --cover-letter -x" to generate a series of patches.
> So it automatically removes "PATCH". I will correct the cmd to "git
> format-patch --subject-prefix "PATCH v4" --cover-letter -x".

You can just use e.g. "-v4" instead of the --subject-prefix option.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
