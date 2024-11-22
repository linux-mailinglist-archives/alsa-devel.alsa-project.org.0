Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A813E9D65CA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2024 23:28:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECE1B19E7;
	Fri, 22 Nov 2024 23:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECE1B19E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732314483;
	bh=lm0mWxvXDqCkwB/9OU/EXC2mFL/355EGws+cHpfvUU8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VMMCbvLDPEQltFbN29xL/8X0cnExJyMMvY3IaVsNi7CWTX9LycXmGwB56paUI4FDt
	 J1S9iWvxrkIfYTuAr8AVCDSCPph7jIpMJYW9Qw+TB3eeQfc3Td6cchZd+pgxYiKGzJ
	 Nxgcgp4rM4koi9jZcZgsuAZV/ZiqFpyWHCf6UxR0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B2BF805C0; Fri, 22 Nov 2024 23:27:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B9DF805BE;
	Fri, 22 Nov 2024 23:27:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E37FF80533; Fri, 22 Nov 2024 23:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFA5F80073
	for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2024 23:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEFA5F80073
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732314444029596329-webhooks-bot@alsa-project.org>
References: <1732314444029596329-webhooks-bot@alsa-project.org>
Subject: x870-A no S/PDIF output audio (ALC4080)
Message-Id: <20241122222726.6E37FF80533@alsa1.perex.cz>
Date: Fri, 22 Nov 2024 23:27:26 +0100 (CET)
Message-ID-Hash: JDGP77W4XFGQMPQ3ARFZNXZC7QF3ZQ6Y
X-Message-ID-Hash: JDGP77W4XFGQMPQ3ARFZNXZC7QF3ZQ6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDGP77W4XFGQMPQ3ARFZNXZC7QF3ZQ6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #468 was opened from SentryII:

Hi all, I've been searching for hours for a fix for this and im posting this as a last resort

I've checked under If.realtek-alc4080 in the USB-Audio.conf and the X870-A is not listed 
IDVendor is 0b05
IDProduct is 1b9b
0b05:1b9b

Line-Out works fine, issue is with Soundcard 2 USB-Audio
Which is using optical / S/PDIF

I've attached the alsa-info output below

Thank you for your time
[alsa-info.txt](https://github.com/user-attachments/files/17876970/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/468
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
