Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20D2EAB75
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 14:04:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B7F1680;
	Tue,  5 Jan 2021 14:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B7F1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609851890;
	bh=0eD6AFGcSTTRNBJfVZWpZwNAzaJ48dhNBjaISkflcAs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRTis2ieRm9PgdgTHpLEaNMdtEiBvUNyzzCVoFtETazzCXPYuOwohwy2DV5pbUuyI
	 hPutfrfUiVmBzUgBFG1teT43g2wVWlLTPwVUaBuGOReUllGM1Vz8hkyPy0sS9GZYPO
	 oFb/yeLz1rgHw0HVBZYpzsw6gJNs5OOydNWkjcJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B816AF8015B;
	Tue,  5 Jan 2021 14:03:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D711EF8015B; Tue,  5 Jan 2021 14:03:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2025F8015B;
 Tue,  5 Jan 2021 14:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2025F8015B
IronPort-SDR: lOlZJd5zAprMJl7VtaXAhw2lB8Bv4DopQEd1Kpfhmwnxv/JA95wF9JBA/S3f3f2/YdEKg1zUKA
 Z845zZzVSs4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="156294562"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="156294562"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 05:03:01 -0800
IronPort-SDR: jptWPMLfWGX6lDuX7MiHAn8ipT9mgPZ6kJanzSCH5wVxQZ/U2gNXiw9a+2klpDQm32tI8BFx0U
 TIy11gsyWYFg==
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="569721207"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 05:02:57 -0800
Date: Tue, 5 Jan 2021 14:59:52 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 2/3] ASoC: SOF: Intel: hda: Modify existing helper to
 disable WAKEEN
In-Reply-To: <20210104140853.228448-2-kai.heng.feng@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2101051458590.864696@eliteleevi.tm.intel.com>
References: <20210104140853.228448-1-kai.heng.feng@canonical.com>
 <20210104140853.228448-2-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Rander Wang <rander.wang@intel.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
 Amery Song <chao.song@intel.com>, daniel.baluta@nxp.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
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

On Mon, 4 Jan 2021, Kai-Heng Feng wrote:

> Modify hda_codec_jack_wake_enable() to also support disable WAKEEN.
> In addition, this patch also moves the WAKEEN disablement call out of
> hda_codec_jack_check() into hda_codec_jack_wake_enable().

ack, this looks good:

Acked-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
