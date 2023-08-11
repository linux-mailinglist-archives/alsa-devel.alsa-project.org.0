Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575D67798E3
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C74823;
	Fri, 11 Aug 2023 22:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C74823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691787118;
	bh=Qh7EYEMMNQBkYsz190OBnrAZiw7KEwsyZzH2DwW8co0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=M4KAmLZBv+sIWn/ilVsyl1lJQ6xhVnfDxTS7hHP8rXBOxAHaSdHPSXs7IJM/+ska2
	 dGEwL1Wg9syieHocrymkl4wGMUJbpAEzipI/yx1WPjAknpRviLJmh05R1RA5yTlRgu
	 R/0wkmJDbCdYurRtwsG2DBRspVSMkbmg8CgQu1UY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CFDFF80166; Fri, 11 Aug 2023 22:51:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2A6F80134;
	Fri, 11 Aug 2023 22:51:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CFDEF80166; Fri, 11 Aug 2023 22:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA85F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA85F800F4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691787059715125084-webhooks-bot@alsa-project.org>
References: <1691787059715125084-webhooks-bot@alsa-project.org>
Subject: MSI x570s Carbon Max WiFi ALC 4080
Message-Id: <20230811205102.6CFDEF80166@alsa1.perex.cz>
Date: Fri, 11 Aug 2023 22:51:02 +0200 (CEST)
Message-ID-Hash: Z52MTMYFXSFQLAWWNJNJVD6XTDV53H5Y
X-Message-ID-Hash: Z52MTMYFXSFQLAWWNJNJVD6XTDV53H5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z52MTMYFXSFQLAWWNJNJVD6XTDV53H5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #338 was edited from zpackrat:

Fedora 38 patched to current, issue has existed for months. Rear output jacks for Center/Sub and Rear Speakers are reversed. I use a 5.1 speaker setup. When I run sound tests in the gnome audio settings the issue is verifiable. Also audio that requires center channel for dialogue has issues. This is specifically the rear audio I/O ports.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/338
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
