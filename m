Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43EF1AD64B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 08:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263CC1662;
	Fri, 17 Apr 2020 08:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263CC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587105739;
	bh=BJR17g+YJ0sVM6dhf+ImGEVDdLvDrbBdjpNHNf0zITk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzdrzWTxmLXTKhrLrh3iSeJrupU3N2KqgdmRGlcC62UAxM7pLDlDRmHdDzM4oDgKa
	 2V5xK+SsXNfVFAY5kj6FTthTbnmEjB99ORL/GegTV3O4DkSJ2S3EcfI7QxGOI4t05v
	 TaW3Tb6f89X7qtvoc5XOkw/Gk9R5VCa1KsOJ/luc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C21DF8012E;
	Fri, 17 Apr 2020 08:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97E16F80245; Fri, 17 Apr 2020 08:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 480AFF8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 08:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 480AFF8012E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587105616223323107-webhooks-bot@alsa-project.org>
References: <1587105616223323107-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: Reverse order and priority of headset and headphone mic
Message-Id: <20200417064034.97E16F80245@alsa1.perex.cz>
Date: Fri, 17 Apr 2020 08:40:34 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #21 was opened from juimonen:

Headset mic is the analog input source in 99% of the cases compared to
headphone mic, so change it's priority higher.

Jaska Uimonen <jaska.uimonen@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/21
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/21.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
