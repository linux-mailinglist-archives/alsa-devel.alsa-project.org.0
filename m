Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0186892500
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 21:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98232CD0;
	Fri, 29 Mar 2024 21:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98232CD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711743214;
	bh=TyE6iCtmshzrfAef6XyVVaVl7vKfkeMC3X/vFvL4W4E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ImPqUH4dONXdZumszFQpquuM0mnTKeqnB3yZ7nrxaMIFEDjvHs+4ZkNX/Mp6TGMBQ
	 xJjWn0FDn64fNdODCHeheOLwtMtA+tbh/vA1zmWy9TaEqFHbrrjM6f99KLaH/RFPKu
	 tsFC++0ozHwpkIlHjN4J2qtPnvt2fOa6dTqwHroU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BA5EF8057E; Fri, 29 Mar 2024 21:13:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2894F805A8;
	Fri, 29 Mar 2024 21:13:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66D05F8025F; Fri, 29 Mar 2024 21:12:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B096FF801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 21:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B096FF801D5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1711743175606406689-webhooks-bot@alsa-project.org>
References: <1711743175606406689-webhooks-bot@alsa-project.org>
Subject: Sending 0xFx events causes libasound to segfault
Message-Id: <20240329201258.66D05F8025F@alsa1.perex.cz>
Date: Fri, 29 Mar 2024 21:12:58 +0100 (CET)
Message-ID-Hash: G4QOLD7MSXN6OPAAJBCNII7OJ2NNDKRV
X-Message-ID-Hash: G4QOLD7MSXN6OPAAJBCNII7OJ2NNDKRV
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4QOLD7MSXN6OPAAJBCNII7OJ2NNDKRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #392 was opened from human222:

ALSA 1.1.9. This issue breaks DOSBox-X MIDI playback.

Discovered through this thread: https://github.com/joncampbell123/dosbox-x/issues/4873

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/392
Repository URL: https://github.com/alsa-project/alsa-lib
