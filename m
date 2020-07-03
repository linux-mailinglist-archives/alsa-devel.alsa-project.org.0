Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7F1213699
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ACB916CF;
	Fri,  3 Jul 2020 10:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ACB916CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593765667;
	bh=y3hI8p4kPtsO8vUZLJr1m/0WFcTGGur8CoSfujgHM78=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V1HHdJWXNx2ape60JkJoDoLmVOqJwimnnbB+daPxjXkDeSx+ern8Q3ZXmS2/O0o4A
	 Uu4zkKh7ftfsxJ7A/eqH8ljB2PegDu6kmSEDodbMVK+yG8yS97eESizUOM78ZyyqqK
	 sead97cSOW/kinb+/9TVp4qo37c+OUpbQ1GX65Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2645F80269;
	Fri,  3 Jul 2020 10:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 384D3F8025F; Fri,  3 Jul 2020 10:38:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B9C5EF800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9C5EF800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1593765534036065102-webhooks-bot@alsa-project.org>
References: <1593765534036065102-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp UCM doesn't work with the latest alsa-lib
Message-Id: <20200703083857.384D3F8025F@alsa1.perex.cz>
Date: Fri,  3 Jul 2020 10:38:57 +0200 (CEST)
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

alsa-project/alsa-lib issue #67 was opened from libinyang:

In the latest UCM for sof-hda-dsp, it has supported Syntax 3 and it uses $var for hdmi. In sof-hda-dsp/Hdmi.conf, It defines "HdmiNum 1", and later it will redefine "HdmiNum 2", then "HdmiNum 3". It will try to `Include.hdmi1.File "/codecs/hda/hdmi.conf"` to use these definitions. But actually, only "HdmiNum 3" will be used for HDMI1, HDMI2 and HDMI3. The old value of "1" and "2" will be overridden when parsing HDMI1 and HDMI2. This is the bug of alsa-lib initialization sequence issue.

HDA-Intel/Hdmi.conf should have the same issue.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/67
Repository URL: https://github.com/alsa-project/alsa-lib
