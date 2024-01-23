Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72880838869
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 08:59:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C00826;
	Tue, 23 Jan 2024 08:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C00826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705996787;
	bh=E87nD93jJ+vmxbmKH7yTTktP9lMuBJ2ulmspVtaJYKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W36H2moB5OnPs2M1qHPPf9cizIq12A5ibFFcLbwIqy1wEgCZg6C59LDYUkWr621pw
	 97EfwZF8EcdIQWnDnm/1axNwJEVXmag4g61jzHLg8kSBhnGyKso2x7HUxqjTGzaxrQ
	 rTUmhoTWkljeLkGqstAUM2o6qRJt9h4szaC4yEh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D10FCF805C1; Tue, 23 Jan 2024 08:58:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 434FDF805B3;
	Tue, 23 Jan 2024 08:58:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DC3BF8028D; Tue, 23 Jan 2024 08:58:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96DAEF80149
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 08:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DAEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=obrUMfBg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE635CE2DDC;
	Tue, 23 Jan 2024 07:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3462C433C7;
	Tue, 23 Jan 2024 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705996688;
	bh=E87nD93jJ+vmxbmKH7yTTktP9lMuBJ2ulmspVtaJYKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obrUMfBgK9Z0J3D4toVHkjnUI/BHbpboUTHMYupaer114w5skrzm8AcoVhyoLN9HZ
	 3Z9l9amEBJ7YJ/E5V2tNjXlehcXVsfhw9U3rNsDF31Lfl/HeVUDYBH5CwGprrwsEdY
	 VExOLl3zb/y0ZiEsJKv0EvgWVn7YAxEImEF6+f0RMiH0dzMiRvp2TZKG+zqb7y8lEH
	 LOciS4+YztgnOmsIU2Bkkjec5qlAxPeHHZg9P7pwkm6UQTC7CD50gBF9jfuiQpJqVO
	 CuiALrHaOe0eziCDFfDD5NXTFL3cBlDBZqHZwQvxkeIIZTXs2oiLiWbOOZdFyLwgZ+
	 JShGXd4cJ3UIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rSBfo-00000000267-3iRv;
	Tue, 23 Jan 2024 08:58:20 +0100
Date: Tue, 23 Jan 2024 08:58:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] ASoC: qcom: volume fixes and codec cleanups
Message-ID: <Za9xnEXYczA5rsw3@hovoldconsulting.com>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <170596045016.161959.16318695944363636291.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170596045016.161959.16318695944363636291.b4-ty@kernel.org>
Message-ID-Hash: LRE5BDPZIREEX25KMESTGHJVBYYRD5T6
X-Message-ID-Hash: LRE5BDPZIREEX25KMESTGHJVBYYRD5T6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRE5BDPZIREEX25KMESTGHJVBYYRD5T6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 22, 2024 at 09:54:10PM +0000, Mark Brown wrote:
> On Fri, 19 Jan 2024 12:24:16 +0100, Johan Hovold wrote:
> > To reduce the risk of speaker damage the PA gain needs to be limited on
> > machines like the Lenovo Thinkpad X13s until we have active speaker
> > protection in place.
> > 
> > Limit the gain to the current default setting provided by the UCM
> > configuration which most user have so far been using (due to a bug in
> > the configuration files which prevented hardware volume control [1]).
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/4] ASoC: codecs: wsa883x: fix PA volume control
>       (no commit info)
> [2/4] ASoC: qcom: sc8280xp: limit speaker volumes
>       commit: c481016bb4f8a9c059c39ac06e7b65e233a61f6a
> [3/4] ASoC: codecs: lpass-wsa-macro: fix compander volume hack
>       (no commit info)
> [4/4] ASoC: codecs: wcd9335: drop unused gain hack remnant
>       (no commit info)

Thanks, Mark. 

Could you consider applying at least patches 1/4 and 3/4 for 6.8 as
well?

The former is needed for proper hardware volume control with the fixed
UCM files, and the latter avoids ending up with the digital gain setting
set too low or too high while by-passing the volume limit set by the
machine driver.

Johan
