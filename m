Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2C31B95A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 13:37:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6CA211C;
	Mon, 15 Feb 2021 13:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6CA211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613392636;
	bh=tw/KzNm6zhpjJJEnontpAVu6/xv3KTM62aWK+LgaMIw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0GjDzIPOEi6+yVQQlC8PZ7cG6+ueEchqi4kjPfVdTxC7F9W3COv8lVP3E23F6JCL
	 msMEf4yafgkODv7f4AJyXVdE2BsAKWVMOtEyhhRgc2VI2XnnzxZTpUxWasonk6NpLC
	 WQyueeYaJL/7l2TiGbsnRTxiX3uTfRWNa0rgUga0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35541F80089;
	Mon, 15 Feb 2021 13:35:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F382F80258; Mon, 15 Feb 2021 13:35:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC03DF800AE
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 13:35:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CC6E9A0040;
 Mon, 15 Feb 2021 13:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CC6E9A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613392527; bh=FhbBUcTMSUcMh8lqbAeJUEPaHlEEHFLdstnyQvFkrRQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Hiltduue5CBEDF6nqek6v9ODqL9VfxZkHhZXdjj9x1+bpmTSk12+ORXjnSWRXcEvG
 xSba/JsNtzoJrCCVyeUX6ssRhDd5MNRx1VtQOCmxsyQLrNLDe77FN/UZLsZqOJycMI
 LcPwtrsiHe1ydPTFR2E/HaAC/jWyGJ+r+4vE+RT8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 15 Feb 2021 13:35:23 +0100 (CET)
Subject: Re: [PATCH 0/5] ALSA: control - add generic LED trigger code
To: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210211111400.1131020-1-perex@perex.cz>
 <cb04c4b2-4722-233a-05d4-2d3472d14bd9@redhat.com>
 <eaa36d30-8d9f-0845-4516-f89a066a76e7@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7784da7f-0d9c-d2b7-bf0d-26c37ae81311@perex.cz>
Date: Mon, 15 Feb 2021 13:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eaa36d30-8d9f-0845-4516-f89a066a76e7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Perry Yuan <Perry.Yuan@dell.com>
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

Dne 15. 02. 21 v 13:02 Hans de Goede napsal(a):
> Hi,
> 
> On 2/12/21 9:31 PM, Hans de Goede wrote:
>> On 2/11/21 12:13 PM, Jaroslav Kysela wrote:
> 
> <snip>
> 
>>> The sound driver implementation is really easy:
>>>
>>> 1) call snd_ctl_led_request() when control LED layer should be
>>>    automatically activated
>>>    / it calls module_request("snd-ctl-led") on demand /
>>> 2) mark all related kcontrols with
>>> 	SNDRV_CTL_ELEM_ACCESS_SPK_LED or
>>> 	SNDRV_CTL_ELEM_ACCESS_MIC_LED
>>
>> So I've been running some tests with this,combined with writing
>> UCM profiles for hw volume control, for some Intel Bay- and
>> CherryTrail devices using Intel's Low Power Engine (LPE) for audio,
>> which uses the ASoC framework.
>>
>> My work / experiments for this are progressing a bit slower then I
>> would like, but that is not the fault of this patch-set, but rather
>> an issue with hw-volume control mapping, see below for details.
>>
>> Leaving the ASoC implementation details aside, this patch-set
>> works quite nicely to get the speaker mute-LED to work.
> 
> I've spend some more time this weekend playing with this and I've also
> added mic MUTE LED support for the ASoC rt5672 codec driver now using
> this.
> 
> I will post a RFC patch series with the ASoC rt5672 codec driver LED
> support soon, as adding an extra use-case for this will hopefully help
> with reviewing this.
> 
> FWIW there were some challenges, but those were not related to the
> driver API this patch set adds. The driver API works well for ASoC
> codec drivers.
> 
> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> One open issue is the lockdep issue which I reported in my
> previous email.

