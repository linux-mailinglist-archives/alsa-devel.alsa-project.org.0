Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3480CA4D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 13:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36F93823;
	Mon, 11 Dec 2023 13:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36F93823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702299326;
	bh=cVLs2m4zNhGQgeKr8K/RAa56lm+O9Ctlu9DiFQF2P+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pu0ihTlaErWyYHVewztmaZ7gC3WGGz+zHavpJGv8VkDQXUZxRqLgkvsRMpgT39WPC
	 9VOI4ryTS63563VJY3J9FIFDmpGxBM+J6+bIUKkf9Y9PaSNsg27OGkHy78S+1jH/PQ
	 dKWE1hwb8wJ9PGrY9Yp8BMSC9KcTB5TUZjliIewQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5017F8057F; Mon, 11 Dec 2023 13:54:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E454F80537;
	Mon, 11 Dec 2023 13:54:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3940FF80166; Mon, 11 Dec 2023 13:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 739DFF800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 13:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 739DFF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=kpMhgjgC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E426AB80E0D;
	Mon, 11 Dec 2023 12:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7945C433C7;
	Mon, 11 Dec 2023 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702299282;
	bh=cVLs2m4zNhGQgeKr8K/RAa56lm+O9Ctlu9DiFQF2P+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpMhgjgCsfcyP66OWTsFQHGzxgOSHf/0bt8DOOATJWGkcto3lQNuqer7dxeSKwjlH
	 l69g+MuHMrfFZnZfHRO9Ha7ppkkQcbKkUXcadXZOlE/AQriOyeajsj8MfujQgsM8yu
	 zquUaW54pC3VwXfFxdOqT1gHruYqJcxXHqYFZBhU=
Date: Mon, 11 Dec 2023 13:54:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 0/2] ASoC: qcom: Limit Digital gains on speaker
Message-ID: <2023121113-walrus-outmost-ec34@gregkh>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
 <ZXbDY1iA_DQLIzqq@hovoldconsulting.com>
 <2023121146-hunger-crane-7dee@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023121146-hunger-crane-7dee@gregkh>
Message-ID-Hash: VYSTOETWVPZ6USQQ7EHHE5HNMSGO7JVW
X-Message-ID-Hash: VYSTOETWVPZ6USQQ7EHHE5HNMSGO7JVW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYSTOETWVPZ6USQQ7EHHE5HNMSGO7JVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 11, 2023 at 01:40:52PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 11, 2023 at 09:08:03AM +0100, Johan Hovold wrote:
> > Hi Greg and Sasha,
> > 
> > On Mon, Dec 04, 2023 at 12:47:34PM +0000, srinivas.kandagatla@linaro.org wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > Limit the speaker digital gains to 0dB so that the users will not damage them.
> > > Currently there is a limit in UCM, but this does not stop the user form
> > > changing the digital gains from command line. So limit this in driver
> > > which makes the speakers more safer without active speaker protection in
> > > place.
> > > 
> > > Apart from this there is also a range check fix in snd_soc_limit_volume
> > > to allow setting this limit correctly.
> > > 
> > > Tested on Lenovo X13s.
> > > 
> > > Srinivas Kandagatla (2):
> > >   ASoC: ops: add correct range check for limiting volume
> > >   ASoC: qcom: sc8280xp: Limit speaker digital volumes
> > 
> > These were unfortunately not marked for stable, but could you pick them
> > up for 6.6?
> > 
> > The upstream commits are:
> > 
> > 	fb9ad2448508 ("ASoC: ops: add correct range check for limiting volume")
> > 	716d4e5373e9 ("ASoC: qcom: sc8280xp: Limit speaker digital volumes")
> 
> Now queued up, thanks.

Oops, no, this breaks the build on 6.6.y, can you send a series that is
at least built for this series successfully?  :)

thanks,

greg k-h
