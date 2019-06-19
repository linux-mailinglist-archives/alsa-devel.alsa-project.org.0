Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639A4B284
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 09:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF2416A5;
	Wed, 19 Jun 2019 08:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF2416A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560927638;
	bh=5UryYTCbHkwgNHdOsLC4LrO25VWFYp4pBuf5SCzbhOc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLr648nu8Rngz7iW7XOyx7kci5nojZvZalmaoblVzRI5mEXEOvhkIsb7LnGZTxKuv
	 gBe5ttqUdUqAhM3UAeah9ptfuQYgBPC1wWYhT2yilfnzEMjFWGOnZrrprUjVi1b9vs
	 OYZ+w2Ts3q1bkTXZvlsXpEjwRDqomhBhTwbzhyt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07137F896B8;
	Wed, 19 Jun 2019 08:58:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98045F896B8; Wed, 19 Jun 2019 08:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82943F80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 08:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82943F80C87
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="kp4xRCtE"
Received: by mail-wm1-x32b.google.com with SMTP id 207so478657wma.1
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=1TENGME35FC48XgS8CKOSnb5pbmTWrwfdD8b8KALO8M=;
 b=kp4xRCtEIbtPiPc7FpWBQgkQa7DMxDJysF8xIan4U0oTWjDGBnytnQ+ErvVWdrdl83
 AjdVE55RnOFGQy6CbuLUcN+6JdfCQklFScpSn2/CFncnOnwhB5ANsayqJ3DdZyEudz9Z
 botXW/OIrElMqKUabZX4Rqk23CJZwOP8sKt388ptSor3ih8Lq6wtyvd9Z6zFvkz7DuDY
 4yaedhK/D9s6T+dqi1jh4015ygLTEFbAqH8REZGdQ0P4or49o9zsGgByJE9mmy20Y/gy
 PSDUN4HjLuHGaUvRk/OQH9xt+Wf65oCzKHDJHm2TNB+oC7o2AkXDYFzcVQgYpr/1Hehh
 fsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=1TENGME35FC48XgS8CKOSnb5pbmTWrwfdD8b8KALO8M=;
 b=hq0gICEjwAE7GOqfyJVLAWDeAzGa+uOzb1BghbpjqOT0GKv+uH+2gG1bl3ana3/NJ8
 hbClP/2eznqsBTS1fHuZBdnJc3dzwB+541f92PUjhyBqp2x5mfs9r6EBop3qAAIjla/+
 jLoMCwyzpn5ju8Nr3nY5mBTWVMcF6eMvtP1S/D5CH8r+KgNUQZK+LW+QL0P3eMSwAohZ
 0uRRsEDKY1iZAShIu/rrChUWs3zWo4VxnKmp7Z3pEIpNSPBepHWemYmgDcdTT9IQZNYx
 V4rREEAJdF03T4DPV38bryOc49U3/S/qBvF6N4HRwlycHHtAZmOo4OVeCCmBgh8jBhmw
 kEoQ==
X-Gm-Message-State: APjAAAXX2p9JQEv7ovrtXAlXvgWIilAkueH5BtNbSjtjfGQWO5Naiydx
 Fg96fiQSfcgmes6GD/Tqr/USow==
X-Google-Smtp-Source: APXvYqxQP0q1hQGdHefygd6auCw063Hw7M9dN94NrU03DfugjUTlEfdg7a+DIQ3dILB1e5F+mGteJg==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr6803343wmm.96.1560927528352; 
 Tue, 18 Jun 2019 23:58:48 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm19649931wru.0.2019.06.18.23.58.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 23:58:47 -0700 (PDT)
Message-ID: <544711aa4b79afdff666e68954994cf8cd3964c1.camel@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jun 2019 08:58:46 +0200
In-Reply-To: <20190618110710.GA14934@mwanda>
References: <20190618110710.GA14934@mwanda>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [bug report] ASoC: meson: axg-card: fix null
 pointer dereference in clean up
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

On Tue, 2019-06-18 at 14:07 +0300, Dan Carpenter wrote:
> Hello Jerome Brunet,
> 
> The patch 960f428ca0a0: "ASoC: meson: axg-card: fix null pointer
> dereference in clean up" from Jun 10, 2019, leads to the following
> static checker warning:
> 
> 	sound/soc/meson/axg-card.c:121 axg_card_clean_references()
> 	warn: address of 'link->codecs[j]' is non-NULL
> 
> sound/soc/meson/axg-card.c
>    109  static void axg_card_clean_references(struct axg_card *priv)
>    110  {
>    111          struct snd_soc_card *card = &priv->card;
>    112          struct snd_soc_dai_link *link;
>    113          struct snd_soc_dai_link_component *codec;
>    114          int i, j;
>    115  
>    116          if (card->dai_link) {
>    117                  for_each_card_prelinks(card, i, link) {
>    118                          if (link->cpus)
>    119                                  of_node_put(link->cpus->of_node);
>    120                          for_each_link_codecs(link, j, codec)
>    121                                  if (codec)
>                                             ^^^^^
> "codec" is the list iterator so it can't possibly be NULL.

Indeed, only "cpus" need a check.
Thanks for reporting this Dan
I'll post a fixup soon 

> 
>    122                                          of_node_put(codec->of_node);
>    123                  }
>    124          }
>    125  
>    126          if (card->aux_dev) {
>    127                  for (i = 0; i < card->num_aux_devs; i++)
>    128                          of_node_put(card->aux_dev[i].codec_of_node);
>    129          }
>    130  
>    131          kfree(card->dai_link);
>    132          kfree(priv->link_data);
>    133  }
> 
> regards,
> dan carpenter


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
