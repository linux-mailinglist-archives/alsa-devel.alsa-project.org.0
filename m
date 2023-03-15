Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A754F6BB509
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:46:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195481269;
	Wed, 15 Mar 2023 14:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195481269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678887979;
	bh=avbS2XLbaT2Ze2SWcGU+uxKZhUw+cN+JCgvYHiUVGl0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MKuh3M4JBMMDRd8LbhfiS324U79JrSwbL0xmNCBxppKWVJiaFRUcxML6yGyUStciF
	 pwFTbUtN3DENgxtQPdVNoH8pmELeS5FPDIGV6P4UToeAcOYs360OSutLFg2f33WJg1
	 oI3zagSWTvtcZr3oc0cuNbHiVtsm72F2eDrvD3y4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88974F80580;
	Wed, 15 Mar 2023 14:43:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 512BEF80587; Wed, 15 Mar 2023 14:43:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F58BF8057E
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:43:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F58BF8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KT+cilCT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D72861DA7;
	Wed, 15 Mar 2023 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51756C433D2;
	Wed, 15 Mar 2023 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678887794;
	bh=avbS2XLbaT2Ze2SWcGU+uxKZhUw+cN+JCgvYHiUVGl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KT+cilCTP1wAcIJ8HjEaSpmXvNPOjdVgjtZZTPHtYjFqFMyKfWC4GFT80ZC0ElIrZ
	 +MsVrKqQFYAqkWxLG2tqJT6UqpD28qe2eFzTnhrfyBXCVnUR8Izl7M1dcwi37RzgdX
	 e1DtR0AhuZOZTAI8tsCuyufuNKT2lEz1aLmIXE4cEtC0WFUj0q1QPPIGpOwqyvaKcj
	 2D9xBXXYxX51ibEjzduZX2jgvQq/pmPM/ClgyT3osn7Wp6c06YLds3a3k13232I0T5
	 NlChccnngghMeZv/RLDK9hrC6o3zQKdR8uWDcn7QZNwDygc3lw2A7yE6ttvugkhS1U
	 z2vpXUQ2oaFkg==
Date: Wed, 15 Mar 2023 19:13:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] soundwire: bus: Prevent infinite loop in
 sdw_ch_mask_to_ch()
Message-ID: <ZBHLbksMqwnewtMC@matsya>
References: <20230202154212.1098736-1-rf@opensource.cirrus.com>
 <20230202154212.1098736-2-rf@opensource.cirrus.com>
 <0b49c924-5994-c1cd-a174-4a2e2cfaf0d2@linux.intel.com>
 <2d1f1bc1-afaa-b1f4-1a93-df1bfa00405b@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1f1bc1-afaa-b1f4-1a93-df1bfa00405b@opensource.cirrus.com>
Message-ID-Hash: XHZA2ZDWO6FCAHKBGQ2HZZAAHIORTFVR
X-Message-ID-Hash: XHZA2ZDWO6FCAHKBGQ2HZZAAHIORTFVR
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHZA2ZDWO6FCAHKBGQ2HZZAAHIORTFVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03-02-23, 16:18, Richard Fitzgerald wrote:
> On 03/02/2023 14:35, Pierre-Louis Bossart wrote:
> > 
> > 
> > On 2/2/23 09:42, Richard Fitzgerald wrote:
> > > Define the ch_mask argument of sdw_ch_mask_to_ch() as an unsigned
> > > so that the shift right is guaranteed to eventually make the
> > > value of ch_mask==0.
> > > 
> > > Previously ch_mask was defined as a signed int, but a right
> > > shift of a signed value preserves the sign bit. So if the sign
> > > bit was 1, ch_mask would never become 0 and the for loop would
> > > be infinite.
> > > Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> > > ---
> > >   drivers/soundwire/bus.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> > > index 7631ef5e71fb..28bedc919b78 100644
> > > --- a/drivers/soundwire/bus.h
> > > +++ b/drivers/soundwire/bus.h
> > > @@ -160,7 +160,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
> > >   		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf);
> > >   /* Retrieve and return channel count from channel mask */
> > > -static inline int sdw_ch_mask_to_ch(int ch_mask)
> > > +static inline int sdw_ch_mask_to_ch(unsigned int ch_mask)
> > >   {
> > >   	int c = 0;
> > 
> > This patch1 is fine, but you remove this function in patch2, so is this
> > patch needed at all?
> > 
> > -/* Retrieve and return channel count from channel mask */
> > -static inline int sdw_ch_mask_to_ch(unsigned int ch_mask)
> > -{
> > -	int c = 0;
> > -
> > -	for (c = 0; ch_mask; ch_mask >>= 1)
> > -		c += ch_mask & 1;
> > -
> > -	return c;
> > -}
> > -
> 
> I'm happy to squash them, I did it in two steps so it didn't get
> overlooked that there's a bugfix happening.

I think this case is fine to squash and send as a single patch while
documenting that we are fixing the bug in the log

Thanks
-- 
~Vinod
