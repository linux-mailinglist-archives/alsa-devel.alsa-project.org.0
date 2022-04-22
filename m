Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BB50B894
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7B51FA;
	Fri, 22 Apr 2022 15:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7B51FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634489;
	bh=F6w/yj/ffWeFOB0KTSgJjCM8uAAwtgASk4fxMyEoiRU=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GikHAdloq//gZP0ER2MvzxOT/UF/CI3BXYopgb4PcJl1JtXPYaXgJCZYUtxe0lq95
	 dzZNdhFxoYanxI1OBJCrMgnZ9fGsl4oO7ZgdVqNKXf+zi6M9gwn2DOS4vq53vqwKMG
	 3Gk8do8iHEvNSKmCj56P2qSx76dRxPopInaW6rL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED415F80534;
	Fri, 22 Apr 2022 15:31:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B92FF80245; Fri, 22 Apr 2022 13:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71060F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 13:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71060F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="BAChplZk"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650626900; bh=nnRPoDn9UVOQmCSWBi2f0yPJ71M+pe94PUc3/C0TV6E=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=BAChplZkXMuMU7YQjAHHfzse8aIDAhSV5emQZaIx7Fr664MnS1WotKU9oMqA0G08L
 oXMJk5Zl8gsP1sytZjTBTyJAUSP9cPK8UoNsouQlgULCRve8jQJ5qZOdAtY4pCgwnh
 ywCL6HvHVjTcsUbT0ceA4vN62COm59lDp5Bn/fMM=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
Date: Fri, 22 Apr 2022 13:28:20 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <YkWfziQzprEsWL72@sirena.org.uk>
 <CCE4A06E-6D6F-457D-B3C5-C36209BF38D3@cutebit.org>
 <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
 <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
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



> On 22. 4. 2022, at 13:19, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Apr 22, 2022 at 12:43:30PM +0200, Martin Povi=C5=A1er wrote:
>=20
>> I looked in the TAS2770 and TAS2764 drivers/datasheets, and to answer
>> the questions we had:
>=20
>> * VSENSE/ISENSE output slots are configured independently of audio =
samples
>>   routing. Kernel drivers configure the slots based on the =
'ti,imon-slot-no'
>>   and 'ti,vmon-slot-no' properties of devicetree.
>=20
>> * By default codecs transmit Hi-Z for duration of unused slots.
>=20
>> So once we supply the devicetree props it should be electrically =
sound
>> under any configuration of userspace knobs.
>=20
> Great, that's a relief.
>=20
>> One final thought on the playback routing controls: On systems with =
>2
>> speakers, the codecs need to be assigned slots through set_tdm_slot.
>> The macaudio driver RFCed here assigns a single slot to each speaker,
>> making the effect of each speaker's routing control this:
>=20
>>  'I2C offset' -- uses a random slot
>=20
>>  'Left' 'Right' 'LeftRight' -- uses the single slot we configured
>=20
>> I suppose I better assign two slots to speakers in each left-right =
pair
>> of the same kind (e.g. woofer 1, woofer 2, tweeter). This way the
>> routing control will mimic its behavior from simple stereo systems =
but
>> replicated within each left-right pair.  (I would prefer to hide the
>> controls altogether, but as I learned that hiding things unless =
proven
>> dangerous is an ASoC non-goal, this way I can make the controls do
>> something interesting.)
>=20
> I don't quite grasp the difference between the arrangement you're
> proposing and assigning a single slot to each speaker?  Possibly it's
> just a reordering of the slots?

Ah, maybe what=E2=80=99s missing is the fact that the way the speaker =
amp drivers
are written, if they are assigned two slots with a call to set_tdm_slot,
the first slot is considered 'left' and the second is 'right'.

So in the arrangement I am proposing the 'Left', 'Right' and 'LeftRight'
values of the routing control have the nominal effect (within the =
left-right
speaker pair), while in the other arrangement it is as I described =
above.

