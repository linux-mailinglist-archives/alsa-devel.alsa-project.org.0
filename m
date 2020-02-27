Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9E1727EA
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 19:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7962C16C1;
	Thu, 27 Feb 2020 19:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7962C16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582829227;
	bh=J6N/b73ow2TT3mKdWN9o21lquRV00GGhvBWHZ51uI/o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+5MWKMpZDVwlY0p3y4C7X47oOVGuVxm/6vXpb8BGyCl/Guu/uw0IS6shkC78N/xl
	 hbn5AuBy5jsH1I7Ri+7kypfcEqvxVX5ONnJF+x+DEQx5J8HJWGKnVLgMXYh9MSgMvI
	 UGNB3/CqDImbUjMCdgkzeQdFrJNS9lywHMcjRtu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B5CF8013E;
	Thu, 27 Feb 2020 19:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F7D1F80142; Thu, 27 Feb 2020 19:45:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 56870F80125
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 19:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56870F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582829118578932047-webhooks-bot@alsa-project.org>
References: <1582829118578932047-webhooks-bot@alsa-project.org>
Subject: sof-bdw-rt5677: initial port to UCM2
Message-Id: <20200227184522.9F7D1F80142@alsa1.perex.cz>
Date: Thu, 27 Feb 2020 19:45:22 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #13 was opened from plbossart:

Tested on Pixel 2015/SAMUS Chromebook.

Known limitations:
Left/Right confusion (probably a firmware issue)
PulseAudio does not switch capture devices on headset plug

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/13
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/13.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
