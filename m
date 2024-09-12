Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703669761EC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 08:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7F6852;
	Thu, 12 Sep 2024 08:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7F6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726124101;
	bh=z7nLLQWCp1Q0B2nuQKxbn9zT6GXhc7IlKSW/BdnAjVg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Nz0ZEy+eGGP99pv2VPKYuheFeLm7e0v2g2rJu8Wj/Km6RKMpV51IMkojgJXhqg7pd
	 O7cLYbMPvEKX3jhW8xh4qomNlotOKf0GPQbDBS3zr+XVZeSRTc+GFz3YOs0jDTZ3AM
	 ysqMhMhujZB2HKUxpBUmvRrZDgF8GwcjAkGf1fPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06DB0F805B3; Thu, 12 Sep 2024 08:54:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC3CF805B0;
	Thu, 12 Sep 2024 08:54:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AFFCF801F5; Thu, 12 Sep 2024 08:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 68DBDF800E9
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 08:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DBDF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1726124062936977863-webhooks-bot@alsa-project.org>
References: <1726124062936977863-webhooks-bot@alsa-project.org>
Subject: Mismatched volume controls of Sound Blaster X3
Message-Id: <20240912065425.3AFFCF801F5@alsa1.perex.cz>
Date: Thu, 12 Sep 2024 08:54:25 +0200 (CEST)
Message-ID-Hash: Y4OXVTN73VA4XCYOTNXBPY7P6CHO2QRE
X-Message-ID-Hash: Y4OXVTN73VA4XCYOTNXBPY7P6CHO2QRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4OXVTN73VA4XCYOTNXBPY7P6CHO2QRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #273 was opened from buboleck:

Hello,

Recently I got Creative Sound Blaster X3 (SB1810) as it seemed it works fine with linux. I'm using Gentoo with Plasma desktop (ALSA + Pipewire) and the onboard sound is OK but the SB X3 seems is misbehaving,  I found that the volume controls for RearLeft is swapped with Center and RearRight is swapped with the LFE. (Also tried live Ubuntu 24.04 same issue)

On the other hand maybe related, I was not able to get stereo upmix working in any way, ALSA upmix does not want to work as also the Pipiwire upmix.

Gentoo kernel 6.10.9
alsa-lib-1.2.12
alsa-tools-1.2.11
alsa-utils-1.2.12
alsa-plugins-1.2.12
pyalsa-1.2.12

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/273
Repository URL: https://github.com/alsa-project/alsa-utils
