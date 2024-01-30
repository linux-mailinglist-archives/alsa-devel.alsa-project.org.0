Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E390E841CB5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 08:37:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE2FB6A;
	Tue, 30 Jan 2024 08:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE2FB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706600243;
	bh=M9spN+i39/nbtnUNp8PNM/LRv1jQ5j007Zfc/C40vaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UnewBr7fPkK3ax2VEBJ4uaYMwZhDZdMeHjwQy/cleUq8tbvO0TWhlWMNJkHP/CmE3
	 1kkjbcKzOR9NWn6/mKz+lKykWJDdSaRdiLyMLl1JAUTcpgTp7dJxJiTLEF/oY7n+go
	 UsUgispmlhkfAMdXuHCkP7Evn0HCN12+UrV8vYaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E101F80587; Tue, 30 Jan 2024 08:36:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E93F805A1;
	Tue, 30 Jan 2024 08:36:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BEE4F8055C; Tue, 30 Jan 2024 08:32:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F94AF8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 08:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F94AF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256
 header.s=lahtoruutu header.b=QpdNJnLX
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net
 [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TPH0s07y0z49Pwl;
	Tue, 30 Jan 2024 09:31:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1706599902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kiNee71ztfk6wXe9Rbz+IdTHsbBiUwHJoXFPCx0dNaU=;
	b=QpdNJnLX6VjSx7WjU8D0wiKI0MFACR/KXAN986V2m7PiyS61vq2PcCyqErPea6jTZrV5Ki
	KG5Ky41FakvPaZqn7AQ2LqvxLssnfq2nTJdLenhX9KU1Byxfdh14B0kp/KedRVDR8djk9f
	k5Z1VsPHkP4FJy+TTZDXJ2BKzKGzXYSe9po+YBbxkxtdyozbhFPJuRHuaO+SkMdMcVP8QR
	yCC/vi4z0I/FiIXDsULVFWv7m4PkD2W136+XWzhDrSpyrJaFhmE3ur1ByR3TLkGNp0axSr
	/SXnzIY217NB/+KH+J32hyw8/0Bo3O+AM7ovWu1q7+RVon2otw1hRAHPT9npfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1706599902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kiNee71ztfk6wXe9Rbz+IdTHsbBiUwHJoXFPCx0dNaU=;
	b=aixnvEw0w8CPbo4tmknZv2BEWJvsS5+T8i57IWyL5hORQv61Pc8Cmj4IP/NqFW8YbNE2QM
	mkRFOHWKNMNLlYfFpI74t2R0r1EZXdHCfgItpCKQzQXzagxYtdQx0wmwQXzYCg9yiarcz6
	7fdiFj6hPPBlLOkk+OPD9flBq2fErmxlg27HSXaGuk27fSYmnmqBlXNWxPrSpZT+t6m6rs
	QueOikqOMcuWog4FDmxQk4WFxXeZ6cul8kUN/TMwz+wl3BdcL3TYn78gYcB5JFBet8vKRf
	wE+1SaPogQE8M6mDfsgONuwYhHS53NSaJCssS99WOSCy6b5e5EffbMS+Fai3Rw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1706599902; a=rsa-sha256;
	cv=none;
	b=axbhd8Yt1Vdo527V2frPRvypu/SVngz+SvaBTOXdCoEaRZ79gJOOEvIjSogDCRzvaxLGaG
	5CIIi3pjMpsjcFf677ichTDNn+12aKogpPJHc3gIgqn+BMTDmZ0V9BWHaGKaihDspmytgC
	hssb4IVuKhtHqVmlnZNw6RjUhtPCHe3tz3tFZNttp2h7wKGxDMhGtlw/kDmJgE0n9C0s5v
	M2/JTtfbkDGPN5z8nzAewgjtH/PCO/sk1fyGGTtWymqFjzD2nDgQcv6fNxvdRAuuQe8tXL
	0QvxpwaDTpn/F9Dzs4gLqYEVbs01AOwipfUhUdTITd0Tvufs+8SGGD12whmbrw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A2C3B634C93;
	Tue, 30 Jan 2024 09:31:39 +0200 (EET)
Date: Tue, 30 Jan 2024 07:31:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: SAAJGXTWVEQGZFKS4UMKDELI3COBF3KU
X-Message-ID-Hash: SAAJGXTWVEQGZFKS4UMKDELI3COBF3KU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAAJGXTWVEQGZFKS4UMKDELI3COBF3KU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On Tue, Jan 30, 2024 at 12:34:55AM +0000, Kuninori Morimoto wrote:
> 
> Hi Laurent, Sakari
> 
> Thank you for your review
> 
> > > The strategy sounds good to me. However, I'm wondering if you shouldn't
> > > take one more step in the core, and implement these as fwnode
> > > operations. Or is there a reason why OF is special, and iterating over
> > > ports would be useful for drivers on OF systems but not on other types
> > > of systems ?
> > 
> > I'd prefer that, too.
> 
> It is very easy reason, because I'm not fwnode user ;P
> I'm not familiar with fwnode, but in my quick check, it seems it is easy
> to expand fwnode side functions if of_graph side function exist ?

That would be one way to do that, yes, but I suggested using the existing
endpoint iterators as that would keep the firmware specific implementation
more simple. The (slight) drawback is that for each node returned, you'd
need to check its parent (i.e. port node) is the same as the port you're
interested in. The alternative may involve reworking the struct
fwnode_operations interface somewhat, including swnode, DT and ACPI
implementations.

-- 
Kind regards,

Sakari Ailus
