Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97436354F
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 14:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4929E1683;
	Sun, 18 Apr 2021 14:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4929E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618749999;
	bh=opucStnH6s7ASCDlRN9E+DfbIQlUDrBW3XWeFX2VO+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4YOCg3T9SArEzobW/LbaX0YUuS4scJAVYcqTj4Ma3il9u34wC2WSvXcCFQTo89cw
	 zxXZrj0uOjnv2F9u0Ao+fU43GaVJRNEZtcOkYZSeLlWh5aa0AaRxjo+JcCo/U3K/Ay
	 KWXWKCI2A739d7ivdQGah3+veQZWumPb7i4GDp+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A169EF80273;
	Sun, 18 Apr 2021 14:45:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBF9F80253; Sun, 18 Apr 2021 14:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8575DF80164
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 14:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8575DF80164
Received: from hellmouth.base.nu (localhost [127.0.0.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id f2414e3d;
 Sun, 18 Apr 2021 12:44:59 +0000 (UTC)
Received: from base.nu ([88.97.23.37]) by hellmouth.base.nu with ESMTPSA
 id 1PqMKMspfGA7jQAADaPQrA
 (envelope-from <livvy@base.nu>); Sun, 18 Apr 2021 12:44:59 +0000
Date: Sun, 18 Apr 2021 13:43:01 +0100
From: Olivia Mackintosh <livvy@base.nu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] Pioneer devices: engage implicit feedback sync for
 playback
Message-ID: <20210418124301.scwvjqxwanlarko6@base.nu>
References: <CAEsQvcs9LcciAYjoB64Kt_VaSww4EAW4-qN0ED5jDA0GeeTtDg@mail.gmail.com>
 <20210409110745.kbr5z2jinsaur2ac@base.nu>
 <s5ha6pygqfz.wl-tiwai@suse.de>
 <20210417222630.dpqju7bowvks5nnq@base.nu>
 <s5hpmysf374.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hpmysf374.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, geraldogabriel@gmail.com
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

> As a blind shot: might the stall be avoided by passing the recently
> introduced chip->playback_first flag?  The revised patch is below.

This appears to fix the issue, thank you! I am curious as to why this is
not required for Geraldo's DDJ-SR2.

My initial thought was that certain devices that restrict capture unless
regular SysEx/Control URBs are sent may mean that Playback first support
is required (e.g. 750, 850, 450). Please correct me if this intuition is
incorrect.

Olivia
