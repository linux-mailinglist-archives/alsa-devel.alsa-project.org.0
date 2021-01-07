Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB672EE776
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 22:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F0616A2;
	Thu,  7 Jan 2021 22:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F0616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610053894;
	bh=i90yOYRn+Zuv2l7hSi279QvbDCMU+4SKGqBphK1It0w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYkijQjRPT+7Y6Buo9x1qiiJ1cSfAYrl6jV/1x+rKl5K8HqsYEOdUv7PGqjleQk9p
	 dNQ8kMOr5GKQEzU+HtQR4vrY8dn6YaZkHitvc4/s3U9vwYIGapqT6twTyqQnaZU3y8
	 ow8xdsD0pqzDHffNR7PY/15icptvZsmOmOXqiAE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 726FDF80258;
	Thu,  7 Jan 2021 22:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47B1CF801F5; Thu,  7 Jan 2021 22:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B1CDDF80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 22:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CDDF80096
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1610053790499669075-webhooks-bot@alsa-project.org>
References: <1610053790499669075-webhooks-bot@alsa-project.org>
Subject: Add support for WAVE file format in cplay
Message-Id: <20210107210959.47B1CF801F5@alsa1.perex.cz>
Date: Thu,  7 Jan 2021 22:09:59 +0100 (CET)
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

alsa-project/tinycompress pull request #9 was opened from dbaluta:

This will allow us to use PCM codec type with cplay. This patchseries moves some WAVE related functions and structures to their own file in order to be used by both cplay/crecord.

Request URL   : https://github.com/alsa-project/tinycompress/pull/9
Patch URL     : https://github.com/alsa-project/tinycompress/pull/9.patch
Repository URL: https://github.com/alsa-project/tinycompress
