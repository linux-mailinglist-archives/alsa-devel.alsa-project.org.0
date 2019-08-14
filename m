Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDFD8CA6E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F80167F;
	Wed, 14 Aug 2019 06:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F80167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565757286;
	bh=uZmEhsqvWAX3g+1O8/WfUL1ZflAbODgRAHr0dkN2sAo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itZH1FIwP009zinzvQw4rZUdALUhP7KtVRO+qX2cm/TsBsNrbBs+tT63PDCG4xeAI
	 ZCA4zvgBum8aXH0C9udQQ0ZnQ+4ARkEaKip0Q3b26ypJ2ZMojV9ygM1x9zou9UXomJ
	 5FYgwjIx599kQ1THIGxb+1wNv3gxnGoJOF9sZiDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9430BF80214;
	Wed, 14 Aug 2019 06:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ABB8F80214; Wed, 14 Aug 2019 06:32:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFCCF8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFCCF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U/60wuQZ"
Received: from localhost (unknown [171.76.115.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E2C92064A;
 Wed, 14 Aug 2019 04:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565757172;
 bh=TWrNSsCdKwDr/CuPKP5AmDWqoO/RoBG3FGXsQCYoT7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U/60wuQZP0vZH4+GEN/8vvepeMhgY9bY3b3bpvd7CZObi1lrTJSI/axqwNG6piOXN
 e8mDqK3u89R6EpufZKbAOMRigwJvlkSkZ949aXI6MQo6UZueZMJmcV42M9cliloPWn
 utkSDe89vSfyZl3HbPw9Ov9/rOkL4fcj/hK73Qs0=
Date: Wed, 14 Aug 2019 10:01:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190814043139.GV12733@vkoul-mobl.Dlink>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-7-pierre-louis.bossart@linux.intel.com>
 <03b6091b-af41-ac54-43c7-196a3583a731@intel.com>
 <024b4fb4-bdfa-a6dc-48bb-c070f2ed36b2@linux.intel.com>
 <2445b5dc-246c-9c3b-b26e-784032feccf9@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2445b5dc-246c-9c3b-b26e-784032feccf9@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 06/17] soundwire: cadence_master: use
 firmware defaults for frame shape
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06-08-19, 18:06, Cezary Rojewski wrote:
> On 2019-08-06 17:36, Pierre-Louis Bossart wrote:
> > =

> > =

> > On 8/6/19 10:27 AM, Cezary Rojewski wrote:
> > > On 2019-08-06 02:55, Pierre-Louis Bossart wrote:
> > > > diff --git a/drivers/soundwire/cadence_master.c
> > > > b/drivers/soundwire/cadence_master.c
> > > > index 5d9729b4d634..89c55e4bb72c 100644
> > > > --- a/drivers/soundwire/cadence_master.c
> > > > +++ b/drivers/soundwire/cadence_master.c
> > > > @@ -48,6 +48,8 @@
> > > > =A0 #define CDNS_MCP_SSPSTAT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0xC
> > > > =A0 #define CDNS_MCP_FRAME_SHAPE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
x10
> > > > =A0 #define CDNS_MCP_FRAME_SHAPE_INIT=A0=A0=A0=A0=A0=A0=A0 0x14
> > > > +#define CDNS_MCP_FRAME_SHAPE_COL_MASK=A0=A0=A0=A0=A0=A0=A0 GENMASK=
(2, 0)
> > > > +#define CDNS_MCP_FRAME_SHAPE_ROW_OFFSET=A0=A0=A0=A0=A0=A0=A0 3
> > > > =A0 #define CDNS_MCP_CONFIG_UPDATE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0x18
> > > > =A0 #define CDNS_MCP_CONFIG_UPDATE_BIT=A0=A0=A0=A0=A0=A0=A0 BIT(0)
> > > > @@ -175,7 +177,6 @@
> > > > =A0 /* Driver defaults */
> > > > =A0 #define CDNS_DEFAULT_CLK_DIVIDER=A0=A0=A0=A0=A0=A0=A0 0
> > > > -#define CDNS_DEFAULT_FRAME_SHAPE=A0=A0=A0=A0=A0=A0=A0 0x30
> > > > =A0 #define CDNS_DEFAULT_SSP_INTERVAL=A0=A0=A0=A0=A0=A0=A0 0x18
> > > > =A0 #define CDNS_TX_TIMEOUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 2000
> > > > @@ -901,6 +902,20 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
> > > > =A0 }
> > > > =A0 EXPORT_SYMBOL(sdw_cdns_pdi_init);
> > > > +static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
> > > > +{
> > > > +=A0=A0=A0 u32 val;
> > > > +=A0=A0=A0 int c;
> > > > +=A0=A0=A0 int r;
> > > > +
> > > > +=A0=A0=A0 r =3D sdw_find_row_index(n_rows);
> > > > +=A0=A0=A0 c =3D sdw_find_col_index(n_cols) & CDNS_MCP_FRAME_SHAPE_=
COL_MASK;
> > > > +
> > > > +=A0=A0=A0 val =3D (r << CDNS_MCP_FRAME_SHAPE_ROW_OFFSET) | c;
> > > > +
> > > > +=A0=A0=A0 return val;
> > > > +}
> > > > +
> > > =

> > > Guess this have been said already, but this function could be
> > > simplified - unless you really want to keep explicit variable
> > > declaration. Both "c" and "r" declarations could be merged into
> > > single line while "val" is not needed at all.
> > > =

> > > One more thing - is AND bitwise op really needed for cols
> > > explicitly? We know all col values upfront - these are static and
> > > declared in global table nearby. Static declaration takes care of
> > > "initial range-check". Is another one necessary?
> > > =

> > > Moreover, this is a _get_ and certainly not a _set_ type of
> > > function. I'd even consider renaming it to: "cdns_get_frame_shape"
> > > as this is neither a _set_ nor an explicit initial frame shape
> > > setter.
> > > =

> > > It might be even helpful to split two usages:
> > > =

> > > #define sdw_frame_shape(col_idx, row_idx) \
> > > =A0=A0=A0=A0=A0((row_idx << CDNS_MCP_FRAME_SHAPE_ROW_OFFSET) | col_id=
x)
> > > =

> > > u32 cdns_get_frame_shape(u16 rows, u16 cols)
> > > {
> > > =A0=A0=A0=A0=A0u16 c, r;
> > > =

> > > =A0=A0=A0=A0=A0r =3D sdw_find_row_index(rows);
> > > =A0=A0=A0=A0=A0c =3D sdw_find_col_index(cols);
> > > =

> > > =A0=A0=A0=A0=A0return sdw_frame_shape(c, r);
> > > }
> > > =

> > > The above may even be simplified into one-liner.
> > =

> > This is a function used once on startup, there is no real need to
> > simplify further. The separate variables help add debug traces as needed
> > and keep the code readable while showing how the values are encoded into
> > a register.
> =

> Eh, I've thought it's gonna be exposed to userspace (via uapi) so it can =
be
> fetched by tests or tools.

Uapi? I dont see anything in this or other series posted, did I miss
something? Also I am not sure I like the idea of exposing these to
userland!

> =

> In such case - if there is a single usage only - guess function is fine as
> is.

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
