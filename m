Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E94E2DA97F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 09:52:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA5E17C2;
	Tue, 15 Dec 2020 09:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA5E17C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608022364;
	bh=f36VBf8oNSMyrbuC6Xi4IP9TpI12xl7gZMLdf+77pFM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qbwynh0cG+G99tuMXNvsgfVw9RlLJHPiesO/CIZFqC/Ku0hL3tdXQOvi7lXLnwYCX
	 I1+PO3lB4QPGWkYspwM7XzdGhCrnCWjJNtfIJRCzf/1pCg9VW5QM6sTF0PnIHWIsm5
	 g+SaQN6HnG0zjhtfnENuQLjgzCkhruwX8Bi/fNc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B462EF8027B;
	Tue, 15 Dec 2020 09:51:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6A43F80278; Tue, 15 Dec 2020 09:51:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 52905F80129
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 09:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52905F80129
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1608022249261568069-webhooks-bot@alsa-project.org>
References: <1608022249261568069-webhooks-bot@alsa-project.org>
Subject: ucm2: sof-soundwire - add support for new main capture switch and main
 capture volume control
Message-Id: <20201215085105.A6A43F80278@alsa1.perex.cz>
Date: Tue, 15 Dec 2020 09:51:05 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #67 was opened from GoPerry:

This patch was added for its new main capture switch and main capture
volume control which combine the ADC 07 / ADC 27 Capture and Volume
switch ,the new mute switch and volume control will be handled by codec
rt715`s driver mute/volume kcontrol instead of PGA5.

BugLink: https://github.com/thesofproject/linux/issues/2544
Signed-off-by: Perry Yuan <perry_yuan@dell.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/67
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/67.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
