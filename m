Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D55276EA
	for <lists+alsa-devel@lfdr.de>; Sun, 15 May 2022 12:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC51E16E7;
	Sun, 15 May 2022 12:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC51E16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652610232;
	bh=SgZxZELlhIx+QSAS5imLqi6OIN5HFeBAPHMe2+dkRqs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FUFQyfm1jTCPPs+SyAnPEkl/QZmZpPDgjPReafsK23J3SRFPkL7MeBJxXlh+tI3IM
	 2eIAX59WGTx7Bw8xqQF2//7k9ZMm+8+pqKjbuBdYKVKeDSC7xx42V/78JqPwz+rrg1
	 MiiXXRMEBqKowMeYj0jVfQz8WzGESP+yB0xfN8J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 385B4F80107;
	Sun, 15 May 2022 12:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97433F8016D; Sun, 15 May 2022 12:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5DC0CF80107
 for <alsa-devel@alsa-project.org>; Sun, 15 May 2022 12:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC0CF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652610165762794971-webhooks-bot@alsa-project.org>
References: <1652610165762794971-webhooks-bot@alsa-project.org>
Subject: Missing documentation
Message-Id: <20220515102252.97433F8016D@alsa1.perex.cz>
Date: Sun, 15 May 2022 12:22:52 +0200 (CEST)
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

alsa-project/alsa-lib issue #227 was opened from fedeb95:

Hi, this probably isn't the right place, but I couldn't find anything specific for documentation bugs. 

The links under https://www.alsa-project.org/wiki/ALSA_Driver_Documentation currently give a 404.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/227
Repository URL: https://github.com/alsa-project/alsa-lib
