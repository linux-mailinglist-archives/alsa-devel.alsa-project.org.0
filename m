Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445AB8453D5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 10:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D034DEE;
	Thu,  1 Feb 2024 10:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D034DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706779578;
	bh=R2/KugRaeWca7L8ElD1e0FLg7bs8qEI5wiMRWQAzd80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IXmNXfxDQJqzZBNaEuF8RAAJAAMNf3bo7jh5xLgMn1nJdiOjdir2qg0qcjCnDnWiI
	 nx+m/DpEv7C4MJIXLHK/7lpwio+qiDK5TXRfLosaZOXKKKIup2Vhlinjy1PHGzOGGY
	 y7UAVqIVG17SqGns4uIGNkNm3AMv+jgZ2+ohK7Tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76307F805A0; Thu,  1 Feb 2024 10:25:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF77F805A0;
	Thu,  1 Feb 2024 10:25:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92218F8055C; Thu,  1 Feb 2024 10:19:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE96EF804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 10:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE96EF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256
 header.s=lahtoruutu header.b=QLzeQBYW
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net
 [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TQYHk0RBKz49Q4M;
	Thu,  1 Feb 2024 11:18:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1706779139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Fpy/KbSzjZ8m/Xpg84MM6yz5okV9u4UdrP7s0ILl8o=;
	b=QLzeQBYWyIizNCEdOO0UnX0HbEbBMsM6ktPq78KqRpoDIQ8DmizFrGfVVnqwyqtUM/JaQ+
	erh45k6PJI0YU0dVIUAuNMpYqhechz6r7RLjPhP0fCld4o9s92kwIfth9sixHAur8GV2ye
	G2lFy1SdeH9AtNZFleuMzdFQqETUVPDqw+urOJfKPNLmyuvp4bBGSIV+V4ig0+XrumyWw8
	07fO25P6bDSPhfUBeJnaRCgXxunatKkjhJf6ewRWNftJ32L9nbl7zxsY62LhrL6VcpImO1
	cu/F04Wn3EOnsDbdb61x+zQZO1Yl5mrbRGKmKp8rOJ1aKctoF/qjfKxyftAoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1706779139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Fpy/KbSzjZ8m/Xpg84MM6yz5okV9u4UdrP7s0ILl8o=;
	b=NknHwVeZQJph2n5Ymg8Coj2j1/Q2mhhDK6vMUerjuy1o4kzQBFLyw6FjOzTBjxdEHsyG5l
	mGxwX+TYvyaeBrDhVHKBQEpF3iFhU6h9WDDTUXmLIDiwLhwnGaWiQE7J54Gz4I+J6Xsfkd
	0XKjFaruAqV8fQa78frFvSmUxR09PvGIFkumiQy+u5QzJuymMuyEzzZzdhePLaudoRtmi+
	H00XLzwqiTuH2uJ2jx7uUy5JYxlmfWZ3UNNc34jvL6Y53pYP1Sfaw5ysl05YQTVbelZj7M
	qrK3owq9nvbhux0AG2BXRMCG37dovyKGhjdI1NAXn511Tfdk8kQ+Dsnc+eUzHQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1706779139; a=rsa-sha256;
	cv=none;
	b=NXxTkNsVQcVrRPfV3ZqrLN9BDgTVvbgp7hawQ7Q6lKlQaDSt++h0qI6VuOwvJvBLnyCz2N
	sGZ+lNoYYhWvTGiUU7Bf2GwvZ+WJedRCZNClnC5pZzjA4JKpjpBXsUOc/2qBSERXjSVbFF
	1kUXTsWurtS6VjuyIEFk594JHCAhlyMxRNZPNtFALs/nyBqKa1pE9ZXCtmqlhAvhs47v6x
	Zr9qQ8tQ0DEeUNNVFnBzVgvDYhgiqkt/0isTXz8cq9vVKlFUoLg/56p24AjjeXPzwMs5+X
	vOzDNbGz+dH9WCIlxrE9bSo2nb6QIlWzGvwiKZ/ftfGIOgSJJHSC0KxxDGfyTA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B5FC0634C93;
	Thu,  1 Feb 2024 11:18:56 +0200 (EET)
Date: Thu, 1 Feb 2024 09:18:56 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Message-ID: <ZbtiAJklkLaXWY20@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
 <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
 <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
 <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
 <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: K7JPBX6ZPKGUN7XVEQBNAZXPY26U7FO5
X-Message-ID-Hash: K7JPBX6ZPKGUN7XVEQBNAZXPY26U7FO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7JPBX6ZPKGUN7XVEQBNAZXPY26U7FO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On Tue, Jan 30, 2024 at 11:24:07PM +0000, Kuninori Morimoto wrote:
> 
> Hi Sakari
> 
> > > > > I'm not familiar with fwnode, but in my quick check, it seems it is easy
> > > > > to expand fwnode side functions if of_graph side function exist ?
> > > > 
> > > > That would be one way to do that, yes, but I suggested using the existing
> > > > endpoint iterators as that would keep the firmware specific implementation
> > > > more simple. The (slight) drawback is that for each node returned, you'd
> > > > need to check its parent (i.e. port node) is the same as the port you're
> > > > interested in. The alternative may involve reworking the struct
> > > > fwnode_operations interface somewhat, including swnode, DT and ACPI
> > > > implementations.
> > > > 
> > > 
> > > But we still need the of_* versions, don't we, for patches 4 to 13?
> > 
> > Yes, my comment was indeed about the fwnode property API only.
> 
> Thank you for your suggestion.
> But I'm not familiar with fwnode, and it seems we still need of_*,
> I will keep current style (= non fwnode) in v3

The fwnode API should be kept in sync with the OF (and other firmware
specific) API. Merging your set in its current form would leave fwnode API
impaired. Therefore I'd very much prefer to see this set add similar fwnode
APIs, too.

-- 
Regards,

Sakari Ailus
