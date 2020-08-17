Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E88245B23
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 05:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA61166F;
	Mon, 17 Aug 2020 05:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA61166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597635642;
	bh=g4YXwa3YftUJtKxvDqyRXBnofm/eMd2MvERPIpMOxaQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQiM2sstZhCLFTwkbmKDQAjtqtmZAHY/ipx3p2K8aq1DRypuLz83R+lhUO9C9iE5p
	 uRpXswgOiWso96cYrvukB4muy1FcJEqh5j1T43vgcxtPKb/eyNySNqgotE75xxksWF
	 P8per9emAtYiux+b4dcqpaiVUbY/1/ocUib/OeBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEAEFF80255;
	Mon, 17 Aug 2020 05:39:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1B6CF80218; Mon, 17 Aug 2020 05:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0F0A0F800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 05:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F0A0F800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1597635533050285101-webhooks-bot@alsa-project.org>
References: <1597635533050285101-webhooks-bot@alsa-project.org>
Subject: HDA-Intel: HiFi-dual: Fix the Rear Mic's Jack name
Message-Id: <20200817033858.A1B6CF80218@alsa1.perex.cz>
Date: Mon, 17 Aug 2020 05:38:58 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #46 was opened from jason77-wang:

On the LENOVO P520 (dual codecs machine), the Jack name of Rear Mic is
"Rear Mic Jack" instead of "Mic Jack".

Below is picked from alsa-info.txt on the LENOVO p520 machine:
	control.18 {
		iface CARD
		name 'Rear Mic Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/46
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/46.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
