Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0308150B896
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A457016F8;
	Fri, 22 Apr 2022 15:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A457016F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634506;
	bh=w8qOoYofEWQZizg7i2ezlHza32nWfH6FcFVjCBPIktc=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edqx0DyyXdc05HXNQcTbp1objOUNblngrvDq6UMne7oyWNez2rGCicKLyNBv7qjsJ
	 lgynSgBOKGplL2ZQQn3BVjrkbc7rOgMlTH1YXy1G1HOctJUbhgGLNiKJpEunHjAjAf
	 PnLzuO4s06kMhu7qjN5xojQlB1CMQyM8CwOtyZE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE0FF8053B;
	Fri, 22 Apr 2022 15:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1223EF80245; Fri, 22 Apr 2022 13:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60444F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 13:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60444F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="dbRI4qKc"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650627847; bh=FpuPF57lqV2wF0ozxJVgJREDohc1ui5JNgdpVwE+l8w=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=dbRI4qKchxCMWHz/gRQ8gR1uvvn7q5BnJWLyllNZscu8zPDEr7VSPjV96/jjfK8Do
 8A5M9XStn6yvgo/Fy0WO7RvQsnYEZt0e7qpaI+kedi46sXd3oIbt4NUPGClhTAI4qc
 /vctMet+PKq2Cn8h8xKfhCfdMfXGEddPIrsxnkGo=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmKSgHrbb/7koM36@sirena.org.uk>
Date: Fri, 22 Apr 2022 13:44:06 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1574F30-62D2-467D-A40B-8FD7C6B8BCFA@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <YkWfziQzprEsWL72@sirena.org.uk>
 <CCE4A06E-6D6F-457D-B3C5-C36209BF38D3@cutebit.org>
 <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
 <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
 <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
 <YmKSgHrbb/7koM36@sirena.org.uk>
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


> On 22. 4. 2022, at 13:33, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Apr 22, 2022 at 01:28:20PM +0200, Martin Povi=C5=A1er wrote:
>>> On 22. 4. 2022, at 13:19, Mark Brown <broonie@kernel.org> wrote:
>>> On Fri, Apr 22, 2022 at 12:43:30PM +0200, Martin Povi=C5=A1er wrote:
>=20
>>>> One final thought on the playback routing controls: On systems with =
>2
>>>> speakers, the codecs need to be assigned slots through =
set_tdm_slot.
>>>> The macaudio driver RFCed here assigns a single slot to each =
speaker,
>>>> making the effect of each speaker's routing control this:
>=20
> ...
>=20
>>> I don't quite grasp the difference between the arrangement you're
>>> proposing and assigning a single slot to each speaker?  Possibly =
it's
>>> just a reordering of the slots?
>=20
>> Ah, maybe what=E2=80=99s missing is the fact that the way the speaker =
amp drivers
>> are written, if they are assigned two slots with a call to =
set_tdm_slot,
>> the first slot is considered 'left' and the second is 'right'.
>=20
>> So in the arrangement I am proposing the 'Left', 'Right' and =
'LeftRight'
>> values of the routing control have the nominal effect (within the =
left-right
>> speaker pair), while in the other arrangement it is as I described =
above.
>=20
> So previously each speaker would get two slots but now it just gets =
one?

No the other way around. Previously (with the driver as it is RFCed),
each speaker gets a single slot, and 'Left', 'Right' and =E2=80=98LeftRigh=
t'
values of the routing control don't do anything different from each
other (well except maybe 'LeftRight' lessens the volume due to how
the chip handles the edge case of mixing down two channels from the
same slot).

With the new arrangement I am proposing, the two speakers in a =
left-right
pair get both the same two slots, meaning they get to choose one of the
two slots based on the 'Left' 'Right' value of their routing control.

