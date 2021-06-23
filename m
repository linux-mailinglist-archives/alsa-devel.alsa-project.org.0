Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89123B1CC8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 16:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6871D83A;
	Wed, 23 Jun 2021 16:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6871D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624459352;
	bh=0G4eTzYU/sxML8MFRQRFHh1FXOTvMtBa+B5mOTVLJHI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dk4haKrtycLmHnQK2+GK45skmmthwYsfdVG1YPBonF6VKqbaAH1lAdak0dF/ueZqX
	 VvwPKLNTAY0weVqzqz3NFYF1PZge4skHYCZqvCOeVfy/8mUA2cdEaSRmSm4eJACLLF
	 fps8bEIIPuB9lXhc8d+c5h/o+3ZRZnpAT+537IQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF46EF8016D;
	Wed, 23 Jun 2021 16:41:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 519B3F8016D; Wed, 23 Jun 2021 16:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E785AF80137
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 16:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E785AF80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624459252042319059-webhooks-bot@alsa-project.org>
References: <1624459252042319059-webhooks-bot@alsa-project.org>
Subject: UCM2 documentation
Message-Id: <20210623144102.519B3F8016D@alsa1.perex.cz>
Date: Wed, 23 Jun 2021 16:41:02 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #103 was opened from perexg:

Add/improve the documentation for

- directory tree layout
- build-in string substitutions
- runtime conditional configuration selection
- mixer settings (boot -> use -> verb -> device)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/103
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
