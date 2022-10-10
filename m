Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED25F9E62
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:10:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6622B2983;
	Mon, 10 Oct 2022 14:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6622B2983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403817;
	bh=s3/QDNXgZ/2K+FUTKrf/gZ9xIJimRqklF88lgaVEM+w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL9+q5Jw+KsJNFeBioNRfR5eZQWd9GZFD8Gj+5SdJeI5aioYOsx0NtpLq/eJsxki1
	 xutp08A9YEEE0OOuJpLwRKVr3u4xKf1LgaMtAdrg+me8IpGzFbN6zkjGroSOFVmQUe
	 Hyx9ykdPR8pH3NiBkRCzlFJdt3tw4TS6hW7pcOzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CF1F8032B;
	Mon, 10 Oct 2022 14:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6495EF801D5; Mon, 10 Oct 2022 14:09:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 96BF4F80155
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BF4F80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665403753918127060-webhooks-bot@alsa-project.org>
References: <1665403753918127060-webhooks-bot@alsa-project.org>
Subject: Mute PC Speaker by default
Message-Id: <20221010120920.6495EF801D5@alsa1.perex.cz>
Date: Mon, 10 Oct 2022 14:09:20 +0200 (CEST)
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

alsa-project/alsa-utils issue #172 was opened from lnussel:

SUSE has a [preset](https://build.opensuse.org/package/view_file/openSUSE:Factory/alsa-utils/01beep.conf) to mute the PC speaker by default  as it can be quite annoying (https://bugzilla.suse.com/show_bug.cgi?id=767270). Would it make sense to include that upstream?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/172
Repository URL: https://github.com/alsa-project/alsa-utils
