Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C682650B897
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 698CF170B;
	Fri, 22 Apr 2022 15:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 698CF170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634519;
	bh=BdyZ8YeqA+uO9dlIG1OSAi1gBzb7JByVPXLl1gFdTvE=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjyqlcmdn47yp5HlUq3HoumaQmDYosr+4j0rwq9dg2ndLxDqYywjJBRdykP+G5NtT
	 Fr4BZDkblNcR7ariPGGToukV+SnJMNmtpvUZaAcYg7JgwQemKXR3G6vLdQkQ3MqQT0
	 NKni8pfPEfdQrbTpPgefl3Mqh0tQkIQgoLdiNRGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A874F8053C;
	Fri, 22 Apr 2022 15:31:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A66FCF80245; Fri, 22 Apr 2022 14:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8237F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 14:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8237F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="KOTSsrVY"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650630964; bh=OSdl6aaUeic9SF9BLtfTgFqL689pyLDLZc4/GdJKq8o=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=KOTSsrVYpbp9H5eGEznDOrhNsmP3WRoz8CT6HguROZySCUrsZqVTT44KHKkohBvsd
 e+qME5tm+XjxZ4vuL1KYQmlgCHruAzaW6CvVg1UJa3itnrutntNc5vnK3SEYU/nmJ3
 tQziBxksfZFdSSzcb3CTR1FRn4UKO1OQJamlKnM0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmKeEKa0w2xLM9cL@sirena.org.uk>
Date: Fri, 22 Apr 2022 14:36:03 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F6130F3-381C-4AB7-B618-CDC4C4A37C9B@cutebit.org>
References: <YkWfziQzprEsWL72@sirena.org.uk>
 <CCE4A06E-6D6F-457D-B3C5-C36209BF38D3@cutebit.org>
 <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
 <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
 <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
 <YmKSgHrbb/7koM36@sirena.org.uk>
 <A1574F30-62D2-467D-A40B-8FD7C6B8BCFA@cutebit.org>
 <YmKeEKa0w2xLM9cL@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
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


> On 22. 4. 2022, at 14:22, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Apr 22, 2022 at 01:44:06PM +0200, Martin Povi=C5=A1er wrote:
>=20
>>> So previously each speaker would get two slots but now it just gets =
one?
>=20
>> No the other way around. Previously (with the driver as it is RFCed),
>> each speaker gets a single slot, and 'Left', 'Right' and =
=E2=80=98LeftRight'
>> values of the routing control don't do anything different from each
>> other (well except maybe 'LeftRight' lessens the volume due to how
>> the chip handles the edge case of mixing down two channels from the
>> same slot).
>=20
>> With the new arrangement I am proposing, the two speakers in a =
left-right
>> pair get both the same two slots, meaning they get to choose one of =
the
>> two slots based on the 'Left' 'Right' value of their routing control.
>=20
> Ah, I think the confusion here is that I'm using slot and channel
> interchangably whereas you're saying that previously the driver would
> allocate two channels to each speaker with duplicate data?

I guess you could say that. Not that there=E2=80=99s duplicate data on =
the I2S
bus, but the speaker amp would previously be configured to look for the
left and right channel in the same TDM slot (see e.g. set_tdm_slot of
tas2770 [0]).  (Each speaker amp drives a single speaker, but it still
has a notion of left and right channel.)

[0] =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/so=
und/soc/codecs/tas2770.c#n416

