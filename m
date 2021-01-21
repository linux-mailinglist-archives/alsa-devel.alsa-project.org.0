Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E82FF695
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 21:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2303A193F;
	Thu, 21 Jan 2021 21:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2303A193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611262667;
	bh=w0Eux015xC/2UvH+3EVFmZOP6CMzOUm3+U4ED+HQkS8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAgRoCsXFDL4expZM3wY4G31fda1CsSCOlomK8Ynp++hiPLM7qb9D2kr8ChpI3rI4
	 016fm+Y3um8FW+5kQ2UAT2Tn7MxJiV4KcAfmaFg9PT0zZkSPT70XBfNYgP7vtd9ZIC
	 0RmVGwcSF0yQZdffiaNbimptmV2naKdQCluMo4Uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5732AF8026A;
	Thu, 21 Jan 2021 21:56:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 211B9F80273; Thu, 21 Jan 2021 21:56:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7A756F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A756F80162
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611262608211165905-webhooks-bot@alsa-project.org>
References: <1611262608211165905-webhooks-bot@alsa-project.org>
Subject: SOF: Improve dmic support
Message-Id: <20210121205651.211B9F80273@alsa1.perex.cz>
Date: Thu, 21 Jan 2021 21:56:51 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #75 was edited from plbossart:

DMIC support seems incomplete for HDaudio (not handling all possibilities for cfg-dmics) and missing completely for SoundWire.

This is an untested draft just to get UCM3 feedback from @perexg and tests from @aigilea on an HP Spectre x360 device.

Edit: adding @libinyang for reviews.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/75
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/75.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
