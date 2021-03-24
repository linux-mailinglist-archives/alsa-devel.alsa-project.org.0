Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5E347C6C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:22:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8980D1694;
	Wed, 24 Mar 2021 16:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8980D1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616599337;
	bh=J9k2hdq5qoUZRfrMWPZrofJwqONWk4Ge5nFQ0hUoMuo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJHMyYz3jiagV9fnDxXizMUsSvV2gxUJt0OuKqBwM7GMroS1I6I08/5RzIZEaHgO2
	 IAy0dgdhBe062IrXYXUpgupk7XS9W8jqs3i3JCC1KWkeOUjU0NsdeHc4R50UNkgn7X
	 ymdmzw+fXmPyPRVpyijqRxlpb6sVhpn6O8JFHoaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8018F800FF;
	Wed, 24 Mar 2021 16:20:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A894F8016B; Wed, 24 Mar 2021 16:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 80121F80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80121F80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1616599245855740070-webhooks-bot@alsa-project.org>
References: <1616599245855740070-webhooks-bot@alsa-project.org>
Subject: man: Correct "rate" option
Message-Id: <20210324152050.0A894F8016B@alsa1.perex.cz>
Date: Wed, 24 Mar 2021 16:20:50 +0100 (CET)
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

alsa-project/alsa-utils pull request #83 was edited from nootc:

Resolves https://github.com/alsa-project/alsa-utils/issues/82
Change "rate" option from "-c" to "-r".

Request URL   : https://github.com/alsa-project/alsa-utils/pull/83
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/83.patch
Repository URL: https://github.com/alsa-project/alsa-utils
