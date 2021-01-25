Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64477302661
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 15:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85F81850;
	Mon, 25 Jan 2021 15:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85F81850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611585703;
	bh=cCfQbmf+QFojoSGB/Fbpxdw5ocaXgtuVT5fWNH07+Jg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=So+RY4d5Crhk9DB0ZTlv7muTGTfTYAPF2x+VWlgDzCBBRcLJAK+VEc81zOKygtKsK
	 x0RhMQPB4kPesF9Vh0mpK84lpxQj5xxHKYws+aW6G7B7nvHmwmucytUJIsJnvNHNHW
	 4zNpuE+oEzny48VAnqNhH0brlkiTyJzpwn8XOTTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681EFF80218;
	Mon, 25 Jan 2021 15:40:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDF8BF80259; Mon, 25 Jan 2021 15:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 028A9F80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 15:39:57 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A02D4A003F;
 Mon, 25 Jan 2021 15:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A02D4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611585591; bh=FJj58bei+aCWpx65yklFK8J9qXhHmqa2Fr/8KLjrtfE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C61+0xN55K/GHQyvIjr65v5eSKnHtO2tTu/9RKWAMVNSYZ9mULgn16UsGHjlT81UM
 80HB+uP5qaEkqVcnqA/gaEhIK1ze3TpPHZDWpL0yfvmGqXe/zMzbXAkxYDhNSKP4tq
 yUKddrDpRyaE+XyOpGggJMG292NuIZ6/lBV6lAd4=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 25 Jan 2021 15:39:41 +0100 (CET)
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: set proper flags for Dell TGL-H SKU
 0A5E
To: Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
References: <20210125081117.814488-1-kai.vehmanen@linux.intel.com>
 <161158424212.32959.6636308393612395831.b4-ty@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <60058033-96d6-a941-5771-3e78e165292e@perex.cz>
Date: Mon, 25 Jan 2021 15:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161158424212.32959.6636308393612395831.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Hui Wang <hui.wang@canonical.com>,
 Bard Liao <bard.liao@intel.com>
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

Dne 25. 01. 21 v 15:17 Mark Brown napsal(a):
> On Mon, 25 Jan 2021 10:11:17 +0200, Kai Vehmanen wrote:
>> Add flag "SOF_RT711_JD_SRC_JD2", flag "SOF_RT715_DAI_ID_FIX"
>> and "SOF_SDW_FOUR_SPK" to the Dell TGL-H based SKU "0A5E".
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: Intel: sof_sdw: set proper flags for Dell TGL-H SKU 0A5E
>       commit: 9ad9bc59dde106e56dd59ce2bec7c1b08e1f0eb4

Hi Mark,

Those fw selection related patches should be applied together to enable support for this machine, too:

ASoC: SOF: allow soundwire use desc->default_fw_filename
  https://lore.kernel.org/alsa-devel/20210125070500.807474-1-kai.vehmanen@linux.intel.com/
ASoC: Intel: tgl: remove sof_fw_filename set for tgl_3_in_1_default
  https://lore.kernel.org/alsa-devel/20210125070500.807474-2-kai.vehmanen@linux.intel.com/

Unrelated to this machine but a cleanup for future:

ASoC: Intel: adl: remove sof_fw_filename setting in ADL snd_soc_acpi_mach
  https://lore.kernel.org/alsa-devel/20210125070500.807474-3-kai.vehmanen@linux.intel.com/

					Thank you,
						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
