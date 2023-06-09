Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34F729B17
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 15:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B02209;
	Fri,  9 Jun 2023 15:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B02209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686316223;
	bh=0QHEEmERs5KT10qCKQxRCKpKm54QjTiueVsH9AJrKB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fIqlhXoBSORTRptWsXYIf1J6D8/HW27tZOCd+ryPdZiVoOpEMiAEg8verkzEcFE5K
	 lBtckjEYcdq8L3MngMzs6mJxAPT+KRP0c/YbKLYzuB19On8+rdPz3e7d9YhRAPLq2d
	 Cs3J1pLuaWHtFXCU8hp3vmj6U+sCREJ/x3ObJJ1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1ABCF80527; Fri,  9 Jun 2023 15:09:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44BFAF8016C;
	Fri,  9 Jun 2023 15:09:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 578E0F80130; Fri,  9 Jun 2023 15:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF060F80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 15:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF060F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=LfCcK/8S
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF6D76606F22;
	Fri,  9 Jun 2023 14:08:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686316134;
	bh=0QHEEmERs5KT10qCKQxRCKpKm54QjTiueVsH9AJrKB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfCcK/8Sl5ct0QVN8gjBplH83VDF0OcfXd83X4W9O853eIVGvELrztFdPIij1EIxb
	 u1OogdQuoSqiIrqvxo+yDlkVHa4WpcbHfceUizk4MYIw6XNlzNGzCW5UYXN11EbNMu
	 JK6kqdXVZ2Te8EGvMNW8KWgaUSoCBAvd9qRONuDOzadG3TqOpCrGY8HljFTNLr/A4Q
	 UdPajj1BEwlBdl04dobfIhgUP/Xb+PD1mMp0IB+PAGWyH9Ngh3TUqsfr2F/CZkhYKH
	 hCdpB7xNzU/K8C/WKgTnuMmLFQMqaeN2q/1TWJx3bPKSASC3OWwYUvFnqoMVnQUzJw
	 ILWm7DxfEFyFw==
Date: Fri, 9 Jun 2023 09:08:47 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Revert "ASoC: mediatek: mt8192-mt6359: Remove " Jack"
 from Headphone pin name"
Message-ID: <ef54367a-a4f5-45af-aff1-08513c75c63c@notapiano>
References: <20230608221050.217968-1-nfraprado@collabora.com>
 <abe6e5f5-7373-44fc-90b6-2c01b1f1e96e@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abe6e5f5-7373-44fc-90b6-2c01b1f1e96e@sirena.org.uk>
Message-ID-Hash: 5IMVT54S2FSTCPYQ4S4YAXRALGZ5C7FL
X-Message-ID-Hash: 5IMVT54S2FSTCPYQ4S4YAXRALGZ5C7FL
X-MailFrom: nfraprado@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IMVT54S2FSTCPYQ4S4YAXRALGZ5C7FL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 09, 2023 at 10:39:25AM +0100, Mark Brown wrote:
> On Thu, Jun 08, 2023 at 06:10:48PM -0400, Nícolas F. R. A. Prado wrote:
> > This reverts commit cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f. That
> > commit removed the " Jack" suffix with the reasoning that it is
> > automatically added to the name of the kcontrol created, which is true,
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Hi Mark,

just for my own reference in the future, what exactly should have been done
differently in this commit? Are the subject line and commit reference in the
message generated by 'git revert' no good? Or is this message from a bot that
can't handle revert commits?

Thanks,
Nícolas
