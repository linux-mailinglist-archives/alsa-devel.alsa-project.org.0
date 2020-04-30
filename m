Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 259101C0AF6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 01:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92A783B;
	Fri,  1 May 2020 01:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92A783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588289210;
	bh=NkvmbuVWJeXyTCAgxl8YSJIFD953vioXDsaZwp2Njmw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ap8BUx9A0rI/7Wh44qeNto7j1zol43m7MjKnTW4ZY7lVQU+beIdD4aepZL1QzVRx3
	 FTpQqHMDkIurT2ReoGEarSnZXAb8CtjFELQs4+n0jWVFdApaWfc2jCF2ka7eX5Q+8m
	 rV+TTVqONZrouRWOWCP2Ij+SF4WshM8bnTfZsuns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C043EF801F7;
	Fri,  1 May 2020 01:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC50FF801EB; Fri,  1 May 2020 01:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A21EDF80123;
 Fri,  1 May 2020 01:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A21EDF80123
IronPort-SDR: 7L2/Dl7+LNChkIBg9s+Hp5LdIqaAOs4aQCU9tXBkMWcYoXYltXAqQraIMhnKR0bGnmtLtbJEDC
 M/WbHIRsS7zA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 16:24:55 -0700
IronPort-SDR: 8Ndi1Xo18oo7OwAtPFeXY5jAmHkUsD+Bs9gHkDbjURuHQLpaIR8F8ZBuEH+qdjEGnoe4vQu16o
 JlihN8EVxJwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="283029943"
Received: from cctang1x-win8.gar.corp.intel.com ([10.251.149.196])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2020 16:24:55 -0700
Message-ID: <a557561fef13e030c3b64eec62e3fd5c2e86e6d5.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Update correct LED status at the first time
 usage of update_mute_led()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, 
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, 
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com
Date: Thu, 30 Apr 2020 16:24:55 -0700
In-Reply-To: <20200430091139.7003-1-kai.heng.feng@canonical.com>
References: <20200430091139.7003-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 "moderated list:SOUND - SOUND OPEN
 FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

On Thu, 2020-04-30 at 17:11 +0800, Kai-Heng Feng wrote:
> At the first time update_mute_led() gets called, if channels are
> already
> muted, the temp value equals to led_value as 0, skipping the
> following
> LED setting.
> 
> So set led_value to -1 as an uninitialized state, to update the
> correct
> LED status at first time usage.
> 
> Fixes: 5d43001ae436 ("ASoC: SOF: acpi led support for switch
> controls")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

LGTM, thanks!

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

