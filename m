Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE13D54BB9D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 22:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C5118F6;
	Tue, 14 Jun 2022 22:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C5118F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655238348;
	bh=byPpJFnPvwYnpMhqT8m9tmLeEnBMPU8s0XBqbNUJrNA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibEwl79V2oqr4tvYqgJQ7zIUwdFA0TjBssYfpHyrGcxazTka5QLT3aMIEwmP8z68x
	 TQ//yY7heb+JCVO1mozFA4o09jGBzC/lZUwFiqq5ny4kBbOK6Vf1DrkcqWJq0SWb8G
	 /4LcqFUZkgW8o80K7N5hmP0QRNeFz6zeRPBIQrhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FAD3F800E1;
	Tue, 14 Jun 2022 22:24:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76C14F80139; Tue, 14 Jun 2022 22:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AB4A1F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 22:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4A1F800E1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655238282893857002-webhooks-bot@alsa-project.org>
References: <1655238282893857002-webhooks-bot@alsa-project.org>
Subject: Any way to fuse static libasound with alsa-plugins so no dlopens are
 performed?
Message-Id: <20220614202446.76C14F80139@alsa1.perex.cz>
Date: Tue, 14 Jun 2022 22:24:46 +0200 (CEST)
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

alsa-project/alsa-plugins issue #45 was opened from MIvanchev:

See title. I have a project that might benefit from such a mix.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/45
Repository URL: https://github.com/alsa-project/alsa-plugins
