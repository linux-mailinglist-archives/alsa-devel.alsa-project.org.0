Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101452C41FC
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 15:16:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9631D1731;
	Wed, 25 Nov 2020 15:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9631D1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606313812;
	bh=It3AOpk7Sqk7xU3BKEgvsDJo++LyRiFJ9Y1f3n1Yb90=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vJRuhfQTmNAKdrtHYXSBGEaw2VrIgvjYTgPLIT3uXP1nbFUN6kVzOlBDY9sUNVa7K
	 4TIBXtFPaCxwM1YqAeKqE7X5oZQBnFtm1fK27f9fzFQkJFmgxKHGj9Luq4RthrLCHT
	 4y3/e8WEhRYH7LqEol4R5nDcirgquXDG112Z/DO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E72DF8015F;
	Wed, 25 Nov 2020 15:15:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B047AF8019D; Wed, 25 Nov 2020 15:15:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA0CAF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 15:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0CAF8015A
Received: by mail-wm1-f66.google.com with SMTP id d142so2138348wmd.4
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 06:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OTNWqTeUqmzJkpC9NOCmUX8GBH/nXgfg9fJE4Ofwcd8=;
 b=hMUr7LrQ87dhQVn0VOc0RJ1ze8kMVYSUGL8e+bd35a9HwIY8hUulfWz2G4S8kDWFAf
 66cCjUdmUULvYvT6p0Hh0sOoQKjgwuwUIT+RJlyN9327haHzoJO3d+EM8gJNili46Dhu
 UosBPFq4pQtCg6o3HfpDdNjAn7NThrfv5i1XxdRsbuZJLUMw7jvjeAg0237vlLfBBJCA
 5VI6qpTM2yUYdSWlFXGFyeyyImrII+EuhhZaPkgnKjzngMTC8TUrnRwOGXfha2axdJd+
 988h2Qfa4uY9VHmv9Vm9zsmjbdR0EPT8mZt7BCPi/nLjRRNVPdRmuAbchAV//EEdk0JK
 ijig==
X-Gm-Message-State: AOAM532D5mCMAHEOrHw278HaDX/OO8QcigDohr1nGTP7JzYlKxSgIUP5
 vsereLP3F+PGuz/racXpgZU=
X-Google-Smtp-Source: ABdhPJyvfqQ/sP05uKPapIZjZ8P1LI64iv1xcYxdq5+nC6S8RSDBQOEhxRq+85Dg1vPAhjljyRi0tQ==
X-Received: by 2002:a1c:2008:: with SMTP id g8mr4101230wmg.19.1606313708219;
 Wed, 25 Nov 2020 06:15:08 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id c2sm5411796wrf.68.2020.11.25.06.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 06:15:07 -0800 (PST)
Date: Wed, 25 Nov 2020 15:15:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with
 HAVE_LEGACY_CLK
Message-ID: <20201125141505.GA77733@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-2-krzk@kernel.org>
 <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
 <20201118074812.GA5803@kozik-lap>
 <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
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

On Tue, Nov 24, 2020 at 04:11:31PM -0800, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-11-17 23:48:12)
> > On Tue, Nov 17, 2020 at 11:41:57PM -0800, Stephen Boyd wrote:
> > > Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> > > > COMMON_CLK even though is a user-selectable symbol, is still selected by
> > > > multiple other config options.  COMMON_CLK should not be used when
> > > > legacy clocks are provided by architecture, so it correctly depends on
> > > > !HAVE_LEGACY_CLK.
> > > > 
> > > > However it is possible to create a config which selects both COMMON_CLK
> > > > (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads to
> > > 
> > > Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
> > > SOC_RT305X selecting HAVE_LEGACY_CLK?
> > 
> > The SND_SUN8I_CODEC I fixed in following patch (I sent separately v2 of
> > it).
> > 
> > The SOC_RT305X select HAVE_LEGACY_CLK? because it is an old, Ralink
> > platform, not converted to Common clock frm. Few clock operations are
> > defined in: arch/mips/ralink/clk.c
> > 
> 
> Ok so this patch isn't necessary then?

For this particular build failure - it is not necessary anymore.

However there might more of such errors - just not discovered yet. Also,
the clock bulk API has such ifdefs so it kind of symmetrical and
consistent approach.

> It seems OK to select
> HAVE_LEGACY_CLK but not to select COMMON_CLK unless it's architecture
> code that can't be enabled when the other architecture code is selecting
> HAVE_LEGACY_CLK.

Best regards,
Krzysztof

