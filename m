Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF17A3152
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 18:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6390A4A;
	Sat, 16 Sep 2023 18:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6390A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694880548;
	bh=TetoKn0jEc0O5//Vt7JAoy6eetbQVJ2liQR8Uy2EbTU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h/vnZkTT7RdxvyEz0XYMiFHYmG3PWTrcjy+Se7mMfS7Gz2er5/OMk3/iqsvUleQqO
	 F5iyxIV2KLkGRWTxGodL612Lu9wdW7aTaemjT67XYbj4JVjf0NM0dYD/ExT8rP/0SL
	 kc9/Xgui0AY0ZYX1pwKrIbWtATEoRmFId07Fjeco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E69AF80551; Sat, 16 Sep 2023 18:08:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E216BF80246;
	Sat, 16 Sep 2023 18:08:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45894F80425; Sat, 16 Sep 2023 18:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F9B9F80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 18:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F9B9F80141
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694880438650761127-webhooks-bot@alsa-project.org>
References: <1694880438650761127-webhooks-bot@alsa-project.org>
Subject: AIF2 ADC Stereo Capture Route is uninitialised in alsa-ucm-conf
Message-Id: <20230916160722.45894F80425@alsa1.perex.cz>
Date: Sat, 16 Sep 2023 18:07:22 +0200 (CEST)
Message-ID-Hash: GKGPUF6CJ57HXHNMNSGZOWQ6VKUNDDY6
X-Message-ID-Hash: GKGPUF6CJ57HXHNMNSGZOWQ6VKUNDDY6
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKGPUF6CJ57HXHNMNSGZOWQ6VKUNDDY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #351 was edited from broukema:

DESCRIPTION:
`AIF2 ADC Stereo Capture Route` is not initialised in
`alsa-ucm-conf`. This implies that if its setting is significant, any
accidental change by the user (using any of the various `alsa` tools)
to a wrong setting will not be corrected by any of the three
`PinePhone/*.conf` files, leading, in particular, to audio errors during a phone
call. This was discovered by testing variations on the Mobian version
of the PinePhone alsa-ucm-conf files.

CODING ARGUMENT:
All parameters that can significantly affect the audio system should be
either initialised or overridden in configuration files that the user
expects to necessarily work, such as those for phone calls.
In `alsa-ucm-conf` commit b68aa52 (one beyond v1.2.10):
````
$ grep -ri "AIF2 ADC Stereo Capture" .
$
````
shows that `AIF2 ADC Stereo Capture Route` is not set for any device at all
(PinePhone or other).

HARDWARE ARGUMENT:
For the PinePhone (PP), Megi recommends in https://xnux.eu/devices/feature/audio-pp.html
that `AIF2 ADC Stereo Capture Route` is set to `Mix Mono`.

TESTING ARGUMENT:
Experimentation with different stored alsa settings (from
````
sudo alsactl store -f - > YYYYMMDD_example_alsa_settings
````
) showed that settings files whose only substantial difference was in the setting
of `AIF2 ADC Stereo Capture Route` had the effect that audio from the PP was heard on the
remote phone when the value was `Mix Mono` and was not heard with the value `Stereo`.
Testing was done with the equivalent of
https://codeberg.org/boud/pinephone_hacks/src/commit/7c7b6660a4446a24747f2c2edbe1d57d863ffb9f/audio_hacks/sort_of_restart_audio
with the settings file
https://codeberg.org/boud/pinephone_hacks/src/commit/7c7b6660a4446a24747f2c2edbe1d57d863ffb9f/audio_hacks/20230806_example_alsa_settings#L271
that has the `Mix Mono` value selected.

RECOMMENDATIONS:
* `AIF2 ADC Stereo Capture Route` should be initialised or set to *something* in one of the
.conf files (in the PP case, most likely in `VoiceCall.conf`), at least for the PinePhone,
to prevent users who experiment and have 
difficulty remembering which of the 50 PinePhone alsa parameters should be set in which way from
accidentally sabotaging their otherwise working audio calls;
* Based on Megi's 2020 page and my testing, it seems that the correct value should be `Mix Mono`.


COMMENT:
While setting all 50 of the alsa settings for the PinePHone
```` 
$ sudo alsactl store -f - |grep "name " |wc
50     258    1788
````
in the .conf files is most likely unnecessary, there could be others that are necessary too. Ideally,
someone who really understands how the PP audio system works (including Megi's two diagrams
at https://xnux.eu/devices/feature/audio-pp.html) should be able to make these recommendations.

Some other phones may need this or other parameters initialised too.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/351
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
