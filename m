Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142632FB54
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 16:22:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A181AF0;
	Sat,  6 Mar 2021 16:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A181AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615044130;
	bh=GfTQYq5Sz8FVFvO4yClmO4MKnePOuwlf5DbNTrTXJ/Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8Gvf1jeqdn+axUW1+El6S9P4pzlkMtuZ57P4tW8bLUMN5VjYJZix/fY59uGlr+e8
	 9LPgbrO4aaR7DSuCcrkG+NIoKGAlSmilb+VQe8DL/jmRurPaLOTwnfyAk3kuOf/jUs
	 oFpboR6Yjtn6BAW4laWGeU6Ki89mRetuJo3eZTmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B633F800F3;
	Sat,  6 Mar 2021 16:20:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F85EF80269; Sat,  6 Mar 2021 16:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0C43EF80116
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 16:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C43EF80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1615044033044989109-webhooks-bot@alsa-project.org>
References: <1615044033044989109-webhooks-bot@alsa-project.org>
Subject: alsactl: init command now honors -g flag as well
Message-Id: <20210306152037.8F85EF80269@alsa1.perex.cz>
Date: Sat,  6 Mar 2021 16:20:37 +0100 (CET)
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

alsa-project/alsa-utils pull request #80 was opened from MichaIng:

As of #75 this commit aligns the manpage with the new behaviour.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/80
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/80.patch
Repository URL: https://github.com/alsa-project/alsa-utils
