Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE5305FC7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 16:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BCC1714;
	Wed, 27 Jan 2021 16:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BCC1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611761916;
	bh=G3vVaXk8OWsCrJFjithMp3l1QyeJ54k9GRH25fs4qAE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=srd0v+tfX8P5Mo+0jEFM3rGTnqd9/M8BgRp6PUE6LY8NSkwRAUSGG7rfiuv9IC4LU
	 GWGICgIopU3lT/CSWnaHB+4abJF68YeOrJNYAStUk+sA6cy0CBQyvVIfziumN8Zd/7
	 p2o6/VSdLU/4xP5thCgkjoIM+mRT9D6ti5DEnX+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42970F80218;
	Wed, 27 Jan 2021 16:37:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26BF5F80259; Wed, 27 Jan 2021 16:37:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A0940F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 16:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0940F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611761807933743000-webhooks-bot@alsa-project.org>
References: <1611761807933743000-webhooks-bot@alsa-project.org>
Subject: [Feature request][alsactl] Allow -g/--ignore to be used with init
 command
Message-Id: <20210127153704.26BF5F80259@alsa1.perex.cz>
Date: Wed, 27 Jan 2021 16:37:04 +0100 (CET)
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

alsa-project/alsa-utils issue #75 was opened from MichaIng:

It would be great if the `-g`/`--ignore` flag would have an effect on the `init` command as well, so that `alsactl -g init` does not print and exit with an error, if no sound cards have been found.

Since it can be checked for attached sound cards on Linux easily via /proc or sysfs, this is of minor importance, and probably there is a reason why it is as it is. In this case, probably the `--help` output could be extended by this info, which is currently only present in the man page. Reading the `--help` only, one (or at least me) would not guess that this flag is ignored by the `init` command.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/75
Repository URL: https://github.com/alsa-project/alsa-utils
