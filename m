Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F9363C26
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 09:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62ADA16BC;
	Mon, 19 Apr 2021 09:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62ADA16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618816154;
	bh=rgrB19IYLOp2YlamPbwc/CeUev5qp76AdM4zHI7lujw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ql5h2RSgDIKiGTdHLDoarNgFfpG5E8J15TUl+QKRoZ5ENRN09J0Y6hcwBI+M9T7Cx
	 +Z1ft56a2NAOxamjMzk2GbpfEEQ2I5stuAOBDZDPRvDED36oyyPy3l8xD9er4B2BOf
	 idhwACfQAJP4YCV5xFyLHEkRG7phNDWkqXNOBVCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2AEF80256;
	Mon, 19 Apr 2021 09:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22206F80227; Mon, 19 Apr 2021 09:07:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 99EFEF8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 09:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99EFEF8014D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1618816053442156076-webhooks-bot@alsa-project.org>
References: <1618816053442156076-webhooks-bot@alsa-project.org>
Subject: ucm2: rt711-sdca: remove 'rt711 FU0F Capture Switch' setting
Message-Id: <20210419070744.22206F80227@alsa1.perex.cz>
Date: Mon, 19 Apr 2021 09:07:44 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #89 was opened from libinyang:

The rt711-sdca codec driver removes the 'rt711 FU0F Capture Switch'
kcontrol. So we need to remove the setting of 'rt711 FU0F Capture Switch'
correspondingly.

Signed-off-by: Libin Yang <libin.yang@intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/89
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/89.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
