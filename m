Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B56C70D9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 20:15:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4087ED0;
	Thu, 23 Mar 2023 20:15:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4087ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679598956;
	bh=FkqFVqDSJDeFtdzoxQTnwYBKgXczJf+phvdxwnB3uWs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cFNb0e1xPcpRze9y1IX/m0AUsrZYBxCfCUH1R2dI4BDp5XqzsIgs+6SZGd6gkWn4D
	 fXFvHDREEU5VlwSkywgT9v5HFq5lGHFyevvb64VmIVMepqnyvL64K0Ga18zK288Naw
	 V/gfmpMw2cNdC2qoYqHAC4BKdL4HV39y2BGMn3/8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAA0F802E8;
	Thu, 23 Mar 2023 20:15:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4063CF802E8; Thu, 23 Mar 2023 20:15:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A6076F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 20:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6076F80254
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679598897260419369-webhooks-bot@alsa-project.org>
References: <1679598897260419369-webhooks-bot@alsa-project.org>
Subject: Thinkpad Mute LED not working until Restore + Uninstall
Message-Id: <20230323191502.4063CF802E8@alsa1.perex.cz>
Date: Thu, 23 Mar 2023 20:15:02 +0100 (CET)
Message-ID-Hash: JQY47SJOA42R53Z4ZNKPUI5S4BSMMPQG
X-Message-ID-Hash: JQY47SJOA42R53Z4ZNKPUI5S4BSMMPQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQY47SJOA42R53Z4ZNKPUI5S4BSMMPQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #196 was opened from alosarjos:

Hi there!

I'm using a ThinkPad T14 Gen 3 (AMD) laptop. It has a led on the F4 key for muting the microphone and a LED indicating if the mute is enabled or not. Now, the strange thing is that the only way I've found to make it start working is by:

1. Run `alsactl restore`
2. Uninstall `alsa-utils`

It won't start working until I uninstall the `alsa-utils` package.

I'm not sure this is the correct place to report the issue, but since the `alsa-utils` package removal is making it work again I'm hoping to get some guidance.

My OS stack is:

- Arch Linux
- Linux 6.2.7
- Pipewire 0.3.67

Thanks a lot :D

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/196
Repository URL: https://github.com/alsa-project/alsa-utils
