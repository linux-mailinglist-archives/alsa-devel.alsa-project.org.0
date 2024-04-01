Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0A893AB1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 13:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2553622CB;
	Mon,  1 Apr 2024 13:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2553622CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711971973;
	bh=rHhsnFn1ylR46yCmyO+WzrZSaq3fhEA0XUeZg61LMLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gsaQlWwUB61lyyFRhaLujUo+K/nesLq+X+T8zUGCd+wlyDaAtoqr8kGQbNw3zc6RU
	 Bm274cO6BkyWNjFkzYAEau7+fcGmnOjEYB2t77L6AdAS4l2MftSVNnalXaOjG2xRFk
	 oS5hmeWlUEzOzd4JKWojj++YCtmTC5ANHYa0no1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F9B4F805AA; Mon,  1 Apr 2024 13:45:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D54F80580;
	Mon,  1 Apr 2024 13:45:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCBFF80236; Mon,  1 Apr 2024 13:45:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86978F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 13:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86978F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=InrVNlyL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711971927; x=1712576727;
	i=oswald.buddenhagen@gmx.de;
	bh=rHhsnFn1ylR46yCmyO+WzrZSaq3fhEA0XUeZg61LMLM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=InrVNlyLyxZipLiqFdi8oB57E83906lPgXKZ1mUqrjuOKZxd8znEZBgKsS8VLg+6
	 LZ6VvvQg+aect+1+BkyFosxmwlWJ11mbX22JyMrOZkPmUDc4Bjc/jAYv5m9wWNT49
	 +XhE+a5Ah5SE+R6tWntHyyZTQlFHvGNCUDOQV0iHqNkVkI3AtfHyOi+KPVtQjvwm8
	 awNTHd/rE5dYgCpSiJCc0diNVgNW8O2jis8Sy0C3ZnNA3q/C8kCBqZ3TexWCA8Fn/
	 Pd0sLabzHFs6bKUXCybkzvzj7IvAuQF4ZryD5J8Ouj5dUx/VxUW9WQUyTo86yUT+v
	 ZNxaFk6qO6xGTyqoPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7i8Y-1sueQv35jG-014jTj; Mon, 01
 Apr 2024 13:45:27 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrG6R-97c-00; Mon, 01 Apr 2024 13:45:27 +0200
Date: Mon, 1 Apr 2024 13:45:27 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgqeV4M8DGpl6KHJ@ugly>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
 <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
X-Provags-ID: V03:K1:jTv7rEY4VYkVeYRmnEKfyYpipSSxantI5WaeuP+HvhRflr58eHS
 lQjE4TOB5vB7fLkddRzBcZTYZSWqWwfCdpRL8APAXFB4d0hsaCzNJe0xqy61LLEbrYh4B6d
 8d1J58d+HqxsItHCMG/KWBHNC3O/aLlL1ecd4pHN3c+QSAoRiqp+3V+GLLfP2pevcr8vu1X
 70GWXfJ+hAPbGxk8e0dyw==
UI-OutboundReport: notjunk:1;M01:P0:bqJZa/qt9sg=;5+zmyprgh1n8+v02ESCK1Wzl8N0
 z3oVYAtxP7HfTsD1XEgCch10zDeXU/H3wx7Z4v/aIALWjFwLBEgYThBdectWyhkzt0H+kcsRj
 88KOhl5RbzL/7zw2pSY2xgATvKfD2wheFoeCuWg9p/npoBA28G3YABnEuAZyo4FQEa2F1mJmG
 KblTA8QgPurUlS8A0Ofn/BGCLp+FInYYgJM8x1y8Gy7qTDfc9xb6FHZ/FzpYd6yhmXomv5Jsr
 uT+2a69yFaH9wIZOhKSiVToh8nYKdHOSR+YQY4nLnQZ1OObjb6Xuv1gWffwhf45bkcls2tm3a
 PMvL3UayO5BGQXJg//AVY8r6EoY+vJggvcpglZ1yUNVX0tktfKLoN6wJytooakoJmtzsaKZmQ
 3jD1VXCJtSNcB62vuUEfDRQsYVhIs0ZEHwVtAxASEWSMsNU6KEQVBenl6DR27y/dC8Ubxheef
 ddrt4K62B8L+nb3d0ksD+tRJOFKHUFlC4izFmktRTKs0GXp4T0PDEWZ4rknNilH1ZpbCb6m4j
 I5BguqrPGVT9K2lOGXvxVr180BZpQ8JJbNWOFLwDR0CAMdw3zs2oDMHe1CJlbHgZbab6tpo82
 mUHsM5jPt4KjLEtURt2fyVDDIRbBuy6CLIB2FHuMdR/f8uIkBcMnp1wM/RBGOttJZVdCWYy8l
 AuBfKLoxhCUjJeHnzLNLa0YYp32JIgKXBAe6jS9MLQJOryjj6BlydXXV3KfDmvWP/QKnp5hSd
 gEDpjlwxMOQdoiou3zyABcc4se4kuM3c1rreMwJea4yPxIKPi/6Dk3rx7gXkq1kHfAcJ4oRds
 AOGsDU2CkTcYTv4bdcnXjJ63SUbN/rxP8MuoOJt02AV2w=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JWAOVPMEGKREEF64JS44H2KUZ3FXRA74
X-Message-ID-Hash: JWAOVPMEGKREEF64JS44H2KUZ3FXRA74
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWAOVPMEGKREEF64JS44H2KUZ3FXRA74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 12:04:51PM +0100, Russell King (Oracle) wrote:
>I think where the confusion comes from is that fifo_depth is the
>depth of the hardware FIFO in units of 16-bit quantities, [...]
>
... irrespective of mono/stereo?
well, with that explanation it makes sense.
i recommend that you adjust the comment to make it more helpful/less
misleading. maybe something like "We configure ALSA to expect the FIFO
size in bytes. This works best for us, because [...]".

the patch is retracted.

