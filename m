Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCB19D93F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 16:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D61167A;
	Fri,  3 Apr 2020 16:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D61167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585924579;
	bh=sLXJGYGqlPEFuSv9bArH9Tv/PEQayCMMtzTlwsHqygs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQJAO93Y28nOdrcw+dePMuE1q2/lKRP+2N9RTK9uFzcma8usxVLTEgeHrbTNp9gng
	 Nu348MFKB1YDRtCANgWy20nGCGSfFZz+1H+FSZuQim1MgCs6lK8afy615vKH9Mof3j
	 D6QD0yPEM1iYB31RENPFXpPbz2hVhuaekhKvSXcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A01F8015C;
	Fri,  3 Apr 2020 16:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6706FF8014C; Fri,  3 Apr 2020 16:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F11F9F800E4
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 16:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F11F9F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1585924469088310003-webhooks-bot@alsa-project.org>
References: <1585924469088310003-webhooks-bot@alsa-project.org>
Subject: conf: USB-Audio: Fix S/PDIF output of ASUS Xonar AE
Message-Id: <20200403143434.6706FF8014C@alsa1.perex.cz>
Date: Fri,  3 Apr 2020 16:34:34 +0200 (CEST)
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

alsa-project/alsa-lib pull request #40 was opened from im-0:

ASUS Xonar AE is a PCI-Express card containing USB controller:

	USB controller [0c03]: ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]

and the actual USB sound card:

	ID 0b05:180f ASUSTek Computer, Inc. XONAR SOUND CARD

As other Xonar USB sound cards, it uses second device for digital
output.

Signed-off-by: Ivan Mironov <mironov.ivan@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/40
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/40.patch
Repository URL: https://github.com/alsa-project/alsa-lib
