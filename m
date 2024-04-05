Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91A899E24
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 15:17:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A82C2D2C;
	Fri,  5 Apr 2024 15:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A82C2D2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712323058;
	bh=c/GLSHTTfQzvyP8lT1/GSFHRN4J6Dkc5dEdjq1Og71o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tstvTRT6XYqeRcsmfprCsPwBCFAQVeLUMUT+VF7WtNSi+MWKVw4pX85TqtKgd43JJ
	 spoGh86fUF3WtcDJBHdzRAX6kRQHwcb47rOs5Ali5bWUNDrpuYGYeaeujJALRp9f6D
	 O9fVh+bCp+NUkO4nsjZyD1N5FNQCOiVQ0gdh1gPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39BB2F80571; Fri,  5 Apr 2024 15:17:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B90C2F8059F;
	Fri,  5 Apr 2024 15:17:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD215F8020D; Fri,  5 Apr 2024 15:16:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CA3F5F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 15:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3F5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QyVWipDV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712323010; x=1712927810;
	i=oswald.buddenhagen@gmx.de;
	bh=c/GLSHTTfQzvyP8lT1/GSFHRN4J6Dkc5dEdjq1Og71o=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=QyVWipDV93bBae15te9tNHWSojztW52nYYZTdshY3/WnA6E20SdBlXy+pLNgUh3+
	 nMtGTrsmsNcn6fGy4+/Rtv3TunRO1e1F4pkZ4o01sj/KR5rkLLcevnWJ+dyJrp1PA
	 8jybguoREfnVR1FDXjR0pkUp7Yeut9kj+Xek4m9KPtjxMV1G51xRbud7B3RTqWUkq
	 NcESpICEKbKTh5UHTtw6kkuzcWLVzfanrWfY6qYwC4ex8ZFP4NuWSJ/oShlblnwNP
	 0Q8wWQo9b60AOEHH/a15PZCKXdHTzhMqcpzLIbqQs08eY9t0HxZkYUqU4v0BIjQPo
	 foVJ5VRYKDboceqfrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.116]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt757-1sgpx23nTN-00tXCO; Fri, 05
 Apr 2024 15:16:49 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsjR3-xgA-00; Fri, 05 Apr 2024 15:16:49 +0200
Date: Fri, 5 Apr 2024 15:16:49 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
	tiwai@suse.de, perex@perex.cz
Subject: Re: [PATCH v2] ASoC: au1x: declare that FIFO is reported in frames
Message-ID: <Zg/5wXkjJC6HSYuD@ugly>
References: <20240401201151.560355-1-oswald.buddenhagen@gmx.de>
 <CAOLZvyGnfGjNA=N30LC+UVt92obOoHQt+bekADey=amKkTr8EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CAOLZvyGnfGjNA=N30LC+UVt92obOoHQt+bekADey=amKkTr8EQ@mail.gmail.com>
X-Provags-ID: V03:K1:JdEmB63uTzpPRI7vjMxK5aYivU7Ia3ajd1iy6xFFcvaev3x7kez
 6H6hfVm2p9bcvOn09pq2aqjV4iK7auANcE2gNGXRfBb0BcWGYYzKRYJM4VgDmhSBllFCpWm
 y9f2c6KqM5dG9o54PhT8DZXBxbXVvErKnSkQKFGZFZj0NSxeMxCX3htcPWrD36v/JONwuhw
 46gBK/T3X4th9cUsUH/qg==
