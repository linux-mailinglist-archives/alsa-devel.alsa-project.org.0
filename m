Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE658842578
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 13:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C2AE72;
	Tue, 30 Jan 2024 13:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C2AE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706619269;
	bh=fOjlZzbAVw9Cqy4DTeoEpYu4QFxaBTIi8IHtqdYkjJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F4JQ7/e3grbq044EUIo9MvXLdKno+vpe30zswEXJVfNkXFemCNwjkJhWDN6ITQZa0
	 nSXAKhqavNX8e2LJrWbaC8EEQ8BCVwE3j5VcfNQPIGxbGdrKXDc/1NH5uSn+uH76SX
	 joIN2JBTEnplGOUvI9V4lzMFAk7lIltYzaPt9HoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F6CBF80589; Tue, 30 Jan 2024 13:53:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F0B6F805A1;
	Tue, 30 Jan 2024 13:53:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1200F8055C; Tue, 30 Jan 2024 13:53:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E9A2F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 13:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E9A2F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KRMR0jzX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91978CE16B0;
	Tue, 30 Jan 2024 12:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE48CC433C7;
	Tue, 30 Jan 2024 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706619220;
	bh=fOjlZzbAVw9Cqy4DTeoEpYu4QFxaBTIi8IHtqdYkjJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRMR0jzXNgH0yE18/Nq++DuaSZ5VUmCWGSZmBaGGqW1yG4dN/bZCncvIwsTst3vV9
	 qjaqYdLRiEFINOQwB8ivSQv9nKTFAkgvR9nFCHsTo7sT5Q7sjHgsggmyLwvhl1I2lq
	 KJYDal/kunx40IAsYL/K7qcVYTCcUG9J9+o3A6KDfR5aeCxM/MNClYEWGM3WghRrRu
	 w/sUb5zAE3sxKuV1qodJoOuMgFs/FWF/vHEXoaJh1XTB3B5HtNKaFD327KeCVMLxHO
	 r5njrU4eEp7QOXNu8cjITb+zQE0Sc2mW0jbgpMsckkpS7maAVxjkaX66SBBZUMYPQI
	 4epTlhzdh24PA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rUncO-000000003iL-1S0t;
	Tue, 30 Jan 2024 13:53:37 +0100
Date: Tue, 30 Jan 2024 13:53:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/4] ASoC: qcom: volume fixes and codec
 cleanups
Message-ID: <ZbjxUF2IV3A5zNw5@hovoldconsulting.com>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
 <170596045583.161959.6600754837297158632.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170596045583.161959.6600754837297158632.b4-ty@kernel.org>
Message-ID-Hash: ENPLMCCME2P6RJPQTRVXSVVD3QEWYJGZ
X-Message-ID-Hash: ENPLMCCME2P6RJPQTRVXSVVD3QEWYJGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENPLMCCME2P6RJPQTRVXSVVD3QEWYJGZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark and Takashi,

On Mon, Jan 22, 2024 at 09:54:15PM +0000, Mark Brown wrote:
> On Mon, 22 Jan 2024 19:18:15 +0100, Johan Hovold wrote:
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

alsa-ucm-conf 1.2.11 was released yesterday, which means that it is now
very urgent to get the speaker volume limitation backported to the
stable trees.

Could you please try to make sure that these fixes get to Linus this
week?

Johan