Thank you for tests, Hans. I'm working on the lockdep issue - I'll send v2 of the LED patchset soon.

The actual diff (I'd like to do more tests):

diff --git a/sound/core/control.c b/sound/core/control.c
index 4647b3cd41e8..c9f062fada0a 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2047,6 +2047,7 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 	down_write(&snd_ctl_layer_rwsem);
 	lops->next = snd_ctl_layer;
 	snd_ctl_layer = lops;
+	up_write(&snd_ctl_layer_rwsem);
 	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
 		card = snd_card_ref(card_number);
 		if (card) {
@@ -2054,7 +2055,6 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 			snd_card_unref(card);
 		}
 	}
-	up_write(&snd_ctl_layer_rwsem);
 }
 EXPORT_SYMBOL_GPL(snd_ctl_register_layer);
 
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 638808e397fe..093dce721024 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -75,7 +75,7 @@ static inline unsigned int group_to_access(unsigned int group)
 	return (group + 1) << SNDRV_CTL_ELEM_ACCESS_LED_SHIFT;
 }
 
-struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
+static struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
 {
 	unsigned int group = access_to_group(access);
 	if (group >= MAX_LED)
@@ -116,15 +116,20 @@ static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
 	return 0;
 }
 
-static int snd_ctl_led_get_lock(struct snd_ctl_led_ctl *lctl)
+static int snd_ctl_led_get_lock(struct snd_card *ncard, struct snd_ctl_led_ctl *lctl)
 {
 	struct snd_card *card = lctl->card;
 	int route;
 
-	down_read(&card->controls_rwsem);
-	route = snd_ctl_led_get(lctl);
-	up_read(&card->controls_rwsem);
-	return route;
+	/* the rwsem is already taken for the notification card */
+	if (ncard != card) {
+		down_read(&card->controls_rwsem);
+		route = snd_ctl_led_get(lctl);
+		up_read(&card->controls_rwsem);
+		return route;
+	} else {
+		return snd_ctl_led_get(lctl);
+	}
 }
 
 static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
@@ -149,7 +154,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 	list_for_each_entry(lctl, &led->controls, list) {
 		if (lctl->kctl == kctl && lctl->index_offset == ioff)
 			found = true;
-		UPDATE_ROUTE(route, snd_ctl_led_get_lock(lctl));
+		UPDATE_ROUTE(route, snd_ctl_led_get_lock(card, lctl));
 	}
 	if (!found && kctl && card) {
 		lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
@@ -158,7 +163,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 			lctl->kctl = kctl;
 			lctl->index_offset = ioff;
 			list_add(&lctl->list, &led->controls);
-			UPDATE_ROUTE(route, snd_ctl_led_get_lock(lctl));
+			UPDATE_ROUTE(route, snd_ctl_led_get_lock(card, lctl));
 		}
 	}
 	mutex_unlock(&snd_ctl_led_mutex);
@@ -246,10 +251,11 @@ static void snd_ctl_led_register(struct snd_card *card)
 	mutex_lock(&snd_ctl_led_mutex);
 	snd_ctl_led_card_valid[card->number] = true;
 	mutex_unlock(&snd_ctl_led_mutex);
-	/* the register callback is already called with held rwsem for controls */
+	down_read(&card->controls_rwsem);
 	list_for_each_entry(kctl, &card->controls, list)
 		for (ioff = 0; ioff < kctl->count; ioff++)
 			snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, ioff);
+	up_read(&card->controls_rwsem);
 	snd_ctl_led_refresh();
 }
 
@@ -262,17 +268,6 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
 	snd_ctl_led_refresh();
 }
 
-/**
- * snd_ctl_led_hello - kernel module reference helper
- *
- * Call this helper in the module init function when the control LED
- * code should be activated for the given driver.
- */
-void snd_ctl_led_hello(void)
-{
-}
-EXPORT_SYMBOL(snd_ctl_led_hello);
-
 /*
  * sysfs
  */


					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
