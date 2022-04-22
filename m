Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7050B960
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 16:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1851186C;
	Fri, 22 Apr 2022 16:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1851186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650636067;
	bh=/q+aB7sFpjyUwzw+2KFK0o98I6/1TCzqcCqiEIuvu6c=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OoJ1ASxFtU8Fst8yDLLcCzSiI1TX/5V2AnUY1p+vrxW3Jxxp2hNM/TbCahVbYnnRx
	 RjnrCd0wVn2sP0wh9wjTD7PPs7+Rf/dRoV1TZWsrR8Qa22Vhjbyx/zZcRR+JXRtIu0
	 SSmvi4TPRTPfgk6lpeoA6bX7jBg1D8+6WwLoJ724=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D384F8027C;
	Fri, 22 Apr 2022 15:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C0D5F80507; Fri, 22 Apr 2022 15:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4218F8027C
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 15:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4218F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Rbo9vOum"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650635966; bh=OPTWL88wx7VdNdMeR/dWu1A51DUlJpqaNYL/YGs6XU4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Rbo9vOumJP9KdV5finiGzAkBjNKa7iRrORw6kpRN7GZJVDKj+sDP8c87S3ooJhE8w
 RmVwoV+40VfncKdNwpM6URe0HikudfpNioWiaVoIAeWelg1UjFDZ3snkX8kd4Ua1fk
 ZhO9IvMfylt6vU+wjVjf33M2BIv+zqp+rae0xle0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmKoXbh04ZEs3dSZ@sirena.org.uk>
Date: Fri, 22 Apr 2022 15:59:25 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E735637-EDA8-4A68-8B43-01BCEC41245C@cutebit.org>
References: <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
 <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
 <YmKSgHrbb/7koM36@sirena.org.uk>
 <A1574F30-62D2-467D-A40B-8FD7C6B8BCFA@cutebit.org>
 <YmKeEKa0w2xLM9cL@sirena.org.uk>
 <6F6130F3-381C-4AB7-B618-CDC4C4A37C9B@cutebit.org>
 <YmKjL9bOtOmsFWTs@sirena.org.uk>
 <3CD969AD-7316-4D83-AD92-CC85ED817125@cutebit.org>
 <YmKoXbh04ZEs3dSZ@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


> On 22. 4. 2022, at 15:06, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Apr 22, 2022 at 02:53:54PM +0200, Martin Povi=C5=A1er wrote:
>=20
>>> Oh, I see - the speaker actually allows configuration of the slots
>>> independently.  Usually the left/right thing on mono devices only =
does
>>> something for I2S where the bus clocking enforces that there be both
>>> left and right channels.  Either configuration is fine by me TBH, if =
you
>>> can do that then you could just keep them mapped to the same channel
>>> then mark the control as disabled since it should have no effect.
>=20
>> Well but is there some established way to mark a control as disabled?
>=20
> snd_ctl_activate_id().

Ha! Great.

>> Another issue here is that if I disable it I can=E2=80=99t leave the =
routing
>> control in it=E2=80=99s default value, which is =E2=80=98I2C =
Offset=E2=80=99 and makes the speaker
>> amp ignore the slot mapping.
>=20
> Sure, that's fine - if a control genuinely has no effect it's fine to
> hide it from userspace.  The issue is where it's just that you don't =
see
> the use, if the control demonstrably does nothing then that's fine.

So I assume I can set the control from the machine driver then disable =
it.

Anyway, good, this is what I meant earlier when I said the controls I =
want
to hide are 'useless/confusing at best=E2=80=99. I must walk back that =
they are
=E2=80=98dangerous at worst=E2=80=99, but I am glad we can hide them =
anyway. (Not all of
them of course, ISENSE/VSENSE will not be hidden, neither the routing
control on systems with single mono speaker.)