UI-OutboundReport: notjunk:1;M01:P0:GLR+8LVXMdM=;oFyOU23+hqAZpYEREdCC5VzyiP5
 3CZa8RmBrcr0X0tBM6SWehFYKf9i4VkFD+kVnqKwZ/gxFJoY89Tz2Ly1rv/sKnCb+HVf1RdP6
 jnzbYyTcyRRkBj2Xno6n4vd0j1lEWBNaV8mHTPXPLRbqgQ/wV/72O+GyrtOzRmaCwEszVJEER
 siAM/JKMbiUiMLrUh8syLZGlSbTggXoDwHPBZiULbuvIvt0QYG0sr6gVe5PK0a3q4j34XccVG
 KR1REbNhyphnn3gUkaSedahXFJZbNyWx0OmOkim+1PMZgaeqP+MLepNVu29WuNZbM2EkDQQSU
 ejvbJqic7SuqRivtMySGvYCeel8Hes70jEAoup15SCy9uiDwpIu0qlYfpPLAZeJLBX5DsZb4U
 ivWSb60S5a0wRRtbZwXCh+aRhAsAmNGFJRIYW6SFbYbBB0U1w0wOuKOjfk33lI3exXN060vh6
 wegpyJwYSSkDhEjqEBj5zutso4tyxKiM0jgM9AUzUhb9ULSRvqWc1HxMuiZvbhJNd+5SGtyHi
 VzK/TBKaJjhPpJ6I563gv0EYzfVrhxzE8Az1+NR2BRVUm3ommFrmiagmANvINYpm5QUzMDzCZ
 g3ZYRi4DMQean88XWefKLljFZtrPILqSctU66QPhyGaHlQ64oSac+eDOea2I94vX7/joTLUUS
 0pBeV//Tf7E4nAxalXaatg+Fs9z7Am26ZOr9zsjDOKdLl07wIqueAi++TaO0Z5/8TbmC7kRPT
 RZydXPlM8HfxtsJGvBLkPiVlb1RybNMuJGUD1ndbpN47NMeq6sFAx2WzZeFfgGYLiwpVzpRr/
 RAFK5xHaSTWa1IPZPrpC15tkZ1wlevYS8yMvP94HYxVpY=
Message-ID-Hash: TA4AWP35GBFRDH4IVY6TJUEFAOWAKXRD
X-Message-ID-Hash: TA4AWP35GBFRDH4IVY6TJUEFAOWAKXRD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TA4AWP35GBFRDH4IVY6TJUEFAOWAKXRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 05, 2024 at 01:22:41PM +0200, Manuel Lauss wrote:
>On Mon, Apr 1, 2024 at 10:11=E2=80=AFPM Oswald Buddenhagen
><oswald.buddenhagen@gmx.de> wrote:
>> Is this right? The comment on the field says "fifo entries of
>> AC97/I2S
>> PSC", which doesn't suggest bytes. The data sheet speaks of "words" and
>> "byte masks", but without digging into it I can't tell how it would
>> behave with different sample widths and channel counts (which the drive=
r
>> does not seem to limit _at all_? what am I missing?).
>
>Each fifo entry contains a sample; wordsize is configured in register
>0x08[24:21].
>The fifo is 16 samples deep, so you can have 8 stereo frames or 16
>mono frames queued up.
>
ok, so i'm apparently onto something, though the patch is wrong.

>But the fifo isn't managed by hand, dma transfers are used instead and
>the amount
>of transmitted bytes is extracted from DMA information, so I think this c=
hange
>is pointless.
>
not *quite* pointless - that field is used for calculating latencies
which are reported to user space. this doesn't really matter except for
pro audio equipment. it also isn't very precise if converter latencies
(which can be rather substantial for delta-sigma convs) are not also
taken into account. it's even more "interesting" when a single pcm
stream is connected to multiple ports with different latencies (e.g.,
s/pdif and analog).

HDA has the proper framework for tracking the entire path's latency and
the driver seems to support that, but from the drivers i surveyed that
was the only one which takes the matter seriously. most (legacy?)
drivers just set it explicitly to zero or leave it at the zero default,
which is a somewhat clear expression of "no clue / don't care".

so if you don't want to bother with getting it right or it is hopeless
due to inaccessible variables, just deleting the code is an option. or
simply ignoring the problem ...

i'm sure the alsa maints will correct me if i got anything wrong. ^^

