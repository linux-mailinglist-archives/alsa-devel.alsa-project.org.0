Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC759AA5F
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 03:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E171698;
	Sat, 20 Aug 2022 03:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E171698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660957918;
	bh=BP1Nrss6XrcSBZKvOnOpSp0fkhT5FS/IzNwOZrdH98c=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pB6a5CXWWxqYSBhFeMuqJsIVqEeAc4lCK3trvIPkFtcUZjm4gv+poTPlHRqYT5ium
	 lvGoLo5NFfy+lTzWxZo4T9NrdyIdpz4e7civd5FPK5M0YdwzUmAQlR30BNhBL5KRXb
	 X/cRPUMUuj2NfSumZ3CD+DXbwuYzyJbM6FBGQpFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E7EBF800B5;
	Sat, 20 Aug 2022 03:10:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C00F801F7; Sat, 20 Aug 2022 03:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E982F800B5
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 03:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E982F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="NMLybYYs"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660957852; bh=ybJdctHu1TALzc3RVz8396vJzGlEsjAlDvYISTn2Zpc=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=NMLybYYswE2AXJ0AfHOLEJ9O9OsV7vw9TcKM4jBcROstfRk3ngLp4bUgUn+Jg6yym
 2aSmNFuR1WjJ2l7cvYeVL9Nw3kyPFzsCLXmY1qVKyVrPS/Pd/0op3mt3s9JZxV/Jpu
 sidknC1fvBFXVpQ5bi5fC+NK+1MxeCcSai48Fy6M=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] ASoC: ops: Don't modify the driver's plaform_max when
 reading state
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YwAQ2+OLowhA+14d@sirena.org.uk>
Date: Sat, 20 Aug 2022 03:10:51 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <1329B1B6-EA75-481C-A625-058F21D62C3D@cutebit.org>
References: <20220603112508.3856519-1-broonie@kernel.org>
 <4507B606-8424-4820-A8CE-F79BEDE5181D@cutebit.org>
 <YwAQ2+OLowhA+14d@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


> On 20. 8. 2022, at 0:38, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Aug 19, 2022 at 06:17:25PM +0200, Martin Povi=C5=A1er wrote:
>>> On 3. 6. 2022, at 13:25, Mark Brown <broonie@kernel.org> wrote:
>=20
>>> This means that platform_max is no longer treated as a direct =
register
>>> value for controls were min is non-zero. The put() callbacks already
>>> validate on this basis, and there do not appear to be any in tree =
users
>>> that would be affected.
>=20
>> At least =E2=80=98put_volsw' seem to validate on the other =
conflicting interpretation
>> of platform_max [as was introduced in commit 9bdd10d57a88 (=E2=80=9CASo=
C: ops:
>> Shift tested values in snd_soc_put_volsw() by +min=E2=80=9D)].
>=20
> Ugh, so it does.  The patchwork of reuse and differing interpretations
> of these controls is causing all sorts of confusion :/
>=20
>> Also, the soc.h definitions of SOC_SINGLE_*/SOC_DOUBLE_* set =
platform_max
>> to the register maximum, again interpreting platform_max the other =
way.
>=20
> That use of platform_max has been removed since it was just obviously
> not sensible anyway, the whole purpose of platform_max is to override
> what was set in the control so having both max and platform_max set is
> just redundant and causing confusion.

Right, I was about to submit removal of it myself to address the issues
that surfaced with this patch, then I saw there=E2=80=99s more confusion =
with
platform_max. Anyway I see the removal=E2=80=99s been done in 26bdcc4b.

>>> Signed-off-by: Mark Brown <broonie@kernel.org>
>=20
>> This commit breaks controls with non-zero minimum.
>=20
> Could you specify more exactly how it does that, and indeed where we
> have non-zero minimums - all the info callbacks report 0 as a minimum =
as
> far as I can see?  Life would be a lot simpler if the controls had all
> been defined to just be the register values, I've never been able to
> figure out why they're anything else since the ABI for controls =
supports
> negative values just fine.

Sure. What I meant are non-zero register value minimums, especially
negative ones, and the breaking was in interaction with the default
platform_max values from SOC_SINGLE_*/SOC_DOUBLE_*.

Taking for example

    SOC_SINGLE_S8_TLV("ADC Volume", CS42L42_ADC_VOLUME, -97, 12, =
adc_tlv),

of codecs/cs42l42.c, platform_max was set to 12 and the register value
was then clipped to -97..-85.

So this should be fixed by the removal of the default platform_max,
leaving us with few discrepancies that only manifest if platform_max
is being actively used (and in that only on controls with non-zero
register minimum).

Martin

