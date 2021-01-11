Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167212F1E72
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 20:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A40291735;
	Mon, 11 Jan 2021 20:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A40291735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610391712;
	bh=BsDslaC8+CnH3vrVfwaZrumH+bZiSCeWdaePHlaWe1Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqHDjEV6Ui3GnSIBQm8nW9jUT+B3IFKOO6sjacabdLyJNkonTAu2kmDKD61n53ehz
	 Q2FgiF5vsK+T+twMCb7y86Wb8lNGeIPFZ74lJ5nkoPU1lG7YI8qLIX353tqcnlyzCH
	 8EUN7m1Oraqn+dYbZFSQmq7ucZVPdBqJaHnZMyWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBEE3F8026D;
	Mon, 11 Jan 2021 20:00:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD6CF8026B; Mon, 11 Jan 2021 20:00:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6B5BF80254
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 20:00:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3B8EEA003F;
 Mon, 11 Jan 2021 20:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3B8EEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1610391606; bh=ziYQCPC8cskXBVMPMfw8xQ6rH6S6XxzJ7iO2j2KoDYs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dddB8tHMuS7AGGY3xNF2O0WymT1Vrc7yB1JZ2rplJwJT5G4i/zAmRyIpPmbC2lAj4
 DS4h97KwubWSKVanvxx3dSSSGTvfmE6PggLB62DEYD3USTGE/cazLrNNsGzGyKoAzQ
 1+NMfcXi14Fcv7cKzSKfpm9zxsq/WWzbV0I8yauA=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Jan 2021 20:00:03 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf 2/2] rt5640: Move standard DAC setup to
 EnableSeq.conf
To: Hans de Goede <hdegoede@redhat.com>
References: <20210109210252.159162-1-hdegoede@redhat.com>
 <20210109210252.159162-2-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4e16c283-bc57-f527-2703-0efa347e8ad2@perex.cz>
Date: Mon, 11 Jan 2021 20:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109210252.159162-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 09. 01. 21 v 22:02 Hans de Goede napsal(a):
> No matter which output is used, we always need to setup the standard
> DAC config. Move this to the shared EnableSeq.conf to avoid having
> to duplicate it in various places.

Applied to the ucm repo. Thank you.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
