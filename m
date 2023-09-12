Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4779D9C2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 21:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6115584C;
	Tue, 12 Sep 2023 21:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6115584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694548150;
	bh=T1t/57Cz89XT/CHZe/b38I61bPm2b8hm7sgiiJHtS9w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=T9DgVDNJKrE0W8K1y9sVUPNjYKIJytIjcMpCmmi3UfunbEOiskCor5g0Zydm5d6o/
	 tllT99TvVCv6iIJ2HND9oZJnkTAWnfGu8h0A62XyvfkVND0Eq8TQf9tppWrlufd+rs
	 memt7j1c+7GuVJyx2d4fUcPvulYk1z9lcoC5y94c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDE48F80141; Tue, 12 Sep 2023 21:48:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D79BF80246;
	Tue, 12 Sep 2023 21:48:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00C61F80425; Tue, 12 Sep 2023 21:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E9A2F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 21:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E9A2F8007C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694548093934110165-webhooks-bot@alsa-project.org>
References: <1694548093934110165-webhooks-bot@alsa-project.org>
Subject: Bug: AIF2 ADC Stereo Capture Route is unitialised in alsa-ucm-conf
Message-Id: <20230912194816.00C61F80425@alsa1.perex.cz>
Date: Tue, 12 Sep 2023 21:48:16 +0200 (CEST)
Message-ID-Hash: QPSX23OKJFBQZUT3K3Q2JRFXRB462HUR
X-Message-ID-Hash: QPSX23OKJFBQZUT3K3Q2JRFXRB462HUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPSX23OKJFBQZUT3K3Q2JRFXRB462HUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #351 was opened from broukema:

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
.conf files (in the PP case, most likely in `VoiceCall.conf`) to prevent users who experiment and have 
difficulty remembering which of the 50 PP alsa parameters should be set in which way from
accidentally sabotaging their otherwise working audio calls;
* Based on Megi's 2020 page and my testing, it seems that the correct value should be `Mix Mono`.


COMMENT:
While setting all 50 of the alsa settings
```` 
$ sudo alsactl store -f - |grep "name " |wc
50     258    1788
````
in the .conf files is most likely unnecessary, there could be others that are necessary too. Ideally,
someone who really understands how the PP audio system works (including Megi's two diagrams
at https://xnux.eu/devices/feature/audio-pp.html) should be able to make these recommendations.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/351
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
