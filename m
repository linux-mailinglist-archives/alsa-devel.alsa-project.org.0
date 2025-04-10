Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0FA84176
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 13:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA9236A962;
	Thu, 10 Apr 2025 13:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA9236A962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744283262;
	bh=JAsWSbFsVAMb7M//FZ8Vk+1CNFb4lFUSaZfNaMp6nyY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fkMqXLk7B0dB9kZG5d+exVQOD3/0oVpY2cDwhx2E9KxA8ktG2r/4APkyji8JjtLV4
	 hAsOdlflfyn1BqLX0Qr1cBlzmyXGBNwqP6VogBqIJDwiRW4gVyBBfHnHTnuMzlWiYP
	 TsIM9Xrw2t0rmsghuV86C5xAqN2jsfQjuYn+P3lc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07D91F805C3; Thu, 10 Apr 2025 13:07:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF7B8F805BF;
	Thu, 10 Apr 2025 13:07:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA88AF8028B; Thu, 10 Apr 2025 13:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 143D5F80124
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 13:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143D5F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1834f05c241a6b00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/544@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/544@alsa-project.org>
Subject: ucm2: Qualcomm: add Asus Zenbook A14
Date: Thu, 10 Apr 2025 13:07:16 +0200 (CEST)
Message-ID-Hash: 5FGEBTMU4IXPBQLGLZGPA7W7QUK6VHQC
X-Message-ID-Hash: 5FGEBTMU4IXPBQLGLZGPA7W7QUK6VHQC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FGEBTMU4IXPBQLGLZGPA7W7QUK6VHQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #544 was opened from alexVinarskis:

Add a Regex string, seems compatible with Lenovo T14s x2 speakers, x2 DMICs, x3 DP (x2 USB-C, x1 DP->HDMI), headphone jack.

Initial support for the platform is available on the [lists](https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/), with [Audio part ](https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14/blob/master/0013-arm64-dts-qcom-support-sound-on-Asus-Zenbook-A14.patch)not being upstreamed just yet.

Tested that speakers, MICs and jack are working.

Respective audioreach-topology changes are open [for PR.](https://github.com/linux-msm/audioreach-topology/pull/14)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/544
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/544.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
