Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 818009C4A53
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 01:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0934F14DE;
	Tue, 12 Nov 2024 01:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0934F14DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731369801;
	bh=ls/MIf30Agu7qEZi/+729fUyFOmUfufiE5k/sZ2eE/I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=P6IpHuSSrMWkvgRQHUUKXLPDOaqkmAZGULThRJIT1GWdZO0fxMeXsoDjRBU94KZkA
	 o0RZ+Hr3kp3p6ay1u6XWe4dWQ9ueeaXQwoizpUnGVVOOZee4zhZTlMwiCGIHxVPAUl
	 GpVfRsVhpeMC/t+gJ6y83R/rMGt2xKaRkVjRxeXs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F6C9F8058C; Tue, 12 Nov 2024 01:02:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CD3F802DB;
	Tue, 12 Nov 2024 01:02:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B4FF80199; Tue, 12 Nov 2024 01:02:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 252E2F800C9
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 01:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252E2F800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731369770321220875-webhooks-bot@alsa-project.org>
References: <1731369770321220875-webhooks-bot@alsa-project.org>
Subject: ALC4082 - ASRock X870 Steel Legend
Message-Id: <20241112000252.D4B4FF80199@alsa1.perex.cz>
Date: Tue, 12 Nov 2024 01:02:52 +0100 (CET)
Message-ID-Hash: L7LHJOV55L4Y33XVY4ODB45G5WEHS2XQ
X-Message-ID-Hash: L7LHJOV55L4Y33XVY4ODB45G5WEHS2XQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7LHJOV55L4Y33XVY4ODB45G5WEHS2XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #462 was opened from cybik:

Following up on https://github.com/alsa-project/alsa-ucm-conf/issues/334

The card "works", but there is one feature missing - though I hesitate to call it "critical": S/PDIF / TOSLINK support is incomplete.

While sound works "fine" (ish), it's limited to 2 channels.
* Plugging in another device (CM106-type, for example) gives out a plethora of configuration options (per the screenshot), though this also comes with having to select the right output
* The USB audio outs are output-specific, which is VERY welcome, but the S/PDIF out does not allow for any advanced selection like "Supported Codecs", and the HiFi 5.1 and 7.1 do not appear to enable any IEC958/AC3 support in the background

Is there something missing in the config files to allow for such support?

![image](https://github.com/user-attachments/assets/906ea829-0210-49a8-ba16-ad1b5b1285ae)

Relevant PR: https://github.com/alsa-project/alsa-ucm-conf/pull/461

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/462
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
