Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A65FF86
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 04:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 507DF1699;
	Fri,  5 Jul 2019 04:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 507DF1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562294413;
	bh=kYlZgDPK2HXu0UKJPsrE3YDSlH3/MYOeLhloMzN6/IU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oruLlO+Qk11XJGaHR4Cs7FYwQXvleRuGSh+Aq2gRrFBAhf36UAq/khA+kHQ08+ADx
	 qRpV34D3kj6tmliG9iTOChEtBRBbv3yxbAnAqEaIuWtjPbovUr2mVgM5aSVATrSntx
	 WRun323FePJ60xMuer8+ZyRbg4vP+raC7u7c63sE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB68F80120;
	Fri,  5 Jul 2019 04:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEB12F8011F; Fri,  5 Jul 2019 04:38:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD16DF800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 04:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD16DF800E7
Received: by mail-ed1-f66.google.com with SMTP id m10so6879898edv.6
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 19:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WqY7P7z7HvZSik8uVxR3WylUoD8M+JaJvkcH77K5Dg=;
 b=pytNVuPP7MfXjrA5Itj2dY8MCGE63IaGPX4OYBhRpbTZtz36a0ESXR74HloSbkF+g3
 wCgZZIX2KfDLeE3SXSj7WHCvh7c5EY3Yog/6eqN3aG7PSPjAmo02gNeIe+c2C6yJ/HE5
 CXnrUGtL6KaYqCVxhraBTKUKZOGB1tonoDVZU4HcNl1gRQSpNfPwGxyFFRfG5FVvfMt5
 9Z9KO9g2fRdWBgIx1Ci47+CP1MOni8T9ddFMhZILrv02ZzxyXfhEpTzxHy3KdSDqm8yT
 6Sy4tSWoghfdFBl+AzJTINc2HWKk5GZgFIhTq3kCERid4aORnRk8P50v6RdbCLRDwEZa
 KC/g==
X-Gm-Message-State: APjAAAVna0U9R9/kS5ysirFag7eCA8bH2ulHRdDGfKtp4vfQF4kdpa3u
 ebedDbFhezuJ/PZLDQVMRQJmFD3jxfI=
X-Google-Smtp-Source: APXvYqx0NNlQNN2yJclXA8ZvlBHql/Kif6qxHyre7IMgL9Ur+DRk4xo03dPEuV9k93jOJ3Je2xkC8g==
X-Received: by 2002:a50:886a:: with SMTP id c39mr1782398edc.214.1562294297894; 
 Thu, 04 Jul 2019 19:38:17 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id pv18sm999316ejb.14.2019.07.04.19.38.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 19:38:16 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id c2so8263579wrm.8
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 19:38:16 -0700 (PDT)
X-Received: by 2002:adf:f70b:: with SMTP id r11mr1078942wrp.324.1562294296092; 
 Thu, 04 Jul 2019 19:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190703184814.27191-1-luca@z3ntu.xyz>
In-Reply-To: <20190703184814.27191-1-luca@z3ntu.xyz>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Jul 2019 10:38:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64EL-v5YUuWA4t=KUhuwEqML6Co6iosG607_rZhUQ+OLg@mail.gmail.com>
Message-ID: <CAGb2v64EL-v5YUuWA4t=KUhuwEqML6Co6iosG607_rZhUQ+OLg@mail.gmail.com>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 ~martijnbraam/pmos-upstream@lists.sr.ht, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: sunxi: sun50i-codec-analog: Add
	earpiece
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

On Thu, Jul 4, 2019 at 2:49 AM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> This adds the necessary registers and audio routes to play audio using
> the Earpiece, that's supported on the A64.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

LGTM.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
