Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FF1A70C8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 04:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7024A169D;
	Tue, 14 Apr 2020 04:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7024A169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586829855;
	bh=fgtsijLtWlb+dCDbtJUrHbV7mQJbqXnNmEi4UsrzKdY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AifjKr52d8Zd3m028Rv6DcTnWHXtCfWG2c4kX8E5LLti2habieYgtGUGkYQH+Mc7r
	 sPgyxSVOycVneBsLM07SsCNIE7BNkMZ/UN0lz346ZvuYBhahP8RtQ2iUYbYKSOf40i
	 AM3zA8CQXDXrdE287VHEwrZgF6B03NTAlWqG67T4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 827BCF8013D;
	Tue, 14 Apr 2020 04:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055FBF8013D; Tue, 14 Apr 2020 04:02:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A49D8F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 04:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A49D8F800B9
IronPort-SDR: 7ufyrzTCsJLHIptjMDfxwJZnE3VL/TtaymmcChiKHgeooUDodrnSydDrehXGmx0QA6MfpEOZIY
 Apqt3Px3Ce0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 19:02:25 -0700
IronPort-SDR: bEzrMNX7mi4nZk9c43rfqhy2QXyupHtlE2Jdy9WWZWVswAodqPrNLxZUuE58hzyRiTxglnZt8G
 OyzKjpkr/pDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,381,1580803200"; d="scan'208";a="426896256"
Received: from sbaqai-mobl.amr.corp.intel.com (HELO [10.134.66.220])
 ([10.134.66.220])
 by orsmga005.jf.intel.com with ESMTP; 13 Apr 2020 19:02:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
Subject: Regression on Intel Atom/SST/Baytrail devices w/ v5.7-rc1
Message-ID: <4d9d2c14-4db7-1a98-9b3d-e9193333e1b9@linux.intel.com>
Date: Mon, 13 Apr 2020 21:02:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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
With Mark's for-next tree and v5.7-rc1 I get these really bad errors 
with the Atom/SST driver on a Baytrail device - found by accident while 
trying to validate UCM changes.

[    9.741953] intel_sst_acpi 80860F28:00: FW Version 01.0c.00.01
[    9.832992] intel_sst_acpi 80860F28:00: FW sent error response 0x40034
[    9.833019] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
[    9.833028] intel_sst_acpi 80860F28:00: sst_get_stream returned err -5
[    9.833033] sst-mfld-platform sst-mfld-platform: ASoC: DAI prepare 
error: -5
[    9.833037]  Baytrail Audio Port: ASoC: prepare FE Baytrail Audio 
Port failed
[    9.853942] intel_sst_acpi 80860F28:00: FW sent error response 0x40034
[    9.853974] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
[    9.853984] intel_sst_acpi 80860F28:00: sst_get_stream returned err -5
[    9.853990] sst-mfld-platform sst-mfld-platform: ASoC: DAI prepare 
error: -5
[    9.853994]  Baytrail Audio Port: ASoC: prepare FE Baytrail Audio 
Port failed

Trying to bisect, the errors change at some point:

[c77b8317ee3ab43634421afb73fdb1ea253d3d47] ASoC: mediatek: 
mt8183-da7219: use SND_SOC_DAPM_PINCTRL in TDM out

[    9.387540] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for Headset Playback
[    9.387551] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for media1_in
[    9.387556] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for media0_out mix 0
[    9.387561] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for media0_out
[    9.387566] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for pcm0_in
[    9.387570] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for modem_out mix 0
[    9.387575] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for modem_out
[    9.387580] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for codec_out0 mix 0
[    9.387584] bytcr_rt5640 bytcr_rt5640: ASoC: can't get playback BE 
for codec_out0

And then from
[5d3c644773925c3568617435e42a9404a114c428] drm/mediatek: support HDMI 
jack status reporting to v5.6-rc1 I get those time outs...

[   21.031638] intel_sst_acpi 80860F28:00: Wait timed-out condition:0x0, 
msg_id:0x1 fw_state 0x3
[   21.031661] intel_sst_acpi 80860F28:00: fw returned err -16
[   21.031692] sst-mfld-platform sst-mfld-platform: ASoC: PRE_PMD: 
pcm0_in event failed: -16

Both 5.5 and 5.6 work though, as if we are missing a set of 
dependencies? I am running out of time this evening, but I'd be good to 
see if anyone else reproduces my findings.

Thanks
-Pierre


