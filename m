Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E327D737A9C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 07:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5087C74C;
	Wed, 21 Jun 2023 07:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5087C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687325401;
	bh=yW3qiUVHg16/4KKCpu0Z3TzdW/v7UqcyJCdIiYkYUpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SBBzP6U0C563025/tVNiZDcJqL6phFKSntR8/tm58p14oOpzlYDKVBgIDyFlR+340
	 uw+1V3x+CR0ks3emhF1h2o97IYgQ0JllZSQC8Qf/kAXNKcCVCVvKLQPzP8I3DGU27u
	 MsAt/TurchlQHLQtDvJNshkGXbhIhCGlJnEXpv/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 592E7F80124; Wed, 21 Jun 2023 07:29:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB9AF80132;
	Wed, 21 Jun 2023 07:29:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F26AF80141; Wed, 21 Jun 2023 07:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D730F80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 07:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D730F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Lp+Qoq8e;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q+wYsoJI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD923218E5;
	Wed, 21 Jun 2023 05:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687325330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9zyM/doTEDKZbW/dtNnMrjF7ydlOovCExA/UYr2bJ+0=;
	b=Lp+Qoq8eyyndQfFSN9kaO8Abre31ZhmMpXWbLBRwl1RDQWIHJD3J9pQI++6J5b6C2/1ctI
	6uMXPPyXP+aS0zZfe2sIyvS1G620BKIfHCbqBg6/lyAvuRE6XRaGOIX0PthCj5wuUNvq45
	Nizga2fEtAMDky8xxkXl/sa/QdPQvCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687325330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9zyM/doTEDKZbW/dtNnMrjF7ydlOovCExA/UYr2bJ+0=;
	b=Q+wYsoJI83FpAhoaIUZGWs44NbUYF+3a3vUdGm/+p83vibkSeAf4xIEWK+Akp+CZH7uJLz
	bmh6+Z9x67TcSTAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CD4813A20;
	Wed, 21 Jun 2023 05:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oUwYJZKKkmTJCQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 05:28:50 +0000
Date: Wed, 21 Jun 2023 07:28:50 +0200
Message-ID: <87v8fhqt7x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com,
	corbet@lwn.net,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_plai@quicinc.com,
	quic_mohs@quicinc.com
Subject: Re: [PATCH v3] ALSA: compress: allow setting codec params after next
 track
In-Reply-To: <20230619092805.21649-1-srinivas.kandagatla@linaro.org>
References: <20230619092805.21649-1-srinivas.kandagatla@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KFB24HGUGLDM6VR6Y6MJEI36KGIA4HME
X-Message-ID-Hash: KFB24HGUGLDM6VR6Y6MJEI36KGIA4HME
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFB24HGUGLDM6VR6Y6MJEI36KGIA4HME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Jun 2023 11:28:05 +0200,
Srinivas Kandagatla wrote:
> 
> For gapless playback it is possible that each track can have different
> codec profile with same decoder, for example we have WMA album,
> we may have different tracks as WMA v9, WMA v10 and so on
> 
> Or if DSP's like QDSP have abililty to switch decoders on single stream
> for each track, then this call could be used to set new codec parameters.
> 
> Existing code does not allow to change this profile while doing gapless
> playback.
> 
> Reuse existing SNDRV_COMPRESS_SET_PARAMS to set this new track params along
> some additional checks to enforce proper state machine.
> 
> With this new changes now the user can call SNDRV_COMPRESS_SET_PARAMS
> anytime after setting next track and additional check in write should
> also ensure that params are set before writing new data.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v2:
>  simplified the logic to allow set_params and udated the documentation accordingly

Applied now.  Thanks.


Takashi
