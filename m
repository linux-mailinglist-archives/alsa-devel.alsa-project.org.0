Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40D832558
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 09:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1404D823;
	Fri, 19 Jan 2024 09:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1404D823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705651251;
	bh=RvV+1/JImv/LsRuTBtSvKboMDVj2C5IRu1Y90h46cMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gx+likv4td96TLAGRcmxSroAykFdIftCw8FI7X5kxnyXrzk0PHgP9lOCRFUTAGJEl
	 43CCOKSvRM6XKUpFw3xppBMlEFLp+OGYHhfpRMIiNnZAEAOU0m2Z/RxqoyMndIgkJ9
	 T062NF23UDBey5djzbsR5x7NWKG1qSvYmOmZnAI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA29F8057D; Fri, 19 Jan 2024 09:00:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01316F80563;
	Fri, 19 Jan 2024 09:00:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A30F801F5; Fri, 19 Jan 2024 09:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E201F80074
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 09:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E201F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cs09mdNN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93F8061083;
	Fri, 19 Jan 2024 08:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322C1C43390;
	Fri, 19 Jan 2024 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705651207;
	bh=RvV+1/JImv/LsRuTBtSvKboMDVj2C5IRu1Y90h46cMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cs09mdNNXn/aACNvQqz5ULreJfjwPVRxn8+H6D39eaWB57CeeCyQAf3qFkJ0r0Co4
	 gm/i6ZljCOGciBqfUaZas4CEgLSUgKNaBhTdX4h5xAAaWsWA2rmDjmQNCFdhr8iMwf
	 aWklHr9uTSG/2DrbxsCHkqH38+bFyLHicrWVU/wIrSGqMKQSCSdB2WvlEqmFl9Hrk3
	 o+tN/PTFdsXeV4PLrVtGf23hli2nVfpjAbvNHrlUgYS3J5OmxmlKnMXP2A15fwAQHc
	 GCYzEIpv+Ol/iexkRvigJCVTZSKBBo32ifJM3DmayVuccwcQONNO+YODHiDCeKGzvF
	 5aiJb63saaCqg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQjnT-0004Yp-2Z;
	Fri, 19 Jan 2024 09:00:15 +0100
Date: Fri, 19 Jan 2024 09:00:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ASoC: codecs: wsa883x: lower default PA gain
Message-ID: <ZaosD3N0MpYg9Fpo@hovoldconsulting.com>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-3-johan+linaro@kernel.org>
 <63e000c7-deae-44df-8d82-a74ffe303e9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e000c7-deae-44df-8d82-a74ffe303e9a@linaro.org>
Message-ID-Hash: HGGHRYUIXQSDPPKGL2AC76QKWENKHDYV
X-Message-ID-Hash: HGGHRYUIXQSDPPKGL2AC76QKWENKHDYV
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGGHRYUIXQSDPPKGL2AC76QKWENKHDYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 07:15:33AM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 18/01/2024 16:58, Johan Hovold wrote:
> > The default PA gain is set to a pretty high level of 15 dB. Initialise
> > the register to the minimum -3 dB level instead.
> > 
> > This is specifically needed to allow machine drivers to use the lowest
> > level as a volume limit.
> > 
> > Cc: stable@vger.kernel.org      # 6.5
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >   sound/soc/codecs/wsa883x.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> > index 32983ca9afba..8942c88dee09 100644
> > --- a/sound/soc/codecs/wsa883x.c
> > +++ b/sound/soc/codecs/wsa883x.c
> > @@ -722,7 +722,7 @@ static struct reg_default wsa883x_defaults[] = {
> >   	{ WSA883X_WAVG_PER_6_7, 0x88 },
> >   	{ WSA883X_WAVG_STA, 0x00 },
> >   	{ WSA883X_DRE_CTL_0, 0x70 },
> > -	{ WSA883X_DRE_CTL_1, 0x08 },
> 
> this is hw default value.

Indeed. This was a last minute change when I noticed I could actually
set the lowest limit in the machine driver after I offset it, but then
the reset value was never updated. Didn't think this through.

> > +	{ WSA883X_DRE_CTL_1, 0x1e },
> >   	{ WSA883X_DRE_IDLE_DET_CTL, 0x1F },
> >   	{ WSA883X_CLSH_CTL_0, 0x37 },
> >   	{ WSA883X_CLSH_CTL_1, 0x81 },

Johan
