Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B13479385
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:06:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C63728D4;
	Fri, 17 Dec 2021 19:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C63728D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764388;
	bh=qqM2sZneIYk3sCh0vAGlmn/SVFTaAMrB3jyeBT1OWu8=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOmkEb4XkxAIDJAtzhwDXz6d7gl1nO+CI5X3xMRZB3jb0Xkvpr4ocbJWbAPaz2oQ/
	 Ul48ISOHmKSzfimS1HJprG3p3sNCNFVdxHbjQO61CvMA87x4EhM943hzStKDfbq4aP
	 uTzHSq9/G3/bPG2mIvbB6oJEBKU/tfXmC2RSvGzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E10F4F8016D;
	Fri, 17 Dec 2021 19:05:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A85F4F800AB; Fri, 17 Dec 2021 19:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED5DBF800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 19:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED5DBF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lLuPe83q"
Received: by mail-lj1-x231.google.com with SMTP id bn20so4597510ljb.8
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TfMBvuPX2wgd5B4i9WzScZ4xJDbFLe7nDXiaKwSnRqo=;
 b=lLuPe83qA2TPyZ90TpYoRINS+4fMhqGeIv3mHp8yHHW2I7lThzCxthnx0N6YPEHNqr
 IcmZIW6fFcdD5IneEq0bADRMX+XoM1rhkuM8+/YrEurXU62UheYOQxJD9ZSzQTOWNrxP
 1esazbMTAq761cFb22R7GFXqiksjN0Iq3LVC9Qx9FtcNLmIQan5LSSx+BYEI9KQokc/r
 rXtQDs0GXgzd5YfM4zeW1o2ABGq4Us/iAFhSipTWMSyBZEhnBwcbexICvhS222jhfZrt
 3rfsRzxpXwFHdRERwKEZJDDFhxrpULvk4Jqj0ofPhN4Aqdk1Kq46LZ6qzPFrkDAWg/5z
 NoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TfMBvuPX2wgd5B4i9WzScZ4xJDbFLe7nDXiaKwSnRqo=;
 b=7ZMiTTbnNV5zdpvFMqW6gujEE84VJXqxyK751UFmNJUoqBeQCrHHd1cKcfIky7Mh8v
 u4NdcUDdmuHE3RXVVrcjk19wH5kK11tkO4neiGx3fpONNtCPdAn6hyR8x2tY0OVLb6na
 Wm7tO3KmFgBLDwEpH4FT3Q2icy1l2hL5H2iNQ1iXAMf0BO42nmIDMy6ZBUUB4BFwfUv5
 LTtaX+BhZSqumDUyq89ej8FoU9XghAkECQ6UxH5Cl0cK8PT1WCsNkQKBLuRssmyiZn2G
 0GgrPacXhjLpsuHKcDMU8uuHBjTNbmNhAG3YyZ2nbgFLUli7vZW0jCXK9TrB2sWNQUE9
 DpUg==
X-Gm-Message-State: AOAM532Sn+ogBCWfjNvJG1revu7h7C5N/zYi+lPNMX0MDPZ8lCCwCNDB
 y1pqqUk1Xzjq8Iilgzf4U5c=
X-Google-Smtp-Source: ABdhPJz1FVHSMGSmE2Wy7Rd1zrsuOxe4lGKW7e0DD9WOJgs+K7rhRmtZ7AWxOjbcwTSyRKOHPx0oHw==
X-Received: by 2002:a05:651c:b0e:: with SMTP id
 b14mr3769307ljr.38.1639764315476; 
 Fri, 17 Dec 2021 10:05:15 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id k13sm1475964lfo.300.2021.12.17.10.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 10:05:15 -0800 (PST)
Subject: Re: [PATCH v5 00/11] Support HDMI audio on NVIDIA Tegra20
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
References: <20211217175606.22645-1-digetx@gmail.com>
Message-ID: <019854ed-e181-eb81-8d91-2b598911b174@gmail.com>
Date: Fri, 17 Dec 2021 21:05:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

17.12.2021 20:55, Dmitry Osipenko пишет:
> This series revives Tegra20 S/PDIF driver which was upstreamed long time
> ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
> audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
> For now the audio is enable only for Acer A500 tablet and Toshiba AC100
> netbook because they're already supported by upstream, later on ASUS TF101
> tablet will join them.
> 
> (!) These patches are made on top of stable dmaengine branch from Vinod Koul.
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine_topic_slave_id_removal_5.17
> 
> for you to fetch changes up to 3c219644075795a99271d345efdfa8b256e55161:
> 
>   dmaengine: remove slave_id config field (2021-12-17 11:23:56 +0530)
> 
> Changelog:
> 
> v5: - Dropped all patches that were already applied by Thierry Reding.
> 
>     - Made minor changes that were suggested by Thierry Reding.
> 
>     - Added acks from Thierry Reding.
> 
>     - Rebased patches on top of stable dmaengine branch from Vinod Koul.
> 
> v4: - Added patches that update multi_v7_defconfig with the enabled S/PDIF
>       and APB DMA drivers.
> 
> v3: - Renamed S/PDIF device-tree clocks as was suggested by Rob Herring.
> 
>     - Added r-bs and acks that were given by Rob Herring to v2.
> 
> v2: - Corrected I2S yaml problem that was reported by the DT bot for v1
>       by removing the non-existent required clock-names property.
> 
>     - Removed assigned-clocks property from S/PDIF yaml since this property
>       is now inherited from the clocks property.
> 
>     - Reordered the "tegra20: spdif: Set FIFO trigger level" patch, making
>       it the first sound/soc patch in the series, like it was suggested by
>       Mark Brown in the comment to v1. Also reworded commit message of this
>       patch to *not* make it looks like it should be backported to stable
>       kernels.
> 
> Dmitry Osipenko (11):
>   ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
>   ASoC: dt-bindings: tegra20-i2s: Convert to schema
>   ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate
>     property
>   ASoC: tegra20: spdif: Set FIFO trigger level
>   ASoC: tegra20: spdif: Support device-tree
>   ASoC: tegra20: spdif: Improve driver's code
>   ASoC: tegra20: spdif: Use more resource-managed helpers
>   ASoC: tegra20: spdif: Reset hardware
>   ASoC: tegra20: spdif: Support system suspend
>   ASoC: tegra20: spdif: Filter out unsupported rates
>   ASoC: tegra20: i2s: Filter out unsupported rates
> 
>  .../bindings/sound/nvidia,tegra20-i2s.txt     |  30 ---
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    |  77 +++++++
>  .../bindings/sound/nvidia,tegra20-spdif.yaml  |  85 ++++++++
>  sound/soc/tegra/tegra20_i2s.c                 |  49 +++++
>  sound/soc/tegra/tegra20_spdif.c               | 198 +++++++++++++-----
>  sound/soc/tegra/tegra20_spdif.h               |   1 +
>  sound/soc/tegra/tegra_pcm.c                   |   6 +
>  sound/soc/tegra/tegra_pcm.h                   |   1 +
>  8 files changed, 359 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> 

Mark, I see that you already applied previous v4 to broonie/misc. Please
skip this v5 then, thanks!
