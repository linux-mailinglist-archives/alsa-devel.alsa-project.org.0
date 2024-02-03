Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7484848C
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 09:39:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E379827;
	Sat,  3 Feb 2024 09:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E379827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706949570;
	bh=OebqqDe2OlNfuBtKrA2Fp5NrNdfMmgRR0lEDATDNxjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qSZB87XUJvKspLfETVDTT0cFZxA2KO9molEQo8glH7kNVFNSiT8cf3OzNnzXkuwJu
	 f0haFdxax2D6tVx3bnQ3ffgRUOvbGxnMILFCj7XK8BfZ6+hSIM+LjBeLUtlrXTVwtf
	 O6Q4tV9RSQ0oqHs8205MHkvL9Rx+gtCIsl8Tt7Iw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05B94F8058C; Sat,  3 Feb 2024 09:38:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F03AEF8055C;
	Sat,  3 Feb 2024 09:38:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D2EF8055C; Sat,  3 Feb 2024 09:36:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42E01F800E3
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 09:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42E01F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c57KYkkV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E11EB608C4;
	Sat,  3 Feb 2024 08:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D83C433F1;
	Sat,  3 Feb 2024 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706949369;
	bh=OebqqDe2OlNfuBtKrA2Fp5NrNdfMmgRR0lEDATDNxjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c57KYkkVPqqrokvDQtm1sj0j77mgbmS3lGSlsPbfDVoefIQoMSPzBEjqYlqzRHZZM
	 3NM60BEci5Nn93/V+71Jf5PB8hV4UvKW+fcNAfB4V+ZrE0Fo/yl1jC9bTRrI0dXOLN
	 SlKcx7VEItswRYP6THbLa4zAxTBv9vk5tFlw9wb5OQpWbkPd7LgSAFHJc+d00ddaL1
	 26XLGnfBTdseCexgHfuKhTKvrWRwzeRGHHiKUhyA+P/gS72mXegcXVxXiSnvlsYJMs
	 qc5isvtBauDQTI/9ajrRshRl419Ikh3wYN1e5UCkN9A2upsCqksPhYzX3cU++2j7d2
	 qw7RRTZRHanYQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rWBVW-000000000M0-2H7G;
	Sat, 03 Feb 2024 09:36:14 +0100
Date: Sat, 3 Feb 2024 09:36:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Stable backport request (was: [PATCH v5 0/4] ASoC: qcom: volume
 fixes and codec cleanups)
Message-ID: <Zb36_mlapsfSLHEy@hovoldconsulting.com>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
 <170596045583.161959.6600754837297158632.b4-ty@kernel.org>
 <ZbjxUF2IV3A5zNw5@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbjxUF2IV3A5zNw5@hovoldconsulting.com>
Message-ID-Hash: ZKLIQOZQLYDDG2CRUWTQW2CEZBWSWLVY
X-Message-ID-Hash: ZKLIQOZQLYDDG2CRUWTQW2CEZBWSWLVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKLIQOZQLYDDG2CRUWTQW2CEZBWSWLVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg and Sasha,

On Tue, Jan 30, 2024 at 01:53:37PM +0100, Johan Hovold wrote:
> On Mon, Jan 22, 2024 at 09:54:15PM +0000, Mark Brown wrote:
> > On Mon, 22 Jan 2024 19:18:15 +0100, Johan Hovold wrote:
> > > To reduce the risk of speaker damage the PA gain needs to be limited on
> > > machines like the Lenovo Thinkpad X13s until we have active speaker
> > > protection in place.
> > > 
> > > Limit the gain to the current default setting provided by the UCM
> > > configuration which most user have so far been using (due to a bug in
> > > the configuration files which prevented hardware volume control [1]).
> > > 
> > > [...]
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> alsa-ucm-conf 1.2.11 was released yesterday, which means that it is now
> very urgent to get the speaker volume limitation backported to the
> stable trees.
> 
> Could you please try to make sure that these fixes get to Linus this
> week?

This series (and a related headphone codec fix) were merged into Linus's
tree yesterday.

I saw that the 6.7.4 stable patches were sent out for review over night,
but could it be possible to squeeze in also the following four fixes in
6.7.4 (and 6.6.16)?

	c481016bb4f8 ASoC: qcom: sc8280xp: limit speaker volumes
	4d0e8bdfa4a5 ASoC: codecs: wcd938x: fix headphones volume controls
	46188db080bd ASoC: codecs: lpass-wsa-macro: fix compander volume hack
	b53cc6144a3f ASoC: codecs: wsa883x: fix PA volume control

These are needed for proper volume control and, importantly, to prevent
users of the Lenovo ThinkPad X13s from potentially damaging their
speakers when the distros ship the latest UCM configuration files which
were released on Monday.

Johan
