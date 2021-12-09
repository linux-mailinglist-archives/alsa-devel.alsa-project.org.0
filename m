Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C546E171
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 05:20:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B840F23A1;
	Thu,  9 Dec 2021 05:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B840F23A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639023605;
	bh=37MVlfpiy4LY5uW6uHJmvHxhEczwKaqdm0d3qc2KjBk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rw7lbeDoY6Na90NtJZSE9qIHVZEacdrHBi8XTacOnzJ0Q56n0bZSVdQvR8IL/qmkI
	 x9vdDwNqyLYnPhHNOU9V5Ea8QA2zbaeWQpPmCvLg9gDwWppei53lg46/9jVPTRmriu
	 H3RKsD4KbIP97PYKC2morxyEYq53KYhvHLAdk94I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B478F802A9;
	Thu,  9 Dec 2021 05:18:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A998CF8028D; Thu,  9 Dec 2021 05:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2E3AFF800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 05:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E3AFF800AB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639023515547167063-webhooks-bot@alsa-project.org>
References: <1639023515547167063-webhooks-bot@alsa-project.org>
Subject: alsa-lib-1.2.6 regression, no audio
Message-Id: <20211209041852.A998CF8028D@alsa1.perex.cz>
Date: Thu,  9 Dec 2021 05:18:52 +0100 (CET)
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

alsa-project/alsa-lib issue #199 was opened from gkubaryk:

after upgrading the following packages, there is no audio:
=media-plugins/alsa-plugins-1.2.6
=media-sound/alsa-utils-1.2.6
=media-libs/alsa-ucm-conf-1.2.6
=media-libs/alsa-lib-1.2.6

I checked each of the four individually and the last one (alsa-lib, 1.2.5.1) is the one that restored audio.

alsa-info.sh output, as run from 1.2.5.1 (but it downloaded the newer version of the script to /tmp) is at http://alsa-project.org/db/?f=f94a60ff547f9cce9e872acae67fdf35473fa754

let me know if I can be of further assistance; I need the audio working for the rest of the day but would be able to provide output from 1.2.6 tomorrow perhaps, if desired.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/199
Repository URL: https://github.com/alsa-project/alsa-lib
