Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FFE9012D1
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2024 18:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 922D1850;
	Sat,  8 Jun 2024 18:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 922D1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717865186;
	bh=nOGnpHia4alHQ+PuzhuuxOc4Zcu0wjvDSpcU48Tw/Qk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rlSEKpsgErLUQh+OFBzpgFQfemLHh8532tlHLgGxc71M5QlicY+wVYI18ehIppiVQ
	 nxpVq0MY30Dgl5qlZVAbwNQFO3UvtOreWFDYnmEMVNLTztor3AWl4xDL61LEj0y0S5
	 d+I0P9KhIn/cd0iR6M6kzUYOl78Z8eme1XksQmmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19598F805A9; Sat,  8 Jun 2024 18:45:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 976EDF805A9;
	Sat,  8 Jun 2024 18:45:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB93F804D6; Sat,  8 Jun 2024 18:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A25AF80107
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 18:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A25AF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1717865137360209227-webhooks-bot@alsa-project.org>
References: <1717865137360209227-webhooks-bot@alsa-project.org>
Subject: [modern hardware] interleaved or plannar?
Message-Id: <20240608164549.DAB93F804D6@alsa1.perex.cz>
Date: Sat,  8 Jun 2024 18:45:49 +0200 (CEST)
Message-ID-Hash: DXZIMPKEMGKDMJQSTDNYC4TAFMOBBAME
X-Message-ID-Hash: DXZIMPKEMGKDMJQSTDNYC4TAFMOBBAME
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXZIMPKEMGKDMJQSTDNYC4TAFMOBBAME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #400 was opened from sylware:

To have the less "technical distance" with modern audio hardware (for instance usb audio 2), is it better to have interleaved audio frames each with a pitch, or brutally planar with a pitch per plane?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/400
Repository URL: https://github.com/alsa-project/alsa-lib
