Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8D199730
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 15:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523D11670;
	Tue, 31 Mar 2020 15:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523D11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585660497;
	bh=BTbc/zwckK+KsTeoNdCpv3xhH2SfMEDaz/AD3AvHqSc=;
	h=Date:From:To:To:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zczk3l+1sHkX0+FRDHpP8uLewTq2UH3uCVR/2ctGQ93mHZvHjvsorzh3inIrxaxPD
	 5LvhtEhs1/hAkH4r0aRP3nkKXIzWbC1OrGLB/HsYWF9b/TDTScDEsHtSRDu3n3H5gV
	 C87hdov19Dw3HxtDMADFkIiU6uN4LHzMp8Y034Z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92C40F80290;
	Tue, 31 Mar 2020 15:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC050F801F2; Tue, 31 Mar 2020 15:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95B16F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 15:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95B16F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HzzVGoQp"
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A72620757;
 Tue, 31 Mar 2020 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585660290;
 bh=BTbc/zwckK+KsTeoNdCpv3xhH2SfMEDaz/AD3AvHqSc=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=HzzVGoQpJDvLZhoWMkJ2CTv9N/KBsUg5DeXP20OgQ6Rm47Ut4RTCeGnRPZtn5nnsN
 FPvsyJRxTYsl2f6Dm8BupaL3QpHV9g1aOILBFY2yqepBDGLVMoq+9fSJvBaBe6Z9vr
 C1TN4N+Uo35saz9T48ZaFgUdr7F5ZiMkAyWMELzA=
Date: Tue, 31 Mar 2020 13:11:29 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - a fake key event is triggered by
 running shutup
In-Reply-To: <20200329080642.20287-1-hui.wang@canonical.com>
References: <20200329080642.20287-1-hui.wang@canonical.com>
Message-Id: <20200331131130.0A72620757@mail.kernel.org>
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
fixing commit: 78def224f59c ("ALSA: hda/realtek - Add Headset Mic supported").

The bot has tested the following trees: v5.5.13, v5.4.28, v4.19.113.

v5.5.13: Build OK!
v5.4.28: Build OK!
v4.19.113: Failed to apply! Possible dependencies:
    10f5b1b85ed1 ("ALSA: hda/realtek - Fixed Headset Mic JD not stable")
    2b3b6497c38d ("ALSA: hda/realtek - Add more codec supported Headset Button")
    8983eb602af5 ("ALSA: hda/realtek - Move to ACT_INIT state")
    c8a9afa632f0 ("ALSA: hda/realtek: merge alc_fixup_headset_jack to alc295_fixup_chromebook")
    d3ba58bb8959 ("ALSA: hda/realtek - Support low power consumption for ALC295")
    e854747d7593 ("ALSA: hda/realtek - Enable headset button support for new codec")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
