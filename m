Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC31303F4
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 20:04:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BF5176B;
	Sat,  4 Jan 2020 20:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BF5176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578164682;
	bh=dSMDnBaxlp92PASJnaqx9C0sgHZwutW/mmc7pokT+O4=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRmKTNyLKWvvNun4ReoXmWIPy3Fqin3frWpObVwQip5QgwrLXAfUIbOehr3fOLRyl
	 2uqm57qF1wMkAnvKYBzU2AMXirKmkhuqO4HfDCWl5Losm47p+MmK1lN5ygzlnsNs0y
	 vzcEEh0jCD1+9WrQpfC3te0aZRjylzJYdZLUG+WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6C2CF8014F;
	Sat,  4 Jan 2020 20:03:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FF05F80157; Sat,  4 Jan 2020 20:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B7DDCF80100
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 20:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DDCF80100
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578164552844650984-webhooks-bot@alsa-project.org>
References: <1578164552844650984-webhooks-bot@alsa-project.org>
Message-Id: <20200104190236.9FF05F80157@alsa1.perex.cz>
Date: Sat,  4 Jan 2020 20:02:36 +0100 (CET)
Subject: [alsa-devel] No support for Kaby Lake DA7219 (on Chromebooks)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf issue #11 was opened from FantasyCookie17:

I'm sorry if this is the wrong page and the bug tracking mailing list would be better, or if this is the wrong part of the ALSA project, however this seems indeed related to ALSA UCM configuration. The original issue is [here](https://github.com/GalliumOS/galliumos-distro/issues/536), however OP and developers did not seem to care or know what to do, so I wondered whether a fixed version of this could be put into the standard ALSA configuration.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/11
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
