Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D723A2C2C27
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 17:00:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE4D16B0;
	Tue, 24 Nov 2020 16:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE4D16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606233631;
	bh=dbeQNlFU+Xp7K4xbK/8dFJNDmhF0UIMHHUBlALXXThI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkGZKUwy7uXjkQHX3LnvGZE7lowYOIHLa+9Ha66FPBa2+C61bzv/15vnKtMJtSc5K
	 c67E1J7E+Nd/x2OYMOBV3nDGn5pKDE0v+nT+SXYceBGJXYT67B3gvK8VHLDii0cbt1
	 N/XbQm0Ua0JRZ8W3TIviTBlZbVQGJix3M9KE9IaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F9A6F800C1;
	Tue, 24 Nov 2020 16:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2230F80165; Tue, 24 Nov 2020 16:58:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B2F27F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 16:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F27F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1606233518106209040-webhooks-bot@alsa-project.org>
References: <1606233518106209040-webhooks-bot@alsa-project.org>
Subject: jack: add option to allow non-jack-aligned period size
Message-Id: <20201124155855.D2230F80165@alsa1.perex.cz>
Date: Tue, 24 Nov 2020 16:58:55 +0100 (CET)
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

alsa-project/alsa-plugins pull request #14 was opened from aditpape:

Commit 72337f1dcb2df6a2b7fdae93e88d7dd3a7e97ab4 forces ALSA period size
to be exact multiple of the JACK daemon period size.
There are good reasons to align the period size, but completely disallowing non aligned periods is too restrictive.
This patch adds an option "align_psize" which allows to optionally revert to original behavior.

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/14
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/14.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
