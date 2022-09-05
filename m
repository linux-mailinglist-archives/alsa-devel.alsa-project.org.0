Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACC5ADB7A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 00:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00B46822;
	Tue,  6 Sep 2022 00:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00B46822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662417713;
	bh=iTfE7FpHj7dt4cVilGz2B/xcQmBqndKAf8SibO8giS0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6Pfn+hkFCpVLkZHY6xfWtZxDSzG/9hti+aGSnhChx85nnDSJ7L9xNaDakNxmypKO
	 8Elyj3C953J9Yk+D8MYRTNs+K/K2oZ++9QszK8LlUyQ4YU/jEFEzvib3OhZujnqczq
	 wOv0q8Ep0VI46dCsFv3lZCLGm9+LtAA3/mKjgtZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB02F8032D;
	Tue,  6 Sep 2022 00:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88A55F80238; Tue,  6 Sep 2022 00:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E2ED2F800CC
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 00:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2ED2F800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662417648270813942-webhooks-bot@alsa-project.org>
References: <1662417648270813942-webhooks-bot@alsa-project.org>
Subject: amidi: --send shouldn't require a seekable file
Message-Id: <20220905224051.88A55F80238@alsa1.perex.cz>
Date: Tue,  6 Sep 2022 00:40:51 +0200 (CEST)
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

alsa-project/alsa-utils issue #167 was opened from BasedUser:

Just like `--receive`, `--send` should instead send events to a given port until the sent file returns EOF, or `amidi` is terminated. Pipes and FIFOs cannot currently be used to create a persistent MIDI source.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/167
Repository URL: https://github.com/alsa-project/alsa-utils
