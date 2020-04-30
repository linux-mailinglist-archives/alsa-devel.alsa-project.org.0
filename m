Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107D1C0405
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 19:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E0D1690;
	Thu, 30 Apr 2020 19:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E0D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588268551;
	bh=Aijv8vCM+vo95npfEUiGZ0gbItyvT0yYMOgVPQKAUZk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P16+oY98LChPoQF+qyjKAm4BVSiN8ag7pbW5PJWpq5g0YcSef+J8wxiGXZ39wJP1v
	 eU00GWw6v6Om5hovCIvZiim+bN4Y+/RinWyDIawxa9nRoJwYTEjUufm3dxCKUyu33z
	 oT2UngmfxDoMEtvcT9dGC6aiyzV1nEJRqIQm7o6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB78EF80136;
	Thu, 30 Apr 2020 19:40:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1215DF801EB; Thu, 30 Apr 2020 19:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2185EF800B6;
 Thu, 30 Apr 2020 19:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2185EF800B6
IronPort-SDR: g8+aCZr5Etx5ZvBZ3pD7bQkVfe7OpXcnLn228LUSGVeED1NtdcbI6q58BsvZk8F9j41wFHETCY
 F4FT+tfKuEBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 10:40:36 -0700
IronPort-SDR: eFPFtYx6+uB6NHAuxSoYK+WLEfrFkFcl2Zkv6ijG9Nmiygl5G67VPd/g9YBvB6oF+6M0gb43lQ
 +n5anvaS4Xqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="276592844"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 30 Apr 2020 10:40:33 -0700
Date: Thu, 30 Apr 2020 20:40:32 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] ASoC: SOF: Update correct LED status at the first time
 usage of update_mute_led()
In-Reply-To: <20200430091139.7003-1-kai.heng.feng@canonical.com>
Message-ID: <alpine.DEB.2.21.2004302038390.2957@eliteleevi.tm.intel.com>
References: <20200430091139.7003-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
 daniel.baluta@nxp.com, Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Hi,

On Thu, 30 Apr 2020, Kai-Heng Feng wrote:

> At the first time update_mute_led() gets called, if channels are already
> muted, the temp value equals to led_value as 0, skipping the following
> LED setting.

thanks, looks good! 

Acked-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
