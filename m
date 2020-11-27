Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC212C6C81
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 21:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 932741888;
	Fri, 27 Nov 2020 21:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 932741888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606508456;
	bh=o3RTkjTyHvzrrCB4moRhD+SXP7lFjO4qLgZ4zpDkqEw=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hz+54yHkAAbspAXSdRBIHXSOEihfcHHC7fNY9wc/xjdna64m+Muh2kbL45ORh8KcI
	 9iuOrfl+HOblTPb3317gxNOJn69J8ljTnL6No3PcpOmyXZtKoxSCIXINnP/YSKlkd3
	 TU4AIkQ/As/rooL1+tEHU71t0tI3CDFJNT4jSXAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 202AFF800E0;
	Fri, 27 Nov 2020 21:19:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA84F8019D; Fri, 27 Nov 2020 21:19:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F962F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 21:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F962F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E1/Cvts2"
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CB3F21D7A;
 Fri, 27 Nov 2020 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606508354;
 bh=o3RTkjTyHvzrrCB4moRhD+SXP7lFjO4qLgZ4zpDkqEw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=E1/Cvts2AleC6juqrgkFNASwChKaHV22sMpl7ga1RdwHhzr9Sxg1//qQRacMN5vTr
 09SVpnPFbjA+/qQ+ocmDj0MCwXooOtNQMD0BH/9XJDSb0vcG51kZhsT47CJZAJVzyK
 cOG8kTYQMOco+n84s865MMiBAncUY4edGYJUV4ls=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201125141505.GA77733@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-2-krzk@kernel.org>
 <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
 <20201118074812.GA5803@kozik-lap>
 <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
 <20201125141505.GA77733@kozik-lap>
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with
 HAVE_LEGACY_CLK
From: Stephen Boyd <sboyd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Nov 2020 12:19:12 -0800
Message-ID: <160650835295.2717324.6223337132204167294@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Krzysztof Kozlowski (2020-11-25 06:15:05)
> On Tue, Nov 24, 2020 at 04:11:31PM -0800, Stephen Boyd wrote:
> >=20
> > Ok so this patch isn't necessary then?
>=20
> For this particular build failure - it is not necessary anymore.
>=20
> However there might more of such errors - just not discovered yet. Also,
> the clock bulk API has such ifdefs so it kind of symmetrical and
> consistent approach.
>=20

Ok. Patches always welcome.
