Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3A6BEA3C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 14:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F32F5C;
	Fri, 17 Mar 2023 14:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F32F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679060310;
	bh=YWIDLuEFnRBwfpxQtDoAidrvlww69eJAsTQKccqkZNQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=euaUbM1HEvNyE8bMsZHIhGMYnYLURmIz+4hj59cLdMG5DBuKKj+feSAw6+02Nk3Lf
	 9XTcAz10AbDbtnBTzG6D0R+4ZeYa/E5nGz6nguEe7TCYWQ3CtCHT4WmQp5OrsImoTS
	 8VXkRgqfogOhf4+vgQU6TZTx2x3ThDj9ioIxPdKw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 025C9F80527;
	Fri, 17 Mar 2023 14:37:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E0BFF80529; Fri, 17 Mar 2023 14:37:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C627BF80520
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 14:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C627BF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c7OwB4Pm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 916CC622A3;
	Fri, 17 Mar 2023 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600D6C4339C;
	Fri, 17 Mar 2023 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679060239;
	bh=YWIDLuEFnRBwfpxQtDoAidrvlww69eJAsTQKccqkZNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7OwB4PmkZxRr85XcBZkS7xesvAoFtE+21ae1YpfA6yECiRs5ooSxph+4VEvCFFbf
	 fTQN0tH4hMuDzK+7yV67K1JvIcKYfEQs8ndoocY4hb+uWl3yqi5Y9oRlTaCTj8n/Ky
	 hjqkrmHfxZJi7R+lDxSIHhQRfRQ2qJ64qrfcbdpTXI4z86g5GG3jWyL1P/Dn6rigg2
	 ScoLvCGLyRkZJj2whKtOtxzRQT0TsBCGusONDoWO3+6dRgq0PTbwQC/RcBhwk8KapP
	 Bfx933INbNwHJUs3Iw0sOHY2a93fuaYl35lRv7sNnwvRzZhFb3dca4Bgc2QsUoJOA1
	 Cp0VnFXdAt/pw==
Date: Fri, 17 Mar 2023 19:07:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: stream: uniquify dev_err() logs
Message-ID: <ZBRtCwtmFsQQ+Oo0@matsya>
References: <20230309054905.21507-1-yung-chuan.liao@linux.intel.com>
 <ZBGZR2ACa8AbNmvy@matsya>
 <c40192e9-6207-3204-819f-abbabc320c38@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c40192e9-6207-3204-819f-abbabc320c38@linux.intel.com>
Message-ID-Hash: DRPZYXGJB65C7M3JBORTO3HK4BMDEQR5
X-Message-ID-Hash: DRPZYXGJB65C7M3JBORTO3HK4BMDEQR5
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRPZYXGJB65C7M3JBORTO3HK4BMDEQR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-03-23, 09:38, Pierre-Louis Bossart wrote:
> 
> 
> On 3/15/23 05:09, Vinod Koul wrote:
> > On 09-03-23, 13:49, Bard Liao wrote:
> >> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>
> >> There are a couple of duplicate logs which makes harder than needed to
> >> follow the error flows. Add __func__ or make the log unique.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> >> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >> ---
> >>  drivers/soundwire/stream.c | 18 ++++++++++--------
> >>  1 file changed, 10 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> >> index 2e39587ed1de..dd09855caac9 100644
> >> --- a/drivers/soundwire/stream.c
> >> +++ b/drivers/soundwire/stream.c
> >> @@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
> >>  
> >>  	ret = do_bank_switch(stream);
> >>  	if (ret < 0) {
> >> -		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
> >> +		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
> > 
> > why make it pr_ and loose the dev name? There is a trick to emit
> > function for dev_err too using dynamic debug
> 
> a stream can be cased on multiple managers/buses.
> 
> It's incorrect to use bus->dev in this case, see all other error cases
> in stream.c, they all use pr_err already for the same reason. bus->dev
> is only valid when dealing with a single bus, typically in loops in that
> file.
> 
> That said we could have split the two changes where dev_err() is changed
> as pr_err() for clarity.

Thanks, that would be better way

-- 
~Vinod
