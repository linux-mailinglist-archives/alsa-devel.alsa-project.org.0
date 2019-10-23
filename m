Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA007E2032
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 18:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53F9D165E;
	Wed, 23 Oct 2019 18:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53F9D165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571847016;
	bh=LtijriNBXC4C+yXP2bs+0c4Fk9P1HFIftaKnbRYorrY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eNkhnV0WdfJDRWvvHHweWufm1p9fOEbfxRKVWur/0wntEenCbxQaBQy2PyLJCXJax
	 cH7TjdsaPhz7W60EGJbpJu+qgJUuuSwUi+5VpLoV2x/TwQMZ1E/8jX77aL2lKTDYEQ
	 s9k6T2YOZzliL+e97P8BFAwoOFRINJYFLURQWqFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6728F80368;
	Wed, 23 Oct 2019 18:08:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B28F80368; Wed, 23 Oct 2019 18:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 08DD5F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 18:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08DD5F80112
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1571846903163125992-webhooks-bot@alsa-project.org>
References: <1571846903163125992-webhooks-bot@alsa-project.org>
Message-Id: <20191023160829.99B28F80368@alsa1.perex.cz>
Date: Wed, 23 Oct 2019 18:08:29 +0200 (CEST)
Subject: [alsa-devel] [RFC] sof-skl_hda: change to use common HDMI codec
	driver
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

alsa-project/alsa-ucm-conf pull request #4 was opened from kv2019i:

Here's a companion patch to the hda-hdmi kernel patchset on alsa-devel:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157201.html

Modify UCM sequences to use user-space interface of the common
HDMI codec driver. Use of hdac-hdmi driver is no longer supported
by this UCM file.

To use this UCM file, kernel must be compiled with
SND_SOC_SOF_HDA_COMMON_HDMI_CODEC

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/4
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/4.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
