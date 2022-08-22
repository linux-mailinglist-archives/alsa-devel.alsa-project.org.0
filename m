Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5359C042
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 15:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170C01699;
	Mon, 22 Aug 2022 15:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170C01699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661173974;
	bh=HTMe+NWdQhVrv4pk9fiHKxQBTpwr9lj6IAS27IV/VvE=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyHpidbVYVvoC3VyC2+OQ6gCxuWWQwH/j14zD22o6OHNSF3+QAGtGT1lKtDKGnqyR
	 ut9NIpBvM6r2yfaTQpNjioGlFwHFZh34F+8lReVwOwSry0Ndc65rVA5d2lGv9wW1dE
	 yZ37Qo4bPEQv6rgjzYhtQSLaedexEIG2RP4OlRPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71BCFF8026D;
	Mon, 22 Aug 2022 15:11:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 873D0F8026A; Mon, 22 Aug 2022 15:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4AE5F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 15:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4AE5F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="q8L1pggj"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661173908; bh=HTMe+NWdQhVrv4pk9fiHKxQBTpwr9lj6IAS27IV/VvE=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=q8L1pggjM0PWgIqJYCIL22femgo3CMmkx0sHKqqiWpKLGyDateOmHoMO2m3Jdpns4
 pzMV1WmAXjXHC9xY7YeZueMmQYvpvJnomm4uMbPMJ1LJoTNpz49IJjCzAK99y2lC5u
 xad/jYkJEXvQ9UBtmtWFntivWc3hmV2UGB+mIGi4=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YwN+0yHSOSC2aD+J@sirena.org.uk>
Date: Mon, 22 Aug 2022 15:11:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6EDC1D4B-4B84-49A2-A60A-EA15D27251A7@cutebit.org>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk>
 <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
 <YwN+0yHSOSC2aD+J@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> On 22. 8. 2022, at 15:04, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Aug 22, 2022 at 02:38:09PM +0200, Martin Povi=C5=A1er wrote:
>>> On 22. 8. 2022, at 14:27, Mark Brown <broonie@kernel.org> wrote:
>=20
>>> There was a tool floating about in the past (last copy I knew about =
was
>>> on Wolfson's git but they took that down) - can we not just continue =
to
>>> do that?
>=20
>> I don=E2=80=99t know the tool or where would I find it. I think =
it=E2=80=99s neat
>=20
> Copying in Charles and Richard who might know about the status of the
> tool Dimitris wrote.

Thanks.

>> simply having a =E2=80=98graph.dot=E2=80=99 at hand, especially since =
it requires
>> little code. (Although sure there=E2=80=99s the danger of it =
growing.)
>=20
> I'm also worried about people going in and wanting other more tool
> specific formats adding, if we didn't have anything at all it'd be one
> thing but we do have something.

Sure, although I would argue DOT is by a large margin the standard
format to represent graphs in.

Best,
Martin

