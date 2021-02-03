Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFF30D8B2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 12:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 325AD176F;
	Wed,  3 Feb 2021 12:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 325AD176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612351969;
	bh=DDUzrqEIavhCea9H+GtCFL0nwBQ7WVrFqkGgjYUirUE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFD9baCnzz3ovzgCxIgwl5lcU5MMPNIesfMGhVjZVboBSTwaY2m/Y2isiQH3uXvJW
	 nGhJwEGxYfvLvZHO9lfd+9OGK0esjYQMwPdQBLbvYMxT7IEg+1vhEeK2gb3KfDbsO0
	 0YQUUcl8tGXJg6tR7jVZzZOwAdvd1UWgaBX58Ytg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6797F8016E;
	Wed,  3 Feb 2021 12:31:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1541CF8015A; Wed,  3 Feb 2021 12:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 84FEFF80155
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 12:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84FEFF80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612351867092300892-webhooks-bot@alsa-project.org>
References: <1612351867092300892-webhooks-bot@alsa-project.org>
Subject: sof-soundwire: use the ${find-device} lookup for the dmic device
Message-Id: <20210203113114.1541CF8015A@alsa1.perex.cz>
Date: Wed,  3 Feb 2021 12:31:14 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #77 was opened from perexg:

The PCM device number for the internal digital microphone is not fixed.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/77
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/77.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
