Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8839E8DA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 23:06:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E74D31678;
	Mon,  7 Jun 2021 23:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E74D31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623099984;
	bh=z+6NzayOksWsCGM9QMU1lOxtWgcUz/kWakCj1df/XIY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufSGkmvQmgbIaBI53bfxFZ3eVu8mXYZf2hNlagFLBDywCQygBeTGsOcRCfw/DJFYH
	 ZcPtZwB6cuQwKorcsBw2Xo0ISTG2g7dDKZ6OZe2mpAS1jyElBHzCP17Fuwo9PeXJNR
	 vk8lDI6EV0jeU+kiQm5noPTEAuDI73BnlRUZbwmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C585F8026C;
	Mon,  7 Jun 2021 23:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA19FF80212; Mon,  7 Jun 2021 23:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E57E0F800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 23:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E57E0F800AF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623099884613096952-webhooks-bot@alsa-project.org>
References: <1623099884613096952-webhooks-bot@alsa-project.org>
Subject: added an option to aseqnet to optionally set the midi process name
Message-Id: <20210607210453.CA19FF80212@alsa1.perex.cz>
Date: Mon,  7 Jun 2021 23:04:53 +0200 (CEST)
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

alsa-project/alsa-utils pull request #95 was opened from BrainDamage:

This option allows to run multiple instances of aseqnet without having
to double check the assigned port number, since each one can get spawned
with a unique name.

The patch is pretty minimal and clean, thopefully here shouldn't be troubles 
merging it.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/95
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/95.patch
Repository URL: https://github.com/alsa-project/alsa-utils
