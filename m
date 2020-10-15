Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA67128F993
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 21:36:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A80A177F;
	Thu, 15 Oct 2020 21:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A80A177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602790561;
	bh=nNQdvaLyo8+OfBycDNETPv+t6EKmi4fXfHtGZooHpU0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TekPj8PposmxhrbNliuDo3x3Dq2eUuh1u6Qm8iQ6918n4KpZFtffZnO22D4KE25Vq
	 39eVeE/PxXt9Mso/oPIHoFfiWAjaEYqO+xOl0VSbeJK0qtr0+yuC5lVV+yitEvxzZr
	 NUm6A4Fhy2K4Vcblz1xk+SILGfDKItxoAiA6p+9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D517DF8012B;
	Thu, 15 Oct 2020 21:34:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A16F80268; Thu, 15 Oct 2020 21:34:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BE703F8012A
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 21:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE703F8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1602790449426171064-webhooks-bot@alsa-project.org>
References: <1602790449426171064-webhooks-bot@alsa-project.org>
Subject: amixer: cset: check control is readable before reading it
Message-Id: <20201015193417.69A16F80268@alsa1.perex.cz>
Date: Thu, 15 Oct 2020 21:34:17 +0200 (CEST)
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

alsa-project/alsa-utils pull request #63 was opened from ViorelSuman:

In current implementation cset command will fail on
controls which are not readable, ie just writable.
Check readable state prior calling snd_ctl_elem_read.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/63
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/63.patch
Repository URL: https://github.com/alsa-project/alsa-utils
