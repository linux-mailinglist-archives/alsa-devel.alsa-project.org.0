Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30132C3543
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 01:13:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7891E173D;
	Wed, 25 Nov 2020 01:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7891E173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606263196;
	bh=a+Rxij4TwnjUBiotOv+s4sSAjtCT1yAbFvk3KFgRQwk=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NH7OhbeO/7fH38I9qaqP4HXKi5mp+rllBIWrf0vYziHecNJU62TFPiqI/A/Q6Au2b
	 4VmfGlRER72LKfKAmiGMda7B5j4cYASiSCtovar3UMhkHLcnIMIjU3J7U7i7oiinKz
	 pL7w259FylXN6UPbfplWksvH4RzEcF0Wlrzmi7vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED66CF80166;
	Wed, 25 Nov 2020 01:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D939F80165; Wed, 25 Nov 2020 01:11:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C8FF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 01:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C8FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CosENmDf"
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEB98206E5;
 Wed, 25 Nov 2020 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263092;
 bh=a+Rxij4TwnjUBiotOv+s4sSAjtCT1yAbFvk3KFgRQwk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CosENmDfkL+cgj7WPvYKqODfrjuLGx+KPZj+0j8+V7h280NLtz0dsqvjUjlqRfisC
 CtpwmD0iFNR5eb13g7D2wt38jkTBeDEH9o1PWdzcShDtfiwIPVqeLN3ax7sAKCHCJR
 eywKE8709HAMCLI7VcABX1ifaSVPNXJtCGRa/nAE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201118074812.GA5803@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-2-krzk@kernel.org>
 <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
 <20201118074812.GA5803@kozik-lap>
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with
 HAVE_LEGACY_CLK
From: Stephen Boyd <sboyd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 24 Nov 2020 16:11:31 -0800
Message-ID: <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
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

Quoting Krzysztof Kozlowski (2020-11-17 23:48:12)
> On Tue, Nov 17, 2020 at 11:41:57PM -0800, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> > > COMMON_CLK even though is a user-selectable symbol, is still selected=
 by
> > > multiple other config options.  COMMON_CLK should not be used when
> > > legacy clocks are provided by architecture, so it correctly depends on
> > > !HAVE_LEGACY_CLK.
> > >=20
> > > However it is possible to create a config which selects both COMMON_C=
LK
> > > (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads =
to
> >=20
> > Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
> > SOC_RT305X selecting HAVE_LEGACY_CLK?
>=20
> The SND_SUN8I_CODEC I fixed in following patch (I sent separately v2 of
> it).
>=20
> The SOC_RT305X select HAVE_LEGACY_CLK? because it is an old, Ralink
> platform, not converted to Common clock frm. Few clock operations are
> defined in: arch/mips/ralink/clk.c
>=20

Ok so this patch isn't necessary then? It seems OK to select
HAVE_LEGACY_CLK but not to select COMMON_CLK unless it's architecture
code that can't be enabled when the other architecture code is selecting
HAVE_LEGACY_CLK.
