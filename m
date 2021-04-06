Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D6355406
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 14:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA23F1660;
	Tue,  6 Apr 2021 14:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA23F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617712519;
	bh=1SHmi8bB6lQhAOJ8X1+OKUaLZoN55yaOwnde8USQ8M8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WxI8KlzB5zxnM+Bdn96EcLBjNv8qzYqhDAzP+m9iAs+aHccTJwRNLCiIiyYRD/Md1
	 PrnIsGiLXXIAoCGyGyGqAPDoW5LftMfNm6s/kTtIBQ9/Rjq20NfggNg52ptGE1NHvm
	 aLja3ZvexSF76lTuWmf+6mdU5ngvwy19kaq6c8T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35A9BF800E3;
	Tue,  6 Apr 2021 14:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3FCAF80124; Tue,  6 Apr 2021 14:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 891EDF80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 14:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891EDF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1617712423758209944-webhooks-bot@alsa-project.org>
References: <1617712423758209944-webhooks-bot@alsa-project.org>
Subject: cplay: Add suport for AAC audio codec
Message-Id: <20210406123350.D3FCAF80124@alsa1.perex.cz>
Date: Tue,  6 Apr 2021 14:33:50 +0200 (CEST)
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

alsa-project/tinycompress pull request #10 was opened from TangleZ:

Add parse_aac_header API to parse AAC streams, support ADTS and
ADIF format.

Signed-off-by: Zhang Peng <peng.zhang_8@nxp.com>

Request URL   : https://github.com/alsa-project/tinycompress/pull/10
Patch URL     : https://github.com/alsa-project/tinycompress/pull/10.patch
Repository URL: https://github.com/alsa-project/tinycompress
