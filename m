Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF22C893A9C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 13:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11FBE21DD;
	Mon,  1 Apr 2024 13:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11FBE21DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711970363;
	bh=HAM0LuObHpU0tYoqqnia/ulwN/eVyxl/1MDcTA1uctk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H7RwPakTwIY6Rot7KnNWkRbd2HldzUfZHSvPBI3D2yVT2srE4n2MYzIgT1W3jHOWk
	 EfGxLNmLz8Xleg0dVnimdQ2oZopcOoVs3dp/wNVtErVKLOguXtBkTtBYjioInt0akl
	 Hi9m01qhe6hCYgXw6ZHSpej6ufJ+Nu91wjv2AIEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C1CF805AD; Mon,  1 Apr 2024 13:18:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05942F80580;
	Mon,  1 Apr 2024 13:18:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBDC3F80236; Mon,  1 Apr 2024 13:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8351F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 13:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8351F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Zy5CW7w7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711970317; x=1712575117;
	i=oswald.buddenhagen@gmx.de;
	bh=TT6p8aaLZjoB4gKAX1J4geqP7xGNmXdFN4+knfYt+PU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=Zy5CW7w7G4lTgESIjs8OxCzKJ6qg40aI+CxMvVd5qcT2Lq3g79oAWMzF3+icbdYh
	 dRzUqkb1IKf9jSX63FQZbEBed8Da7u17Wisqd4jNlwMzXGpQD8IhRaAsE4Y1g0/6D
	 qx9ogTf4nD+gXeApW1+hvHFz8iPeKFzkRf8EeN81OWr09kTsqc+RU548D7Kx+av1g
	 AoSvtS62ineXB06yLHxI2GtPrjB0kS6yR0pqtGXZvreP9FPRUUnycbwaBp3pfmFY/
	 gsmILKraR9SYMMyvtYmBA9flEROTWhdCIYvRljVsnnyPV3I/mOCIoPwj7RiZckF5N
	 rfpMQWmvwjRe77U37w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1sAXvL1iRe-00OrF1; Mon, 01
 Apr 2024 13:18:37 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrFgS-8js-00; Mon, 01 Apr 2024 13:18:36 +0200
Date: Mon, 1 Apr 2024 13:18:36 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: Re: [PATCH 00/18] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
Message-ID: <ZgqYDAXb2HKw6IiE@ugly>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
 <87r0fp5paj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87r0fp5paj.wl-tiwai@suse.de>
X-Provags-ID: V03:K1:BWjQIip0jkT93vJ/+nmeauhKHF2Llu+OnCZ2ox6EsoQpM8Ubv7L
 KvBYznHy+esdFVV/ed0ta5UNhvmVpJ1MENlwAkPioIfDSKg2x96poB0VSNe7s16Vk6V8Axz
 4qHBEKMAE6V5+Dhfg9juCdbOiNDOk5xKMrwpCGnY+cv/1HHS9f/0ShNNhJnAhAigrU96QOb
 ue4ZizfYdd1d4CZNesAIw==
UI-OutboundReport: notjunk:1;M01:P0:yj3zi1G/fYo=;YRzEFBeU1uXuzkjcTbVG02F3K5c
 OBP/wpVG0U0oG8ItEorVQgJUfwHm3GoXHZ8Ujl+6k6HtBNjrI21EaYmaqNWpLqQee1bTKUia9
 n8zC8h2SpHQBP/HFl2//2jk1Rk6N0Sfez2kJV+yurj07TUsavL2iZ2GcFGGvz9t3us5j8TmH0
 B8xA2+XISbsh5GGw1qslMGLDjDKVg0CBiTXu6mNFg1wYYRY/U1Xmtjv8bIEHmT2RotFwl1KiA
 6mUBbKVqphOCwILXf+Gnbv5N//e3oJc4LuTjmdvDZkSDPlBe+nr0punDK7gG2qAtobyeJFTww
 vIS6IB27hOG0lGZHPhwR9H2mXTWgMvxQjoG8giDavsBfPqZ1ack866jh5fQftUfrZVXShp54m
 IbP/2j+0ie0BVqQcqOiz/dg69MND5VErTZGeujXcKTMF3ch3lYIrm8k0oXHHoaFwtjyURsXIW
 U7ke7tCTmYqzlQQUtK/2GInl9looe6OEdIBKwkAlw8SLAZ9CadkVw7DtFi239AOymNnAVTj74
 Kg5HCn1/K1OM85xW0o/dK5N18AdzRdWNTZ4MqRkkEs+sJZiEnwNQ++q0B1dB18wjIsllTBQpy
 8u/gZBBZqx3nWYLUpd7/GgMeMizd0/SPk7xmXwQM7lagJeKYEKjjd9A5w540ocP0xQwFhpwqZ
 D28Gmk6Qm15gz3xlBcZswHKPLUIk4acqGHGwvkvJx0acRibG70C8lRL/PtltPX6x8aGS3i2Nn
 t5JA9hVyvd+k7P8AvOjWi6eWUfAARHI9hGV9YPUYvrl7dU/VzCfDrnHCz1YfeFW18is/Zn3sw
 az4N4/dmfnslmyHPID3bWj2PGblWaeMKXB/bEEB3wj7AI=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 25N6EDUPCNMMJO5ZHOVR6AELNZYEYC4D
X-Message-ID-Hash: 25N6EDUPCNMMJO5ZHOVR6AELNZYEYC4D
X-MailFrom: oswald.buddenhagen@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25N6EDUPCNMMJO5ZHOVR6AELNZYEYC4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 12:51:32PM +0200, Takashi Iwai wrote:
>Could you give Fixes tag in each commit if it's a regression fix for
>the  corresponding commit?
>
i did. you'll see it when the later patches arrive (minor hiccup with
mail delivery on my end ...).

of course this won't help a lot with picking to stable, because the fix
actually depends on several of the prior patches. i can re-arrange the
series to minimize the hard dependency chain, but it will still be ~10
patches.

an alternative approach would be just reverting the offending patch and
re-fixing it as part of the subsequent series. the revert would be
easily pickable, but that merely replaces the current problem with the
(admittedly less audible) previous problem. your choice.
