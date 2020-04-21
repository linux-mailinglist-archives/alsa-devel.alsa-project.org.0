Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692071B24DF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 13:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02C99168D;
	Tue, 21 Apr 2020 13:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02C99168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587467966;
	bh=reuHpvU5C8p1ABHi7V1ZEz585x9wE1J0QwZoTFDKtZc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTgKbFnSSsOpp8ze2JXw9L55QDfTtnJeuTMoiUnkaP3U6eLrOI8waN5vFrOMVRD31
	 f2epiU8Ax0B1CieMFFBAx8lGqyU//bPRPleYNNPvfpWGyl4epdqsNWBYssvQc0iyQc
	 m7aDocRtLEunZUKVJwmAiIXyJJ1ZaEOpnCr4WQ+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D61F801ED;
	Tue, 21 Apr 2020 13:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4742F801EC; Tue, 21 Apr 2020 13:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CB8A4F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 13:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB8A4F800E7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587467852976934910-webhooks-bot@alsa-project.org>
References: <1587467852976934910-webhooks-bot@alsa-project.org>
Subject: Add support to SDM845 based platforms
Message-Id: <20200421111741.D4742F801EC@alsa1.perex.cz>
Date: Tue, 21 Apr 2020 13:17:41 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #22 was opened from Srinivas-Kandagatla:

Add Support to two codecs WCD934x and WSA881x and two platforms DragonBoard DB845c and Lenovo-YOGA-C630-13Q50 that use this codec.
For ucm-validator to pass this PR depends on config files PR "ucm-validator: add config files for DB845c and Lenovo-YOGA-C630-13Q50" to alsa-tests

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/22
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/22.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
