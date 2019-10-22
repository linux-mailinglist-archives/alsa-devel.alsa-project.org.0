Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C94E03B4
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 14:17:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB7C165F;
	Tue, 22 Oct 2019 14:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB7C165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571746666;
	bh=E33HQ4KgVbK1sibi56kRHP6ZyhJSYfwXR8oTb5lQHpc=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTnHmo2nYRFkZv9GvVDe/5APTanT7Z5VDtnKqaQSuuydGocwzS+MJ/qtx3Oyial5G
	 DMRRbzSLKaI2JSYcg/+3O1jGE7rQYWDLN1Dt3O0KXVYrWPBU7BLMvsf2yGJxx+PN57
	 VHfXGBdzUwOYOlJqiRJFAWSGeL/sJ0ZTepDaMJqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC50EF8031A;
	Tue, 22 Oct 2019 14:16:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E00F8031A; Tue, 22 Oct 2019 14:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CD26CF80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 14:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD26CF80112
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1571746557006731033-webhooks-bot@alsa-project.org>
References: <1571746557006731033-webhooks-bot@alsa-project.org>
Message-Id: <20191022121600.48E00F8031A@alsa1.perex.cz>
Date: Tue, 22 Oct 2019 14:16:00 +0200 (CEST)
Subject: [alsa-devel] sof-skl_hda: add device definition to speaker disable
	sequence
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

alsa-project/alsa-ucm-conf pull request #3 was opened from juimonen:

For example Pulseaudio is not able to run the disable sequence
if the device is not defined. So add the definition.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/3
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/3.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
