Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A06C3D9E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 23:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1DEF208;
	Tue, 21 Mar 2023 23:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1DEF208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679437180;
	bh=esiCyKOeRzOLdYIVhVrXW6XDb+dUfcaBNizQSQbemhA=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ozTEMhbOQohDhPQJmnkmmv0mo30HABhn3eS0LcPHVi3TpwHDWx+dvOlAGO59njkID
	 dVIPnpS6uEYkXX78FbAehiEUElSp6hiv6kl9mR5LwdDoJ8u6UzSsyO5ApYMT2A7wXN
	 fXYt8D/pzOQHgUvMErgSJYYLIStoMSEwEHKWBObs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FFFF80254;
	Tue, 21 Mar 2023 23:18:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 701B9F8027B; Tue, 21 Mar 2023 23:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29DBCF8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 23:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29DBCF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=Gs+vK6HP
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 04DE516C0008;
	Wed, 22 Mar 2023 00:18:37 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3HaXk0NAyie; Wed, 22 Mar 2023 00:18:33 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1679437113; bh=esiCyKOeRzOLdYIVhVrXW6XDb+dUfcaBNizQSQbemhA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gs+vK6HPaIqLXChtT2Kk/SmmFCHQ5yHmyT9ThRurlMegTjCiW8/aT95i8jdmIioPq
	 iHeLYuz8urbvwB+u0F8MSPQWdbIWthONiiIhavj2vNGRb9aMV+l6IwWfW8Me5Af+9y
	 sD+UY2i9lHYR6sRn0xbBuEuzuh1IvuqQXrmBXK9k=
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
In-Reply-To: <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
Date: Wed, 22 Mar 2023 00:17:24 +0200
Message-ID: <87lejpwxzf.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 4H2SROVTKF4KZAFVO5D2WVVK6SL553VY
X-Message-ID-Hash: 4H2SROVTKF4KZAFVO5D2WVVK6SL553VY
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4H2SROVTKF4KZAFVO5D2WVVK6SL553VY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mark Brown <broonie@kernel.org> writes:

>> +static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
>> +					    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
>> +
>> +	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
>> +	if (SND_SOC_DAPM_EVENT_ON(event))
>> +		acp3x_es83xx_set_gpios_values(priv, 1, 0);
>> +	else
>> +		acp3x_es83xx_set_gpios_values(priv, 0, 1);
>
> Why are these two GPIOs tied together like this?
>

These GPIOs represent the speaker and the headphone switches. When
activating the speaker GPIO you have to deactivate the headphone GPIO
and vice versa. The logic is taken from the discussion on the sofproject
pull request:
https://github.com/thesofproject/linux/pull/4112/commits/810d03e0aecdf0caf580a5179ee6873fb33485ab
and
https://github.com/thesofproject/linux/pull/4066

>> +static int acp3x_es83xx_suspend_pre(struct snd_soc_card *card)
>> +{
>> +	struct acp3x_es83xx_private *priv = get_mach_priv(card);
>> +
>> +	dev_dbg(priv->codec_dev, "card suspend\n");
>> +	snd_soc_component_set_jack(priv->codec, NULL, NULL);
>> +	return 0;
>> +}
>
> That's weird, why do that?

This is needed because if suspending the laptop with the headphones
inserted, when resuming, the sound is not working anymore. Sound stops
working on speakers and headphones. Reinsertion and removals of the
headphone doesn't solve the problem.

This seems to be caused by the fact
that the GPIO IRQ stops working in es8316_irq() after resume.
Now the call to snd_soc_component_set_jack() in suspend disables the
GPIO IRQ and in resume the GPIO IRQ is reactivated.
By the way this sequence is also used in bytcht_es8316.c in suspend and
resume:

static int byt_cht_es8316_suspend(struct snd_soc_card *card)
{
	struct snd_soc_component *component;

	for_each_card_components(card, component) {
		if (!strcmp(component->name, codec_name)) {
			dev_dbg(component->dev, "disabling jack detect before suspend\n");
			snd_soc_component_set_jack(component, NULL, NULL);
			break;
		}
	}

	return 0;
}

static int byt_cht_es8316_resume(struct snd_soc_card *card)
{
	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
	struct snd_soc_component *component;

	for_each_card_components(card, component) {
		if (!strcmp(component->name, codec_name)) {
			dev_dbg(component->dev, "re-enabling jack detect after resume\n");
			snd_soc_component_set_jack(component, &priv->jack, NULL);
			break;
		}
	}
