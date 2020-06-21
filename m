Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD69202B45
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jun 2020 17:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7961696;
	Sun, 21 Jun 2020 17:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7961696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592752195;
	bh=ihOFjtUHHPE5BIh7d6mh3e+CrCMqXXusOJZCWYlYtCg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BipA0Z+DvE+3+OeoKSui35vzLvEv2L9B36NuDFCzJGaX4STDJb2L/FHyWa4L5gptn
	 Tq/knuuijimTTugYzB4HDFnBT2dggsgKNHjo/OhWBg/7OsXpiMNC3l84h2TUZ+mxUd
	 R76NcY21I/1Kv0OVIIkmo7DJaIiQ/Tm/F8wln6W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D84B0F8010E;
	Sun, 21 Jun 2020 17:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A524F80234; Sun, 21 Jun 2020 17:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A7697F8010E
 for <alsa-devel@alsa-project.org>; Sun, 21 Jun 2020 17:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7697F8010E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592752084904021978-webhooks-bot@alsa-project.org>
References: <1592752084904021978-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: add API to get current protocol version in each
 interface
Message-Id: <20200621150808.7A524F80234@alsa1.perex.cz>
Date: Sun, 21 Jun 2020 17:08:08 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #44 was opened from takaswie:

In UAPI of Linux sound subsystem, interfaces support protocol versioning. This patchset adds API to get current protocol version in each interface.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/44
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/44.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
