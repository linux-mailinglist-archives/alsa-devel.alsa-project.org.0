Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF09B1B3ABE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 11:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559FF16C5;
	Wed, 22 Apr 2020 11:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559FF16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587546349;
	bh=WpIX/KZSreOKwUM5YQbh6aIbWpM9AevSzxWDLNQiKA0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MilFASdlk3oQXUch2PbniQPnkF9eV56PZ0Y+G7bA5cqDDEpLbaww7jbyNdUwNDyjk
	 TQ3LLZL4mR2TPt9RhPs084X0nD0blMUuhdufxkZ0JdTvLjio6gU/rsyGePD6sZRxH+
	 gGmXdc26IFuKA+tBqJO6VNAigN2N4m5p2NnCar9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48053F8020C;
	Wed, 22 Apr 2020 11:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A1B7F801D9; Wed, 22 Apr 2020 11:04:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AF7E0F800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 11:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF7E0F800FF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587546241601941109-webhooks-bot@alsa-project.org>
References: <1587546241601941109-webhooks-bot@alsa-project.org>
Subject: v2: Add support to SDM845 based platforms
Message-Id: <20200422090405.6A1B7F801D9@alsa1.perex.cz>
Date: Wed, 22 Apr 2020 11:04:05 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #23 was opened from Srinivas-Kandagatla:

Add Support to two codecs WCD934x and WSA881x and two platforms DragonBoard DB845c and Lenovo-YOGA-C630-13Q50 that use this codec.
For ucm-validator to pass this PR depends on config files PR  "v2: ucm-validator: add config files for DB845c and Lenovo-YOGA-C630-13Q50" (https://github.com/alsa-project/alsa-tests/pull/3) to alsa-tests

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/23
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/23.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
