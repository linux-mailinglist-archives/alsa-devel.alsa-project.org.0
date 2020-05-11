Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27C1CD56E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 11:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65F81607;
	Mon, 11 May 2020 11:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65F81607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589189908;
	bh=XXW+Squq+vhbak0LUIKG728l9fQEh2+LDUMmU68ndNQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlxXu+MX2ofAJkvnDKGJxAWWkJ02mU5HqwzcjgP31dAOf0oSmm7w5ercBjzLJRl5b
	 E9Ku6qnOwVZBfbvZgoX3jDPWi+gl3yyCWFvedgTHKNXDDHEmvcGwKN2oUtuQvPOD0p
	 9UNFMGXJ4E6OL4liJ5n8TQw9K/DSlAz6K8chnpTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4C2AF801F2;
	Mon, 11 May 2020 11:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B1AFF80157; Mon, 11 May 2020 11:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D5F7F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 11:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5F7F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1589189799131467104-webhooks-bot@alsa-project.org>
References: <1589189799131467104-webhooks-bot@alsa-project.org>
Subject: seq: user_client: use constant qualifier for read-only parameter
Message-Id: <20200511093644.2B1AFF80157@alsa1.perex.cz>
Date: Mon, 11 May 2020 11:36:44 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #20 was opened from takaswie:

The 'port_id' parameters of 'alsaseq_user_client_create_port()' is
a pointer to storage of unsigned char type, due to optional parameter
in g-i interface. It's read-only if having value and it's better to
have const qualifier.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/20
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/20.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
