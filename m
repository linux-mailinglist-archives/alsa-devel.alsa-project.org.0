Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06D7126D9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 14:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D59AB204;
	Fri, 26 May 2023 14:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D59AB204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685104814;
	bh=uRKIKd5kZwD1/I4Cu4EQfLsMEDAzLj4GvwaAMoygEBw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MYaOf4o2qZHwBcicioBNXzrdvUm2SGMzJJe0ajcUSpmHPEA9ccDxOmQFN8vmSVKOI
	 q+oRUp8UfnsZuu1A4Q1MsSyJtpbjAJyQLxstsKMyhTuT1u0rvUtrzd49P4HqqQrYH7
	 YykMok7J+JDL4puz7iKKXtgackBNpvfnnPA6MhP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37555F80249; Fri, 26 May 2023 14:39:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A01F9F8016A;
	Fri, 26 May 2023 14:39:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31FCFF80249; Fri, 26 May 2023 14:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 91663F8001F
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 14:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91663F8001F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1685104754091510773-webhooks-bot@alsa-project.org>
References: <1685104754091510773-webhooks-bot@alsa-project.org>
Subject: Failed to import use case configuration
Message-Id: <20230526123918.31FCFF80249@alsa1.perex.cz>
Date: Fri, 26 May 2023 14:39:18 +0200 (CEST)
Message-ID-Hash: QCAILXV7ANIQOCQMH2OFMFUS5KCKC3HH
X-Message-ID-Hash: QCAILXV7ANIQOCQMH2OFMFUS5KCKC3HH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCAILXV7ANIQOCQMH2OFMFUS5KCKC3HH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #217 was opened from jesusjimsa:

Hello,

I have stored the configuration for my sound card in an asound.state file and `alsactl` is reading it fine, but during boot and whenever I try running the command manually, this message appears in the log:
```
alsa-lib ../../../git/src/ucm/main.c:1412:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -2
```

I don't understand what is going wrong and I haven't found much online. Any ideas for how I could fix this error or what might be the origin of it?

This is what I get if I run `aplay -l`:
```
~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: mycard [mycard], device 0: 44004000.audio-controller-tlv320aic31xx-hifi tlv320aic31xx-hifi [44004000.audio-controller-tlv320aic31xx-hifi tlv320aic31xx-hifi]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

Thank you.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/217
Repository URL: https://github.com/alsa-project/alsa-utils
