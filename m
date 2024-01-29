Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9798400F1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 10:10:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A575A4D;
	Mon, 29 Jan 2024 10:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A575A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706519403;
	bh=HbA1f2Tx6HmmIf2IjP1+NL4vrJPEb98Aas7A+919OVs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m61aROSWytXtOdt9VmUlOuaXe9nBzm6tQrbX9M8FBfB3OdDJmCbKeg0oIMyJOaBy9
	 /hVJnveQifkUkmBzDFhVIW05qyLdloKyZnrH2ZHH3UwutHVh9B125p5INN8fx37/VQ
	 m61p5rOeyJAkVwpSbo+6KZGT2y9MYr7ERrr0S3CQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DBD7F80580; Mon, 29 Jan 2024 10:09:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5604EF8057D;
	Mon, 29 Jan 2024 10:09:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DC2DF80310; Mon, 29 Jan 2024 10:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E5E1F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 10:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E5E1F800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706519364513619900-webhooks-bot@alsa-project.org>
References: <1706519364513619900-webhooks-bot@alsa-project.org>
Subject: USB-Audio: ALC4080: Add support for MSI MPG B650 Carbon Wifi
 (0db0:70d3)
Message-Id: <20240129090928.0DC2DF80310@alsa1.perex.cz>
Date: Mon, 29 Jan 2024 10:09:28 +0100 (CET)
Message-ID-Hash: 5G4MQZHCAR4HMWFCR6XUUNETLPELR4XD
X-Message-ID-Hash: 5G4MQZHCAR4HMWFCR6XUUNETLPELR4XD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5G4MQZHCAR4HMWFCR6XUUNETLPELR4XD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #392 was edited from lngr:

This PR adds support for the MSI MPG B650 Carbon Wifi board. This makes the front headphone and microphone ports working (tested on my local hardware).  The microphone sound volume is a bit low compared to windows, [as mentioned previously](https://github.com/alsa-project/alsa-ucm-conf/pull/143/files#r845264949), but in general it works.

Fixes #359

```
$ sudo lsusb | grep Audio
Bus 001 Device 003: ID 0db0:70d3 Micro Star International USB Audio
$ alsaucm listcards
  0: hw:4
    Generic USB Audio at usb-0000:0f:00.0-6, high speed

```

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/392
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/392.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
