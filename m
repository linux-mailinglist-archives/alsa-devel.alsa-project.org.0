Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B97E01BB
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 12:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2622741;
	Fri,  3 Nov 2023 12:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2622741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699009821;
	bh=nxFHoUjcS49j/4AN+t8WD+FvoekXQHL5vf16Hez2M9k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rGP6klCcb96rhgvfAOjeU/MwofP+oaq1l6Vqc/+XxB+2syPPNgPKtKloVgNNbdVr1
	 zuK7l8aaVHNKo+y1DuUbG7lZjPOMIzAHvrUG6F0T011P03+JzwEB7miKvFWHm/LZ5g
	 PgFg2YpZhA5r+9k4sjnLn957T7k7K1VrPQCQ5ZfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC24F8055B; Fri,  3 Nov 2023 12:09:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2B22F8020D;
	Fri,  3 Nov 2023 12:09:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 037F8F80290; Fri,  3 Nov 2023 12:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A37B0F8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 12:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A37B0F8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1699009759267902374-webhooks-bot@alsa-project.org>
References: <1699009759267902374-webhooks-bot@alsa-project.org>
Subject: hdajackretask documentation window takes up all screens
Message-Id: <20231103110927.037F8F80290@alsa1.perex.cz>
Date: Fri,  3 Nov 2023 12:09:26 +0100 (CET)
Message-ID-Hash: AMZENBTMHYB2JNHJMRI6W645MKKYUU3M
X-Message-ID-Hash: AMZENBTMHYB2JNHJMRI6W645MKKYUU3M
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMZENBTMHYB2JNHJMRI6W645MKKYUU3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #20 was edited from francisdb:

For a multi-monitor setup you get a very large window.

The code below should probably be removed

https://github.com/alsa-project/alsa-tools/blob/8c8d6941f21ea68894ce7fd13e92b3ac9f16dc8a/hdajackretask/main-gtk.c#L517-L523

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/20
Repository URL: https://github.com/alsa-project/alsa-tools
