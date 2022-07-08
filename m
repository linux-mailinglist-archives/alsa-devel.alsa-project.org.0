Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F756BA5D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 15:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B3A14E;
	Fri,  8 Jul 2022 15:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B3A14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657285885;
	bh=nD4F69VsFiRgy666pBneaAm29lfQ9/VNw8jVJ1L4lUU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LW6tME67sy6+Jx5EWm10Dj32jE1FPUPCvyZx0d5Jy4jTjWHVlXH0O7U/9Iq7MTVbf
	 gomY9DuK6ylYIOa0/nHE9j2PNlT0lhR4gcCW/fBERE0TVgTv2fvvL1Byp07OrUViUQ
	 f8XkHfH7oJg9req1E9upLmf21oIOxB4DymWn07KM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 925ABF8025B;
	Fri,  8 Jul 2022 15:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 278C7F80167; Fri,  8 Jul 2022 15:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 15B13F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 15:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B13F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657285816049292088-webhooks-bot@alsa-project.org>
References: <1657285816049292088-webhooks-bot@alsa-project.org>
Subject: ucm: fix st_mode check for symbolic links
Message-Id: <20220708131023.278C7F80167@alsa1.perex.cz>
Date: Fri,  8 Jul 2022 15:10:23 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

alsa-project/alsa-lib pull request #249 was opened from stephan-gh:

The file type in the st_mode field is not encoded as unique bits but as
an enumerator. Checking if some bits of S_IFLNK are set does not work
correctly because it happens to evaluate to true for regular files as
well.

The POSIX man page suggests using the following approach to check
the file type:

    if ((sb.st_mode & S_IFMT) == S_IFLNK)

Alternatively, there is a S_ISLNK() macro to check this more easily.

Make use of the latter so that readlink() is only called on actual
symbolic links and not regular files. This makes audio work again
with slightly older alsa-ucm-conf versions or alternative top-level
configurations that do not make use of symlinks.

Fixes: d6adde0e ("ucm: top-level path - set directory from symlink")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/249
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/249.patch
Repository URL: https://github.com/alsa-project/alsa-lib
