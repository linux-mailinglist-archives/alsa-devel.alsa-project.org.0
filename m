Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7914569B9C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 09:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02AD81657;
	Thu,  7 Jul 2022 09:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02AD81657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657179134;
	bh=hf+6Y/Flyu8EsOdAxfU1p8vgXpSfZnX6slPrleYUzt8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GO/bXwAuh4quBMyJ4a/khVVtuGJbcJ20P6oweLnT0CnCyNaxhV2132rYhASrVtR1e
	 GNy5zuKdZXEr1ofTbvHVE4/94QU4PXpwcaqsJnECWMwic1IESony4XMIzXHhF1SnE3
	 Nr6WMJOwcwsaw7AguglIEswqBmOcvkLAmKIVsngM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A55BF8028D;
	Thu,  7 Jul 2022 09:31:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB00DF8016A; Thu,  7 Jul 2022 09:31:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 22DF5F800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 09:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22DF5F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657179066905766964-webhooks-bot@alsa-project.org>
References: <1657179066905766964-webhooks-bot@alsa-project.org>
Subject: [Enhancement] aplay: make stream pause/resume automation/script
 friendly
Message-Id: <20220707073111.BB00DF8016A@alsa1.perex.cz>
Date: Thu,  7 Jul 2022 09:31:11 +0200 (CEST)
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

alsa-project/alsa-utils issue #155 was opened from aiChaoSONG:

There is an `-i` option for interactive mode, in the interactive mode, we are able to pause/resume the playback/capture stream with SPACE key, which is very good. However we have to do this in a terminal, because there is a isatty check on the stdin, this is not friendly for automation/script to test audio pause/resume feature with aplay.

Is it possible to remove the isatty check, so that we can do pause/result test with a single stdin redirection? Another possible fix is that we can make use of the SIGUSR2, so that we pause/resume stream by sending signal to the aplay process.

@perexg

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/155
Repository URL: https://github.com/alsa-project/alsa-utils
