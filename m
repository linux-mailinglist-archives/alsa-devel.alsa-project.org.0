Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3059BAF8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 10:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CD0163F;
	Mon, 22 Aug 2022 10:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CD0163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661155695;
	bh=uPIyaukpJLOLL8QLn4bIZ7TTDmIcWYB3QqtYBB8x4xo=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tnHsSFlyQ3FVo1k5n4kBunrHArfsW0MFgWYhY5vMQhaNWBv50IGmDB5pzslk3zd5X
	 dox1PFYv/FZnVgtPSlnw3DJcCEUf0RM5jtwGHEPtugJsuaH67jgRKCzx7OqaySlhqp
	 NRZtJ/iXoyN77B4SaEm6+V+SRk5FlfyhsnX9WZsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A223DF800ED;
	Mon, 22 Aug 2022 10:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E9A6F8026A; Mon, 22 Aug 2022 10:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBBF2F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 10:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBBF2F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="BkACgUDl"
X-UUID: 8e60ab8b022347d5bb0ab43aebad11c1-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=4YTg09B1vAYVwT4qbNMBjdKvY6UnuybFze8ucc+2wEs=; 
 b=BkACgUDlxPvN2EM4ksMhCr3Os9B6/bAq+P8sPShax2p1jcS3Fxei3FKYx8wre2EppPX7Q/sULxVh5lG0TB31z7OC+2W5gp2PtJbWUPucxNc1HgOuydUtfNhcivqP8f5OIYrPs615MAKG1TqNI6uk0WNClLd1JZtm/3atcPo3yws=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:fe573026-e248-4488-80c8-22a96d5e8152, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Relea
 se_Ham,ACTION:release,TS:95
X-CID-INFO: VERSION:1.1.10, REQID:fe573026-e248-4488-80c8-22a96d5e8152, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS
 981B3D,ACTION:quarantine,TS:95
X-CID-META: VersionHash:84eae18, CLOUDID:269365c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:da172a57c5c8,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 8e60ab8b022347d5bb0ab43aebad11c1-20220822
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 267542353; Mon, 22 Aug 2022 16:07:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 16:06:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 16:06:59 +0800
Message-ID: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
Subject: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: <alsa-devel@alsa-project.org>
Date: Mon, 22 Aug 2022 16:06:58 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: chihhao.chen@mediatek.com
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

I am testing many headsets on Android platform with different kernel
versions.

On kernel-5.10, calling sequence for playback is
1. snd_usb_hw_params -> set highest sampling rate, no
SAMPLING_FREQ_CONTROL USB request sent in this stage
2. snd_pcm_release
3. snd_usb_hw_params -> set proper sampling rate, still no
SAMPLING_FREQ_CONTROL USB request 
4. snd_usb_pcm_parepare -> in configure_endpoint SAMPLING_FREQ_CONTROL
USB request was sent on USB bus

With the same calling sequence, a slightly behavior change on kernel-
5.15 is
1. snd_usb_hw_params -> set highest sampling rate,
SAMPLING_FREQ_CONTROL USB request  was sent on USB bus
2. snd_pcm_release
3. snd_usb_hw_params -> set proper sampling rate, SAMPLING_FREQ_CONTROL
USB request  was sent too
(because configure_endpoint was moved to snd_usb_hw_params function)
4. snd_usb_pcm_parepare -> no SAMPLING_FREQ_CONTROL USB
request  because of USB EP flag check

I checked all USB packets and confirmed audio data output was correct.
But there may be missing sound problem for the first sound with many
headsets (for example Samsung headset).
I found this issue is related to two-times sampling rate set request.
(I tried to forcibly skip first USB request, everything became okay.)
So do you guys know why configure_endpoint was moved to
snd_usb_hw_params?
Or could you provide patch for this problem?

Many thanks
Chihhao

