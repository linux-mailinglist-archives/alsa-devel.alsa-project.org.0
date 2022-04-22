Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FCC50B893
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714DE170A;
	Fri, 22 Apr 2022 15:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714DE170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634471;
	bh=ni5ZQmX6js7ucRJWsITQ0uV4suJF87cJdrwcWI2bs9c=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1qarfbZQcAmOrs1OtKdIRPopxpA/2fhOW4Mh+8z1OU+YYxyFzyGU6ufadG1xEqVd
	 drRlpG/c8fUI16t1nM+9eRL+L9M6uu7D2Hmlu8tyzmDPHJ2SM1LgR5KCaBfwBnGcff
	 BZE5eRQWpGGxQjE9SLecl4n10yV4KtP/8ZXj2v8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5DDF80533;
	Fri, 22 Apr 2022 15:31:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92362F80245; Fri, 22 Apr 2022 12:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 787D0F80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 12:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 787D0F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="rbvLx9uV"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650624211; bh=4zKNiCJ9mR8YNKg4xV+9DRTe5znRz0G2bXHhsbBhsuc=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=rbvLx9uVaZ9KLhaZck/JuJlU9H9gFERagLBhE3o2ytCZKQ11iJiiO/8KqezzNuSTn
 pQCc4HfjB8ZDB11RdeTfmScFbabJXyS6U+rAc6/SCe8v9PGAjQPSd/0lUJEYEhBJb/
 DAcjFfxZ553jXRIzeWyzghfGmwfRSlnEi3hT8HRc=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YkXKmxJ0R3qpUoH4@sirena.org.uk>
Date: Fri, 22 Apr 2022 12:43:30 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <YkWfziQzprEsWL72@sirena.org.uk>
 <CCE4A06E-6D6F-457D-B3C5-C36209BF38D3@cutebit.org>
 <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
 <YkXKmxJ0R3qpUoH4@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:39 +0200
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


> On 31. 3. 2022, at 17:36, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Thu, Mar 31, 2022 at 05:04:32PM +0200, Martin Povi=C5=A1er wrote:
>>> On 31. 3. 2022, at 16:18, Mark Brown <broonie@kernel.org> wrote:
>=20
>>> Yes, having two devices driving the bus at the same time wouldn't be
>>> great.  How is the TDM slot selection for the signals done in the
>>> hardware, I'm not seeing anything immediately obvious in the driver?
>>> I'd have thought that things would be implemented such that you =
could
>>> implement speaker protection on all speakers simultaneously but =
perhaps
>>> not.
>=20
>> I don=E2=80=99t know. I would have to go study the details of this. =
Should I see
>> if I can find a combination of =E2=80=98ASI1 Sel=E2=80=99 =
=E2=80=98VSENSE=E2=80=99 =E2=80=98ISENSE=E2=80=99 settings
>> that would lead to driver conflict on one of the models, or is there
>> a chance we could hide those controls just on the basis of =E2=80=98it =
doesn=E2=80=99t
>> do anything usable and is possibly dangerous=E2=80=99?
>=20
> If ISENSE and VSENSE output are controlled by the same mux as routing
> then we should lock one of the controls out for at least stereo =
devices
> (it might be a good idea to check if the output is actually high Z =
when
> ISENSE and VSENSE are off rather than just driving zeros, if not it
> definitely has to be the routing control).  My instinct is that it's
> better to preserve the ability to implement speaker protection in =
future
> since that is something that'd be broadly useful, especially if =
someone
> comes up with a generic speaker protection implementation in which =
case
> there should be an awful lot of systems out there which could benefit.=20=


Sorry for having put this on hold for a while.

I looked in the TAS2770 and TAS2764 drivers/datasheets, and to answer
the questions we had:

 * VSENSE/ISENSE output slots are configured independently of audio =
samples
   routing. Kernel drivers configure the slots based on the =
'ti,imon-slot-no'
   and 'ti,vmon-slot-no' properties of devicetree.

 * By default codecs transmit Hi-Z for duration of unused slots.

So once we supply the devicetree props it should be electrically sound
under any configuration of userspace knobs.

One final thought on the playback routing controls: On systems with >2
speakers, the codecs need to be assigned slots through set_tdm_slot.
The macaudio driver RFCed here assigns a single slot to each speaker,
making the effect of each speaker's routing control this:

  'I2C offset' -- uses a random slot

  'Left' 'Right' 'LeftRight' -- uses the single slot we configured

I suppose I better assign two slots to speakers in each left-right pair
of the same kind (e.g. woofer 1, woofer 2, tweeter). This way the
routing control will mimic its behavior from simple stereo systems but
replicated within each left-right pair.  (I would prefer to hide the
controls altogether, but as I learned that hiding things unless proven
dangerous is an ASoC non-goal, this way I can make the controls do
something interesting.)

Martin

