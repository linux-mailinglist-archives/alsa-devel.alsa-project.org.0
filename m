Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6755296B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 04:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61D41AC9;
	Tue, 21 Jun 2022 04:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61D41AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655778824;
	bh=89yHRCxfEo/c9NJJi+0/qdr0Q85zROQkDYG0TAhdIEM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHcf+484lk0XHLkCys8aS93IVPBdD1xukRugOkeQ9eIhk38lKaD5ZOqKGqa07WXtV
	 A/c99CN4fMPoiV1CR6BmO0IpFvimsY4qAtGlnJbWTlCGHcHeKF4fYeeCc7cXV9EgvW
	 fIioM9aNVUr10CZ0rf+jadRD7jTgUINqVoUgllok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35999F80253;
	Tue, 21 Jun 2022 04:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C247FF80155; Tue, 21 Jun 2022 04:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 24D55F80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 04:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24D55F80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655778760267633915-webhooks-bot@alsa-project.org>
References: <1655778760267633915-webhooks-bot@alsa-project.org>
Subject: GoXLR Broken in 1.2.7.1
Message-Id: <20220621023243.C247FF80155@alsa1.perex.cz>
Date: Tue, 21 Jun 2022 04:32:43 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #175 was opened from FrostyCoolSlug:

The alsa profiles no longer set correctly for the GoXLR or GoXLR Mini since 5dcd69.

>From what I can tell with some quick tests, if the DirectCardName isn't set, the profile doesn't seem to apply anymore. Removing the direct config, or adding a DirectCardName seems to solve the issue (although obviously, neither are ideal).

Thanks.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/175
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
