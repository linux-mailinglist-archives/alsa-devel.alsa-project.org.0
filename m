Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B729F280C99
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 06:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B2D1EF6;
	Fri,  2 Oct 2020 06:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B2D1EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601611941;
	bh=2T6j9CihrBOKsxA+kEznLrgRc8nhICWUbv0IFx48UoQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skFxnws3BCM0+oezFX3CSchlVD3AykNi6hNf+p/bmbmXR2scIs2FW/ShItnl8Q8mi
	 EwZNXWlbn57f/qTHEbZTTYMg/Qtg+a1UBOaw22jgbWsJPSvT7LWN5CdbtHGhN6goub
	 2vnPIpTuGWLKzSWgS8ycCHcd73hCg48k7ktB/0f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78493F80247;
	Fri,  2 Oct 2020 06:11:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DD98F80247; Fri,  2 Oct 2020 06:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A8F39F801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 06:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F39F801A3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1601611860372674942-webhooks-bot@alsa-project.org>
References: <1601611860372674942-webhooks-bot@alsa-project.org>
Subject: alsactl: init - add -U option to disable UCM based init
Message-Id: <20201002041108.6DD98F80247@alsa1.perex.cz>
Date: Fri,  2 Oct 2020 06:11:08 +0200 (CEST)
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

alsa-project/alsa-utils pull request #60 was edited from ahlinc:

The reason is to use it with internal init extra commands like:
  alsactl -U -E CMD=info init

Currently, if there is a valid UCM config for a card the alsactl command exits silently on the init command and don't execute any extra commands because that commands defined in a common init path file _init/00main_ that don't used in case of UCM did the job.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/60
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/60.patch
Repository URL: https://github.com/alsa-project/alsa-utils
