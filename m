Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E495E7A4C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 14:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D851FC;
	Fri, 23 Sep 2022 14:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D851FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663935408;
	bh=kJ9w7hOn58xiGeponpnQayKtpIBMpjkP6nVL/CaGCEE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mEZJcWzGwCgPhPLUfhyM+cxXfvuwfFdssnYqSqHQBJha/Zt0Byi8Wj+EAS+Lc4ylY
	 fscBBri12P1F1Qes0bZhJgW92LmF90Qe1elMavQDMcXRNBoF620Qc3z7kyKTZi2s6z
	 uqcpd6G227iP1VsuOIAn5FquHXIex892EmVN+3Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07147F80431;
	Fri, 23 Sep 2022 14:15:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC99F80269; Fri, 23 Sep 2022 14:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id ECB69F801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 14:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB69F801EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1663935342376276970-webhooks-bot@alsa-project.org>
References: <1663935342376276970-webhooks-bot@alsa-project.org>
Subject: ACP6x: PulseAudio profiles different (from the legacy probe)
Message-Id: <20220923121549.DCC99F80269@alsa1.perex.cz>
Date: Fri, 23 Sep 2022 14:15:49 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #215 was edited from sebastianst:

My Ryzen 6000 laptop has an AMD audio coprocessor driving the microphone with the ACP6x kernel module. #138 added initial support for this, but me and some other people on different Ryzen 6000 laptops have issues with alsa-ucm not configuring the microphone properly. We have to disable `alsa-ucm` to get any sound input or output working with pulseaudio, see https://bbs.archlinux.org/viewtopic.php?pid=2058087#p2058087 for the relevant discussion. Note that we first had to add our laptops to some quirk table of the kernel module to get it working at all.

Any idea how to fix this?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/215
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
