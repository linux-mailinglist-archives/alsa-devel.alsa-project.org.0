Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4D841CCE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 08:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D45BC0;
	Tue, 30 Jan 2024 08:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D45BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706600501;
	bh=gQFi/hgfA9MVHBETu5aazZyA13OZc9rH5VvRgCcJmsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vISSm3wKfOe1QQKnsWVHXcUfCRP9FZAz9PMDw4gBa/z/1kuzM6aQxTl3AU8yV22YS
	 fsmpcRYVUN9aFpGdQUbHXVFAt/m/nCoeXLyH2FI5tR1BY3c7os30B1VxBRra3L1svY
	 MNImczXGNMjl4XI6uCLZJs/f6pBmBCNx8nbpqACE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94EAAF805AE; Tue, 30 Jan 2024 08:41:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D090F8058C;
	Tue, 30 Jan 2024 08:41:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A522F80563; Tue, 30 Jan 2024 08:40:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AF58F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 08:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF58F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256
 header.s=meesny header.b=mmg4Uety
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TPHBy1PY0zyPp;
	Tue, 30 Jan 2024 09:40:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706600429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXYG2rIBeg/NNZorp9z2BhKReEh61TvwReLHXvCjaww=;
	b=mmg4UetyKwlC7TSRMl0nDOWPi+zjDxXpOp3M6L3+Qb/TsTqYbPp/4uUv261XYGZBcYHB6U
	T7T3x9ynxedfSLrcBFH+i/H93sAwKym2r1tj/D1GB2T/SkFWrq1/Kt+oc8YHFDjfatHaM9
	GduB0g58fL7yX+1xcHMtDKkvA1Pp1X0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706600429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXYG2rIBeg/NNZorp9z2BhKReEh61TvwReLHXvCjaww=;
	b=UJJzQlqCs9VrKm5FbkOAbRgkCMTr9auA3UukM+Cirg/lszktkvqF9Eq5X0OOPQzqyY1zgH
	1sd2TE0evQiwof0Rp/NhS9QPgZ738HW3BhaVRDZmAvDKyv1e/CfDJchauGIeZMEks+FKYO
	Gs5KxF3RtGS38UkWzoFa/p1ytG0AjEw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706600429; a=rsa-sha256; cv=none;
	b=b8I/5XUpD8zAG3kEkB9ylC36TMUKxkOVnd3GUPE359jInhtZl89CjKZLsuC/UJuUeEnO3o
	h5OdGhfPjjgmquLay5oDg7lo+L5ojRZUBSC8QI62oKmUlDJpF6udc9tAur01+JX+nmf0Ct
	HTROci/T7MAOf+H9Af+iDXNYkNT9M9s=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3FC86634C93;
	Tue, 30 Jan 2024 09:40:24 +0200 (EET)
Date: Tue, 30 Jan 2024 07:40:24 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
 <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
 <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
Message-ID-Hash: TG3X7AGMNTFPH5NYYC6LIDCCJKBDJB45
X-Message-ID-Hash: TG3X7AGMNTFPH5NYYC6LIDCCJKBDJB45
X-MailFrom: sakari.ailus@iki.fi
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TG3X7AGMNTFPH5NYYC6LIDCCJKBDJB45/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 30, 2024 at 09:37:42AM +0200, Tomi Valkeinen wrote:
> On 30/01/2024 09:31, Sakari Ailus wrote:
> > Hi Morimoto-san,
> > 
> > On Tue, Jan 30, 2024 at 12:34:55AM +0000, Kuninori Morimoto wrote:
> > > 
> > > Hi Laurent, Sakari
> > > 
> > > Thank you for your review
> > > 
> > > > > The strategy sounds good to me. However, I'm wondering if you shouldn't
> > > > > take one more step in the core, and implement these as fwnode
> > > > > operations. Or is there a reason why OF is special, and iterating over
> > > > > ports would be useful for drivers on OF systems but not on other types
> > > > > of systems ?
> > > > 
> > > > I'd prefer that, too.
> > > 
> > > It is very easy reason, because I'm not fwnode user ;P
> > > I'm not familiar with fwnode, but in my quick check, it seems it is easy
> > > to expand fwnode side functions if of_graph side function exist ?
> > 
> > That would be one way to do that, yes, but I suggested using the existing
> > endpoint iterators as that would keep the firmware specific implementation
> > more simple. The (slight) drawback is that for each node returned, you'd
> > need to check its parent (i.e. port node) is the same as the port you're
> > interested in. The alternative may involve reworking the struct
> > fwnode_operations interface somewhat, including swnode, DT and ACPI
> > implementations.
> > 
> 
> But we still need the of_* versions, don't we, for patches 4 to 13?

Yes, my comment was indeed about the fwnode property API only.

-- 
Sakari Ailus
