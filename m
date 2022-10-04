Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD225F4AEC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 23:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5A116ED;
	Tue,  4 Oct 2022 23:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5A116ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664918991;
	bh=g+hISo7Y4tSXDfyOw3TtrfdZm00D9U8tzk6VCs1GTlw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tgjGQvLXDlUGp10Bsx0ugDP/JXhq/5FnGAS/mdKzI+c+lWOyVAGiCRNa3MVwIBXWA
	 ok7pYTxA71qLNRZMxc+I1dJfiHQiSzb/GENzNpT5NZ71eu0zILziAXASCcRVr2MRui
	 Q6o6h76ajnTPj01BzWq2LH7cFBTrgISYjpTAmzGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F744F801F5;
	Tue,  4 Oct 2022 23:28:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D7E8F801EC; Tue,  4 Oct 2022 23:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B1B19F8012A
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 23:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B19F8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1664918924433600903-webhooks-bot@alsa-project.org>
References: <1664918924433600903-webhooks-bot@alsa-project.org>
Subject: Change to RemainAfterExit=yes in alsa-restore.service.in
Message-Id: <20221004212852.2D7E8F801EC@alsa1.perex.cz>
Date: Tue,  4 Oct 2022 23:28:52 +0200 (CEST)
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

alsa-project/alsa-utils pull request #171 was opened from stele95:

Fresh Manjaro installation.
Default volume value was 75%, no matter to what value I change it, it resets to 75% on reboot/shutdown.

After changing to `RemainAfterExit=yes` from `RemainAfterExit=true` in `alsa-restore.service`, the volume value is properly saved and restored on reboot/shutdown. I did check the following [link](https://www.freedesktop.org/software/systemd/man/systemd.service.html) and it says:

> RemainAfterExit=
> Takes a boolean value that specifies whether the service shall be considered active even when all its processes exited. Defaults to no.

But if you look at `Example 4. Stoppable oneshot service`, it clearly sets `RemainAfterExit=yes` with `Type=oneshot`.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/171
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/171.patch
Repository URL: https://github.com/alsa-project/alsa-utils
