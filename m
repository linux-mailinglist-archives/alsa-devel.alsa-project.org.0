Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF32B7728
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 08:50:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C64B1789;
	Wed, 18 Nov 2020 08:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C64B1789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605685801;
	bh=W53kf0sA41Ui3hAkoYQedLbVIY4mvBoFp7NgHyqXuVQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogFWYFv3ekJEm0gdvkiN1KkZinsJo5gFSVqdMvY6/45FQWCDgA6627mVY1OWHQks7
	 +KH1c0joMVyDaGdAgm4+jx/LPVUHARPCBaYfp4j7uxcTSyqWtv/553uZFW+YVtKzOb
	 rJQMdfj1r964zBicqGkzaJfp+RUIQwR9qM2rWXoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8319EF8016D;
	Wed, 18 Nov 2020 08:48:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF86EF8016C; Wed, 18 Nov 2020 08:48:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5008AF800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 08:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5008AF800EE
Received: by mail-ed1-f68.google.com with SMTP id e18so949967edy.6
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 23:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/VBymVKVFuIaMs6diTaKJdglBbHoKWE5HN40ZxS82fM=;
 b=AwGWII9Nj+6srSpXHgxvvl/fhJVvWnIN+IoIUbaCVx6VT9scYEpWH5Nj9d+B4XmSOr
 QHUcEZWZfsZihCAEytupimpy6x4nCk9S+E/vVELZi7Tv6KfrkzIGGKXgROZOHO8E9O33
 bguLXscqQ1JydhjaAOo0LpC6gOgiVPABU1aGWrU1LxVPOd/IUpPzlZga3csKk34OjoJC
 DAuIqzsgYjOerncaBNf1y3gI6afsXXwbfyXIAMwNp108cnY7aavsWwNYrIAhvEHNKDLB
 vzGQlOxBpzKCKsFrwHyn4DdV7JRwmLuMmU4YgVnlUZGFPv7RhH0TOzTQWhL3SoM+E2ZH
 w1fw==
X-Gm-Message-State: AOAM530WEctUPFdKFvwnZIFDirAbOSCV+tPSBnd6grTx4FmAzq5nR9Yn
 gT5nX5LtEWmcc5oqUMZPuPQ=
X-Google-Smtp-Source: ABdhPJx+aZjGIA58JBNNsU2EYJuORCMi9eVDKQ3IfVQdHZjH8ummbU4/k0jvYclGpHK/bGP8ytcepg==
X-Received: by 2002:aa7:c2c3:: with SMTP id m3mr24597168edp.361.1605685694599; 
 Tue, 17 Nov 2020 23:48:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id g7sm13224731edl.5.2020.11.17.23.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 23:48:13 -0800 (PST)
Date: Wed, 18 Nov 2020 08:48:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with
 HAVE_LEGACY_CLK
Message-ID: <20201118074812.GA5803@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-2-krzk@kernel.org>
 <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On Tue, Nov 17, 2020 at 11:41:57PM -0800, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> > COMMON_CLK even though is a user-selectable symbol, is still selected by
> > multiple other config options.  COMMON_CLK should not be used when
> > legacy clocks are provided by architecture, so it correctly depends on
> > !HAVE_LEGACY_CLK.
> > 
> > However it is possible to create a config which selects both COMMON_CLK
> > (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads to
> 
> Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
> SOC_RT305X selecting HAVE_LEGACY_CLK?

The SND_SUN8I_CODEC I fixed in following patch (I sent separately v2 of
it).

The SOC_RT305X select HAVE_LEGACY_CLK? because it is an old, Ralink
platform, not converted to Common clock frm. Few clock operations are
defined in: arch/mips/ralink/clk.c

Best regards,
Krzysztof

