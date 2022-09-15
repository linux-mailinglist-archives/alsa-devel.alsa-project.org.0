Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EAB5B9C44
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 15:46:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3089A1A26;
	Thu, 15 Sep 2022 15:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3089A1A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663249582;
	bh=IER5tMa1P6/JO8ZYNlErz26opD8FQDN/0FmaBqWZU+A=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/cYe24zdmdjewFx2CaeYhKGgtBsb/rE7tMnM7iFuGkFdmyU+hl3r9Tn/Gy6R3VAr
	 d6QWTbd1fK+cqy2TXCT0FuM3grdEhts8UFKYagFvNHOR3HJetTV9Rk4DslbBUPlMcO
	 y/qbrTinfnBuqm3Zx6xF/KjN7rEL3zxqrIsm+pqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8488FF8027D;
	Thu, 15 Sep 2022 15:45:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BC00F80238; Thu, 15 Sep 2022 15:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D28E2F800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 15:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28E2F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="K5TAwaPZ"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663249513; bh=l01iLyM36JedOYdbzAtHbSm+ZQiW2nZAjHAJLtQOIws=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=K5TAwaPZbHU8pEC1ODHmVk2rGZNxvX8lP1CrhlLin+uAdeE//NklaLbliGyuO37GS
 1aD+jCZlo1q28wPfikTP0ks7osCFIaqDUy2T2ilc+0qWxTJ4lONe3Njl7HZGlO/K08
 VKw4qsdaRXa7xW7ULNnDcMlFOQcCRig6u4y+RNNI=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 04/11] ASoC: cs42l42: Split probe() and remove() into
 stages
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <2839a437-a57a-ffc4-da8e-dde9a9a9a5cc@opensource.cirrus.com>
Date: Thu, 15 Sep 2022 15:45:10 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB6CBB73-5124-4C3B-9F03-DB4B5092767C@cutebit.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
 <20220915094444.11434-5-povik+lin@cutebit.org>
 <2839a437-a57a-ffc4-da8e-dde9a9a9a5cc@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Matt Flax <flatmax@flatmax.com>
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


> On 15. 9. 2022, at 14:20, Richard Fitzgerald =
<rf@opensource.cirrus.com> wrote:
>=20
> On 15/09/2022 10:44, Martin Povi=C5=A1er wrote:
>> From: Richard Fitzgerald <rf@opensource.cirrus.com>
>> To prepare for adding SoundWire the probe must be split into three
>> parts:
>> 1) The bus-specific probe
>> 2) Common bus-agnostic probe steps
>> 3) Initialization of the peripheral registers
>> Step (3) must be separate because on SoundWire devices the probe must
>> enable power supplies and release reset so that the peripheral can be
>> enumerated by the bus, but it isn't possible to access registers =
until
>> enumeration has completed.
>> The call to devm_snd_soc_register_component() must be done at stage =
(2)
>> so that it can EPROBE_DEFER if necessary. In SoundWire systems stage =
(3)
>> is not a probe event so a deferral at this stage would not result in
>> re-probing dependencies.
>> A new init_done flag indicates that the chip has been identified and
>> initialized. This is used to prevent cs42l42_remove(), =
cs42l42_suspend(),
>> cs42l42_restore() and cs42l42_irq_thread() from attempting register
>> accesses if the chip was not successfully initialized. Although this
>> cannot happen on I2C, because the entire probe would fail, it is
>> possible on SoundWire if probe succeeds but the cs42l42 is never
>> enumerated.
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> ---
>> sound/soc/codecs/cs42l42.c | 127 =
+++++++++++++++++++++++++------------
>> sound/soc/codecs/cs42l42.h | 2 +
>> 2 files changed, 87 insertions(+), 42 deletions(-)
>> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
>> index 11cb659f03e0..427b29db2252 100644
>> --- a/sound/soc/codecs/cs42l42.c
>> +++ b/sound/soc/codecs/cs42l42.c
>> @@ -1627,7 +1627,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, =
void *data)
>> 	int report =3D 0;
>> 	mutex_lock(&cs42l42->irq_lock);
>> -	if (cs42l42->suspended) {
>> +	if (cs42l42->suspended || !cs42l42->init_done) {
>> 		mutex_unlock(&cs42l42->irq_lock);
>> 		return IRQ_NONE;
>> 	}
>=20
> This doesn't apply to broonie/for-next. Needs rebasing onto commit:
> ea75deef1a73 ("ASoC: cs42l42: Only report button state if there was a
> button interrupt")

It did apply to broonie/for-6.1 roughly at the time of posting, but
since then the merge commit 12e51866c79f ("ASoC/qcom/arm64: Qualcomm
ADSP DTS and binding fixes=E2=80=9D) brought in changes into =
broonie/for-6.1
from elsewhere, I guess from broonie/for-next. (I am not sure this
was intentional.)

Since the series still applies in a 3-way automerge (git am -3) on
top of the new for-6.1 or for-next, I checked the automerge result
and also considering the other commit ea75deef1a73 touches an
unrelated part of cs42l42_irq_thread, I am not considering this an
issue, that is unless Mark says it is.

Martin

