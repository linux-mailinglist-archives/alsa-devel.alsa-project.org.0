Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA7848751
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 17:04:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68742857;
	Sat,  3 Feb 2024 17:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68742857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706976296;
	bh=5DqaVk+Tled7B7zD5P3CsBhEgwQvizuMR5RGuh99ymo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W88oXYtvYg75JX2nUi6a0IJr31h0Fx2UBU+WUL/o2qR9IfI30q0WKeupQVtHaakgc
	 MUVYSZ8ewbGhaiaXvYL4BlR3snmtoxUHLAFLPRKle3B9mRJPHDd6fob9eszNF4sGQp
	 /H+jjfJgAh8cOzPHH7oCHBwPpwLfxRef83LDZOyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E07F80580; Sat,  3 Feb 2024 17:04:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C38F805A8;
	Sat,  3 Feb 2024 17:04:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7555DF8055C; Sat,  3 Feb 2024 17:04:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96C1DF800E3
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 17:04:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C1DF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=h6r7y3Xd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94289602E1;
	Sat,  3 Feb 2024 16:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3558CC433F1;
	Sat,  3 Feb 2024 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706976242;
	bh=5DqaVk+Tled7B7zD5P3CsBhEgwQvizuMR5RGuh99ymo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6r7y3Xd16/amxIFXzdo+EwJqTFcTUs3LSFsQP4O7TDp2PF0LDCHgQL5z+7j9cnT/
	 Rrx5rOYMCJvTYNlvFLYZeac2dRhoAthGNePlGG78qAILMPEHbNh9GqRbUMEdaDQLkJ
	 zVABXrgCxX1WnqF157FNoS12arEM1lifAlvLFgNQ=
Date: Sat, 3 Feb 2024 08:04:01 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
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
Message-ID: <2024020351-tactics-discover-9091@gregkh>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
 <170596045583.161959.6600754837297158632.b4-ty@kernel.org>
 <ZbjxUF2IV3A5zNw5@hovoldconsulting.com>
 <Zb36_mlapsfSLHEy@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zb36_mlapsfSLHEy@hovoldconsulting.com>
Message-ID-Hash: 77T6NSASBVVJSMBJERWRYQZVMZACWOAM
X-Message-ID-Hash: 77T6NSASBVVJSMBJERWRYQZVMZACWOAM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77T6NSASBVVJSMBJERWRYQZVMZACWOAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Feb 03, 2024 at 09:36:14AM +0100, Johan Hovold wrote:
> Hi Greg and Sasha,
> 
> On Tue, Jan 30, 2024 at 01:53:37PM +0100, Johan Hovold wrote:
> > On Mon, Jan 22, 2024 at 09:54:15PM +0000, Mark Brown wrote:
> > > On Mon, 22 Jan 2024 19:18:15 +0100, Johan Hovold wrote:
> > > > To reduce the risk of speaker damage the PA gain needs to be limited on
> > > > machines like the Lenovo Thinkpad X13s until we have active speaker
> > > > protection in place.
> > > > 
> > > > Limit the gain to the current default setting provided by the UCM
> > > > configuration which most user have so far been using (due to a bug in
> > > > the configuration files which prevented hardware volume control [1]).
> > > > 
> > > > [...]
> > > 
> > > Applied to
> > > 
> > >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> > 
> > alsa-ucm-conf 1.2.11 was released yesterday, which means that it is now
> > very urgent to get the speaker volume limitation backported to the
> > stable trees.
> > 
> > Could you please try to make sure that these fixes get to Linus this
> > week?
> 
> This series (and a related headphone codec fix) were merged into Linus's
> tree yesterday.
> 
> I saw that the 6.7.4 stable patches were sent out for review over night,
> but could it be possible to squeeze in also the following four fixes in
> 6.7.4 (and 6.6.16)?
> 
> 	c481016bb4f8 ASoC: qcom: sc8280xp: limit speaker volumes
> 	4d0e8bdfa4a5 ASoC: codecs: wcd938x: fix headphones volume controls
> 	46188db080bd ASoC: codecs: lpass-wsa-macro: fix compander volume hack
> 	b53cc6144a3f ASoC: codecs: wsa883x: fix PA volume control
> 
> These are needed for proper volume control and, importantly, to prevent
> users of the Lenovo ThinkPad X13s from potentially damaging their
> speakers when the distros ship the latest UCM configuration files which
> were released on Monday.

All now queued up for this round, thanks.

greg k-h
