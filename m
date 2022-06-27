Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9B655B4D3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 03:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3C2161D;
	Mon, 27 Jun 2022 03:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3C2161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656291801;
	bh=O9uaIhifoTMv9DIsPHNw5Hq/vaADZtp4HvYzIIuBYfg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSDLQANOTqJdUJaDKhPgG6RdPA6hm7UfmXF8WGxRfMdf+/EeakHCT/ZuytCbINDhS
	 u5j2Ls0tplPnzJvAXaoWkL11Ws2UYxlVXdv8e5mcYQ6at//xv1/RSg8kBkcSaFyBUi
	 bp9hQXoaWtB2Fz1QBvQ/qJC3tD/kD+bfvjzeeWVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D306F8012F;
	Mon, 27 Jun 2022 03:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FBBBF8016A; Mon, 27 Jun 2022 03:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1E3ECF800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 03:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E3ECF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656291732060338020-webhooks-bot@alsa-project.org>
References: <1656291732060338020-webhooks-bot@alsa-project.org>
Subject: mixer: add documentation about postcondition of removal event
 processing
Message-Id: <20220627010220.3FBBBF8016A@alsa1.perex.cz>
Date: Mon, 27 Jun 2022 03:02:20 +0200 (CEST)
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

alsa-project/alsa-lib pull request #244 was opened from takaswie:

PulseAudio and PipeWire seems to appear including careless code to
process events of mixer element in implementation of mixer class.

 * https://lore.kernel.org/alsa-devel/YrbxZ2b+3rIdi7Ut@workstation/

They register own implementation of mixer class. At addition event,
they attach own mixer element into hcontrol element. However at removal
event, they never detach the mixer element from hcontrol element. They
hit assertion in mixer API internal due to unsatisfied postcondition.

This commit adds documentation about postcondition of removal event
processing so that developer for implementation of mixer class easily
realize the way to satisfy the postcondition.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/244
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/244.patch
Repository URL: https://github.com/alsa-project/alsa-lib
