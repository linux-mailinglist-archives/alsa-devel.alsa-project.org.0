Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E92809339FE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C04B6A;
	Wed, 17 Jul 2024 11:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C04B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208954;
	bh=a2Uu8UI8V0vvRA3hscoyzszAisM9xQQnRCyxHTEGNwM=;
	h=Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:Date:From;
	b=LzAvQcmFMFHoMFt06UOtqOZ0yInnI5wsHxfoR7bUDqQJZQWGKDUJnA5fhQXwUgzQa
	 2Zzaatm4rH1fYNX2+pyI+71HhykCI6CrDfa+x7bDEPoTXzC5DAKyDHo0jXnW6eWGQO
	 SNqHVv8GChm4vfOdBV9pmxQaO/csJpn5J2IHvjFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70859F80681; Wed, 17 Jul 2024 11:34:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF54F80684;
	Wed, 17 Jul 2024 11:34:24 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [PATCH v9] ALSA: hda/tas2781: Add tas2781 hda SPI driver
From: baojun.xu@ti.com
To: alsa-devel@alsa-project.org
Message-ID: <20240711132001.2792-1-baojun.xu@ti.com>
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:34:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YEAWETOCIURVQP2AP6SXQN3ZHUAWIXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Date: Wed, 17 Jul 2024 11:34:24 +0200 (CEST)

The content of this message was lost. It was probably cross-posted to
multiple lists and previously handled on another list.
