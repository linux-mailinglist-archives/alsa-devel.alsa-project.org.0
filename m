Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B648950A3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 12:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788DA2C25;
	Tue,  2 Apr 2024 12:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788DA2C25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712054823;
	bh=FcWh8Dou/6nqexF7hkrQLPGUL72+sA2bhz4fmmWropI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cjOjCjmbsrKw4GcATJesj+8Po7lUz91c+e5x0SYhVVAsxox7PYeiKfE3MpxkBKfEz
	 nvCG0y0SSbrVhYwEqYagqFuAnhR4ICRVWcVTxii1/NrRBE+hU/0FSLYDUzH85BfY6Y
	 IdFW7ECjk2wSIT3n+KyyMIh3Q+Ft+67RYWQ75hYk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EF1FF805A1; Tue,  2 Apr 2024 12:46:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C9EF805A9;
	Tue,  2 Apr 2024 12:46:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7B6AF8020D; Tue,  2 Apr 2024 12:46:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5A86F8015B
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 12:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5A86F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=cWP+DG5I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712054772; x=1712659572;
	i=oswald.buddenhagen@gmx.de;
	bh=FcWh8Dou/6nqexF7hkrQLPGUL72+sA2bhz4fmmWropI=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=cWP+DG5Iv3uxF77tZI/EZe2K21PNgllVjoRyFgfwOpwzisgH2Nr4T2bw8RaVPQKL
	 g8sA4peRwuULoRaG0XvvJFccn/G5ZIA1PjHFW1V4vQsraz1A+3uNkgvZ4juWcwPdm
	 2poI37BSAg5STCalJCLlPEpczsoT1+YhwaTNV5GPIds6dfctGuc22Nbph2OCxCphv
	 MhKgM3VIyKcYX/w8sLJ9mQLf+fPwpjN/5rg8KjWlP6dAPwbckM1YHK6InDNxlHe2j
	 htoBXW/Ihh9OXhuIqIomLHqGf5q8kYgGmVNGh8LOt2vpl7UNkSDosztAyN8OgkowL
	 MYpNQYvS7Ak7JQRizQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.125]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU4s-1sRlom3Axg-00aTFm; Tue, 02
 Apr 2024 12:46:12 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrbee-W80-00; Tue, 02 Apr 2024 12:46:12 +0200
Date: Tue, 2 Apr 2024 12:46:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <Zgvh9Hzk4a4/Izlb@ugly>
References: <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
 <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
 <ZgqeV4M8DGpl6KHJ@ugly>
 <Zgq33GqYqtln0qyX@shell.armlinux.org.uk>
 <ZgrCEU6rHuEtT6/8@ugly>
 <ZgsgHiFbbmjuD+tT@shell.armlinux.org.uk>
 <Zgs8xAB3a6zWc0w6@ugly>
 <ZgtChSSiQsuyWq/f@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZgtChSSiQsuyWq/f@shell.armlinux.org.uk>
X-Provags-ID: V03:K1:8ZzGDuEfW7ioe7E0t12ZuRxJmomalND4CgG4jHtceFSBnysv290
 m3vMAiF32+CQYwSeeif7/dSbGV4eO8I9xCtUxSd5Sqsv7mYNZSB8a8B0zo5L2lQxW7rst4z
 FPi5ZsN9k5nrb3wcWJay2sAeLyYzBB7nAPi6qC2iqpeC42ZK+Qp6J4UEE7PGs2tACMPphuw
 2a+XGi82g5z7nJ8YFhB0A==
UI-OutboundReport: notjunk:1;M01:P0:Gi4jACXHtiw=;0aWIAEY3QnXJFexIZ9uE5lh12DJ
 djS/nYimB/EOXVuKVJII3UaMgIIDin5gUnEoThi1KtDH/y8Cu1qn91P1XlysHkIFU+aA2KXpQ
 SKZ/BboqbKX6KszQ8wafjVut0SIMa2E0I9x770F2PRVGeHjZxc7pEtfLkLj6aoS1W6er2RnTs
 Bw9EfbVOlNL7e8OVVvOusflJmRt3LavA7myKs+q3bzf0yDFD1PDkbCmMdu3v2bkqmMskS8FgF
 tuqyNYkAWY4/MJaj2zx4mhCfw9Rg053pmytq7jkJYGJ3BQje0+6/u5a7/JlP1pYFp4GSH1QIM
 xHG7hujfH8dzX/BqnRiZ381RiuR8muxrRi7kZj1wKz+5YTiULbAwdFqZbxKZwq6b1FVz7IIGx
 blOJhcWFQRTWUUhJ4tT9PxZ3lAanbiLCPGRdpBXzSMQXIzqCQpe3b/Fc7kYU8CfK7FO2Wn499
 6cNd2kG9xgnj3hukY1F+iUDDQXw2qn6rTgAqGM24T1UvROXQlV6KR3HjZJ6x3b46pcL4pGTMh
 Uq7PBThzdJk2jjxpg1jgUhMGbuWj41qfbH7EZRNSAm52t1FXTOVfmKlaPnctx0zTMwnNOsZA5
 xCqX9UBa8hQW4d0FxUiNT6zAerAnRzbrTPYyLSGRpPiT9z++wDA4dlGzJ3d6zbobWjCXe/qfT
 pZbkn5TgI/QDDIaZ2DqYTyMpRbnKG8eJWRj/AA+ExiF+MfTxcdIQaF89jbu2EUth7KDkMut3T
 3cKGToamELkpQn/Np9htw5jt38ozJVPEWmbOorzrzEuIVpzMeLuNOjZRt9AjlzjFbtJ4h0l5h
 Oi21bXBhH1lH4Yn5wqWJPgwFsrkj7srFgqWvsj9/FilV8=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 56I6KE6S4KL6GWI4A3UXGCFRK24BEJ33
X-Message-ID-Hash: 56I6KE6S4KL6GWI4A3UXGCFRK24BEJ33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56I6KE6S4KL6GWI4A3UXGCFRK24BEJ33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 02, 2024 at 12:25:57AM +0100, Russell King (Oracle) wrote:
>On Tue, Apr 02, 2024 at 01:01:24AM +0200, Oswald Buddenhagen wrote:
>> putting an obvious disclaimer/question section after a three-dash
>> line
>> is a perfectly sufficient way to mark such a patch.
>
>Convention is it goes in the subject line, so patch automation such as
>patchwork can identify the patches that aren't to be applied.
>
that's a good point, but things aren't quite as black-and-white. while i
didn't _expect_ the patch to be correct, it seemed possible.

>The driver you are modifying was introduced
>in v2.6.13-rc1 *before* this flag was available, and thus from a time
>when fifo_size was _only_ _ever_ specifyable in bytes.
>
well, that's nice to know, but totally irrelevant. you're clearly more
interested in proving that you didn't do anything wrong more than a
decade ago, rather than judging whether there is room for improvement
*now*. there is no shame in acknowledging that things aren't perfect,
and then just moving on, because it isn't important enough.

>You clearly don't believe in doing any research.
>
or maybe i just didn't want to spend hours on investigating something
mildly suspicious i coincidentally stumbled upon when someone in the
know could make a call in seconds.

if you truly believe that this is an unacceptable approach, then you
apparently think that your time is worth hundreds of times more than
mine. you should reflect upon that attitude.

>You just create broken patches and send them in a form where they could
>well be picked up and merged into mainline causing breakage.
>
you seem to have a remarkably low opinion of the people and processes
involved in safeguarding that this doesn't happen. which is kinda funny,
because it includes yourself.


