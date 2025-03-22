Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB2A6CAFE
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Mar 2025 15:57:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C88B60246;
	Sat, 22 Mar 2025 15:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C88B60246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742655437;
	bh=50PHIp97lj2coxUPVf3NnvmCPZjfCP4mgRs6fZzyufE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uu0WLSX0m3tTnRtUTfmFtaf0JZaCoaeQf78NkY4Qzbe8iGaQWHgSo6CQ6ypdMkdKJ
	 jwN7p7xjuRyiRWFScw0NgDeM4kcfOb35n4Wc65sj64VmUeiNxUhmM54Xu+SOw9NjGB
	 98SH9WXIs3S0FClbARLDVT2dIeWtLcJ0BhS7ZnXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7390CF805C1; Sat, 22 Mar 2025 15:56:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F220F801F5;
	Sat, 22 Mar 2025 15:56:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D54FEF8025A; Sat, 22 Mar 2025 15:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 305B0F800BD
	for <alsa-devel@alsa-project.org>; Sat, 22 Mar 2025 15:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 305B0F800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182f27da2d89b500-webhooks-bot@alsa-project.org>
In-Reply-To: <182f27da2d827f00-webhooks-bot@alsa-project.org>
References: <182f27da2d827f00-webhooks-bot@alsa-project.org>
Subject: [Regression] v1.2.13 broke my laptop's headphone microphone
Date: Sat, 22 Mar 2025 15:56:40 +0100 (CET)
Message-ID-Hash: MASUQVU7ZDILGKDTH6I6JLQY2UHYTS3O
X-Message-ID-Hash: MASUQVU7ZDILGKDTH6I6JLQY2UHYTS3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MASUQVU7ZDILGKDTH6I6JLQY2UHYTS3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #530 was opened from vixalien:

Hello everyone!

I have a HP ProBook 440 G8 Notebook PC, and sound and microphones were working correctly on v1.2.12, but now the microphone is not working after upgrading to v1.2.13.

Here's my system details:

```
OS: Alpine Linux edge x86_64
Host: HP ProBook 440 G8 Notebook PC
Kernel: Linux 6.13.7-0-edge
```

```
$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: sofhdadsp [sof-hda-dsp], device 0: HDA Analog (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 6: DMIC (*) []
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 7: DMIC16kHz (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

The `arecord` commands only works when I set the device to 0,6 and 0,7

```
arecord --duration=5 --format=dat --device=hw:0,0 test-mic.wav # does not work, empty audio
arecord --duration=5 --format=dat --device=hw:0,6 test-mic.wav # works
arecord --duration=5 --format=dat --device=hw:0,7 test-mic.wav # works
```

On v1.2.12, pipewire is automatically configured to use `0,6`, but on v1.12.13, it seems like it's configured to use `0,0` which causes that audio does not work.

I'm sorry this is my first issue report. I'm happy to provie more details if necessary.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/530
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
