Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B25A541D9
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 05:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC5C6042D;
	Thu,  6 Mar 2025 05:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC5C6042D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741236828;
	bh=AiNVAmU2Yh5wg7vqq+82PhDswq3ciN0VNbqNRLCXaac=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ry17fEQTpa9qVjBBqQDl6tfHaPyJnPLP4gNdcd81dcZO9YDn2lTLF21+oinTC6c/Z
	 IwYbbEmz1byjeeoLa7RGzyk8LxH/GK3Suvb4ekxXkt/DOjw7GD0O91jPELgimrj1so
	 KNSzkCLk92+Z8o6GyqN116zWIocK3HJUWM5tbYUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 913A2F805BA; Thu,  6 Mar 2025 05:53:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 739CDF805BE;
	Thu,  6 Mar 2025 05:53:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D59F804D6; Thu,  6 Mar 2025 05:53:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E39F80152
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 05:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45E39F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741236786732929945-webhooks-bot@alsa-project.org>
References: <1741236786732929945-webhooks-bot@alsa-project.org>
Subject: regresion: snd_hdsp
Message-Id: <20250306045309.16D59F804D6@alsa1.perex.cz>
Date: Thu,  6 Mar 2025 05:53:09 +0100 (CET)
Message-ID-Hash: JBWPPWTMNUQHL4FKATHFV5VAXG6MLB6J
X-Message-ID-Hash: JBWPPWTMNUQHL4FKATHFV5VAXG6MLB6J
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBWPPWTMNUQHL4FKATHFV5VAXG6MLB6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-firmware issue #11 was opened from juanpc2018:

![Image](https://github.com/user-attachments/assets/e57192a7-ad1c-44f9-b51d-7806efed9a32)

```
$ pulseaudio
W: [pulseaudio] module.c: module-combine is deprecated: Please use module-combine-sink instead of module-combine!
W: [pulseaudio] module-combine.c: We will now load module-combine-sink. Please make sure to remove module-combine from your configuration.
E: [alsa-sink-RME Hammerfall HDSP 9632] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
E: [alsa-sink-RME Hammerfall HDSP 9632] alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_hdsp'. Please report this issue to the ALSA developers.
E: [alsa-sink-RME Hammerfall HDSP 9632] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.

```

when i play any video or sound file,
most of the time PulseAudio takes between 7 to 15 seconds to fill the buffer in proper order,
audio is played in wrong order, chopped, like stutter.

i have tested /etc/pulse/deamon.conf
s24le to s24be
problem persists.

forced sample rate to 48Khz,
i remember hdsp9632 worked ok on U/Kubuntu 10.04 & 10.10
Now 20.04.4 LTS has problems.

im using Liquorix 6.3 Kernel.

Issue URL     : https://github.com/alsa-project/alsa-firmware/issues/11
Repository URL: https://github.com/alsa-project/alsa-firmware
