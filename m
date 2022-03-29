Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744BD4EB2AB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 19:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124601765;
	Tue, 29 Mar 2022 19:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124601765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648574779;
	bh=5L73kpv1rrIpyUGOuigpT7NzaQev0Ulcqo1n9VDo0pM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/8aghYg7uPsyxdo7d1NfKXtzS9BNVaX/g6RnTuzeuZqxxnmKrPVwc8OgCsmNgbJn
	 RE2BindQGDYtSutbyHIOcykkerFdAtcIBmheJL231ZSUzQUOMM1czCaL+smlfA+pb/
	 agHFHl9a/1bmxckKwHsXLlnDZHl5SF722uuNw8mA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F9A0F804B0;
	Tue, 29 Mar 2022 19:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD6CCF80311; Tue, 29 Mar 2022 19:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4FFBEF80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 19:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FFBEF80121
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648574706329361916-webhooks-bot@alsa-project.org>
References: <1648574706329361916-webhooks-bot@alsa-project.org>
Subject: Nhlt plugin and simple plugin interface
Message-Id: <20220329172510.BD6CCF80311@alsa1.perex.cz>
Date: Tue, 29 Mar 2022 19:25:10 +0200 (CEST)
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

alsa-project/alsa-utils pull request #129 was edited from juimonen:

Initial something... I need to figure out:

- where to specify which plugins to load/run (nhlt now hard coded)
- where to install the plugins
- how to get the to-be-loaded plugin names and where
- is the "hidden-visibility" gcc flag ok to hide other than .so entrypoint

Request URL   : https://github.com/alsa-project/alsa-utils/pull/129
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/129.patch
Repository URL: https://github.com/alsa-project/alsa-utils
