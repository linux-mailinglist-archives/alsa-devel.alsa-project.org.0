Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1F320C64
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 19:02:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E66B1667;
	Sun, 21 Feb 2021 19:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E66B1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613930569;
	bh=TvW3HpDNQSJ3KuSfRVebOYNQD+f6YDY596ns9UdiICc=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QG8fx1y0x6gNrHjBB1oGFnKBGMzDn89buGUZnZwX9eokd+oZK+Wo94Nl71JipdPFq
	 Uc8rbdqsSXRqFrXH7YgpbEN9Npy79zjoZs8oikI1T+XYSER/PRudY0O4qOOxxUQ6w+
	 O3rTa84ZcS21cCR1Xt2NjxEyxNwZKx72htn8A2NQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF2EF80152;
	Sun, 21 Feb 2021 19:01:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03CF8F8016A; Sun, 21 Feb 2021 19:01:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D31BDF800F3
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 19:01:06 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 86CEAA003F;
 Sun, 21 Feb 2021 19:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 86CEAA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613930466; bh=ihPniwSxtYl+15x5U2QhWQVf3XB8dMTpjpKxnnzV5gs=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=IC+9iJqmNDqF5AF9fwo2DFzKLY/OlCg2Rtp2w1AZV5BEgOyblmt47kS7ukhnZEIPS
 j5PXtYAxiwz2pRlDyTvTTRoKdg+Y7vBwDH0AgTVNJZyFTuzgu/oUXgLHv2ppa5zhox
 KMb3b5Za3hWbSm03WO0nIK4UDmxvcFgeFaYjZZRE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 21 Feb 2021 19:01:02 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 0/5] ALSA: control - add generic LED API
To: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210215172418.1322825-1-perex@perex.cz>
 <d1582696-b8db-7c7e-3279-9ce016a7fa8a@redhat.com>
Message-ID: <1509c137-c977-c9af-95c4-8d4040e619e3@perex.cz>
Date: Sun, 21 Feb 2021 19:01:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d1582696-b8db-7c7e-3279-9ce016a7fa8a@redhat.com>
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

Dne 21. 02. 21 v 14:14 Hans de Goede napsal(a):

>> v2 changes:
>>   - fix the locking - remove the controls_rwsem read lock
>>     in the element get (the consistency is already protected
>>     with the global snd_ctl_led_mutex and possible partial
>>     value writes are catched with the next value change
>>     notification callback)
> 
> I'm afraid that lockdep still is unhappy. With v2 there is a new
> (different) lockdep warning.

> If you can send me another fixup-diff then I'll make sure to
> test this before you do a v3, so that we can be sure that
> all cases which my setup catches are resolved before sending
> out v3.

Thank you for your test. This change (on top of v2) should resolve this
remaining lockdep:

diff --git a/sound/core/control.c b/sound/core/control.c
index c9f062fada0a..494f0154e8be 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2051,7 +2051,9 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
 		card = snd_card_ref(card_number);
 		if (card) {
+			down_read(&card->controls_rwsem);
 			lops->lregister(card);
+			up_read(&card->controls_rwsem);
 			snd_card_unref(card);
 		}
 	}
@@ -2113,10 +2115,12 @@ static int snd_ctl_dev_register(struct snd_device *device)
 				  &snd_ctl_f_ops, card, &card->ctl_dev);
 	if (err < 0)
 		return err;
+	down_read(&card->controls_rwsem);
 	down_read(&snd_ctl_layer_rwsem);
 	for (lops = snd_ctl_layer; lops; lops = lops->next)
 		lops->lregister(card);
 	up_read(&snd_ctl_layer_rwsem);
+	up_read(&card->controls_rwsem);
 	return 0;
 }

@@ -2137,10 +2141,12 @@ static int snd_ctl_dev_disconnect(struct snd_device
*device)
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);

+	down_read(&card->controls_rwsem);
 	down_read(&snd_ctl_layer_rwsem);
 	for (lops = snd_ctl_layer; lops; lops = lops->next)
 		lops->ldisconnect(card);
 	up_read(&snd_ctl_layer_rwsem);
+	up_read(&card->controls_rwsem);

 	return snd_unregister_device(&card->ctl_dev);
 }
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index cafe4c82ca35..b8bb8fd46686 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -235,11 +235,10 @@ static void snd_ctl_led_register(struct snd_card *card)
 	mutex_lock(&snd_ctl_led_mutex);
 	snd_ctl_led_card_valid[card->number] = true;
 	mutex_unlock(&snd_ctl_led_mutex);
-	down_read(&card->controls_rwsem);
+	/* the register callback is already called with held card->controls_rwsem */
 	list_for_each_entry(kctl, &card->controls, list)
 		for (ioff = 0; ioff < kctl->count; ioff++)
 			snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, ioff);
-	up_read(&card->controls_rwsem);
 	snd_ctl_led_refresh();
 }


					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
