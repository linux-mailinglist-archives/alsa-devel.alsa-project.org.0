Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01CB41A1E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 11:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCAF601F9;
	Wed,  3 Sep 2025 11:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCAF601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756892012;
	bh=cVc/g56oq6i9HBL+86rCyyccBilBgHVCkwctiTvNicc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZAgzMw661dY0LmIG15XFE34Zc9jkiK1GbXyEC4WHfSU9rcDoQ/ivEasyX9GU0jEus
	 TKMY3og0XfatzUELy3Puj/NGBP9MOA1OLdNa/zkKgidfcIIuUMS81WgCjVFOHN+9/T
	 Z5HYsy/l6Bm6Jy2hSeqyWqrcF4R2M8eiMZ8qnPQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18421F805C4; Wed,  3 Sep 2025 11:32:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D24BBF805C5;
	Wed,  3 Sep 2025 11:32:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F836F804D6; Wed,  3 Sep 2025 11:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D85C4F8011B
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 11:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85C4F8011B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1861bbeed64e3600-webhooks-bot@alsa-project.org>
In-Reply-To: <1861bbeed2850400-webhooks-bot@alsa-project.org>
References: <1861bbeed2850400-webhooks-bot@alsa-project.org>
Subject: A52 producing static noise
Date: Wed,  3 Sep 2025 11:32:47 +0200 (CEST)
Message-ID-Hash: LQEVTN5FL33R47KQXDUPTMR5FXIWN5U7
X-Message-ID-Hash: LQEVTN5FL33R47KQXDUPTMR5FXIWN5U7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQEVTN5FL33R47KQXDUPTMR5FXIWN5U7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #63 was opened from mingww64:

Setup is GPU----(HDMI)----TV----(eARC)----Sonos Arc

Playing AC3 audio sample works and can confirm the speakers is receiving in AC3 format (Sonos app displaying Dolby Digital 5.1), however using the a52 plugin with `speaker-test` only static noise was coming out intermittently and Sonos app doesn't show any audio format.
```log
Slave: Hardware PCM card 0 'HDA ATI HDMI' device 9 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 3072
  period_size  : 768
  period_time  : 16000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 768
  period_event : 0
  start_threshold  : 3072
  stop_threshold   : 3072
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
  appl_ptr     : 0
  hw_ptr       : 0
 0 - Front Left
 4 - Front Center
 1 - Front Right
 3 - Rear Right
 2 - Rear Left
 5 - LFE
Time per period = 17.888669
 0 - Front Left
 4 - Front Center
 1 - Front Right
^C 3 - Rear Right
 2 - Rear Left
 5 - LFE
Time per period = 8.512034
```

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/63
Repository URL: https://github.com/alsa-project/alsa-plugins
