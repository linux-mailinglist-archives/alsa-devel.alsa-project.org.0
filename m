Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AA13F5B82
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 12:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC6C15F2;
	Tue, 24 Aug 2021 12:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC6C15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629799253;
	bh=VvPTKKufmvnOEnFUypkRs7dpbx4C1pDQEvr+rWErewU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jll5LpX2hlPabUIv0ohoA5jbKN0AYxuESkL+9etw4addJhI0TyZpalIc2TuZ1ibqt
	 eoD79eIu8/NBOXYJP/Z5B8ueZxWVkuP574RxcgXfbfS1TLwF5lqouABJ1Y0UDzHwIR
	 V/FBEOvLnSvLOLQVP/vAc1Z0zx8Mf3PpJl7h6au8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60244F80224;
	Tue, 24 Aug 2021 11:59:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A46FEF801D8; Tue, 24 Aug 2021 11:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 723A8F80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 723A8F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1629799158080141068-webhooks-bot@alsa-project.org>
References: <1629799158080141068-webhooks-bot@alsa-project.org>
Subject: Pinebook Pro's audio does not work
Message-Id: <20210824095933.A46FEF801D8@alsa1.perex.cz>
Date: Tue, 24 Aug 2021 11:59:33 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #110 was opened from starnight:

I have a Pinebook Pro whose audio (including the internal speaker, headphone and internal MIC) does not work by default with general Linux.

Here is the [alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/7037916/alsa-info.txt)

I notice Manjaro ARM has [asound.state](https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-post-install/-/blob/master/asound.state) in [pinebookpro-post-install](https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-post-install) package.  If I install the [asound.state](https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-post-install/-/blob/master/asound.state) into `/var/lib/alsa/`, then `alsactl restore`, all of the audio works!

However, I guess that **asound.state** is produced as a result, not the original configuration.  If this relates to alsa-ucm-conf project, how should I configure the ucm for Pinebook Pro's audio?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/110
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
