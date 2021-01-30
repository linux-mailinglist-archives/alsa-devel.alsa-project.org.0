Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1830950E
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 13:08:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B68E1666;
	Sat, 30 Jan 2021 13:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B68E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612008535;
	bh=ntooOsHYR/ef4kQtwA5PW555c4Eh+jx1jewxpz0mxJk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kRlsOufuUmH+EPl5A+Xztry7MQ54YDJXZOhT/3RTM3Pn6+zMCTvhIjrtDTkQ55H1j
	 /f4OR6grv95tq5GFSbjoGvXB/O//0DjrPVvAuoKxXufyDldNlDUa5541vyqRZ2CgBH
	 X9/awx7oNV3m2BGs4k/PluTEAhDzUZh7HLDZ41rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F783F80143;
	Sat, 30 Jan 2021 13:07:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F3AF8015B; Sat, 30 Jan 2021 13:07:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 591DBF800BE
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 13:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 591DBF800BE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612008436778192997-webhooks-bot@alsa-project.org>
References: <1612008436778192997-webhooks-bot@alsa-project.org>
Subject: Extend card search paths
Message-Id: <20210130120720.A6F3AF8015B@alsa1.perex.cz>
Date: Sat, 30 Jan 2021 13:07:20 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #76 was opened from lumag:

On Qualcomm platforms is is typical for a single kernel module to support several sound cards. Add support for using `ucm2/module/${KernelModule}/${CardLongName}.conf` as a use case config file.

See https://github.com/alsa-project/alsa-ucm-conf/pull/70 for the reference.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/76
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/76.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
