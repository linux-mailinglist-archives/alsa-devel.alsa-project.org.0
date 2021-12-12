Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D7C471B71
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 16:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89B961A3C;
	Sun, 12 Dec 2021 16:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89B961A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639323879;
	bh=v/94qhD1Lcoeg/ec30oL6V3RKC66P6DKEu+uYMax3gA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BTNevWNcg9AqkXOYdtgDEwAqJeqxgEnQnP8IXBqDZMKE6WympnQzWd0OH3lTtytCa
	 GsXvtlaHxlublW15vjQ1ZP+eDy/a6uEuDkLEcoNUmm2vm+BvYx9anD+6FnNoxIKHTj
	 ViipqvxkrzBYEB1dQxu4j9kaGGViTOP/XkGHPaJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9312F800BC;
	Sun, 12 Dec 2021 16:43:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03B68F80246; Sun, 12 Dec 2021 16:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7BD56F80059
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 16:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD56F80059
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639323807501960993-webhooks-bot@alsa-project.org>
References: <1639323807501960993-webhooks-bot@alsa-project.org>
Subject: Move the call to expand variables and expressions
Message-Id: <20211212154331.03B68F80246@alsa1.perex.cz>
Date: Sun, 12 Dec 2021 16:43:30 +0100 (CET)
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

alsa-project/alsa-utils pull request #127 was edited from ranj063:

With the addition of the math expression evaluator in alsa-lib, we can use it to evaluate simple math expresionns for objects attribute values based on other attributes.

For ex: we can set the expression for buffer size as follows:

buffer_size "$[$[$in_channels * 48] * 4]"

The buffer_size attribute value will be computed with the attribute value "in_channels" based on the expression above. So if $in_channels = 2, buffer_size will be evaluated to 384.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/127
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/127.patch
Repository URL: https://github.com/alsa-project/alsa-utils
