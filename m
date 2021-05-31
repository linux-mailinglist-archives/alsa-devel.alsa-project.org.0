Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762EA39572D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 10:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054E0850;
	Mon, 31 May 2021 10:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054E0850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622450399;
	bh=6cEddZKtF9ZXp9447WuEfxpS3zny3ut7O/8gsIlElXA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyRhaxuPJXjBVRdfdLTd0JkWmxzh5v8sBqnL/qCo1YqmQrYzCsGtEB47861dtFIEG
	 ooMwz3pDJAykCf1Ki4ZsP0KX8rQkkxwSml1zLeLsVLNsSJnB+zxvb0khcQ30/ihUZL
	 ZSnszTZupCfUYs923oAtWa0cNvNGbBIu9UPbvzSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE7AF80161;
	Mon, 31 May 2021 10:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6838F802E2; Mon, 31 May 2021 10:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2CDA6F80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 10:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CDA6F80161
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622450299411672115-webhooks-bot@alsa-project.org>
References: <1622450299411672115-webhooks-bot@alsa-project.org>
Subject: Add UCM for Nvidia Tegra HDMI Audio
Message-Id: <20210531083827.B6838F802E2@alsa1.perex.cz>
Date: Mon, 31 May 2021 10:38:27 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #94 was opened from clamor-s:

This were used to have audio over HDMI on Asus Transformers. You may find original configs [in pmOS](https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-asus-tf201/ucm) and paths used [here](https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/device-asus-tf201/APKBUILD#L30-38). I have adjusted them to use syntax 4 and re-use common codecs.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/94
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/94.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
