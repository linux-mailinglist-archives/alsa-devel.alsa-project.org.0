Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDFC54CC9B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 17:23:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F03861914;
	Wed, 15 Jun 2022 17:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F03861914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655306583;
	bh=vHGJvK7D8y5323qT2uB9RRWunn5ilO84KOH/ALN3GJo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kD7r/4H2y2DaW28Lnx8Utd1wwTcoWYRp/dXLGRH1Op9ij0t4ynKV/Gcn1qHZsYulQ
	 RWPb/LmXv58XoZva4pHySY0+xaxfrX/9OywyThihdHZQShlTDAS7ooNinKoq0gXyua
	 NLIV/1LfcEPajcsxQfDuFcsTys37WgI8cTpmQ3TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A7CBF800D8;
	Wed, 15 Jun 2022 17:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E84CF800D8; Wed, 15 Jun 2022 17:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 69177F800D8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 17:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69177F800D8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655306510459693909-webhooks-bot@alsa-project.org>
References: <1655306510459693909-webhooks-bot@alsa-project.org>
Subject: USB-Audio: no Audient iD4 profile for USB ID 2708:0003
Message-Id: <20220615152201.7E84CF800D8@alsa1.perex.cz>
Date: Wed, 15 Jun 2022 17:22:01 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #170 was opened from tiran:

PR https://github.com/alsa-project/alsa-ucm-conf/pull/151 added a profile for Audient iD4 audio interface with USB ID ``2708:0009``. I own a version of the device with ``2708:0003``. The configuration for ``2708:0009`` does not work for version ``2708:0003``. I hacked the config file from ``alsa-ucm-1.2.7-1.fc36.noarch`` package and ``systemctl --user restart pipewire pipewire-pulse``. After restart the audio interface no longer shows up in KDE. ``pw-dump`` shows only a disabled/off profile for the device.

@robertgzr @perexg 

Also see https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/1119

[alsactl.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8910772/alsactl.txt)
[lsusb.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8910773/lsusb.txt)
[pw-dump.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8910774/pw-dump.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/170
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
