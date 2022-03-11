Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21D4D6290
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 14:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B6B1899;
	Fri, 11 Mar 2022 14:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B6B1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647006542;
	bh=C/X03sE1jBF1tRQNmXS3VPS/Tw6o6topBvr8ZMbRmgs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uuWR60oKqG2ZLxm8oqUuAM0YIVjMUpbBCPDuvxn+3YV0D3T94sin/cU8XaCfR/8kI
	 WZqUkT7lUriIOemOhZiCO0dzoYsblgRWWpeYZF6Z64yAtqNsVXxhq0hFuCA4VnvXla
	 lww67XqDuk958slVgvjiRG8rHFGaNlcCpStJIwtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2804EF80085;
	Fri, 11 Mar 2022 14:47:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4026F80227; Fri, 11 Mar 2022 14:47:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 90EA4F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 14:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EA4F80085
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647006466786098957-webhooks-bot@alsa-project.org>
References: <1647006466786098957-webhooks-bot@alsa-project.org>
Subject: jack: implement pcm operation sw_params
Message-Id: <20220311134753.C4026F80227@alsa1.perex.cz>
Date: Fri, 11 Mar 2022 14:47:53 +0100 (CET)
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

alsa-project/alsa-plugins pull request #43 was edited from aditpape:

Alsa-lib commit #88e4ae27 introduced a dynamic recalculation of the avail_min
value on the underlaying slave devices.
This updated avail_min value is not reaching the alsa-jack plugin due to lack
of the sw_params operation.
This patch adds this missing operation to correctly apply an updated avail_min
setting during runtime.

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/43
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/43.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
