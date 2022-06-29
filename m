Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C855F3A3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 04:55:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89801640;
	Wed, 29 Jun 2022 04:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89801640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656471339;
	bh=v3FeSjJUao4SOCPR70LbcUYZDX8hNHFCVUZB6XgByVg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUGlWrvRpLJwbRaVCxHCZQoRAVcrkWF4OlYCWTYuSNRALdyTCAWlAr80oRzgRW2yF
	 KgpaqQPxuGDAHOC75rI431SJJgWS10PBu02EZoAZTiEbIHFjrkGZYFjUQv5BiHP/bD
	 c30IJHKORXH/ZCD90usq1Eh8dQ6wZQNs2wtHKhX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E633F80107;
	Wed, 29 Jun 2022 04:54:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1D66F8020D; Wed, 29 Jun 2022 04:54:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D0568F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 04:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0568F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656471272331792116-webhooks-bot@alsa-project.org>
References: <1656471272331792116-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/8] ctl: elem-value: rewrite getter methods
Message-Id: <20220629025439.B1D66F8020D@alsa1.perex.cz>
Date: Wed, 29 Jun 2022 04:54:39 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #82 was opened from takaswie:

In UAPI of Linux sound subsystem, 'struct snd_ctl_elem_values' has
fixed-sized array. It's natural to retrieve the array as is.

This patchset rewrites getter methods of ALSACtl.ElemValue to retrieve pointer
to arrays in internal storage with annotation for fixed-sized array.

```
Takashi Sakamoto (8):
  ctl: elem-value: fix casting for byte data
  ctl: elem-value: retrieve fixed-sized array by getter method for boolean values
  ctl: elem-value: retrieve fixed-sized array by getter method for integer values
  ctl: elem-value: retrieve fixed-sized array by getter method for enumerated values
  ctl: elem-value: retrieve fixed-sized array by getter method for byte values
  ctl: elem-value: retrieve fixed-sized array by getter method for IEC 60958 values
  ctl: elem-value: retrieve fixed-sized array by getter method for integer 64 values
  update README about change of ALSACtl.ElemValue

 README.rst           |  2 +-
 src/ctl/elem-value.c | 55 ++++++++++++--------------------------------
 src/ctl/elem-value.h | 21 ++++++-----------
 3 files changed, 23 insertions(+), 55 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/82
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/82.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
