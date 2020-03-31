Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA619972D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 15:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4BA85D;
	Tue, 31 Mar 2020 15:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4BA85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585660457;
	bh=E0ZiGGpWnxZaGahYOcWQMjN9JjsdC0P9wppib5vRFlY=;
	h=Date:From:To:To:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j75GqJEgUFbBDzuBADGP/oHu6BXWegAnJ2Jb+U3hSMBTd5ApiwtJjgbkUXSysBxK8
	 9HBzWcbpezkFSm8Y0lCXT4PO18aV1RwgUG8JAqUGSWiT5Lg8pvEJViDP9x6Xa3ZpUY
	 7QTogDQ51Xh4hcRAaWPI79e9h44cYL6OXCtyLwSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8312F8028C;
	Tue, 31 Mar 2020 15:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 728D6F80146; Tue, 31 Mar 2020 15:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BB16F80140
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 15:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BB16F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jFM65O2q"
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B95B220786;
 Tue, 31 Mar 2020 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585660288;
 bh=E0ZiGGpWnxZaGahYOcWQMjN9JjsdC0P9wppib5vRFlY=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=jFM65O2qJCku15188+q3R7FmKYdvYYfHuOq7pF6KY27kuf7S8JnBMGUh8chTmiTRB
 Ppm/tLE6q0yURG63lG/up/BxnaGVciuAEh0L4x7Fq04+1ciYFrb1Ha9R4gkQZw7UYb
 ZUt3/QULxz8ARVvTnt96ljyipqTUXLwcCEvvlDBM=
Date: Tue, 31 Mar 2020 13:11:27 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.or
Subject: Re: [PATCH 1/3] ALSA: doc: Document PC Beep Hidden Register on
 Realtek ALC256
In-Reply-To: <bd69dfdeaf40ff31c4b7b797c829bb320031739c.1585553414.git.tommyhebb@gmail.com>
References: <bd69dfdeaf40ff31c4b7b797c829bb320031739c.1585553414.git.tommyhebb@gmail.com>
Message-Id: <20200331131127.B95B220786@mail.kernel.org>
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

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.5.13, v5.4.28, v4.19.113, v4.14.174, v4.9.217, v4.4.217.

v5.5.13: Build OK!
v5.4.28: Build OK!
v4.19.113: Build OK!
v4.14.174: Build OK!
v4.9.217: Failed to apply! Possible dependencies:
    76ab4e15158c ("ALSA: doc: ReSTize HD-Audio-DP-MST-audio.txt")
    8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
    9000d69925ac ("ALSA: doc: ReSTize HD-Audio document")
    a4caad753f0c ("ALSA: doc: ReSTize HD-Audio-Models document")
    fe0abd18e1ef ("ALSA: doc: ReSTize HD-Audio-Controls document")

v4.4.217: Failed to apply! Possible dependencies:
    34d505193bd1 ("cfg80211: basic support for PBSS network type")
    35eb8f7b1a37 ("cfg80211: Improve Connect/Associate command documentation")
    38de03d2a289 ("nl80211: add feature for BSS selection support")
    463c35fb7981 ("ALSA: Add documentation about HD-audio DP MST")
    76ab4e15158c ("ALSA: doc: ReSTize HD-Audio-DP-MST-audio.txt")
    819bf593767c ("docs-rst: sphinxify 802.11 documentation")
    8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
    9000d69925ac ("ALSA: doc: ReSTize HD-Audio document")
    a4caad753f0c ("ALSA: doc: ReSTize HD-Audio-Models document")
    ba6fbacf9c07 ("cfg80211: Add option to specify previous BSSID for Connect command")
    bf1ecd210541 ("cfg80211: Allow cfg80211_connect_result() errors to be distinguished")
    e705498945ad ("cfg80211: Add option to report the bss entry in connect result")
    fa44b7ec9bc4 ("ALSA: hda - Update documentation")
    fe0abd18e1ef ("ALSA: doc: ReSTize HD-Audio-Controls document")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
