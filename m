Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF4D7D976B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 14:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0503AA4D;
	Fri, 27 Oct 2023 14:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0503AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698408766;
	bh=GufLd68JrWWCWbA9FffHZI8Ui49NvQRStWT72Nq8TtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=haP3GNRTwLxfSz3d/tZl+7LA4fGufIUDt6jM56SF14ViOipxkIom4eZhtDEtN8DLP
	 2qo5UKq8uL+6/KXZoeFdAEYsSy/e3zGKeiVt7/uTXzFEN/SFkP77JAXMe9ooK/4yaK
	 QkkeR8bTGnnZdvRpWreP9vEt/Swon7+ar8oAvniM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE98F80557; Fri, 27 Oct 2023 14:11:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4981DF80165;
	Fri, 27 Oct 2023 14:11:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD8AFF8019B; Fri, 27 Oct 2023 14:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C3E3F8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 14:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3E3F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DLMivdta
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 194F0CE3CE1;
	Fri, 27 Oct 2023 12:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A3DC433C8;
	Fri, 27 Oct 2023 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698408702;
	bh=GufLd68JrWWCWbA9FffHZI8Ui49NvQRStWT72Nq8TtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLMivdtaqZC7ceLgIAqQWKilUrU612Jp4J85/xgMihgp4sM9mah4DWNw6XMSZL468
	 8pPHx/xKmOedmJknI6rFWgAOquFzrfH7YvR0e0aAG8iDayO4TM9vXqAIKh8DLCiKMO
	 a4bJ3V86lzAMNnBv1EZNS4Xm3dti8iksEJi6Pu6Z4kJ4lAiBcgVLQVSt7yaWL8NMqR
	 Z3umw/STegj1sfLdR87es900k1S7FPMfju32aNHxNkXJZ76tzn1KoT4DicPighgqB0
	 0zcahF/Om7LUGByaNc8KZSqOoJrTrxi8eR2H1fDX7lmYKNREJ+hfExU/T6nFur3uFl
	 qW4JZfnNMq8BA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qwLhA-0007So-0P;
	Fri, 27 Oct 2023 14:12:08 +0200
Date: Fri, 27 Oct 2023 14:12:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <ZTupGPUQg0j1aGjW@hovoldconsulting.com>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <54c44548-c2e4-466d-bfe4-b48db9e5d20c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c44548-c2e4-466d-bfe4-b48db9e5d20c@linux.intel.com>
Message-ID-Hash: NCWUWCTQ33PR34KEPLVO2DYJSXCKQW3P
X-Message-ID-Hash: NCWUWCTQ33PR34KEPLVO2DYJSXCKQW3P
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCWUWCTQ33PR34KEPLVO2DYJSXCKQW3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 02:00:13PM +0200, Amadeusz Sławiński wrote:

> Have you tried something like:
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index e40d583a1ce6..f02362cf95dc 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -1229,6 +1229,8 @@ static int wsa883x_spkr_event(struct 
> snd_soc_dapm_widget *w,
>                  snd_soc_component_write_field(component, 
> WSA883X_VBAT_ADC_FLT_CTL,
>  
> WSA883X_VBAT_ADC_COEF_SEL_MASK,
>  
> WSA883X_VBAT_ADC_COEF_F_1DIV2);
> +               snd_soc_component_write_field(component, WSA883X_DRE_CTL_1,
> +                                             WSA883X_DRE_GAIN_EN_MASK, 0);
>                  snd_soc_component_write_field(component, 
> WSA883X_PA_FSM_CTL,
>  
> WSA883X_GLOBAL_PA_EN_MASK, 0);
>                  snd_soc_component_write_field(component, 
> WSA883X_PDM_WD_CTL,
> 
> 
> As it is one thing from wsa883x_digital_mute() which seems missing in 
> SND_SOC_DAPM_PRE_PMD switch case, so it seems to leave GAIN always enabled?

Since I had the test setup ready, I tried the above quickly but it
doesn't seem to make any difference.

Johan
