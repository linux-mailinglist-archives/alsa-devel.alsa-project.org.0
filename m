Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F17F9BC1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 09:34:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AADED83E;
	Mon, 27 Nov 2023 09:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AADED83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701074093;
	bh=unCaXJLxTUPj78Mw3wAj0N85QPztmDRO+DsnNzOcHyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GiVpnWZ23sr7KQGOANzIzhg2LRlyexs05lJUYlxIaQPuZFOan6lGZrWkZcrzWaL/6
	 xoBGLL2YTZLMC0N28gz4QaZTr2oG0bbqoq5hOJCcvG1laUwufy6Dy4y+8H72wafWoW
	 lmgYRwYJfXsTjGne+Y2b13Sz6vuUq7IljHq8dR7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11151F80579; Mon, 27 Nov 2023 09:34:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BEDCF8057A;
	Mon, 27 Nov 2023 09:34:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7D34F801D5; Mon, 27 Nov 2023 09:34:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9817F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 09:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9817F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eeGLYqfH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D64356103E;
	Mon, 27 Nov 2023 08:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804CDC433C7;
	Mon, 27 Nov 2023 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701074051;
	bh=unCaXJLxTUPj78Mw3wAj0N85QPztmDRO+DsnNzOcHyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eeGLYqfHsnH5C6JZJowFVGo9N5tWStKUX+kM+DtxMi7feq8XDRqdrh5Kd71O7SOPv
	 jcXSPKwkVBN/lTBdh6MAQMaoP9XelvBzA8LyL+R20UoV6Cs+fLQO7ldHpTAiHQA58e
	 aZ+E4v/P+v+uD7kviN+GaxpOjy0gCd7+itWbRKSkjjUrYnLgBgqYUZoNrlpdB4+p88
	 ILOrEGU5g+6zjXMkhdBNzJ4DqEkYDEoVvu93RwXhbsXevJu2Mj21tpj1itZ59FcsqV
	 he+pXIMym5Br9bRJdUZtYR3TuJET+EoeXlw16FnAF93Y996DFyICivSTRIH6uL3QBU
	 Ys7Jt98Wddt+w==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r7X4f-0002ln-0B;
	Mon, 27 Nov 2023 09:34:37 +0100
Date: Mon, 27 Nov 2023 09:34:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <ZWRUnUvzJIxqFXDI@hovoldconsulting.com>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
Message-ID-Hash: NCRGMSOKRPZEBIYDGD3G2ZWQUN63VT72
X-Message-ID-Hash: NCRGMSOKRPZEBIYDGD3G2ZWQUN63VT72
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCRGMSOKRPZEBIYDGD3G2ZWQUN63VT72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 01:52:11PM +0200, Johan Hovold wrote:
> On Fri, Oct 27, 2023 at 11:57:45AM +0100, Srinivas Kandagatla wrote:
> > Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> > to accumlate DC when ports are active but without any data streams.
> > There are multiple places in the current setup, where this could happen
> > in both startup as well as shutdown path.
> > 
> > This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
> > generic code do the mute/unmute on trigger.
> > 
> > This patches help fix those issues by making sure the PA is Muted/Unmuted
> > inline with the stream start/stop events.
> >
> > Srinivas Kandagatla (2):
> >   ASoC: soc-dai: add flag to mute and unmute stream during trigger
> >   ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
> 
> I've verified that this fixes the pop sounds when starting and stopping
> a stream on the X13s, even if the click sound when killing pulseaudio
> (e.g. on reboot) is still there (as with the previous fixes).

For the record, the remaining click sounds were incidentally fixed by
commit 3efcb471f871 ("ASoC: soc-pcm.c: Make sure DAI parameters cleared
if the DAI becomes inactive") which also went into 6.7-rc1:

	https://lore.kernel.org/lkml/20230920153621.711373-1-chancel.liu@nxp.com/

Johan
