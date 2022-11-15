Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462FD62AE0F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 23:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2ECE1691;
	Tue, 15 Nov 2022 23:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2ECE1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668550576;
	bh=e+aOhV/M2l42BB9oRxmOothjpwxoT8S+Iy1ohN2sISs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sap5iaoluHB0zGrjDo1ZfCYHTHPb2wsXa6WKIBrUQzuJg2YIR9M6FN2QEKmfoTq1d
	 B2qi6TH3Z2mkjHVvwsxRZquZukOLXAeh3MFfKe4i6Uu0Kpj9RA/IXJSp/tCyjgHhIn
	 idHIMYte0SlPpFUcNi1yR1cd/dpNLDTql9HGm+1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F87F8047C;
	Tue, 15 Nov 2022 23:15:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79A1CF80171; Tue, 15 Nov 2022 23:15:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 42BF3F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 23:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42BF3F800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668550512420017958-webhooks-bot@alsa-project.org>
References: <1668550512420017958-webhooks-bot@alsa-project.org>
Subject: =?utf-8?q?S/PDIF_no_output_=28Realtek=C2=AE_ALC4080=29?=
Message-Id: <20221115221521.79A1CF80171@alsa1.perex.cz>
Date: Tue, 15 Nov 2022 23:15:21 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #241 was reopened from uragan1987:

http://alsa-project.org/db/?f=2f67942734d0a5123454a73ae0dcfabf508dd7f5

Bus 001 Device 003: ID 0db0:6cc9 Micro Star International USB Audio

MPG-Z590-GAMING-PLUS

No output on S/PDIF

Is there a easy fix?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/241
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
