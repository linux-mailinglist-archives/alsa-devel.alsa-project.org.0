Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8233A3DA9
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 10:00:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BAFE18CE;
	Fri, 11 Jun 2021 09:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BAFE18CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623398434;
	bh=ubkSQbsePueuMuAElvTM28q1OAUBybPD4/4sxOaWgAo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfQNYhPqRkMN03Rdlm8NgpdCvKXEjqZjFB8kvdfZV4tSDQrHQgK6gSbLJbFdx5eLj
	 ogiKLKOKt7dEfeFNUemTsxgsnwVC+3xTjWCpym0pNtUq0ZIe8oKkVzBfuF6Lemb35T
	 O39xNUewELASedxuvm415oslXnTHg5yluPpCJC+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0578EF80212;
	Fri, 11 Jun 2021 09:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C2BBF80212; Fri, 11 Jun 2021 09:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BCA71F80212
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 09:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA71F80212
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623398371258145094-webhooks-bot@alsa-project.org>
References: <1623398371258145094-webhooks-bot@alsa-project.org>
Subject: Add support for automatic attributes in Topology2.0
Message-Id: <20210611075939.2C2BBF80212@alsa1.perex.cz>
Date: Fri, 11 Jun 2021 09:59:39 +0200 (CEST)
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

alsa-project/alsa-utils pull request #97 was opened from ranj063:

Add support for automatic attributes in Topology2.0 and also add support for processing objects that are simply used to
update the parent object's private data.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/97
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/97.patch
Repository URL: https://github.com/alsa-project/alsa-utils
