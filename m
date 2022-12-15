Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934A64E3B3
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 23:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F6E188F;
	Thu, 15 Dec 2022 23:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F6E188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671142405;
	bh=WK7DVlkK/PXsM12yLvrb4rPdwLMUSOHyTrTvHqnlG6M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sbiARdqMVyXWQC/evFkFH5hO3lJGe6Ew4uJxow8Clk/Sn773ppiglrwqF/EfNxPH6
	 iVLYawu+SBbJxTxZxnqFmyU93/E07HQFULro88AqDJo6ZY7FSfTVOY9JPqf9kEvNJZ
	 FUSgG0cZjphZgG/i94I3rEo6AwnkVOlK5/eQk3gI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED37F804F3;
	Thu, 15 Dec 2022 23:12:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17E9F804ED; Thu, 15 Dec 2022 23:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2B383F801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 23:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B383F801D5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671142344513089895-webhooks-bot@alsa-project.org>
References: <1671142344513089895-webhooks-bot@alsa-project.org>
Subject: aplay,axfer: Replace off64_t with off_t
Message-Id: <20221215221226.A17E9F804ED@alsa1.perex.cz>
Date: Thu, 15 Dec 2022 23:12:26 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils pull request #183 was opened from kraj:

Also replace lseek64 with lseek.

_FILE_OFFSET_BITS=64 is passed to needed platforms since configure uses AC_SYS_LARGEFILE macro. Therefore off_t is already 64-bit and lseek is same as lseek64.

Additionally this fixes buils with latest musl where these lfs64 functions are moved out from _GNU_SOURCE and under _LARGEFILE64_SOURCE macro alone. This makes the builds fail on 32-bit platforms even though default off_t on musl is 64-bit always.

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/183
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/183.patch
Repository URL: https://github.com/alsa-project/alsa-utils
