Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE39ADB4E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 07:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD12D85D;
	Thu, 24 Oct 2024 07:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD12D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729746996;
	bh=9o8Nsshk57Tp07Bu4qVrcRcqGl0k6tUd5EnETDSvv00=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=t98oQXE6JDqYmrLSwTJocE6Cmo4F+UGSr3P39sCetBjm/DbNuktOJWSLVuu/0zbDh
	 o5gJf41QHlw2w79adRVz49HyGxEgfPYorOjEQ4DjsxeKlGAGNytiiyvwFgcLshtBT6
	 vXB0OgrjyW5zOXQ3lWvtdwMeOTYCUksRWiYivHb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F7FF80580; Thu, 24 Oct 2024 07:16:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 403D5F80588;
	Thu, 24 Oct 2024 07:16:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85F3BF8016C; Thu, 24 Oct 2024 07:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E478BF800ED
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 07:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E478BF800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729746949347859383-webhooks-bot@alsa-project.org>
References: <1729746949347859383-webhooks-bot@alsa-project.org>
Subject: Demo application for accel operation.
Message-Id: <20241024051553.85F3BF8016C@alsa1.perex.cz>
Date: Thu, 24 Oct 2024 07:15:53 +0200 (CEST)
Message-ID-Hash: LLI2M6TATH5QLXB5N2IVJNXEA3HOMSGS
X-Message-ID-Hash: LLI2M6TATH5QLXB5N2IVJNXEA3HOMSGS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLI2M6TATH5QLXB5N2IVJNXEA3HOMSGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/tinycompress pull request #26 was opened from TE-N-ShengjiuWang:

This 'caccel' applicaton is a demo to show how to
call the new introduced accel interface.

The kernel patch is:
ALSA: compress_offload: introduce accel operation mode

As there is conflict when using the API of alsa-lib,
add alsa_wrap file to separate the header files:
    alsa/asoundlib.h
    sound/asound.h

command for conversion to 48kHz:
caccel -i in.wav -o out.wav -r 48000

Request URL   : https://github.com/alsa-project/tinycompress/pull/26
Patch URL     : https://github.com/alsa-project/tinycompress/pull/26.patch
Repository URL: https://github.com/alsa-project/tinycompress
