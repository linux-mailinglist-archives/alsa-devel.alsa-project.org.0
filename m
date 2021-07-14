Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0843C7EC0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 08:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB6D51688;
	Wed, 14 Jul 2021 08:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB6D51688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626245549;
	bh=GEDr+SH46CfIQvTqX7vuW5PFxZCddVnablTMIwZVbfM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JNPvbuJdsG6cJIevE5dszvuv3s0TcdBMRzCGGrySFT4p9XwkDdRglRB/t2A0sBSeI
	 wOustYx34fO4Io20MjdHyDXRCkVPCO2fR5sOJr0AcE6WqLn1tc6r+u/+IZ6gyycmL2
	 gkk1EtXiz0DChM/SaXgZzSJU64oae2EULtWIESWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B17F8025B;
	Wed, 14 Jul 2021 08:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02F9AF80254; Wed, 14 Jul 2021 08:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B957AF8011C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B957AF8011C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1626245452262412071-webhooks-bot@alsa-project.org>
References: <1626245452262412071-webhooks-bot@alsa-project.org>
Subject: sof-ehl-rt5660: Add UCM for Intel sof-ehl-rt5660
Message-Id: <20210714065101.02F9AF80254@alsa1.perex.cz>
Date: Wed, 14 Jul 2021 08:51:01 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #106 was opened from libinyang:

Add the UCM support for the sof-ehl-rt5660 platform.

Signed-off-by: Libin Yang <libin.yang@intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/106
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/106.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
