Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5334784E19
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 03:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD4D83B;
	Wed, 23 Aug 2023 03:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD4D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692753572;
	bh=G5Y+sr3csWFeyo9GrjjJEc2XiqLcmTgce726O/mLo1M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dPLnIaEreFjBv0j6r27v5vquD6K6Wh/vzjdwlOCwfoaSLiQZB2mzgVxqj8jimA4dZ
	 0hEsPmAjS8KY6H1Wvmz26JsN9srx57ljOG0gdA02DCN48Cm4Lce7vxpeJgIwdXCHxT
	 BkLbU5lfNURTKELWQSZpgVwBJT4NbBW5naEA/v68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1C7AF80552; Wed, 23 Aug 2023 03:17:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73223F80549;
	Wed, 23 Aug 2023 03:17:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F419BF80551; Wed, 23 Aug 2023 03:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E89F80158
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 03:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E89F80158
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692753471557394266-webhooks-bot@alsa-project.org>
References: <1692753471557394266-webhooks-bot@alsa-project.org>
Subject: aplaymidi causes pa_stream_writeable_size() failed - connection
 terminated
Message-Id: <20230823011753.F419BF80551@alsa1.perex.cz>
Date: Wed, 23 Aug 2023 03:17:53 +0200 (CEST)
Message-ID-Hash: A2CM7UFIQSRBLXPIX7OQJFH2SSTPCNCD
X-Message-ID-Hash: A2CM7UFIQSRBLXPIX7OQJFH2SSTPCNCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2CM7UFIQSRBLXPIX7OQJFH2SSTPCNCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #232 was edited from symdeb:

How to reproduce:
1. Plain Ubuntu 23.04 desktop with kernel 6.5rc7 and ALSA UMP sequencer enabled.
2. Insert a MIDI 2.0 UMP capable device 
3. play a video with the "video" application.
4. run aplaymidi -l or palaymidi --version
5. Error appears.
Unplug the device  
Wait for about 30 seconds (this is important, sooner the error will appear)
Repeat steps 3 and 4 . The error won't occur.

![image](https://github.com/alsa-project/alsa-utils/assets/19564066/9bd6e993-be47-4715-8e6c-5f2a2242027c)

This is not unique to aplaymidi, other ALSA clients may also cause this error.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/232
Repository URL: https://github.com/alsa-project/alsa-utils
