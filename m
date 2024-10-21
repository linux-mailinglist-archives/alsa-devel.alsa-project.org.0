Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5399A5A7A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 08:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEBD3B6A;
	Mon, 21 Oct 2024 08:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEBD3B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729492604;
	bh=ZiSVpMyTTk8w9gZJ69Hs5xWvt9Ms6PxbVYaEk375Q7c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OGz49pTOsG7bjxnwjDBX6EdupCKIA/oVsLzp3QQ2KnJw8Z0ZgfvtozYywFI3VdWLn
	 wGfofHtRmpIBSFYxgjEfWQsCNmXYKN8BwyFsQTR4F/7ifYPoF1UZQtrNlO4YaNdvV9
	 DqsJguaL8CQa20cUroc5Zuf+2w0E2XzSQqTZP3j8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 868CCF805BB; Mon, 21 Oct 2024 08:36:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D31F80154;
	Mon, 21 Oct 2024 08:36:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3B5EF8016C; Mon, 21 Oct 2024 08:36:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6D8F80104
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 08:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB6D8F80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729492566332724810-webhooks-bot@alsa-project.org>
References: <1729492566332724810-webhooks-bot@alsa-project.org>
Subject: snd_pcm_hw_open open '/dev/snd/pcmC0D0p' failed (-16)
Message-Id: <20241021063608.A3B5EF8016C@alsa1.perex.cz>
Date: Mon, 21 Oct 2024 08:36:08 +0200 (CEST)
Message-ID-Hash: NRUXMXXFAO2L4KDWF6WJYLGT6HWWFNRR
X-Message-ID-Hash: NRUXMXXFAO2L4KDWF6WJYLGT6HWWFNRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRUXMXXFAO2L4KDWF6WJYLGT6HWWFNRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #412 was opened from SVENsuzhou:

Hi, I am using pjsip to make a sip call function. But I got the following error in alsa-lib.
```
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.315           pjsua_call.c !Answering call 0: code=200
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.315      inv0x7f989c003fc8  ..SDP negotiation done: Success
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.316          pjsua_media.c  ...Call 0: updating media..
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.316          pjsua_media.c  .....Media stream call00:0 is destroyed
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.316      udp0x7f989c010710  ....UDP media transport started
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.316            pjsua_aud.c  ....Audio channel update..
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.316      udp0x7f989c010710  .....UDP media transport attached
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.317     strm0x5559ce2eb538  .....Encoder stream started
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.317     strm0x5559ce2eb538  .....Decoder stream started
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.317          pjsua_media.c  ....Audio updated, stream #0: PCMA (sendrecv)
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.317            pjsua_aud.c  ...Conf connect: 1 --> 0
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.317            pjsua_aud.c  ....Set sound device: capture=-1, playback=-2, mode=0, use_default_settings=0
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.317            pjsua_aud.c  .....Opening sound device (speaker + mic) PCM@16000/1/20ms
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.318             alsa_dev.c  ......ALSA lib /usr/src/debug/alsa-lib/1.2.11/src/pcm/pcm_hw.c:1785:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-16): Device o
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.318            pjsua_aud.c  .....Opening sound device (speaker + mic) PCM@44100/1/20ms
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: start media transmit failed: pjsua_conf_connect(id, sink.id) error: Unknown error from audio driver (PJMEDIA_EAUD_SYSERR) (status=420002) [/usr/src/debug/pjproject/2.14.1/pjsip/src/pjsua2/media.cpp:218]
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.318             alsa_dev.c  ......ALSA lib /usr/src/debug/alsa-lib/1.2.11/src/pcm/pcm_hw.c:1785:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-16): Device o
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.318            pjsua_aud.c  .....Opening sound device (speaker + mic) PCM@48000/1/20ms
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.319             alsa_dev.c  ......ALSA lib /usr/src/debug/alsa-lib/1.2.11/src/pcm/pcm_hw.c:1785:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-16): Device o
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.319            pjsua_aud.c  .....Opening sound device (speaker + mic) PCM@32000/1/20ms
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.319             alsa_dev.c  ......ALSA lib /usr/src/debug/alsa-lib/1.2.11/src/pcm/pcm_hw.c:1785:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-16): Device o
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.319            pjsua_aud.c  .....Opening sound device (speaker + mic) PCM@16000/1/20ms
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.319             alsa_dev.c  ......ALSA lib /usr/src/debug/alsa-lib/1.2.11/src/pcm/pcm_hw.c:1785:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-16): Device o
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.319            pjsua_aud.c  .....Opening sound device (speaker + mic) PCM@8000/1/20ms
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.320             alsa_dev.c  ......ALSA lib /usr/src/debug/alsa-lib/1.2.11/src/pcm/pcm_hw.c:1785:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-16): Device o
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.320            pjsua_aud.c  .....Unable to open sound device: Unknown error from audio driver (PJMEDIA_EAUD_SYSERR) [status=420002]
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.320            pjsua_aud.c  ....Error opening sound device: Unknown error from audio driver (PJMEDIA_EAUD_SYSERR) [status=420002]
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.320              media.cpp  ...pjsua_conf_connect(id, sink.id) error: Unknown error from audio driver (PJMEDIA_EAUD_SYSERR) (status=420002) [/usr/src/debug/pjproject/2.14.1/pjsip/src/pjsua2/media.cpp:218]
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: 08:14:36.321           pjsua_core.c  ....TX 966 bytes Response msg 200/INVITE/cseq=30946 (tdta0x5559ce2e7378) to UDP 10.57.0.200:5060:
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: SIP/2.0 200 OK
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: Via: SIP/2.0/UDP 10.57.0.200:5060;rport=5060;received=10.57.0.200;branch=z9hG4bKPje5a12777-db72-4db0-a5a5-a72743589a27
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: Call-ID: 0bc91889-099c-42de-beb2-4fedefac6e7f
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: answer incoming call, remote uri: <sip:passenger_pei@10.57.0.200>, state: CONNECTING
Oct 21 08:14:36 tos-hmi-02 ads_uartboardd[1404]: From: <sip:passenger_pei@10.57.0.200>;tag=9efc50b5-c57a-4aa7-823e-2c3df064a27c
```
I try to use `lsof /dev/snd/*` to check which process hold the file handle. And I got nothing. Can you give me some leads on troubleshooting?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/412
Repository URL: https://github.com/alsa-project/alsa-lib
