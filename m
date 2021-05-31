Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA92396720
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 19:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7267E1655;
	Mon, 31 May 2021 19:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7267E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622482351;
	bh=l34SQnuo7S11uA9KreYVnSmxswfD5Vc2qjSHW7fYTNw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q4bUlncmEg6uY/7pcHdh2LRrQGamQO5GE6up6vXinCmVlVSRA1sikdz/9peGzxEZY
	 iNckOj9Ggfr6v56hTuwItDMKoNSS2OCxhCpf3OKbSpFYzoMmSGLjJrbsPiLaLOZjJP
	 cFoXj8Jdyyqc8PZmNlN5TGV/DmCLZbx382HyAdeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F14E7F80424;
	Mon, 31 May 2021 19:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3934F802E2; Mon, 31 May 2021 19:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0F377F80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 19:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F377F80161
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622482245334261894-webhooks-bot@alsa-project.org>
References: <1622482245334261894-webhooks-bot@alsa-project.org>
Subject: Release tarballs ship other version, break build scripts
Message-Id: <20210531173059.B3934F802E2@alsa1.perex.cz>
Date: Mon, 31 May 2021 19:30:59 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #95 was opened from dvzrv:

Hi! I package this for Arch Linux.

The release tarballs on the ALSA website ship the 1.2.5 data in a directory with a differing version number:

`alsa-ucm-conf-1.2.4.81.g4884e/`

This breaks build system assumptions about the contents of these tarballs. Please provide the data in directories that match the release version.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/95
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
