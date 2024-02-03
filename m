Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2758487C1
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 18:03:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66894846;
	Sat,  3 Feb 2024 18:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66894846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706979789;
	bh=CN7prL1hTwWEH4QYaOs3Ts5GpLJ6XNhC7U20VK3JHBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cAa0etLE4rDtU2uKuY/niGiv8p4QWR3QbrsegAEl76o+QG19RcUQkScRiBhtBIcqp
	 Za1Awxu3626IfbvrTlnPZRSJHB0D/BxZLeCGGi2MTaimbPDuAtp2Bs3VHLkBXT7DZ7
	 gpPVAxpD6eGsmNpkgGo0/yWXVr21vU8ZHPL2FjuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A672F8056F; Sat,  3 Feb 2024 18:02:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 743BFF805A0;
	Sat,  3 Feb 2024 18:02:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9EBFF8055C; Sat,  3 Feb 2024 18:02:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0855CF800E3
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 18:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0855CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GnqIFj6q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6821060276;
	Sat,  3 Feb 2024 17:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F446C433C7;
	Sat,  3 Feb 2024 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706979742;
	bh=CN7prL1hTwWEH4QYaOs3Ts5GpLJ6XNhC7U20VK3JHBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnqIFj6q+449MzHNfDi3e0u94bvAtnkvQVViDTtrThukB8ZZQ9GVGWAfICxbovNwE
	 5TK1/EG20vk4bZ23Qy0kuqn1t1CYQ4ybRL6NmXEcznN4tgLukz0lK5I2WMIhuY6pB2
	 z8hVCaBoFbrAv7qK3IgN8gJeddzktsrPB+45nrHreK41I+PTOC3d81I/4HbWWCBraH
	 27kPgsCySAe2056kxYOsASeo/7vG8RLfzX6dQeDdg0TKg4Wkx9olMEPiGaFVTL5rRC
	 62lQqBfBn5H7COSObBDniVIIrFkEqQAAMRqrzFlp37M9cixotvF2EZwKxnaEE/ojnM
	 L2pMp7yOsAj9w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rWJPQ-000000002QZ-1jJs;
	Sat, 03 Feb 2024 18:02:28 +0100
Date: Sat, 3 Feb 2024 18:02:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: Stable backport request (was: [PATCH v5 0/4] ASoC: qcom: volume
 fixes and codec cleanups)
Message-ID: <Zb5xpHhqWJEkr4lB@hovoldconsulting.com>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
 <170596045583.161959.6600754837297158632.b4-ty@kernel.org>
 <ZbjxUF2IV3A5zNw5@hovoldconsulting.com>
 <Zb36_mlapsfSLHEy@hovoldconsulting.com>
 <2024020351-tactics-discover-9091@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024020351-tactics-discover-9091@gregkh>
Message-ID-Hash: 5Y4MW6F6RVPCCGQ2Z6HZ3ORAGFEH5HAE
X-Message-ID-Hash: 5Y4MW6F6RVPCCGQ2Z6HZ3ORAGFEH5HAE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Y4MW6F6RVPCCGQ2Z6HZ3ORAGFEH5HAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Feb 03, 2024 at 08:04:01AM -0800, Greg Kroah-Hartman wrote:
> On Sat, Feb 03, 2024 at 09:36:14AM +0100, Johan Hovold wrote:

> > I saw that the 6.7.4 stable patches were sent out for review over night,
> > but could it be possible to squeeze in also the following four fixes in
> > 6.7.4 (and 6.6.16)?
> > 
> > 	c481016bb4f8 ASoC: qcom: sc8280xp: limit speaker volumes
> > 	4d0e8bdfa4a5 ASoC: codecs: wcd938x: fix headphones volume controls
> > 	46188db080bd ASoC: codecs: lpass-wsa-macro: fix compander volume hack
> > 	b53cc6144a3f ASoC: codecs: wsa883x: fix PA volume control

> All now queued up for this round, thanks.

Thanks, much appreciated!

Johan
