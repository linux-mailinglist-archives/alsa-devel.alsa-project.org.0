Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4916199735
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 15:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C081660;
	Tue, 31 Mar 2020 15:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C081660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585660541;
	bh=uvJBXe/1fKLbNAJZnngR2H1ble9LkRNQIerQekqdres=;
	h=Date:From:To:To:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bb8uVUC7wwaq0KLW6FZwNc9YKn+HcZDCFutToitr1LWMAPL4dwWnnNIgPTv3E3AiL
	 nk3qQwUcIvc7fDVa50DIDzCJZpBKnFQrU2zfyL6I2Ky1OjhzLQuWM4uGaVpoOUdNN0
	 tbHadL6JNVwe4ALThU2tvF58r1L0CHV5nclI9YUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D06FF80291;
	Tue, 31 Mar 2020 15:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CCAEF80157; Tue, 31 Mar 2020 15:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF95BF8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 15:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF95BF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Efu5PD2A"
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A2BE21924;
 Tue, 31 Mar 2020 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585660291;
 bh=uvJBXe/1fKLbNAJZnngR2H1ble9LkRNQIerQekqdres=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=Efu5PD2A/fHEQkGebgGpQkhqXpVs2Doj2VEKECAFDnm9/6k0C+AIn3YMnfZg5C8t4
 cjs5FlNfJxU+86lND5K8kLa46ZgPQ2zAdobvj7cYvP2xu8sfPOOKTCL43KKvB/3KMb
 0DMZSO1S7Np4X+Qxhsx1ppqJ10nMLn5lFZHMWYvQ=
Date: Tue, 31 Mar 2020 13:11:30 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: hda/realtek - Remove now-unnecessary XPS 13
 headphone noise fixups
In-Reply-To: <028b0c410238090546cf80ef6075b3b9139986a7.1585553414.git.tommyhebb@gmail.com>
References: <028b0c410238090546cf80ef6075b3b9139986a7.1585553414.git.tommyhebb@gmail.com>
Message-Id: <20200331131131.2A2BE21924@mail.kernel.org>
Cc: Kailang Yang <kailang@realtek.com>, stable@vger.kernel.org
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

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 8c69729b4439 ("ALSA: hda - Fix headphone noise after Dell XPS 13 resume back from S3").

The bot has tested the following trees: v5.5.13, v5.4.28, v4.19.113, v4.14.174, v4.9.217, v4.4.217.

v5.5.13: Build OK!
v5.4.28: Build OK!
v4.19.113: Build OK!
v4.14.174: Failed to apply! Possible dependencies:
    1099f48457d0 ("ALSA: hda/realtek: Reduce the Headphone static noise on XPS 9350/9360")
    28d1d6d2f314 ("ALSA: hda - Add model string for Intel reference board quirk")
    a26d96c7802e ("ALSA: hda/realtek - Comprehensive model list for ALC259 & co")
    c0ca5eced222 ("ALSA: hda/realtek - Reduce click noise on Dell Precision 5820 headphone")
    c1350bff69d1 ("ALSA: hda - Clean up ALC299 init code")
    da911b1f5e98 ("ALSA: hda/realtek - update ALC225 depop optimize")

v4.9.217: Failed to apply! Possible dependencies:
    8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
    9000d69925ac ("ALSA: doc: ReSTize HD-Audio document")
    a26d96c7802e ("ALSA: hda/realtek - Comprehensive model list for ALC259 & co")
    a4caad753f0c ("ALSA: doc: ReSTize HD-Audio-Models document")
    a79e7df97592 ("ALSA: hda - Update the list of quirk models")

v4.4.217: Failed to apply! Possible dependencies:
    34d505193bd1 ("cfg80211: basic support for PBSS network type")
    35eb8f7b1a37 ("cfg80211: Improve Connect/Associate command documentation")
    38de03d2a289 ("nl80211: add feature for BSS selection support")
    819bf593767c ("docs-rst: sphinxify 802.11 documentation")
    8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
    9000d69925ac ("ALSA: doc: ReSTize HD-Audio document")
    a26d96c7802e ("ALSA: hda/realtek - Comprehensive model list for ALC259 & co")
    a4caad753f0c ("ALSA: doc: ReSTize HD-Audio-Models document")
    ba6fbacf9c07 ("cfg80211: Add option to specify previous BSSID for Connect command")
    bf1ecd210541 ("cfg80211: Allow cfg80211_connect_result() errors to be distinguished")
    e705498945ad ("cfg80211: Add option to report the bss entry in connect result")
    fa44b7ec9bc4 ("ALSA: hda - Update documentation")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
