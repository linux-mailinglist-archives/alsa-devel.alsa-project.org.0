Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAB70EE49
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 08:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9F3D8;
	Wed, 24 May 2023 08:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9F3D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684910465;
	bh=C3EnvlgHfGci4WQBFLuD/EErN/9TkiQAPoRb3SwWtX0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YM/xzSnD4MrfRnRdxy/E9di9iQ5Jx99mYKz00BpNwXogOiQV2O3jipsOib6tVGC8c
	 WGnqTfaCHfTLvQKurLWxQ9hVHrG1B7aEVCdVIwjZVRn2qWQGeJXVzP8lJqUiN/9qCw
	 JH1gnZJAUNLHdO6M/D3TeWax22/cmAJsuvs5hRMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF00F8016A; Wed, 24 May 2023 08:40:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DA5F80249;
	Wed, 24 May 2023 08:40:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF60FF8024E; Wed, 24 May 2023 08:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A10EF8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 08:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A10EF8016A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684910402153166533-webhooks-bot@alsa-project.org>
References: <1684910402153166533-webhooks-bot@alsa-project.org>
Subject: topology: pre-processor: Add support for object arrays
Message-Id: <20230524064004.CF60FF8024E@alsa1.perex.cz>
Date: Wed, 24 May 2023 08:40:04 +0200 (CEST)
Message-ID-Hash: K2KAKKK4DV4W2FOSRXE6LNFZW2HBAO5A
X-Message-ID-Hash: K2KAKKK4DV4W2FOSRXE6LNFZW2HBAO5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2KAKKK4DV4W2FOSRXE6LNFZW2HBAO5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #216 was edited from ranj063:

Introduce a new keyword, "Objects" to instantiate multiple objects of the same class with different attirbutes. For example

```
Objects.Base.input_audio_format [
	{
		in_rate [
			8000
			16000
			48000
		]
		in_bit_depth [
			32
		]
		in_valid_bit_depth [
			24
			32
		]
	}
]
```

This would be expanded into 6 objects with the rate, bit_depth and valid_bit_depth combinations of the arrays of values above.

```
Object.Base.input_audio_format [
	{
		in_rate 8000
		in_bit_depth 32
		in_valid_bit_depth 32
	}
	{
		in_rate 16000
		in_bit_depth 32
		in_valid_bit_depth 32
	}
	{
		in_rate 48000
		in_bit_depth 32
		in_valid_bit_depth 32
	}
	{
		in_rate 8000
		in_bit_depth 32
		in_valid_bit_depth 24
	}
	{
		in_rate 16000
		in_bit_depth 32
		in_valid_bit_depth 24
	}
	{
		in_rate 48000
		in_bit_depth 32
		in_valid_bit_depth 24
	}
]
```

The Objects definition is an array so that multiple combinations can be specified so that we deal with only valid combinations. For example, 16-bit bit_depth is only valid with 16-bit valid_bit_depth. So if we also want to add those combinations with the multiple rates, the definition would look like:

```
Objects.Base.input_audio_format [
        {
                in_rate [
                        8000
                        16000
                        48000
                ]
                in_bit_depth [
                        32
                ]
                in_valid_bit_depth [
                        24
                        32
                ]
        }
        {
                in_rate [
                        8000
                        16000
                        48000
                ]
                in_bit_depth [
                        16
                ]
                in_valid_bit_depth [
                        16
                ]
        }
]
```

Request URL   : https://github.com/alsa-project/alsa-utils/pull/216
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/216.patch
Repository URL: https://github.com/alsa-project/alsa-utils
