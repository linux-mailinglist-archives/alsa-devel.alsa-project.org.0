Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49674033D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 20:30:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C607F4;
	Tue, 27 Jun 2023 20:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C607F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687890623;
	bh=DSOqUUyJ9RLtqvWkglLf1JOI2Y+oMigWBTPJjg6nMn8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=d/ach6nczVUcd7NBIInvSxRikhRNnX2cBMGrBApC77OOrlWu90dz/5C3UDpzsZK4i
	 //uPk9bOH/wd/6vpY4crUCTlwPMq4ZsFgvFLMYkX+A9GU9pIDLktp+Do4sZ+uHI7Qt
	 UhN2kSdCZ2KLXZM0SjywqB984lxEZiSkE/wrnwkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28386F80212; Tue, 27 Jun 2023 20:29:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F92AF80212;
	Tue, 27 Jun 2023 20:29:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5714F80246; Tue, 27 Jun 2023 20:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D6E2F80124
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 20:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6E2F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687890538083485842-webhooks-bot@alsa-project.org>
References: <1687890538083485842-webhooks-bot@alsa-project.org>
Subject: topology: pre-processor: Add support for object arrays
Message-Id: <20230627182904.E5714F80246@alsa1.perex.cz>
Date: Tue, 27 Jun 2023 20:29:04 +0200 (CEST)
Message-ID-Hash: ZYEI5FAKRJPGOY6K55KAYJ6JBMOJRGHD
X-Message-ID-Hash: ZYEI5FAKRJPGOY6K55KAYJ6JBMOJRGHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYEI5FAKRJPGOY6K55KAYJ6JBMOJRGHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #216 was edited from ranj063:

Introduce a new keyword, "CombineArrays" to instantiate multiple nodes
of the type specified. For example:

CombineArrays.Object.Base.input_audio_format [
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

This would be expanded into 6 objects with the rate, bit_depth and
valid_bit_depth combinations of the arrays of values above.

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

The CombineArrays definition is an array so that multiple combinations can
be specified in order to deal with only valid combinations. For example,
16-bit bit_depth is only valid with 16-bit valid_bit_depth. So if we
also want to add those combinations with the multiple rates, the
definition would look like:

CombineArrays.Object.Base.input_audio_format [
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

Request URL   : https://github.com/alsa-project/alsa-utils/pull/216
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/216.patch
Repository URL: https://github.com/alsa-project/alsa-utils
