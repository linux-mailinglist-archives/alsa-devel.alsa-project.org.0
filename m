Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830EE4701D3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 14:37:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 069ED2020;
	Fri, 10 Dec 2021 14:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 069ED2020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639143430;
	bh=+la3FfHfnZ4xI0LfWqESGnQlpYCMpIWIStFnv5Ck5SE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0NqTHHnwnQ3WzIiLSLLsYPiV6SZXfgix8P7hNCeVkqG4CKP9WHfo89EzzS+dCe9q
	 qeuTmoOiiMBNHWBerB642QyoTylUx1wbOqAPhVhSNuDE3l1Jiv9bSAYhl/br3nvLs9
	 2poJf1o6suqVQyH+s7/0aUiGRPG5eS3z8dENpo/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C2BF8028D;
	Fri, 10 Dec 2021 14:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE98F804EC; Fri, 10 Dec 2021 14:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9A5C9F804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 14:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A5C9F804E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639143353802089930-webhooks-bot@alsa-project.org>
References: <1639143353802089930-webhooks-bot@alsa-project.org>
Subject: Add UCM support for SDM845 based Lenovo yoga c630
Message-Id: <20211210133557.2BE98F804EC@alsa1.perex.cz>
Date: Fri, 10 Dec 2021 14:35:57 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #88 was edited from Srinivas-Kandagatla:

One of the Lenovo YOGA C360 variant is based off Qualcomm SDM845  SoC. This PR adds support to On Board Speakers and Headset. 
This PR also has a small change to the codec Headphone sequences to be inline with other Sequences.

thanks,
srini

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/88
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/88.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
