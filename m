Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76C5FAA8A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 04:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36BB332A;
	Tue, 11 Oct 2022 04:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36BB332A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665454626;
	bh=hE/LWNg6loGlmrlgM5tx5JfejQ4EsSDH6sbLNRQtGbA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hIC5KF5aNO1yG7bsuRtMBbxS8ZmzE2qAFsQQHt38Y3h/kZBDLi61C60/SxxdobyDo
	 30gjkGS4/JxMFQN8ElXl6Iztp5KVjoMUZYJ/JcngjZuIzrf5yIYWDzqD9xJv0rejvR
	 xgHmQzeIIWAq+P6UmidFOKOYe9l5lFWku91qfPBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 786E1F8021D;
	Tue, 11 Oct 2022 04:16:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EF09F801D5; Tue, 11 Oct 2022 04:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A62EFF80132
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 04:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A62EFF80132
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665454565875257015-webhooks-bot@alsa-project.org>
References: <1665454565875257015-webhooks-bot@alsa-project.org>
Subject: If system has Dmic, variable DeviceDmic will be empty
Message-Id: <20221011021609.2EF09F801D5@alsa1.perex.cz>
Date: Tue, 11 Oct 2022 04:16:09 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #228 was opened from xanthein:

change condition from False to True to configure Dmic0 correctly

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/228
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/228.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
